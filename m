Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RijlJ-0002PJ-Cs
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 10:37:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 01:30:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108992557"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 01:30:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:29:48 +0000
Message-Id: <6f81b3695f6f1e19906e6173c6c7e3ee4f86a11b.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] conf/local.conf.sample: fix typos/grammar/formatting
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
X-List-Received-Date: Thu, 05 Jan 2012 09:37:29 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |   35 ++++++++++++++++++-----------------
 1 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 7d52d0e..5679c03 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -4,7 +4,7 @@
 # to the system might want to change but pretty much any configuration option can
 # be set in this file. More adventurous users can look at local.conf.extended 
 # which contains other examples of configuration which can be placed in this file
-# but new users likely don't need any of them initially.
+# but new users likely won't need any of them initially.
 #
 # Lines starting with the '#' character are commented out and in some cases the 
 # default values are provided as comments to show people example syntax. Enabling
@@ -22,16 +22,16 @@
 # The second option controls how many processes make should run in parallel when
 # running compile tasks:
 #
-# PARALLEL_MAKE = "-j 4"
+#PARALLEL_MAKE = "-j 4"
 #
-# For a quadcore, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
+# For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
 # be appropriate for example.
 
 #
 # Machine Selection
 #
 # You need to select a specific machine to target the build with. There are a selection
-# emulated machines available which can boot and run in the QEMU emulator:
+# of emulated machines available which can boot and run in the QEMU emulator:
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemumips"
@@ -59,7 +59,7 @@ MACHINE ??= "qemux86"
 # Where to place shared-state files
 #
 # BitBake has the capability to accelerate builds based on previously built output.
-# This is done using "shared state" files which can be through of as cache objects
+# This is done using "shared state" files which can be thought of as cache objects
 # and this option determines where those files are placed.
 #
 # You can wipe out TMPDIR leaving this directory intact and the build would regenerate
@@ -121,10 +121,10 @@ PACKAGE_CLASSES ?= "package_ipk"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image for suitable of development
+#  "debug-tweaks"   - make an image suitable for development
 #                     e.g. ssh root access has a blank password
-# There are other application targets that can be uses here too, see 
-# meta/classes/core-image.bbclass and meta/recipes-core/tasks/task-core.bb for more details.
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
 # We default to enabling the debugging tweaks.
 EXTRA_IMAGE_FEATURES = "debug-tweaks"
 
@@ -151,16 +151,17 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 #IMAGETEST = "qemu"
 #
 # This variable controls which tests are run against virtual images if enabled
-# above. The following would enable bat, oot test case under sanity suite and 
-# toolchain tests
+# above. The following would enable bat, boot the test case under the sanity suite
+# and perform toolchain tests
 #TEST_SCEN = "sanity bat sanity:boot toolchain"
 #
-# Because of the QEMU booting slowness issue(see bug #646 and #618), autobuilder
-# may suffer a timeout issue when running sanity test. We introduce variable
-# TEST_SERIALIZE here to reduce the time on sanity test. It is by default set 
-# to 1. This will start image and run cases in the same image without reboot 
-# or kill. If it is set to 0, the image will be copied and tested for each 
-# case, which will take longer but be more precise.
+# Because of the QEMU booting slowness issue (see bug #646 and #618), the
+# autobuilder may suffer a timeout issue when running sanity tests. We introduce
+# the variable TEST_SERIALIZE here to reduce the time taken by the sanity tests.
+# It is set to 1 by default, which will boot the image and run cases in the same
+# image without rebooting or killing the machine instance. If it is set to 0, the
+# image will be copied and tested for each case, which will take longer but be
+# more precise.
 #TEST_SERIALIZE = "1"
 
 #
@@ -175,7 +176,7 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # Examples of the occasions this may happen are when resolving patches which cannot
 # be applied, to use the devshell or the kernel menuconfig
 #
-# Supported values are auto, gnome, xfce, rxvt, xcreen, konsole (3.x only), none
+# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
 # Note: currently, Konsole support only works for KDE 3.x due to the way
 # newer Konsole versions behave
 #OE_TERMINAL = "auto"
-- 
1.7.5.4



