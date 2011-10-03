Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAih7-0005A2-0D
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:36:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tj10kD8ZEqB7o6KMlQFB6zKCSp67LV9uSf6haG809Po=;
	b=RCh98nLoFtgyqgYjbiZ0TqrB/cPPgt9wHjvjuPAlMEYDqHXFtQolCd6544Qo1TYB90
	e2u1ZqWULehk/Q9dx6xXbZh+xdgSTHKC4t727ef+c6YLiHXkTxw/1K2yCQf5BmSTy0/1
	XJN3Rcv8uHmiesoGIYPUjtIgsZ6lvppXF+hqo=
Received: by 10.204.155.71 with SMTP id r7mr9926590bkw.205.1317648662913;
	Mon, 03 Oct 2011 06:31:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm13220172bkp.10.2011.10.03.06.31.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:46 +0200
Message-Id: <ef3e42648af17e12e60948eb7193be76150f890d.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 15/30] xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
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
X-List-Received-Date: Mon, 03 Oct 2011 13:37:07 -0000

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
 .../xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb   |    4 ----
 .../xorg-xserver/xserver-xf86-lite_1.11.1.bb       |    4 ----
 ...ver-xf86-1.11.1.inc => xserver-xorg-1.11.1.inc} |    0
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 ...ver-xf86-common.inc => xserver-xorg-common.inc} |    1 +
 ...xserver-xf86-lite.inc => xserver-xorg-lite.inc} |    2 +-
 .../xorg-xserver/xserver-xorg-lite_1.11.1.bb       |    4 ++++
 ...{xserver-xf86-dri-lite.inc => xserver-xorg.inc} |    2 +-
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    4 ++++
 16 files changed, 30 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-1.11.1.inc => xserver-xorg-1.11.1.inc} (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite-1.11.1 => xserver-xorg-1.11.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite-1.11.1 => xserver-xorg-1.11.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite-1.11.1 => xserver-xorg-1.11.1}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-common.inc => xserver-xorg-common.inc} (99%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite.inc => xserver-xorg-lite.inc} (73%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite.inc => xserver-xorg.inc} (87%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb

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
index 47fa7bf..eaaafaa 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3680,14 +3680,14 @@ RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
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
@@ -5895,8 +5895,8 @@ DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
deleted file mode 100644
index 54ff37a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require xserver-xf86-dri-lite.inc
-require xserver-xf86-${PV}.inc
-
-PE = "1"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
deleted file mode 100644
index e214dec..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require xserver-xf86-lite.inc
-require xserver-xf86-${PV}.inc
-
-FILESEXTRAPATHS_append := "${THISDIR}/xserver-xf86-dri-lite:${THISDIR}/xserver-xf86-dri-lite-${PV}:"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite-1.11.1/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
similarity index 99%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 81abfc9..16f2a23 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
+# deprecated, we should use virtual/xserver instead
 PROVIDES = "virtual/xserver-xf86"
 
 # Other packages tend to just care that there is *an* X server:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
similarity index 73%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index a785e64..be84e9e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,4 +1,4 @@
-require xserver-xf86-common.inc
+require xserver-xorg-common.inc
 
 EXTRA_OECONF += "\
                  --disable-dri \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
new file mode 100644
index 0000000..ec29b21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
@@ -0,0 +1,4 @@
+require xserver-xorg-lite.inc
+require xserver-xorg-${PV}.inc
+
+FILESEXTRAPATHS_append := "${THISDIR}/xserver-xorg:${THISDIR}/xserver-xorg-${PV}:"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
similarity index 87%
rename from meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 0d956b5..9a057f1 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,4 +1,4 @@
-require xserver-xf86-common.inc
+require xserver-xorg-common.inc
 
 PROTO_DEPS += "xf86driproto dri2proto"
 LIB_DEPS += "virtual/libgl"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
new file mode 100644
index 0000000..8e97888
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
@@ -0,0 +1,4 @@
+require xserver-xorg.inc
+require xserver-xorg-${PV}.inc
+
+PE = "1"
-- 
1.7.7



