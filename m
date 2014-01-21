Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34F686E821
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 14:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470375699"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:54 -0800
Message-Id: <9ffd747bfacef54cf2198c3ade0e598e1c9b7aa3.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 08/15] tune: README: Whitespace cleanup
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:37 -0000

Before making content changes, cleanup the various whitespace errors in
this file. Mostly end-of-line whitepsace.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/README |   88 +++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
index e4b59c9..65d0942 100644
--- a/meta/conf/machine/include/README
+++ b/meta/conf/machine/include/README
@@ -1,27 +1,27 @@
 2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
  - Initial Revision
 
-The individual CPU, and ABI tunings are contained in this directory.  A 
-number of local and global variables are used to control the way the 
-tunings are setup and how they work together to specify an optimized 
+The individual CPU, and ABI tunings are contained in this directory.  A
+number of local and global variables are used to control the way the
+tunings are setup and how they work together to specify an optimized
 configuration.
 
-The following is brief summary of the generic components that are used 
+The following is brief summary of the generic components that are used
 in these tunings.
 
-AVAILTUNES - This is a list of all of the tuning definitions currently 
-available in the system.  Not all tunes in this list may be compatible 
-with the machine configuration, or each other in a multilib 
-configuration.  Each tuning file can add to this list using "+=", but 
+AVAILTUNES - This is a list of all of the tuning definitions currently
+available in the system.  Not all tunes in this list may be compatible
+with the machine configuration, or each other in a multilib
+configuration.  Each tuning file can add to this list using "+=", but
 should never replace the list using "=".
 
-DEFAULTTUNE - This specifies the tune to use for a particular build.  
-Each tune should specify a reasonable default, which can be overriden by 
-a machine or multilib configuration.  The specified tune must be listed 
+DEFAULTTUNE - This specifies the tune to use for a particular build.
+Each tune should specify a reasonable default, which can be overriden by
+a machine or multilib configuration.  The specified tune must be listed
 in the AVAILTUNES.
 
-TUNEVALID[feature] - The <feature> is defined with a human readable 
-explanation for what it does.  All architectural, cpu, abi, etc tuning 
+TUNEVALID[feature] - The <feature> is defined with a human readable
+explanation for what it does.  All architectural, cpu, abi, etc tuning
 features must be defined using TUNEVALID.
 
 TUNECONFLICTS[feature] - A list of features which conflict with <feature>.
@@ -31,51 +31,51 @@ tuning ends up with features which conflict with each other.
 TUNE_FEATURES - This is automatically defined as TUNE_FEATURES_tune-<tune>.
 See TUNE_FEATURES_tune-<tune> for more information.
 
-TUNE_FEATURES_tune-<tune> - Specify the features used to describe a 
-specific tune.  This is a list of features that a tune support, each 
-feature must be in the TUNEVALID list.  Note: the tune and a given 
-feature name may be the same, but they have different purposes.  Only 
-features may be used to change behavior, while tunes are used to 
+TUNE_FEATURES_tune-<tune> - Specify the features used to describe a
+specific tune.  This is a list of features that a tune support, each
+feature must be in the TUNEVALID list.  Note: the tune and a given
+feature name may be the same, but they have different purposes.  Only
+features may be used to change behavior, while tunes are used to
 describe an overall set of features.
 
-ABIEXTENSION - An ABI extension may be specified by a specific feature 
-or other tuning setting, such as TARGET_FPU.  Any ABI extensions either 
-need to be defined in the architectures base arch file, i.e.  
-ABIEXTENSION = "eabi" in the arm case, or appended to in specific tune 
+ABIEXTENSION - An ABI extension may be specified by a specific feature
+or other tuning setting, such as TARGET_FPU.  Any ABI extensions either
+need to be defined in the architectures base arch file, i.e.
+ABIEXTENSION = "eabi" in the arm case, or appended to in specific tune
 files with a ".=".  Spaces are not allowed in this variable.
 
-TUNE_CCARGS - Setup the cflags based on the TUNE_FEATURES settings.  
-These should be additive when defined using "+=".  All items in this 
-list should be dynamic! i.e. 
+TUNE_CCARGS - Setup the cflags based on the TUNE_FEATURES settings.
+These should be additive when defined using "+=".  All items in this
+list should be dynamic! i.e.
 ${@bb.utils.contains("TUNE_FEATURES", "feature", "cflag", "!cflag", d)}
 
-TUNE_ARCH - The GNU canonical arch for a specific architecture.  i.e. 
-arm, armeb, mips, mips64, etc.  This value is by bitbake to setup 
-configure. TUNE_ARCH definitions are specific to a given architecture.  
-They may be a single static definitions, or may be dynamically adjusted.  
+TUNE_ARCH - The GNU canonical arch for a specific architecture.  i.e.
+arm, armeb, mips, mips64, etc.  This value is by bitbake to setup
+configure. TUNE_ARCH definitions are specific to a given architecture.
+They may be a single static definitions, or may be dynamically adjusted.
 See each architectures README for details for that CPU family.
 
-TUNE_PKGARCH - The package architecture used by the packaging systems to 
-define the architecture, abi and tuning of a particular package.  
-Similarly to TUNE_ARCH, the definition of TUNE_PKGARCH is specific to 
-each architecture. See each architectures README for details for that 
+TUNE_PKGARCH - The package architecture used by the packaging systems to
+define the architecture, abi and tuning of a particular package.
+Similarly to TUNE_ARCH, the definition of TUNE_PKGARCH is specific to
+each architecture. See each architectures README for details for that
 CPU family.
 
-PACKAGE_EXTRA_ARCHS - Lists all runtime compatible package 
-architectures.  By default this is equal to 
-PACKAGE_EXTRA_ARCHS_tune-<tune>.  If an architecture deviates from the 
+PACKAGE_EXTRA_ARCHS - Lists all runtime compatible package
+architectures.  By default this is equal to
+PACKAGE_EXTRA_ARCHS_tune-<tune>.  If an architecture deviates from the
 default it will be listed in the architecture README.
 
-PACKAGE_EXTRA_ARCHS_tune-<tune> - List all of the package architectures 
-that are compatible with this specific tune.  The package arch of this 
+PACKAGE_EXTRA_ARCHS_tune-<tune> - List all of the package architectures
+that are compatible with this specific tune.  The package arch of this
 tune must be in the list.
 
-TARGET_FPU - The FPU setting for a given tune, hard (generate floating 
-point instructions), soft (generate internal gcc calls), "other" 
-architecture specific floating point.  This is synchronized with the 
-compiler and other toolchain items.  This should be dynamically 
+TARGET_FPU - The FPU setting for a given tune, hard (generate floating
+point instructions), soft (generate internal gcc calls), "other"
+architecture specific floating point.  This is synchronized with the
+compiler and other toolchain items.  This should be dynamically
 configured in the same way that TUNE_CCARGS is.
 
-BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is 
-used in a multilib configuration to place the libraries in the correct, 
+BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is
+used in a multilib configuration to place the libraries in the correct,
 non-conflicting locations.
-- 
1.7.9.5


