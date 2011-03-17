Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0LoN-0007DG-GB
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 23:36:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Mar 2011 15:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,201,1299484800"; d="scan'208";a="614375615"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Mar 2011 15:34:46 -0700
Message-Id: <a944030652dd72afa8ee2321083c6f80aa2de233.1300401018.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300401016.git.nitin.a.kamble@intel.com>
References: <cover.1300401016.git.nitin.a.kamble@intel.com>
Old-Date: Thu, 17 Mar 2011 01:12:19 -0700
Date: Thu, 17 Mar 2011 15:34:46 -0700
To: poky@yoctoprojectorg,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 5/7] poky.conf: remove gnome-common from WHITELIST_GPLV3
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
X-List-Received-Date: Thu, 17 Mar 2011 22:36:55 -0000

From: Saul Wold <sgw@linux.intel.com>

This was due to task-poky-extended pulling in qemu-config for
non-GPLv3 poky-image-basic

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/poky.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index eee12b7..76620f9 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -130,7 +130,7 @@ EXTRAOPKGCONFIG = "poky-feed-config-opkg"
 # This is a list of packages that are used by poky to build the distribution, they are not
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPLv3 ?= ""
-WHITELIST_GPLv3 ?= "less gnome-common"
+WHITELIST_GPLv3 ?= "less"
 LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc gcc-runtime" 
 
 # This is a list of packages that require a commercial license to ship
-- 
1.7.3.4



