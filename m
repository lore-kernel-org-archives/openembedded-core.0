Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CBDC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:05:24 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.47956.1669910716009157696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 08:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 915A76A27
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Dec 2022 17:04:41 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.248]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0m3E-1OnxDQ0; Thu, 1 Dec 2022 17:04:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv10 4/4] Add entries for the newly added recipes to maintainers.inc
Date: Thu,  1 Dec 2022 17:04:33 +0100
Message-Id: <20221201160433.111286-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201160433.111286-1-f_l_k@t-online.de>
References: <20221201160433.111286-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669910681-2E0B6EA1-789D5245/0/0 CLEAN NORMAL
X-TOI-MSGID: bc1234e7-cb4d-477c-b173-5a803b0d3bb0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 16:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174196

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 03db94824d..1426491791 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -188,6 +188,7 @@ RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.k=
hem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-source-12.2.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-gcr3 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>=
"
 RECIPE_MAINTAINER:pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} =3D "Khem Raj <raj.khem@gm=
ail.com>"
@@ -229,6 +230,7 @@ RECIPE_MAINTAINER:pn-gperf =3D "Alexander Kanavin <al=
ex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gpgme =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-gptfdisk =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
 RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-graphene =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-grep =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-groff =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-grub =3D "Anuj Mittal <anuj.mittal@intel.com>"
@@ -249,6 +251,7 @@ RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Anuj Mi=
ttal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
 RECIPE_MAINTAINER:pn-gtk+3 =3D "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gtk-doc =3D "Alexander Kanavin <alex.kanavin@gmail.=
com>"
 RECIPE_MAINTAINER:pn-gzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-harfbuzz =3D "Anuj Mittal <anuj.mittal@intel.com>"
--=20
2.34.1


