Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FACC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 10:23:35 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7780.1692872608684500328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 03:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id A3978AF13
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 12:23:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.18]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZ7Us-2C9xSL0; Thu, 24 Aug 2023 12:23:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] qemu: build pulseaudio support depending on distro_feature
Date: Thu, 24 Aug 2023 12:23:16 +0200
Message-ID: <20230824102317.267403-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692872606-7C9A9E98-EC8421E5/0/0 CLEAN NORMAL
X-TOI-MSGID: 76074be7-d041-49e0-9b9b-9034aeca651c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 10:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186655

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu_8.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_8.0.4.bb b/meta/recipes-devt=
ools/qemu/qemu_8.0.4.bb
index 5d3c47c3b0..84ee0bcc49 100644
--- a/meta/recipes-devtools/qemu/qemu_8.0.4.bb
+++ b/meta/recipes-devtools/qemu/qemu_8.0.4.bb
@@ -16,7 +16,7 @@ EXTRA_OECONF:append:class-nativesdk =3D " --target-list=
=3D${@get_qemu_target_list(d)
=20
 PACKAGECONFIG ??=3D " \
     fdt sdl kvm pie slirp \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epo=
xy', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
--=20
2.41.0


