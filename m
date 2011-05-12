Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgZ-0000Rv-Kk
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704233"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:14 -0700
Message-Id: <5222f106f461f535d4927c2bfef931b045d63c30.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:59:51 +0800
Date: Thu, 12 May 2011 19:01:11 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 20/54] metacity: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:05 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gnome/metacity/crosscompile.patch              |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/metacity/crosscompile.patch b/meta/recipes-gnome/gnome/metacity/crosscompile.patch
index 8d86134..7a1942a 100644
--- a/meta/recipes-gnome/gnome/metacity/crosscompile.patch
+++ b/meta/recipes-gnome/gnome/metacity/crosscompile.patch
@@ -3,6 +3,8 @@ rather than target binary in cross-compile environment.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: metacity-2.30.3/src/Makefile.am
 ===================================================================
 --- metacity-2.30.3.orig/src/Makefile.am	2010-09-05 00:09:52.000000000 +0800
-- 
1.7.1



