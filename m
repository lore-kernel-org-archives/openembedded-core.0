Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id E21EC6173A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 17:49:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p17so5203182wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 09:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cnBAegZJnrTXZ70EFErdln3zvaws7q1ryqYMA8B7UH0=;
	b=e0uZWByzhKxhRbTQ54M6Hb7CoFPpemeD/dTC8o1Uqfpt8aCrDH9ePzrpoBF4VmR3Bz
	IDfOPcO9rLTt7gDfWjfGBL0xNUi4sunpAZPgXX8MtIIl21qjg4qt7nn+uiNCFCIUjBul
	VKwT8mKY9AS2rzvmfWpixAY1W9rwjfkFJp6biJaP8xlFFw52NAiDjQmipmDMTfnAGV6I
	hvMNtbT6N556UN0pfrGhH85zT8hCtAILZB3x/tfBXT/elsaVOQU3USYO/+TvstJDpqCT
	kbkp4+KhbLHEV/XWDjnRpewa58mzTwz0StPb0tM5/kiCRWtDu2LU3ycwIdjCVbJL4XcZ
	CbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cnBAegZJnrTXZ70EFErdln3zvaws7q1ryqYMA8B7UH0=;
	b=WYJ2SsCB/imNfMPkTPU7naBtlU+S6dcVJX1FfDPYkGbn8hLMjnWw5yCY0znzHKLH5r
	tVTeBQ53EGREfiCpwgNREjQJ3J58/5wxsk7j2goliiuoEpel0CNcsi6wntLS82hWsIJu
	/jWO7qy8xPUGEFEOWy8AjQ+fgyjgtYMJVABv7bogLhGGk0PNw2RCUmzlyB4dcYKi5osQ
	DVteP8JGImMRuPKxT9LjWh0zihcfsV5hZ1Eifto/ZhyA9KizVstuCX2CWBqNDkXKAUNz
	Lthj9qghz6FHgEGcgJj9ccNA2SOzx+Ehlik06NPbQS6Bu7dNmQx3mFj5VmAEz2qBCt7Q
	ICAA==
X-Gm-Message-State: APjAAAUDWRvDsRooBWEXLPTtf6KKpslVLON5CcML5glPQcp7Jcx7bVZF
	nV+oiaQdcdFs5jQW69MVyUZJ1n1r
X-Google-Smtp-Source: APXvYqzSEk0aHAA0bo3ucTpHnSwEgirwjd8aP+VHxmKYOiEE1fFDAZZmNLW0CVjlND1lI74Gnqn5LQ==
X-Received: by 2002:a1c:b789:: with SMTP id
	h131mr11180423wmf.148.1582393745335; 
	Sat, 22 Feb 2020 09:49:05 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id e8sm2820651wrr.69.2020.02.22.09.49.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 09:49:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 18:49:01 +0100
Message-Id: <20200222174901.20638-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libwpe, wpebackend-fdo: add opengl to required DISTRO_FEATURES
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
X-List-Received-Date: Sat, 22 Feb 2020 17:49:05 -0000
Content-Transfer-Encoding: 8bit

* requires virtual/egl which isn't available without opengl in DISTRO_FEATURES
  as shown in world builds without it:
  ERROR: Nothing PROVIDES 'virtual/egl' (but openembedded-core/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb, openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb DEPENDS on or otherwise requires it)

$ bitbake libwpe
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/egl' (but /OE/build/oe-core/openembedded-core/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/kernel
  virtual/make
  virtual/perf
ERROR: Required build target 'libwpe' has no buildable providers.
Missing or unbuildable dependency chain was: ['libwpe', 'virtual/egl']

$ bitbake wpebackend-fdo
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/egl' (but /OE/build/oe-core/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb DEPENDS on or otherwise requires it). Close matches:
  virtual/kernel
  virtual/make
  virtual/perf
ERROR: Required build target 'wpebackend-fdo' has no buildable providers.
Missing or unbuildable dependency chain was: ['wpebackend-fdo', 'virtual/egl']

$ bitbake webkitgtk
ERROR: Nothing PROVIDES 'webkitgtk'
webkitgtk was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb       | 4 +++-
 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
index 346ca9b1d8..12499ff281 100644
--- a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
@@ -9,7 +9,9 @@ DEPENDS = "virtual/egl libxkbcommon"
 # Workaround build issue with RPi userland EGL libraries.
 CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
 
-inherit cmake
+inherit cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
index 7db5806d9d..cd2f7fabda 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
@@ -8,7 +8,9 @@ DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
 
 DEPENDS_append_class-target = " wayland-native"
 
-inherit cmake
+inherit cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
-- 
2.20.1


