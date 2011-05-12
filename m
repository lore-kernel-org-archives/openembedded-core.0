Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgb-0000Tg-NB
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:06 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1285907"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:16 -0700
Message-Id: <d79da696502d5212e0b6403394ec971ac0edb2df.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:03:30 +0800
Date: Thu, 12 May 2011 19:01:14 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 22/54] gdk-pixbuf: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:07 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gdk-pixbuf-2.22.1/configure_fix.patch          |    2 ++
 .../gdk-pixbuf-2.22.1/hardcoded_libtool.patch      |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
index bbf239c..b141690 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/configure_fix.patch
@@ -4,6 +4,8 @@ This patch simple disables it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: gdk-pixbuf-2.22.1/configure.ac
 ===================================================================
 --- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-25 16:26:41.000000000 +0800
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
index ae16927..ecca62a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.22.1/hardcoded_libtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: gdk-pixbuf-2.22.1/configure.ac
 ===================================================================
 --- gdk-pixbuf-2.22.1.orig/configure.ac	2010-11-26 09:06:34.000000000 +0800
-- 
1.7.1



