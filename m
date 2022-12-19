Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D539C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:17:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.21166.1671455824313357605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 465DA5752
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:17:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7G0r-3DAuKf0; Mon, 19 Dec 2022 14:17:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk4: add tracker-miners runtime dependency
Date: Mon, 19 Dec 2022 14:16:54 +0100
Message-Id: <20221219131654.453363-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455821-EEFF2A26-9B8B12E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 345d4e73-70fe-4224-b69b-56996c7c5704
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 13:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174813

To have gtk4 libtracker support, the target would need to run tracker-min=
ers.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.8.2.bb
index 98850f7ea0..fe18fa2ffd 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
@@ -71,7 +71,7 @@ PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
 PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
-PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker"
+PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker,tracker-miners"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled, vulka=
n-loader vulkan-headers shaderc-native"
=20
 LIBV =3D "4.0.0"
--=20
2.34.1


