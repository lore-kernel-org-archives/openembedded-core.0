Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQ1cq-00049P-NV
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 20:19:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2011 11:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,281,1304319600"; 
   d="scan'208";a="5960066"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2011 11:16:05 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 11:16:00 -0700
Message-Id: <7ae99aa525c707a9b171f96581270163eaa72443.1306520012.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>
References: <b883a6b6076317ebc3eb64f160c5f2df6996a95e.1306520012.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306520012.git.nitin.a.kamble@intel.com>
References: <cover.1306520012.git.nitin.a.kamble@intel.com>
Subject: [bugfix 2/2] Revert "tcmode-default: workaround for gcc 4.6.0 failure on beagleboard"
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
X-List-Received-Date: Fri, 27 May 2011 18:19:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

As we have a fix for gcc 4.6.0 this workaround is not needed anymore

This reverts commit 9bccbc5fbc71b331911b558a2ba15e0a6d0046b4.

Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6eb34ef..d279231 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,10 +26,6 @@ LINUXLIBCVERSION ?= "2.6.37.2"
 # Temporary preferred version overrides for PPC
 PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
 
-# Temporary workaround for gcc 4.6.0 ICE with beagleboard
-# gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
-TARGET_CC_ARCH_arm_pn-mesa-xlib := "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
-
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-initial ?= "${GCCVERSION}"
-- 
1.7.3.5



