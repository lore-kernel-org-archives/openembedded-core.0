Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDDCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:58:27 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.2311.1758038298240459153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 6B97E1CCC9
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 17:58:16 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.62]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyY4I-0N19pR0; Tue, 16 Sep 2025 17:58:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
Date: Tue, 16 Sep 2025 17:57:59 +0200
Message-ID: <20250916155800.3860178-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758038290-B5FF88B3-479C6F79/0/0 CLEAN NORMAL
X-TOI-MSGID: ccddae62-2c57-4d18-9643-6cfb0517f953
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223572

- add 'ffmpeg' as the preferred provider for virtual/ffmpeg

Using virtual/ffmpeg can be useful for recipes that require a different v=
ersion
to that provided by oe-core (e.g. kodi)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index 3f113543cd..7c969b0889 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-libgl ?=3D "${@bb.=
utils.contains('DISTRO_FEAT
 PREFERRED_PROVIDER_virtual/libgles1 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
 PREFERRED_PROVIDER_virtual/libgles3 ?=3D "${@bb.utils.contains('DISTRO_F=
EATURES', 'glvnd', 'libglvnd', 'mesa',d)}"
+PREFERRED_PROVIDER_virtual/ffmpeg ?=3D "ffmpeg"
 PREFERRED_PROVIDER_virtual/mesa ?=3D "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-utils-n=
ative"
--=20
2.50.1


