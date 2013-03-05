Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCtGr-0001jk-Lp
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:55:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2013 06:38:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="209063734"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2013 06:38:29 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 16:38:24 +0200
Message-Id: <1362494304-10179-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] Replace references to mesa-dri with mesa in all files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 14:55:16 -0000

[YOCTO #3385]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta-yocto-bsp/conf/machine/atom-pc.conf           |    2 +-
 meta/conf/distro/include/default-providers.inc     |    6 +++---
 meta/conf/machine/include/ia32-base.inc            |    4 ++--
 meta/conf/machine/include/qemu.inc                 |    8 ++++----
 meta/conf/machine/qemux86-64.conf                  |    8 ++++----
 meta/conf/machine/qemux86.conf                     |    8 ++++----
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../arch/i386/conf/machine/{{=machine}}.conf       |    2 +-
 .../arch/qemu/conf/machine/{{=machine}}.conf       |    8 ++++----
 10 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf b/meta-yocto-bsp/conf/machine/atom-pc.conf
index e97b173..b1c2ae1 100644
--- a/meta-yocto-bsp/conf/machine/atom-pc.conf
+++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
@@ -19,7 +19,7 @@ XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-input-synaptics \
            xf86-video-intel \
-           mesa-dri-driver-i915"
+           mesa-driver-i915"
 
 #MACHINE_EXTRA_RDEPENDS = "rt2860"
 
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ebf2a09..39ce7cc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -5,9 +5,9 @@ PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index 0798bf8..921c740 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -39,11 +39,11 @@ XSERVER_IA32_EXT = " \
            "
 
 XSERVER_IA32_I915 = "xf86-video-intel \
-           mesa-dri-driver-i915 \
+           mesa-driver-i915 \
            "
 
 XSERVER_IA32_I965 = "xf86-video-intel \
-           mesa-dri-driver-i965 \
+           mesa-driver-i965 \
            "
 
 XSERVER_IA32_VESA = "xf86-video-vesa"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 52215b3..29caec9 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,10 +1,10 @@
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            mesa-dri-driver-swrast \
+            mesa-driver-swrast \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 3852b89..23a7108 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -3,9 +3,9 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/tune-x86_64.inc
 
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index ee14bec..d13dc84 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -3,9 +3,9 @@
 #@DESCRIPTION: Machine configuration for running a common x86
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/tune-i586.inc
 
@@ -14,7 +14,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
index afe8235..f769312 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968
 inherit autotools pkgconfig
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
-DEPENDS += "wayland mesa-dri virtual/egl"
+DEPENDS += "wayland mesa virtual/egl"
 
 EXTRA_OECONF  = "--disable-android-compositor --enable-setuid-install"
 EXTRA_OECONF += "--disable-tablet-shell --disable-xwayland"
@@ -25,9 +25,9 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland',
                    ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
                   "
 # Weston on KMS
-PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa-dri libpam"
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa libpam"
 # Weston on Wayland (nested Weston)
-PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa-dri"
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
 # Weston on X11
 PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 5d5443c..795410b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -126,7 +126,7 @@ PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '',
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
                       --disable-dri --disable-dri2 --disable-glx,\
-                      xf86driproto dri2proto mesa-dri"
+                      xf86driproto dri2proto mesa"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
index 86d6a53..304382d 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/i386/conf/machine/{{=machine}}.conf
@@ -57,7 +57,7 @@ XSERVER ?= "${XSERVER_IA32_BASE} \
 
 {{ if xserver == "y" and xserver_choice == "xserver_emgd": }}
 PREFERRED_VERSION_xserver-xorg ?= "1.9.3"
-PREFERRED_VERSION_mesa-dri ?= "7.11"
+PREFERRED_VERSION_mesa ?= "7.11"
 PREFERRED_VERSION_emgd-driver-bin ?= "1.14"
 
 {{ if xserver == "y" and xserver_choice == "xserver_vesa" or xserver_choice == "xserver_emgd": }}
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
index de3b279..e618c61 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
@@ -15,9 +15,9 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 
 {{ if qemuarch == "i386" or qemuarch == "x86_64": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 {{ input type:"choicelist" name:"qemuarch" prio:"5" msg:"Which qemu architecture would you like to use?" default:"i386" }}
 {{ input type:"choice" val:"i386" msg:"i386    (32-bit)" }}
@@ -45,7 +45,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 # We bypass swrast but we need it to be present for X to load correctly
 XSERVER ?= "xserver-xorg \
-           mesa-dri-driver-swrast \
+           mesa-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
-- 
1.7.9.5



