Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDx7-0005eg-B7
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:18 +0200
Received: by ggnq1 with SMTP id q1so3016918ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=+58ZVUnnbtvFspiSqoo+/mMLL2lEL56A+Ws/7afzZOM=;
	b=CvzOXL2YwBu+p4czcV6j31qi3iY1uHtlJrX/yNqmaqwlLBZADof6izSEhSueaE7YLv
	kCB2zyAdnuStkUZ6J9/6R15TishNOPUwEBfegUWilniWYTk70Xa9C0FhN3CJK8E9K0DK
	laBYjB07xUUIzdJwp3nILpPT1B9pUEqOl7Gxg=
Received: by 10.223.17.11 with SMTP id q11mr11975809faa.13.1318007134638;
	Fri, 07 Oct 2011 10:05:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm13582506fag.21.2011.10.07.10.05.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:05:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:04:56 +0200
Message-Id: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 01/31] xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:11:18 -0000

* xserver-xorg is closer to upstream naming and
  that's how it's named in OE-classic and meta-oe? It would make meta-oe
  transition easier and better to do it now then convert meta-oe to
  xserver-xf86 and then rename it back later.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc     |    4 ++--
 .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----------
 meta/conf/machine/qemux86-64.conf                  |    6 +++---
 meta/conf/machine/qemux86.conf                     |    6 +++---
 meta/conf/multilib.conf                            |    2 +-
 ...ver-xf86-common.inc => xserver-xorg-common.inc} |    1 +
 ...xserver-xf86-lite.inc => xserver-xorg-lite.inc} |    4 +---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    2 +-
 ...-lite_1.10.1.bb => xserver-xorg-lite_1.10.1.bb} |    2 +-
 ...{xserver-xf86-dri-lite.inc => xserver-xorg.inc} |    2 +-
 .../cache-xkbcomp-output-for-fast-start-up.patch   |    0
 .../crosscompile.patch                             |    0
 .../fix_macros1.patch                              |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    2 +-
 ...6-dri-lite_1.10.1.bb => xserver-xorg_1.10.1.bb} |    2 +-
 ...er-xf86-dri-lite_git.bb => xserver-xorg_git.bb} |    2 +-
 19 files changed, 27 insertions(+), 28 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-common.inc => xserver-xorg-common.inc} (96%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite.inc => xserver-xorg-lite.inc} (95%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg-lite}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-lite}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-lite}/macro_tweak.patch (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite_1.10.1.bb => xserver-xorg-lite_1.10.1.bb} (89%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite.inc => xserver-xorg.inc} (97%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg}/cache-xkbcomp-output-for-fast-start-up.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg}/fix_macros1.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg}/macro_tweak.patch (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_1.10.1.bb => xserver-xorg_1.10.1.bb} (93%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite_git.bb => xserver-xorg_git.bb} (94%)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d51ac64..a5cdb5b 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -3,8 +3,8 @@
 #
 PREFERRED_PROVIDER_virtual/db ?= "db"
 PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7b6c4a9..8af80c7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3683,14 +3683,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
 RECIPE_MAINTAINER_pn-mesa-xlib="Yu Ke <ke.yu@intel.com>"
 
-RECIPE_STATUS_pn-xserver-xf86-dri-lite="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xserver-xf86-dri-lite="1.8.99.904"
-RECIPE_NO_OF_PATCHES_pn-xserver-xf86-dri-lite="2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-dri-lite="2 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-dri-lite="2010/07/01"
-RECIPE_INTEL_SECTION_pn-xserver-xf86-dri-lite="graphic core"
-RECIPE_LAST_UPDATE_pn-xserver-xf86-dri-lite = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xserver-xf86-dri-lite="Yu Ke <ke.yu@intel.com>"
+RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
+RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
+RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="2010/07/01"
+RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
+RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
+RECIPE_MAINTAINER_pn-xserver-xorg="Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-synaptics = "red"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
@@ -5908,8 +5908,8 @@ DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
-DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
 DISTRO_PN_ALIAS_pn-dtc-native = "Fedora=dtc Ubuntu=dtc"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 18a7513..f28cf08 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -4,8 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-x86_64.inc
 require conf/machine/include/qemu.inc
@@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xf86-dri-lite \
+XSERVER ?= "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 5d0d03e..75c9042 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -4,8 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/libgl  = "mesa-dri"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xf86-dri-lite"
-PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xf86-dri-lite"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 
 require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemu.inc
@@ -17,7 +17,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # We bypass swrast but we need it to be present for X to load correctly
-XSERVER ?= "xserver-xf86-dri-lite \
+XSERVER ?= "xserver-xorg \
            mesa-dri-driver-swrast \
            xf86-input-vmmouse \
            xf86-input-keyboard \
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index b9da33a..5e4b435 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -442,7 +442,7 @@ BBCLASSEXTEND_append_pn-xrandr = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xrestop = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xserver-nodm-init = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xserver-xf86-config = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-xserver-xf86-dri-lite = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-xserver-xorg = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xset = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xtrans = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-xtscal = " ${MULTILIBS}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
similarity index 96%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 17d456c..78c5f2e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
+# deprecated, we should use virtual/xserver instead
 PROVIDES = "virtual/xserver-xf86"
 
 # Other packages tend to just care that there is *an* X server:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
similarity index 95%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index 131c258..f1cef1b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,6 +1,4 @@
-require xserver-xf86-common.inc
-
-PROVIDES += "xserver-xf86-lite"
+require xserver-xorg-common.inc
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
index 2b75427..2b32d4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite/macro_tweak.patch
@@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
 xorg-server 1.8.99.904.
 
 the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
+xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
 are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
 can be safely replace by this patch.
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
index e42f27d..63b2c38 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.10.1.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-lite.inc
+require xserver-xorg-lite.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
similarity index 97%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6b13873..9bc0ee4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,4 +1,4 @@
-require xserver-xf86-common.inc
+require xserver-xorg-common.inc
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/cache-xkbcomp-output-for-fast-start-up.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_macros1.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
index 2b75427..2b32d4e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/macro_tweak.patch
@@ -2,7 +2,7 @@ This is the revised version of files/macro_tweak.patch for
 xorg-server 1.8.99.904.
 
 the files/macro_tweak.patch can not removed now since it is used by
-xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
+xserver-kdrive-1.7.99.2 and xserver-xorg(-lite). Once they
 are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
 can be safely replace by this patch.
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
index b797f97..0194798 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.10.1.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-dri-lite.inc
+require xserver-xorg.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
index 87ba040..beef06a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_git.bb
@@ -1,4 +1,4 @@
-require xserver-xf86-dri-lite.inc
+require xserver-xorg.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
-- 
1.7.7



