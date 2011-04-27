Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEo-0005Sn-VL
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 00:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203603"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:30:13 -0700
Message-Id: <9797957686b823a019883be7caa402dbfc0900e7.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 15:48:27 -0700
Date: Wed, 27 Apr 2011  0:30:13 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 51/52] world-broken: add older clutters since we don't want clutter confusion
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:43 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/world-broken.inc |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 2565f87..4ae7650 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -1,13 +1,16 @@
 #
 # Exclude known broken packages
 #
-EXCLUDE_FROM_WORLD_pn-psb-kernel-source = "1"
 EXCLUDE_FROM_WORLD_pn-gobject-introspection = "1"
 
 # Need bzr
 EXCLUDE_FROM_WORLD_pn-eds-tools = "1"
 
 # Need Updates from Clutter 0.8
-EXCLUDE_FROM_WORLD_pn-tidy = "1"
-EXCLUDE_FROM_WORLD_pn-table = "1"
 EXCLUDE_FROM_WORLD_pn-clutter-box2d = "1"
+
+# Don't build older versions of clutter
+EXCLUDE_FROM_WORLD_pn-clutter = "1"
+EXCLUDE_FROM_WORLD_pn-clutter-1.4 = "1"
+EXCLUDE_FROM_WORLD_pn-clutter-gst-1.4 = "1"
+EXCLUDE_FROM_WORLD_pn-clutter-gtk-1.4 = "1"
-- 
1.7.1.1



