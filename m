Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54894EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:53:14 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.34.1686765188893112851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 10:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id C8D711EDF0
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 19:53:06 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.47.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q9Ug6-1txQjx0; Wed, 14 Jun 2023 19:53:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] gstreamer1.0-plugins-bad: use oneVPL instead of intel-mediasdk for msdk
Date: Wed, 14 Jun 2023 19:52:57 +0200
Message-Id: <20230614175257.67275-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686765186-18DBAE62-60D79985/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b9aac9e-3792-432f-a76a-29f234389354
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 17:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182824

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
index 6260f9586b..bda083d0a8 100644
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
-Dmsdk=3Ddisabled,onevpl,onevpl-intel-gpu"
 PACKAGECONFIG[neon]            =3D "-Dneon=3Denabled,-Dneon=3Ddisabled,n=
eon"
 PACKAGECONFIG[openal]          =3D "-Dopenal=3Denabled,-Dopenal=3Ddisabl=
ed,openal-soft"
 PACKAGECONFIG[opencv]          =3D "-Dopencv=3Denabled,-Dopencv=3Ddisabl=
ed,opencv"
--=20
2.34.1


