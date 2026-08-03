Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C649C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:28:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41068.1785756529045951786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dQ1vDWKl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93FF8143D
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48A573F632
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785756528; bh=BTjRQSdiCTzOQ8v/wTc188S02luBBzGz3CnFXN89jEc=;
	h=From:To:Subject:Date:From;
	b=dQ1vDWKlmrkxMPPv3oTdhbsJR9IXg6VD4FHMgzTlEdcZYHk0bfwCx9rXhTDsbzsgz
	 oRZHaHi/FvCcz5CLbNrUUw4W9qMkuiqm4MVlDNYTyXuIzSK4TdCws3LguFdkhgjOXU
	 Au5BVmXPmMqHRNyxxgSr87C7yyVvl296U0ss8Q7A=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] mesa-demos: upgrade to latest revision
Date: Mon,  3 Aug 2026 12:28:40 +0100
Message-ID: <20260803112843.1362937-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 11:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242649

- meson: Do not pass multiple dependencies in one dependency call
- eglinfo: support EXT_device_query_name and EXT_device_persistent_id
- eglinfo: move brief mode check into PrintDeviceExtensions()
- util: add a utility function for UUID printing
- eglinfo: fix doExtExplicitDevice() control flow
- eglinfo: fix querying of platforms with explicit devices
- eglinfo: add ability to show only device platforms
- eglinfo: allow platform selection for explicit devices
- vulkan: modernize vk_layer_settings.txt
- vkgears: check for errors while waiting for fences
- vkgears: specify one-time-submit
- vkgears: destroy dsl after updating ds
- vkgears: barrier to transfer-write
- eglut/wsi/wayland: remove a debug fprintf()
- vulkan/wsi/wayland: mirror the libdecor changes in eglut/wayland
- eglut/wayland: Don't leak libdecor frame
- eglut/wayland: Move libdecor context to display struct
- eglut/wayland: Don't finish display when dispatching
- eglut/wsi/wayland: Dispatch wl_display via libdecor

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
index ad17f7632b2..784c2d4ad7d 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;begi=
nline=3D1;endline=3D5;md5=3D2c456
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain"
=20
-SRCREV =3D "c508611faf6f2fc30248940cdcb795b564cd6699"
+SRCREV =3D "10418e7636cdd9595dda18c3d78a562d7248f734"
=20
 # This recipe doesn't plan to make more releases, so track upstream git =
commits
 PV .=3D "+git"
--=20
2.43.0


