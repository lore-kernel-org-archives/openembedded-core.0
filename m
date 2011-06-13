Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R3-0004yZ-Vn
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Jun 2011 08:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="11944386"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2011 08:48:48 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:28 +0800
Message-Id: <3cd47eb8a4b7affccb3174e5ed026453d0b481b1.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 03/13] gnome-doc-utils: upgrade from 0.20.5 to the latest version 0.20.6
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:19 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...c-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} (56%)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
similarity index 56%
rename from meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
rename to meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 115eb4d..e7bf6e9 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.5.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,9 +1,9 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r2"
+PR = "r0"
 
 SRC_URI += "file://xsltproc_nonet.patch"
 
-SRC_URI[archive.md5sum] = "3aa1f651834714090cdbf898ec090a98"
-SRC_URI[archive.sha256sum] = "08d99b8ab813fadd3407873e4a30282debce92e22eb1b45430a8bb9c120e2130"
+SRC_URI[archive.md5sum] = "8f6e05071599bc073007830ea0a68391"
+SRC_URI[archive.sha256sum] = "091486e370480bf45349ad09dac799211092a02938b26a0d68206172cb6cebbf"
-- 
1.7.1



