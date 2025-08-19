Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFD4CA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 22:14:06 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.6431.1755641639598983755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 15:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y8q4wsi3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JMDwW02987467;
	Tue, 19 Aug 2025 17:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755641638;
	bh=e26mfYHqJzwsZDdVo0DsXQocRFKcSHIeOPshRYycqx4=;
	h=From:To:CC:Subject:Date;
	b=y8q4wsi3Kq2Xp3IiDKP51PifLU7nA6nXEvqkqamP50UoR5Ty6MmwUX+oaqnmrt0hk
	 pJ7XNSd3PcYhG+6QCqfJVFfRZp+qy9Te+t8DuCoFw1GulpybmkIDCpaSaWNKjta8E4
	 U9rRmndblUJ2nRDAUW4EBzf2cZ71loTsfzOgnkp8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JMDvju713145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 17:13:58 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 17:13:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 17:13:57 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JMDvu93404526;
	Tue, 19 Aug 2025 17:13:57 -0500
From: <a-christidis@ti.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
CC: <rs@ti.com>
Subject: [master][PATCH] libsdl2: Add PACKAGECONFIG option for tests
Date: Tue, 19 Aug 2025 17:13:57 -0500
Message-ID: <20250819221357.997067-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 22:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222150

From: Antonios Christidis <a-christidis@ti.com>

The SDL2 software comes with its own set of tests. Create a
PACKAGECONFIG option to enable the building of such.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
index 98291e0f80..01f834aba9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
@@ -79,9 +79,20 @@ PACKAGECONFIG[pulseaudio] = "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio
 PACKAGECONFIG[vulkan]    = "-DSDL_VULKAN=ON,-DSDL_VULKAN=OFF"
 PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
+PACKAGECONFIG[tests]      = "-DSDL_TESTS=ON,-DSDL_TESTS=OFF"
 
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
+do_install:append() {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
+		install -d ${D}${bindir}/sdl2_tests
+		cp -r ${B}/test/* ${D}${bindir}/sdl2_tests
+
+		# Delete any leftover cmake files within the sdl2_tests dir
+		find ${D}${bindir}/sdl2_tests -type f -name "*.cmake" -delete
+	fi
+}
+
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


