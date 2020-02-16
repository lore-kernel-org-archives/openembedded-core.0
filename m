Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B00E6144D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:09 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so16637266wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oxaFmyt1Vi6s2EyDm96xFKCJAGLsQ/3VkC5SnTs5rEQ=;
	b=pCecwWmXN3lT7UfCNyJZbGPnLttVOuTRCCmXmN/+dvW3cMZiDvmn/XGRv3DxaNaqnl
	BhtRzO1rxAhEzZ1vLjHwsa2aLx7kSY0ilepdpSVuyBT5cCDBJH66gD+/Q09fsP0tLZIt
	5Jod0C+EOfKZbai4KqN4mfKgk6/H/MVYHSuZFBN6qFB062DVPvZrPIoXNtSV1Khhucfu
	oa3PGYkKKs4bJpetCq7c2R6a7Uz2Gs0aqcWuvqYxgv9BwAq36I1bd2IfMRGugmuGPrZS
	CbnWs9jsUgP9ydq54GG0/s/stgXzQaOI81lBQuRiD08bBFewsDABQFhibw4pOdzOK5dx
	EoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oxaFmyt1Vi6s2EyDm96xFKCJAGLsQ/3VkC5SnTs5rEQ=;
	b=IvSnjQcT0f0EM3jomwbVM814s3XlEfT5m2QhBOzd0WotwjSH2jph3h7hUtvPlzk4Mf
	fzg6Fz64A1/wnv3wEwonrZNz+vLRBx5ZTHa9cBsTY7YnR7TCW1uMRJyYmNWblTXamGBJ
	h8AfJcSOUDCwloEVRbaLLjCaPxKcAJfo7pcjzcSdSme14k5XV9AXPalY2i4ce/dwRHkH
	WxZLiSNl1J0J56s/8HO9TBTolbydE3pQ6QX+XmuDVIXr5WGTZT2OHaeT3PiLGyyehXr0
	L7bI3LgOCbaKgeU36uBVQp1rTcCI5Bqq4dw6LSoU8jg0Sxw/+6WwfJGinV00rkMaPvsq
	xHlg==
X-Gm-Message-State: APjAAAWQzpkKRb/hbSHUxVbtT1ejlc6E+G7qHBKmHS5Yfn4l0IEm9x/6
	/o0Odi7KiHdJ5L8HhyW0FwvXRWSN
X-Google-Smtp-Source: APXvYqzuuS9j5zd2WCsAaWli3OpjCU6mJGJmyvc7xkxFjDxfRSmk+j8AGdhNoX3zGT9xxDbD9yXnSA==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr16590205wrj.68.1581868269612; 
	Sun, 16 Feb 2020 07:51:09 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:13 +0100
Message-Id: <20200216155015.21738-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] wayland: convert to meson build
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-the-native-wayland-scanner-directly.patch | 27 +++++++++++++++++++
 .../wayland/wayland_1.18.0.bb                 |  9 ++++---
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
new file mode 100644
index 0000000000..f98037a850
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
@@ -0,0 +1,27 @@
+From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 16 Feb 2020 16:29:53 +0100
+Subject: [PATCH] meson.build: find the native wayland-scanner directly in PATH
+
+Otherwise, meson attempts to use the target pkg-config and fails.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/meson.build | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 3e8c9bf..294aee0 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -55,8 +55,7 @@ pkgconfig.generate(
+ )
+ 
+ if meson.is_cross_build()
+-	scanner_dep = dependency('wayland-scanner', native: true, version: '>=1.14.0')
+-	wayland_scanner_for_build = find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
++	wayland_scanner_for_build = find_program('wayland-scanner')
+ else
+ 	wayland_scanner_for_build = wayland_scanner
+ endif
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 7a3f075552..21a848ff5a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -14,19 +14,20 @@ DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://fixpathinpcfiles.patch \
+           file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            "
 SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
 SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-inherit autotools pkgconfig
+inherit meson pkgconfig
 
 PACKAGECONFIG ??= "dtd-validation"
-PACKAGECONFIG[dtd-validation] = "--enable-dtd-validation,--disable-dtd-validation,libxml2,,"
+PACKAGECONFIG[dtd-validation] = "-Ddtd_validation=true,-Ddtd_validation=false,libxml2,,"
 
-EXTRA_OECONF = "--disable-documentation --with-host-scanner"
-EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
+EXTRA_OEMESON = "-Ddocumentation=false"
+EXTRA_OECONF_class-native = "-Ddocumentation=false -Dlibraries=false"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
-- 
2.25.0


