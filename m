Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C49C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 17:33:23 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.10393.1655919195270046198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 10:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id D3E83596
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 19:33:13 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.39.186]) by fwd75.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o44E5-03ssqI0; Wed, 22 Jun 2022 19:33:13 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] llvm: dont use host python
Date: Wed, 22 Jun 2022 19:32:51 +0200
Message-Id: <20220622173251.478588-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622173251.478588-1-f_l_k@t-online.de>
References: <20220622173251.478588-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655919193-01433199-BD3383EC/0/0 CLEAN NORMAL
X-TOI-MSGID: b23c6573-5b4d-4da4-b411-b14b09f8938a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 17:33:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167246

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
index b86605cbce..292f295cf3 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -15,7 +15,7 @@ COMPATIBLE_HOST:riscv32 =3D "null"
=20
 RDEPENDS:${PN}:append:class-target =3D " ncurses-terminfo"
=20
-inherit cmake pkgconfig
+inherit cmake pkgconfig python3native
=20
 PROVIDES +=3D "llvm${PV}"
=20
@@ -75,7 +75,6 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_OPTIMIZED_TABLEGEN=3DON \
                   -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
-                  -DPYTHON_EXECUTABLE=3D${HOSTTOOLS_DIR}/python3 \
                   -G Ninja"
=20
 EXTRA_OECMAKE:append:class-target =3D "\
--=20
2.25.1


