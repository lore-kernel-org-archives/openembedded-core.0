Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThC-0000rg-FC
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704583"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:53 -0700
Message-Id: <0b8d842d8b83a52af99956ba61354f0ede2953a0.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:51:48 +0800
Date: Thu, 12 May 2011 19:01:50 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 50/54] kf: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-sato/kf/files/fix-configure.patch      |    2 ++
 .../recipes-sato/kf/files/fix-desktop-file.patch   |    2 ++
 meta-demoapps/recipes-sato/kf/files/gcc4.patch     |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch b/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
index fc1ad9a..ae6bf71 100644
--- a/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
+++ b/meta-demoapps/recipes-sato/kf/files/fix-configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urNd ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in kf-0.5.4.1/configure.in
 --- ../kf-0.5.4.1-r0/kf-0.5.4.1/configure.in	2005-04-27 19:42:49.000000000 +0100
 +++ kf-0.5.4.1/configure.in	2005-09-29 14:12:32.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch b/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
index 7a0f7d1..c749616 100644
--- a/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
+++ b/meta-demoapps/recipes-sato/kf/files/fix-desktop-file.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Common subdirectories: kf-0.5.4.1.orig/data and kf-0.5.4.1/data
 diff -u kf-0.5.4.1.orig/kf.desktop kf-0.5.4.1/kf.desktop
 --- kf-0.5.4.1.orig/kf.desktop	2005-04-19 22:08:44.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/kf/files/gcc4.patch b/meta-demoapps/recipes-sato/kf/files/gcc4.patch
index 58727ea..9e16529 100644
--- a/meta-demoapps/recipes-sato/kf/files/gcc4.patch
+++ b/meta-demoapps/recipes-sato/kf/files/gcc4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: kf-0.5.4.1/src/jispman.c
 ===================================================================
 --- kf-0.5.4.1.orig/src/jispman.c	2006-12-03 15:33:47.000000000 +0100
-- 
1.7.1



