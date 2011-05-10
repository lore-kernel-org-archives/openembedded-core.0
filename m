Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKc-0003KX-9i
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 14:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; 
   d="scan'208";a="562853"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 14:16:15 -0700
Message-Id: <2efb09624e27cdbfa4391f6f5e95d1b9df215ebb.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 13:17:31 -0700
Date: Tue, 10 May 2011 14:16:15 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 15/16] binutils: fix upstream status format
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
X-List-Received-Date: Tue, 10 May 2011 21:19:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    2 +-
 .../binutils-2.21/binutils-2.19.1-ld-sysroot.patch |    2 +-
 .../binutils/binutils-2.21/binutils-poison.patch   |    2 +-
 .../binutils-uclibc-100-uclibc-conf.patch          |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
index e17be35..dc49613 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 --- /tmp/configure.ac	2008-06-22 14:14:59.000000000 +0200
 +++ binutils-2.18.50.0.7/configure.ac	2008-06-22 14:15:30.000000000 +0200
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
index e6bea3c..1a640ea 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 http://sourceware.org/bugzilla/show_bug.cgi?id=10340
 
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
index 6d8fd42..759aa88 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [distribution: codesourcery]"
+Upstream-Status: Inappropriate [distribution: codesourcery]
 
 Patch originally created by Mark Hatle, forward-ported to
 binutils 2.21 by Scott Garman.
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
index 64ed132..3f627c6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Pending"
+Upstream-Status: Pending
 
 --- binutils-2.18.orig/configure
 +++ binutils-2.18/configure
-- 
1.7.3.4



