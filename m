Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgf-0000Tg-RO
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1285945"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:23 -0700
Message-Id: <27257ddbf3bbc05933596f943ccae2569e82716c.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:24:11 +0800
Date: Thu, 12 May 2011 19:01:20 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 27/54] python-pygtk: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:10 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../python/python-pygtk/fix-gtkunixprint.patch     |    2 ++
 .../python/python-pygtk/nodocs.patch               |    2 ++
 .../prevent_to_get_display_during_import.patch     |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
index dca19ce..6d2f64b 100644
--- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
+++ b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: pygtk-2.10.0/gtk/gtkunixprint.override
 ===================================================================
 --- pygtk-2.10.0.orig/gtk/gtkunixprint.override
diff --git a/meta/recipes-devtools/python/python-pygtk/nodocs.patch b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
index c358104..f07309a 100644
--- a/meta/recipes-devtools/python/python-pygtk/nodocs.patch
+++ b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: pygtk-2.17.0/Makefile.am
 ===================================================================
 --- pygtk-2.17.0.orig/Makefile.am
diff --git a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
index 9340f82..833038e 100644
--- a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
+++ b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pygtk-2.10.4/gtk/__init__.py
 ===================================================================
 --- pygtk-2.10.4.orig/gtk/__init__.py	2007-11-27 19:27:05.000000000 -0300
-- 
1.7.1



