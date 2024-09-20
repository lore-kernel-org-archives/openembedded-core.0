Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9963FCF9C57
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:37:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.21198.1726846631978695986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 8088D2391E
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 17:36:36 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfgR-1UIeoL0; Fri, 20 Sep 2024 17:36:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/3] gtk4: rename tracker dependencies
Date: Fri, 20 Sep 2024 17:37:06 +0200
Message-ID: <20240920153708.1774041-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726846595-25FF9416-87E146CC/0/0 CLEAN NORMAL
X-TOI-MSGID: fc7adfda-abb7-4d2d-af6e-f01584684733
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 15:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204760

This is required for gnome 47 update in meta-openembedded

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk4_4.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.16.0.bb
index 6331e86bf5..1fe1861105 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3D=
disabled,colord"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
 PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
-PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker,tracker-miners"
+PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tin=
ysparql,localsearch"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled, vulka=
n-loader vulkan-headers shaderc-native"
=20
 # Disable int-conversion warning as error until [1] is fixed
--=20
2.46.0


