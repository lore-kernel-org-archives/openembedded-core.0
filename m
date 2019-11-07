Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2990B7F7B9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 02:34:38 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id n12so239630qvt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 18:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jsuc4IaLkBEDheQgYD+4CakhhHZJ9EM7fVcpjDo5fCw=;
	b=qLyKYQjm2We1r4hOynaGYIqg2NJpI+oAVfrJCQzDoqu/p2B1444t3j4SIf/juP5hfS
	lG+WtqHdC4MjY9IT3Z9wcslRuDOl3Ntaf89rbG8DEMXe8yY5J3C8V7oqeLAOy9QykjHI
	OR0GwfM6O6kZMT7SShzXh1jV60YBEg7r89owvU2Gr8JVkb6sbe7ldn0MIfimVR6VfgtB
	7c6h8qG8Pp0sOvopdDjBbguSfnDUSAB+3Ggfz6ay231Z1iQr6QWSHbcX/bxd86ipV/2T
	jzW3gafih34V/XXNt3PtZk78bccubHKc7VkkuVq0y1Nrl6KIYo3D2rWs+0gvmSv5Q463
	s2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jsuc4IaLkBEDheQgYD+4CakhhHZJ9EM7fVcpjDo5fCw=;
	b=sPu9idX0RnM01halvqfWEisXe/y1d9+HvWYFyhXWdhmciRCHrMth0AUTZsJs88mQ94
	g7ahVrNII0S0fTA/Nxtv94Y8sNcTRDXM9eidS78xjFxYScIqLplKtFv2rUdhJ68LmxXZ
	xeSL0/sQGqmDefvhGLOmpH/6YXw4pLrIvHK0pC0NKiCPnnF1c03za1QKDDwrxufPq76w
	wzQk7+DVRUr0OLKmzDyJA3PFqXM2iR83GdwNfwyHUMPeW0wtTloFQXUn5918JKmL9LOQ
	rclfdMiiLJjm6SipfS/xvD9w6h+7MBMSvRxELDkP/PdPq9rshw3RUldQLL4+DRCEJW25
	W/Bw==
X-Gm-Message-State: APjAAAX9Y2BkOeYhgU/4jLhV2yRFAcY+y6muD05Ysr9lLRA8BOtbOAtB
	+OBMv+ietx2iFrXnXXq3dJiUsUcj8Hc=
X-Google-Smtp-Source: APXvYqwCdBTLK1U2i8jfw/uRLmczarX2pELo1ztiFoJGeE0iV3nxWHms9YEDITBHdYZFqnm4CZeCAA==
X-Received: by 2002:a0c:c70a:: with SMTP id w10mr1239793qvi.218.1573094079497; 
	Wed, 06 Nov 2019 18:34:39 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id i12sm413778qkm.78.2019.11.06.18.34.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 18:34:38 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 21:34:36 -0500
Message-Id: <20191107023436.6832-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meta: add missing description for some recipes in graphics
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
X-List-Received-Date: Thu, 07 Nov 2019 02:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc                | 3 +++
 meta/recipes-graphics/cogl/cogl-1.0.inc                      | 4 ++++
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb             | 4 ++++
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb        | 4 ++++
 .../matchbox-session/matchbox-session_0.1.bb                 | 1 +
 meta/recipes-graphics/piglit/piglit_git.bb                   | 2 ++
 meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb   | 4 ++++
 meta/recipes-graphics/wayland/libinput_1.14.1.bb             | 5 +++++
 8 files changed, 27 insertions(+)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 6dbbf4d803..9ecdfd0a8c 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -1,4 +1,7 @@
 SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
+DESCRIPTION = "Clutter is an Open GL based interactive canvas library, \
+designed for creating fast, mainly 2D single window applications such as media \
+box UIs, presentations, kiosk style applications and so on."
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 4436163168..23661d9b64 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -1,4 +1,8 @@
 SUMMARY = "Modern 3D graphics API with associated utility APIs"
+DESCRIPTION = "Cogl is a small open source library for using 3D graphics \
+hardware for rendering. The API departs from the flat state machine style of \
+OpenGL and is designed to make it easy to write orthogonal components that \
+can render without stepping on each others toes."
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index 825453ab28..834d8154ee 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -1,4 +1,8 @@
 SUMMARY = "OpenGL function pointer management library"
+DESCRIPTION = "It hides the complexity of dlopen(), dlsym(), \
+glXGetProcAddress(), eglGetProcAddress(), etc. from the app developer, with \
+very little knowledge needed on their part. They get to read GL specs and \
+write code using undecorated function names like glCompileShader()."
 HOMEPAGE = "https://github.com/anholt/libepoxy/"
 SECTION = "libs"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index ce45e48147..cca2d48a45 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Matchbox window manager core library"
+DESCRIPTION = "Matchbox is an Open Source base environment for the X Window \
+System running on non-desktop embedded platforms such as handhelds, set-top \
+boxes, kiosks and anything else for which screen space, input mechanisms or \
+system resources are limited."
 SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index cbaf054365..57a3024ea9 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Custom Matchbox session files"
+DESCRIPTION = "Very simple session manager for matchbox tools"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d489f82b14..28a52cfeee 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -1,4 +1,6 @@
 SUMMARY = "OpenGL driver testing framework"
+DESCRIPTION = "Piglit is an open-source test suite for OpenGL and OpenCL \
+implementations."
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
index d2b11c103a..4ac4412df3 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.0.bb
@@ -1,4 +1,8 @@
 SUMMARY = "VirGL virtual OpenGL renderer"
+DESCRIPTION = "Virgil is a research project to investigate the possibility of \
+creating a virtual 3D GPU for use inside qemu virtual machines, that allows \
+the guest operating system to use the capabilities of the host GPU to \
+accelerate 3D rendering."
 HOMEPAGE = "https://virgil3d.github.io/"
 
 LICENSE = "MIT"
diff --git a/meta/recipes-graphics/wayland/libinput_1.14.1.bb b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
index 38bc8d2c33..c74a9bad1f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.14.1.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Library to handle input devices in Wayland compositors"
+DESCRIPTION = "libinput is a library to handle input devices in Wayland \
+compositors and to provide a generic X.Org input driver. It provides \
+device detection, device handling, input device event processing and \
+abstraction so minimize the amount of custom input code compositors need to \
+provide the common set of functionality that users expect."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
-- 
2.20.1


