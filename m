Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 81DD66F58D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311074"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:11 +0000
Message-Id: <b139276bfeb84d745f654701a101ee5d586b51b2.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] documentation.conf: drop obsolete variables
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:30 -0000

These haven't been used for some time (and DESTDIR was never a BitBake
variable at all).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/documentation.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 617fd2a..e709c68 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -115,7 +115,6 @@ DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DESCRIPTION[doc] = "The package description used by package managers. If not set, DESCRIPTION takes the value of the SUMMARY variable."
-DESTDIR[doc] = "The destination directory."
 DISTRO[doc] = "The short name of the distribution. If the variable is blank, meta/conf/distro/defaultsetup.conf will be used."
 DISTRO_EXTRA_RDEPENDS[doc] = "Specifies a list of distro-specific packages to add to all images. The variable only applies to the images that include packagegroup-base."
 DISTRO_EXTRA_RRECOMMENDS[doc] = "Specifies a list of distro-specific packages to add to all images if the packages exist. The list of packages are automatically installed but you can remove them."
@@ -150,17 +149,12 @@ FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when co
 #G
 
 GITDIR[doc] = "The directory where Git clones will be stored."
-GROUP_dependencies[doc] = "The keys in this group influence the dependency handling of BitBake and the resulting packages."
-GROUP_fetcher[doc] = "This key highly influences the fetcher implementations."
-GROUP_locale[doc] = "Locale generation of the GNU libc implementation."
-GROUP_packaging[doc] = "The keys in this group influence the package building process. Specifically, they influence what packages will be generated and what files will be present in the generated packages."
 
 #H
 
 HOMEPAGE[doc] = "Website where more information about the software the recipe is building can be found."
 HOST_ARCH[doc] = "The name of the target architecture. Normally same as the TARGET_ARCH."
 HOST_CC_ARCH[doc] = "The name of the host architecture. Normally same as the TARGET_CC_ARCH."
-HOST_NONSYSV[doc] = "Set to '1' if the host system is not SysV compatible (e.g. fakeroot-native will be build with tcp as IPC implementation)."
 HOST_OS[doc] = "The name of the target operating system. Normally the same as the TARGET_OS."
 HOST_PREFIX[doc] = "The prefix for the cross compile toolchain. Normally same as the TARGET_PREFIX."
 HOST_SYS[doc] = "Specifies the system, including the architecture and the operating system, for with the build is occurring in the context of the current recipe."
@@ -251,7 +245,6 @@ PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed.
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] = "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] = "A promise that your recipe satisfies runtime dependencies for optional modules that are found in other recipes."
-PALMTOP_USE_MULTITHREADED_QT[doc] = "Set to 'yes', if you want to build QT applications with CONFIG+=thread."
 PARALLEL_MAKE[doc] = "Specifies extra options that are passed to the make command during the compile tasks. This variable is usually in the form -j 4, where the number represents the maximum number of parallel threads make can run."
 PATCHRESOLVE[doc] = "Enable or disable interactive patch resolution."
 PE[doc] = "The epoch of the recipe. The default value is '0'. The field is used to make upgrades possible when the versioning scheme changes in some backwards incompatible way."
-- 
1.8.5.3


