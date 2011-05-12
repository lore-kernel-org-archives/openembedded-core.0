Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgR-0000MC-SN
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860510"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:08 -0700
Message-Id: <7275d48d3a74a450b6c249056ad00b8519387c60.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:44:16 +0800
Date: Thu, 12 May 2011 19:01:05 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 15/54] gnome-icon-theme: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:00 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../gnome/gnome-icon-theme/iconpath-option.patch   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch b/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
index 8a16d00..f840fca 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
@@ -4,6 +4,9 @@ pkg-config will only search the target sysroot and we want the native script. Th
 patch adds an option to allow the path to the tool to be specified.
 
 RP - 12/8/10"
+
+Upstream-Status: Pending
+
 Index: gnome-icon-theme-2.31.0/configure.ac
 ===================================================================
 --- gnome-icon-theme-2.31.0.orig/configure.ac	2010-12-01 11:00:22.000000000 +0800
-- 
1.7.1



