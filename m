Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgz-0000Tg-0q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1286008"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:36 -0700
Message-Id: <2421c67d4c5f81881410ab2febecc9822afc6ae4.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:20:52 +0800
Date: Thu, 12 May 2011 19:01:33 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 37/54] dates: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../pimlico/dates/dates-owl-window-menu.patch      |    2 ++
 .../dates/dso_linking_change_build_fix.patch       |    2 ++
 meta/recipes-sato/pimlico/dates/make-382.patch     |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch b/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
index d590165..714623e 100644
--- a/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
+++ b/meta/recipes-sato/pimlico/dates/dates-owl-window-menu.patch
@@ -4,6 +4,8 @@
  src/dates_platform.h |    2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: git/src/dates_gtk.c
 ===================================================================
 --- git.orig/src/dates_gtk.c	2009-08-18 12:44:56.000000000 +0100
diff --git a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch b/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
index 07a0264..eccc782 100644
--- a/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/pimlico/dates/dso_linking_change_build_fix.patch
@@ -30,6 +30,8 @@ file, libtool should have added these needed libraries in there.
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/19
 
+Upstream-Status: Pending
+
 Index: git/src/Makefile.am
 ===================================================================
 --- git.orig/src/Makefile.am
diff --git a/meta/recipes-sato/pimlico/dates/make-382.patch b/meta/recipes-sato/pimlico/dates/make-382.patch
index 9147361..fad3c58 100644
--- a/meta/recipes-sato/pimlico/dates/make-382.patch
+++ b/meta/recipes-sato/pimlico/dates/make-382.patch
@@ -3,6 +3,8 @@ in upstream git.
 
 JL - 15/12/10
 
+Upstream-Status: Accepted
+
 Index: git/Makefile.am
 ===================================================================
 --- git.orig/Makefile.am
-- 
1.7.1



