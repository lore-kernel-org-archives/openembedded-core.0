Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E9FC77B73
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 13:33:20 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.10275.1685194392730921473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 2D4F91BF15
	for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:33:11 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.82]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q2u2d-2qD35g0; Sat, 27 May 2023 15:33:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 4/4] shadow: add libxcrypt-native dependency
Date: Sat, 27 May 2023 15:32:52 +0200
Message-Id: <20230527133252.284132-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527133252.284132-1-f_l_k@t-online.de>
References: <20230527133252.284132-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685194388-327FBCD8-B88CB23C/0/0 CLEAN NORMAL
X-TOI-MSGID: 742e1b7b-54e4-481d-b526-bb6c172ef2f0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 13:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181805

crypt.h is otherwise taken from the host machine

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
index cf05a3af93..7206bfdf02 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc9a450b7be84ea=
c23e6353efecb60b5b \
                     file://src/passwd.c;beginline=3D2;endline=3D30;md5=3D=
758c26751513b6795395275969dd3be1 \
                     "
=20
-DEPENDS =3D "virtual/crypt"
+DEPENDS =3D "virtual/crypt libxcrypt-native"
=20
 GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shadow/releases"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
--=20
2.34.1


