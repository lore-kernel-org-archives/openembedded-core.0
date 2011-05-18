Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzw-0000ea-Uw
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2011 01:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="228914"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 01:17:54 -0700
Message-Id: <9b821c3ba340984269f21fa289b46f1c725b408c.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 21:23:37 -0700
Date: Wed, 18 May 2011  1:17:53 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 05/15] world-broken: remove non-existent items
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
X-List-Received-Date: Wed, 18 May 2011 08:20:56 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/world-broken.inc |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 4ae7650..da9b1e4 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -9,8 +9,3 @@ EXCLUDE_FROM_WORLD_pn-eds-tools = "1"
 # Need Updates from Clutter 0.8
 EXCLUDE_FROM_WORLD_pn-clutter-box2d = "1"
 
-# Don't build older versions of clutter
-EXCLUDE_FROM_WORLD_pn-clutter = "1"
-EXCLUDE_FROM_WORLD_pn-clutter-1.4 = "1"
-EXCLUDE_FROM_WORLD_pn-clutter-gst-1.4 = "1"
-EXCLUDE_FROM_WORLD_pn-clutter-gtk-1.4 = "1"
-- 
1.7.3.4



