Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgm-0000Tg-E7
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1285978"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:29 -0700
Message-Id: <164708347dbeb64a2b4517e569a3e87ca7b1386a.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 14:14:46 +0800
Date: Thu, 12 May 2011 19:01:27 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 32/54] mutter: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:18 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mutter/mutter/crosscompile.patch               |    2 ++
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |    2 ++
 .../mutter/mutter/fix_pkgconfig.patch              |    2 ++
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |    2 ++
 meta/recipes-graphics/mutter/mutter/nozenity.patch |    2 ++
 5 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mutter/mutter/crosscompile.patch b/meta/recipes-graphics/mutter/mutter/crosscompile.patch
index b27383b..da73e7b 100644
--- a/meta/recipes-graphics/mutter/mutter/crosscompile.patch
+++ b/meta/recipes-graphics/mutter/mutter/crosscompile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: git/configure.in
 ===================================================================
 --- git.orig/configure.in	2009-01-27 14:49:10.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
index 3714383..695f94c 100644
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
+++ b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/src/metacity-plugins.pc.in
 ===================================================================
 --- git.orig/src/metacity-plugins.pc.in	2008-12-17 22:42:19.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
index 5ac5ecc..de0dded 100644
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
+++ b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/src/mutter-plugins.pc.in
 ===================================================================
 --- git.orig/src/mutter-plugins.pc.in	2009-07-03 17:30:39.000000000 +0100
diff --git a/meta/recipes-graphics/mutter/mutter/nodocs.patch b/meta/recipes-graphics/mutter/mutter/nodocs.patch
index 98f43be..ceb0609 100644
--- a/meta/recipes-graphics/mutter/mutter/nodocs.patch
+++ b/meta/recipes-graphics/mutter/mutter/nodocs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am	2009-01-27 13:26:12.000000000 +0000
diff --git a/meta/recipes-graphics/mutter/mutter/nozenity.patch b/meta/recipes-graphics/mutter/mutter/nozenity.patch
index 06f5909..fa32b63 100644
--- a/meta/recipes-graphics/mutter/mutter/nozenity.patch
+++ b/meta/recipes-graphics/mutter/mutter/nozenity.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/configure.in
 ===================================================================
 --- git.orig/configure.in	2009-06-16 13:12:17.000000000 +0100
-- 
1.7.1



