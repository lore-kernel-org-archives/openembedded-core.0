Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32081EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:46:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.3730.1686714390345764347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 20:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id D3E632BB92
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 05:46:27 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.47.212]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q9HSc-1ghEVV0; Wed, 14 Jun 2023 05:46:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gstreamer1.0-plugins-bad: use oneVPL instead of intel-mediasdk for msdk
Date: Wed, 14 Jun 2023 05:46:05 +0200
Message-Id: <20230614034605.5344-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686714378-15FFC3A1-8EAC30A0/0/0 CLEAN NORMAL
X-TOI-MSGID: 0477b2bd-1704-4467-9be2-08e8ae1e2827
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182729

According to intel, mediasdk is obsolete and should be replaced by oneVPL

https://www.intel.com/content/www/us/en/developer/tools/oneapi/onevpl.htm=
l#gs.0kgkse

This also adds video processing support for intel alchemist (in combinati=
on with dev-kernel)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.22.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
2.2.bb
index 6260f9586b..eaf1e4c0e2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.b=
b
@@ -60,7 +60,7 @@ PACKAGECONFIG[libde265]        =3D "-Dlibde265=3Denable=
d,-Dlibde265=3Ddisabled,libde26
 PACKAGECONFIG[libssh2]         =3D "-Dcurl-ssh2=3Denabled,-Dcurl-ssh2=3D=
disabled,libssh2"
 PACKAGECONFIG[lcms2]           =3D "-Dcolormanagement=3Denabled,-Dcolorm=
anagement=3Ddisabled,lcms"
 PACKAGECONFIG[modplug]         =3D "-Dmodplug=3Denabled,-Dmodplug=3Ddisa=
bled,libmodplug"
-PACKAGECONFIG[msdk]            =3D "-Dmsdk=3Denabled,-Dmsdk=3Ddisabled,i=
ntel-mediasdk"
+PACKAGECONFIG[msdk]            =3D "-Dmsdk=3Denabled -Dmfx_api=3DoneVPL,=
-Dmsdk=3Ddisabled,onevpl-intel-gpu"
 PACKAGECONFIG[neon]            =3D "-Dneon=3Denabled,-Dneon=3Ddisabled,n=
eon"
 PACKAGECONFIG[openal]          =3D "-Dopenal=3Denabled,-Dopenal=3Ddisabl=
ed,openal-soft"
 PACKAGECONFIG[opencv]          =3D "-Dopencv=3Denabled,-Dopencv=3Ddisabl=
ed,opencv"
--=20
2.34.1


