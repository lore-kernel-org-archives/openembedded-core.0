Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qlji9-0007Xy-Fm
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 17:38:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2011 08:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="34658280"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.235])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2011 08:33:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:33:34 +0100
Message-Id: <d82e8ed188f285363dc42c020b5534945358416b.1311694250.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311694250.git.paul.eggleton@linux.intel.com>
References: <cover.1311694250.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] meta/conf/local.conf.sample: improve comments/layout
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
X-List-Received-Date: Tue, 26 Jul 2011 15:38:21 -0000

Some additions and grammar fixes to the comments, as well as moving
the locale options to the same place.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/local.conf.sample |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 7a5e533..1322202 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -2,10 +2,10 @@
 CONF_VERSION = "1"
 
 # Uncomment and change to cache the files Poky downloads in an alternative
-# location, default it ${TOPDIR}/downloads
+# location, default is ${TOPDIR}/downloads
 #DL_DIR ?= "${TOPDIR}/downloads"
 # Uncomment and change to cache Poky's built staging output in an alternative
-# location, default ${TOPDIR}/sstate-cache
+# location, default is ${TOPDIR}/sstate-cache
 #SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 
 # Uncomment and set to allow bitbake to execute multiple tasks at once.
@@ -26,6 +26,8 @@ MACHINE ??= "qemux86"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
 
+# BBMASK is a regular expression that can be used to tell BitBake to ignore
+# certain recipes.
 BBMASK = ""
 
 # EXTRA_IMAGE_FEATURES allows extra packages to be added to the generated images 
@@ -41,8 +43,7 @@ BBMASK = ""
 # "debug-tweaks"   - make an image for suitable of development
 #                    e.g. ssh root access has a blank password
 # There are other application targets too, see meta/classes/core-image.bbclass 
-# and meta/packages/tasks/task-core.bb for more details.
-
+# and meta/recipes-core/tasks/task-core.bb for more details.
 EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 
 # A list of packaging systems used in generated images
@@ -119,8 +120,6 @@ PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
 # Uncomment this if you want BitBake to emit the log if a build fails.
 BBINCLUDELOGS = "yes"
 
-ENABLE_BINARY_LOCALE_GENERATION = "1"
-
 # The architecture to build SDK items for, by setting this you can build SDK
 # packages for architectures other than the host i.e. building i686 packages
 # on an x86_64 host.
@@ -150,6 +149,12 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
 #case, which will take much time.
 #TEST_SERIALIZE = "1"
 
+# ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
+# packages at build time using qemu-native. Disabling it (by setting it to 0)
+# will save some build time at the expense of breaking i18n on devices with
+# less than 128MB RAM.
+ENABLE_BINARY_LOCALE_GENERATION = "1"
+
 # Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you not
 # wish to perform the time-consuming step of generating all LIBC locales.
 # NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
@@ -160,10 +165,10 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
 #IMAGE_LINGUAS ?= "en-gb"
 #LIMIT_BUILT_LOCALES ?= "POSIX en_GB"
 
-# This value is currently used by PSEUDO to determine if the recipe should
+# This value is currently used by pseudo to determine if the recipe should
 # build both the 32-bit and 64-bit wrapper libraries on a 64-bit build system.
 #
-# PSEUDO will attempt to determine if a 32-bit wrapper is necessary, but 
+# Pseudo will attempt to determine if a 32-bit wrapper is necessary, but
 # it doesn't always guess properly.  If you have 32-bit executables on 
 # your 64-bit build system, you likely want to set this to "0", 
 # otherwise you could end up with incorrect file attributes on the 
-- 
1.7.4.1



