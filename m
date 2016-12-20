Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 408F677272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 08:47:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so8672231pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 00:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RP0w0TVYMtJLmmXXPRiPxU3qYfAIv9DGi+pRiXNM3xo=;
	b=B06xen5V8gvoFHsbif+FSL1+1L903QAlWoCi8w7e+gGZ2MRYTE2kAEjRCO+n+FXUSm
	9QpGS0X6StDPi9jXnqEmaSb99fUD1bgFlmhuWGfPJagWywwn1bgwbGlc8dw7lMvR/lPR
	hWKZZUfVKtt8mfyplCL9jrALL13K/EZUW2SzEYdC1sOWwO11bqtax4N4KOZ9BQ8+AWpi
	iqk6MSfQiz9/5ODYDPGauNhTJ046coVcIwmdaMNBftYwljU8zUCijSfEaT3oVwmPt25J
	7OkrtPMscsz2zKq8Nj+yb4lnporfAPg5sFEEoDuIR3RENgK5jW9e9ypmd95nGhSlj7Ac
	1SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RP0w0TVYMtJLmmXXPRiPxU3qYfAIv9DGi+pRiXNM3xo=;
	b=X1NJL9pybDhZbxV3QBmvAMAoVp7Cchr59K4EqxJ1eJeRefXWamQvVcdggFmOE5J0ha
	wpx4dHUEdW3PyhOx72TK32oMN4cK8lEUt82RLA8IRylsDDZF571oqgYaoJAH8dVAIYxh
	Qm2LLokxOT8h7wbZE5BuB6EnFB7+MAyoLP8usAIn3efiU1ioNzOL0fM0txxE8bPS7Xxd
	Qly1rjXbv6F4noomNE8nkiAMdOJfgeITWDrhJG15nCM71dwJqiF784m+VhXl6ybtLUfu
	gBopqedG2+ZYBi6bUh8OwmEY3g1oMI+MlVh4tUcGDdPzxprNX3y5rvthD4MGIbCfPoBt
	nPmQ==
X-Gm-Message-State: AKaTC03r/bnZUPQtfeSkuF3Wk4AtFHOAhNqryFEwKMAui1PQoAhA0PNYiXwxgg12+3U7Sg==
X-Received: by 10.99.37.2 with SMTP id l2mr34479683pgl.160.1482223629369;
	Tue, 20 Dec 2016 00:47:09 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i11sm37304769pgn.17.2016.12.20.00.47.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 00:47:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 00:47:01 -0800
Message-Id: <20161220084701.28462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gstreamer1.0-libav: Fix build on mips64
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
X-List-Received-Date: Tue, 20 Dec 2016 08:47:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer1.0-libav/mips64_cpu_detection.patch  | 32 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.10.1.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
new file mode 100644
index 0000000000..7a0b448888
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
@@ -0,0 +1,32 @@
+It will add -mips64r6 and -mips64r2 to cmdline which will
+cause conflicts
+
+in OE we user mips32r2 and mips64r2 for mips arch versions
+so there is no benefit of detecting it automatically by
+poking at tools especially in cross env
+
+Fixes errors like
+
+linking -mnan=2008 module with previous -mnan=legacy modules
+failed to merge target specific data of file
+
+-Khem
+Upstream-Status: Inappropriate [OE-Specific]
+
+Index: gst-libav-1.10.1/gst-libs/ext/libav/configure
+===================================================================
+--- gst-libav-1.10.1.orig/gst-libs/ext/libav/configure
++++ gst-libav-1.10.1/gst-libs/ext/libav/configure
+@@ -5269,12 +5269,9 @@ elif enabled mips; then
+ 
+     # Enable minimum ISA based on selected options
+     if enabled mips64; then
+-        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
+         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
+         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
+     else
+-        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
+-        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
+         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
+         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
+     fi
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
index 98f5a50a9a..d44a5b24cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
+    file://mips64_cpu_detection.patch \
 "
 SRC_URI[md5sum] = "9dc8fb8dd01818c27230a1ed6ba9f4de"
 SRC_URI[sha256sum] = "27b28b8de0e6dff1e3952428e8ed8ba4a12f452f789ac0ae9bbe50f00a5c72c7"
-- 
2.11.0


