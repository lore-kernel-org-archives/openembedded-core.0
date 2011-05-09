Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUF-0003hj-RS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="690004844"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2011 23:59:51 -0700
Message-Id: <af4da98b0b4da9f897e9f4637dfc124e81327045.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 20:26:47 -0700
Date: Sun, 08 May 2011 23:59:51 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 11/20] binutils: update upstream status of patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    2 ++
 .../binutils-2.21/binutils-2.19.1-ld-sysroot.patch |    2 ++
 .../binutils/binutils-2.21/binutils-poison.patch   |    2 ++
 .../binutils-uclibc-100-uclibc-conf.patch          |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
index eace3e9..e17be35 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 --- /tmp/configure.ac	2008-06-22 14:14:59.000000000 +0200
 +++ binutils-2.18.50.0.7/configure.ac	2008-06-22 14:15:30.000000000 +0200
 @@ -561,7 +561,7 @@
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
index adcabb4..e6bea3c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-2.19.1-ld-sysroot.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 http://sourceware.org/bugzilla/show_bug.cgi?id=10340
 
 Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
index 1fe713a..6d8fd42 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-poison.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [distribution: codesourcery]"
+
 Patch originally created by Mark Hatle, forward-ported to
 binutils 2.21 by Scott Garman.
 
diff --git a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch b/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
index 8de04e0..64ed132 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/binutils-uclibc-100-uclibc-conf.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Pending"
+
 --- binutils-2.18.orig/configure
 +++ binutils-2.18/configure
 @@ -2206,7 +2206,7 @@
-- 
1.7.1.1



