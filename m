Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8mRe-0001ns-2D
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 07:12:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2011 22:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="71468334"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2011 22:07:05 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:02:43 +0800
Message-Id: <6ad2f399fdf2f5a344c1bc07f3a7f35d4a591cc2.1317185969.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317185969.git.edwin.zhai@intel.com>
References: <cover.1317185969.git.edwin.zhai@intel.com>
Subject: [PATCH 1/4] oprofileui: remove dependence on gnome-vfs
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
X-List-Received-Date: Wed, 28 Sep 2011 05:12:34 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-kernel/oprofile/oprofileui.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index 5170357..ab14c38 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -8,7 +8,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "glib-2.0 gtk+ libglade gnome-vfs libxml2 avahi-ui gconf"
+DEPENDS = "glib-2.0 gtk+ libglade libxml2 avahi-ui gconf"
 
 inherit autotools pkgconfig gtk-icon-cache
 
-- 
1.7.1



