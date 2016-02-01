Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id BB5067708E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:37 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s68so46324292qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rNioUSN/uSUU/rQmbB3OA9CwL5Ik4zOj/3ZP6eesDUw=;
	b=vfFNdMd2ygckX/n/xukxI4/V9iTDFHH+GP9aBsKFfAtO6uiyLeY1EPUNGwKqVLi9aM
	kos899chyTBdUlod+JvE0CDrp31NMflFowCQlR1gH082XQOS4VAtlpVCLoLpJzGKamN5
	vK71d4sWJpuL6u/sPCAn+9njY1XcT4F8k8LlJ3LzR6QAS7cT/SKBOe/8JOejQ54ltaWq
	FwsbJQz+hucO/NfZNi8+FSjO9+yQlM7c1Mj3LjIEwBdxJUJxoappX8UEgRm5o0rX6qie
	Q+p0/kCfDJpPCplyMe7Voqg7Cx3oGWi9mRCqidIE300+3SUY4FfOXIBFZcahc3FD5Mv+
	wD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rNioUSN/uSUU/rQmbB3OA9CwL5Ik4zOj/3ZP6eesDUw=;
	b=bv5hxbDqwgG9700HqSqshCWXj70cWzXxr+aEiSeTl2aXskH8MPIHqRSD9t7BH0hkfs
	yCqnCfks3LcUbyA07Az3LNFm1+/eXz6OoDh0KW2VxtkxYaoGhNGxUInT+C6nLdKqeOy6
	2i3EmpalZc/3vFOrvJZOL5mm3Y1eBah1lDfMhvHNL+3OacEChJeC8wbX2tgfRIKFfTKr
	jO8uFIstZdEagUf51LdoChH+LSyIj48SGColynSR/BfeYBtVqZCrldMAuXk2FP9hbcSw
	3HAy2QrBgUA05IPHGG4VbntU109LD+X/s9UxAvOs7V6SNc+XODyRJyE/Z7xCwEhfQy3E
	ooZw==
X-Gm-Message-State: AG10YOT3PVo43AbdORjAWWQX3W3Umb/EulNsWWAOgemJlt7JaP+ymlzwUaKdn4B2scUvOw==
X-Received: by 10.55.53.207 with SMTP id c198mr25857424qka.24.1454303318311;
	Sun, 31 Jan 2016 21:08:38 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:28 +0000
Message-Id: <abbde9a5321e7682a7e96cb06341ce5280c89456.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] local.conf.sample.extended: Document HOW-TO enable systemd or busbox for init system
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:37 -0000

OE core provides systemd,busybox as options for system init system along
with sysvinit being the default. Document the needed settings to enable
systemd and busybox as options if user wishes.

Remove trailing whitespaces as we are here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/local.conf.sample          | 25 ++++++++++++-------------
 meta/conf/local.conf.sample.extended | 28 +++++++++++++++++++++++-----
 2 files changed, 35 insertions(+), 18 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index a662f4d..11449e8 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -2,11 +2,11 @@
 # This file is your local configuration file and is where all local user settings
 # are placed. The comments in this file give some guide to the options a new user
 # to the system might want to change but pretty much any configuration option can
-# be set in this file. More adventurous users can look at local.conf.extended 
+# be set in this file. More adventurous users can look at local.conf.extended
 # which contains other examples of configuration which can be placed in this file
 # but new users likely won't need any of them initially.
 #
-# Lines starting with the '#' character are commented out and in some cases the 
+# Lines starting with the '#' character are commented out and in some cases the
 # default values are provided as comments to show people example syntax. Enabling
 # the option is a question of removing the # character and making any change to the
 # variable as required.
@@ -73,8 +73,8 @@ MACHINE ??= "qemux86"
 #
 # Package Management configuration
 #
-# This variable lists which packaging formats to enable. Multiple package backends 
-# can be enabled at once and the first item listed in the variable will be used 
+# This variable lists which packaging formats to enable. Multiple package backends
+# can be enabled at once and the first item listed in the variable will be used
 # to generate the root filesystems.
 # Options are:
 #  - 'package_deb' for debian style deb files
@@ -88,7 +88,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 # SDK/ADT target architecture
 #
 # This variable specifies the architecture to build SDK/ADT items for and means
-# you can build the SDK packages for architectures other than the machine you are 
+# you can build the SDK packages for architectures other than the machine you are
 # running the build on (i.e. building i686 packages on an x86_64 host).
 # Supported values are i686 and x86_64
 #SDKMACHINE ?= "i686"
@@ -96,7 +96,7 @@ PACKAGE_CLASSES ?= "package_ipk"
 #
 # Extra image configuration defaults
 #
-# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
 #  "dbg-pkgs"       - add -dbg packages for all installed packages
@@ -121,7 +121,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
 # Additional image features
 #
 # The following is a list of additional classes to use when building images which
-# enable extra features. Some available options which can be included in this variable 
+# enable extra features. Some available options which can be included in this variable
 # are:
 #   - 'buildstats' collect build statistics
 #   - 'image-mklibs' to reduce shared library files size for an image
@@ -143,8 +143,8 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 #
 # Interactive shell configuration
 #
-# Under certain circumstances the system may need input from you and to do this it 
-# can launch an interactive shell. It needs to do this since the build is 
+# Under certain circumstances the system may need input from you and to do this it
+# can launch an interactive shell. It needs to do this since the build is
 # multithreaded and needs to be able to handle the case where more than one parallel
 # process may require the user's attention. The default is iterate over the available
 # terminal types to find one that works.
@@ -182,13 +182,13 @@ BB_DISKMON_DIRS = "\
 #
 # Shared-state files from other locations
 #
-# As mentioned above, shared state files are prebuilt cache data objects which can 
+# As mentioned above, shared state files are prebuilt cache data objects which can
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
 # This can be a filesystem directory, or a remote url such as http or ftp. These
-# would contain the sstate-cache results from previous builds (possibly from other 
-# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
+# would contain the sstate-cache results from previous builds (possibly from other
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
 # cache locations to check for the shared objects.
 # NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
 # at the end as shown in the examples below. This will be substituted with the
@@ -209,7 +209,6 @@ PACKAGECONFIG_append_pn-qemu-native = " sdl"
 PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 #ASSUME_PROVIDED += "libsdl-native"
 
-
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
 # this doesn't mean anything to you.
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index a54cded..a95703d 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -57,7 +57,7 @@
 
 # The following are used to control options related to debugging.
 #
-# Uncomment this to change the optimization to make debugging easer, at the 
+# Uncomment this to change the optimization to make debugging easer, at the
 # possible cost of performance.
 # DEBUG_BUILD = "1"
 #
@@ -131,9 +131,9 @@
 # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
 #
 # Pseudo will attempt to determine if a 32-bit wrapper is necessary, but
-# it doesn't always guess properly.  If you have 32-bit executables on 
-# your 64-bit build system, you likely want to set this to "0", 
-# otherwise you could end up with incorrect file attributes on the 
+# it doesn't always guess properly.  If you have 32-bit executables on
+# your 64-bit build system, you likely want to set this to "0",
+# otherwise you could end up with incorrect file attributes on the
 # target filesystem.
 #
 # Default is to not build 32 bit libs on 64 bit systems, uncomment this
@@ -271,7 +271,7 @@
 
 #
 # GCC/LD FLAGS to enable more secure code generation
-# 
+#
 # By including the security_flags include file you enable flags
 # to the compiler and linker that cause them to generate more secure
 # code, this is enabled by default in the poky-lsb distro.
@@ -381,3 +381,21 @@
 # PREFERRED_VERSION_rpm = "4.11.2"
 # PREFERRED_VERSION_rpm-native = "4.11.2"
 # RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"
+
+#
+# Use busybox/mdev for system initialization
+#
+#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+#VIRTUAL-RUNTIME_login_manager = "busybox"
+#VIRTUAL-RUNTIME_init_manager = "busybox"
+#VIRTUAL-RUNTIME_initscripts = "initscripts"
+#VIRTUAL-RUNTIME_keymaps = "keymaps"
+#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+
+#
+# Use systemd for system initialization
+#
+#DISTRO_FEATURES_append = " systemd"
+#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+#VIRTUAL-RUNTIME_init_manager = "systemd"
+#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
-- 
2.7.0


