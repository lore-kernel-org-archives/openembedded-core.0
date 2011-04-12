Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9UAo-0003TA-Ku
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:21:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2011 20:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="677867083"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2011 20:18:27 -0700
Message-Id: <3c1cd37b3d49ab5cc0a6b430acd04875e9c7136a.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:05:12 +0800
Date: Tue, 12 Apr 2011 11:16:24 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 06/12] gnome-doc-utils: upgrade from 0.20.4 to the latest version 0.20.5
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
X-List-Received-Date: Tue, 12 Apr 2011 03:21:50 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...c-utils_0.20.4.bb => gnome-doc-utils_0.20.5.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.4.bb => gnome-doc-utils_0.20.5.bb} (53%)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.4.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
similarity index 53%
rename from meta/recipes-gnome/gnome/gnome-doc-utils_0.20.4.bb
rename to meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
index a8cbcf0..94b5aec 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
@@ -3,5 +3,5 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
 PR = "r0"
 
-SRC_URI[archive.md5sum] = "6872b68dd081fc033e07d5877b4c0645"
-SRC_URI[archive.sha256sum] = "97c6465ffb15969a9fe1761f16f30c1028977fb24ecda89a0b479170f6412e4d"
+SRC_URI[archive.md5sum] = "3aa1f651834714090cdbf898ec090a98"
+SRC_URI[archive.sha256sum] = "08d99b8ab813fadd3407873e4a30282debce92e22eb1b45430a8bb9c120e2130"
-- 
1.7.2



