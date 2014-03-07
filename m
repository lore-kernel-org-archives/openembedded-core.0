Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 731C86E81B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:37:31 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so4184748yha.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 05:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=l2KSGvSa1I5DRa3hywJGF1B6+qn+p8H9UeB3ZtOc3XQ=;
	b=N8m3rV46/d+GBufH1rTEagwESwA1oz/JaoqDPoQEeE14KLowwXBhNNrLqI201h703d
	2DYMck4cVyKpxP4c25RTVtif7gx8+xovTlWM8uvVVJp+wDVxtfRNfhWhjb8q5lj2waHx
	GR5t/Gmba1WYvzMdT1wFEEEzeR4PGhqKzzUPE9oyfOsys2AOCGut0jt30+zwR6ilk6hB
	5cbscSd7yxdFrap9PIMIW/mfSfjya1TQJMSRKmNQUk15rSrnLOsGwLwzfU9BQOWz1C6J
	mWh6+eCKQ5AUzPmqiIfV9uhcJ0J6BBHEwWs0cjDLapdWPZtpwcn12vLeszIu8POHmDBp
	WWaQ==
X-Received: by 10.236.147.107 with SMTP id s71mr22468248yhj.45.1394199452739; 
	Fri, 07 Mar 2014 05:37:32 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id n4sm28819244yhc.13.2014.03.07.05.37.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Mar 2014 05:37:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 6C2991921C2BE; Fri,  7 Mar 2014 10:37:28 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  7 Mar 2014 10:37:27 -0300
Message-Id: <1394199447-2781-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] PR bumps to remove PRINC use in meta-fsl-arm
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
X-List-Received-Date: Fri, 07 Mar 2014 13:37:32 -0000

Those recipes need PR bump so we drop PRINC from meta-fsl-arm layer.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb                          | 2 +-
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-base.bb               | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.0.bb                       | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb      | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb      | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb         | 2 ++
 7 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index c996cd9..5ab1b13 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "0.2.0"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "\
   file://asound.conf \
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 09e0aef..0c6a530 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -3,7 +3,7 @@
 #
 
 SUMMARY = "Host packages for the standalone SDK or external toolchain"
-PR = "r11"
+PR = "r12"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index d3e35df..368c318 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Merge machine and distro options to create a basic machine task/package"
 LICENSE = "MIT"
-PR = "r82"
+PR = "r83"
 
 inherit packagegroup
 
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.0.bb
index abfd9a0..3810b28 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r15"
+PR = "r16"
 
 SRC_URI = " \
        file://automount.rules \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 3fe72e2..3749a1d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r19"
+PR = "r27"
 
 SRC_URI = "file://xorg.conf"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 19473ba..53cc55c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r7"
+PR = "r8"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 4474e1e..60de7c0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -10,6 +10,8 @@ SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
 DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
+PR = "r4"
+
 inherit gettext gconf
 
 # This package doesn't have a configure switch for EGL or GL, so forcibly tell
-- 
1.9.0


