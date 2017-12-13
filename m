Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id B9BC9606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 13:25:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x204so2605849lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google; h=from:to:subject:date:message-id;
	bh=cICic19a7c/yGRHRas7qeiLiIrd4Zt1KEioSv45Dv70=;
	b=i5JSCUO+oKydtQZ2AVMyF4WanANw0HXM4icSMcK8oHwVeG8eYTSll+ocW+FVYZcUy+
	2qYD5A0CosTBSiz4Ey0Qt41A4gEcENbn+bCyiVjclqvlAClrQhe9p/Ud01t1/pPzTLnT
	tn6GGMbIXRr+U8I7JV94h8vIeu42/Hj+/U4rHArT2yRNfOaCuXgOpxV47NrDHkKhSMKy
	Z+JoI948/uaiPx7HPehEf7jCKjQPeDsl+Vr9rRAduVeZwYb8x5ttL45Wvy7KwjWFu+Ho
	YhT7R3vBLdOcRSrjeNVSKv0MamQhCZGslu63IO5I3f1RhajAJqqeyQ502PjdUfpBQImv
	k6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cICic19a7c/yGRHRas7qeiLiIrd4Zt1KEioSv45Dv70=;
	b=Yzcixzjdh3D5XJ7IVltAjv3l5R9TYNPlR8sju5XjUYUy4VwE3BSmEpW+IzGeIoP1Ob
	r+iE6Hov5DW4BYUxdAB+E5cM5OxOIdOI/tpT9L2MRJOn6yF+OZUrfZJ0Uh4NeOUYr4M6
	EIHw/7M7pRMfhSjpkQvBYa2bBjjcIN1/IZn3BexAqOrBOvuRkCex3nbxI5G1xPbKXsMq
	Hz86V4F7x8LOEybSuHdQIkAXwkAqQr2j0+uymsNrbkGZHiiatYG+GjxXBewPJ7uCdf15
	ZsN1ZYfwmGAOxZVriEFHBjpQlFstv+66JM7U020UntyHBpLeEVFka7B7aVPyhsu5G4ck
	4Vvg==
X-Gm-Message-State: AKGB3mIhR9NAJUhhl/58cTzbkROtyPcrr8AvBfJDfY8idovvHi14wK/w
	04eGXR9ERuDK0OwU22mOEcXLuFuSGnU=
X-Google-Smtp-Source: ACJfBoskwlZRNI0ciasDvrSBsd0LafLaSyH06dbuUbbrqHOC6/fkfAVMBmyW9+DgCQryhUHdfxmnLg==
X-Received: by 10.46.83.9 with SMTP id h9mr1553169ljb.68.1513171553886;
	Wed, 13 Dec 2017 05:25:53 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	v10sm329970lfi.11.2017.12.13.05.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 05:25:52 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 14:25:50 +0100
Message-Id: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot-fw-utils: Fix broken makefile in v2017.11.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Dec 2017 13:25:54 -0000

See the patch for details. This patch has already been applied
upstream, but we need it for v2017.11.

Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
---
 .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 37 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch

diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
new file mode 100644
index 0000000..fe89735
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
@@ -0,0 +1,37 @@
+From ded84f90a1066eef5f34daa4539273de64f7b811 Mon Sep 17 00:00:00 2001
+From: Stefan Agner <stefan.agner@toradex.com>
+Date: Tue, 14 Nov 2017 15:47:18 +0100
+Subject: [PATCH 1/1] envtools: make sure version/timestamp header file are
+ available
+
+With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
+the fw_env utilities need the version.h header file. Building only
+the envtools in a pristine build directory will fail due to missing
+header files.
+
+Make sure the header files are a dependency of the envtools target.
+
+Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
+Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+Tested-by: Peter Robinson <pbrobinson@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 61fd973..f8c66a2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
+ 		false; \
+ 	fi
+ 
+-envtools: scripts_basic
++envtools: scripts_basic $(version_h) $(timestamp_h)
+ 	$(Q)$(MAKE) $(build)=tools/env
+ 
+ tools-only: scripts_basic $(version_h) $(timestamp_h)
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
index bfdf1a0..65f1228 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
@@ -12,6 +12,7 @@ SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
 SRC_URI = "git://git.denx.de/u-boot.git \
     file://MPC8315ERDB-enable-DHCP.patch \
     file://10m50-update-device-tree.patch \
+    file://v2017.11-fw-utils-build-fix.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


