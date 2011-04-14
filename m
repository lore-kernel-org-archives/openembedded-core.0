Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQE-0000KT-AL
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:01:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Apr 2011 01:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="419029080"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2011 01:58:45 -0700
Message-Id: <0575562cf413f6a4b316bbcad037949efd364e32.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:07:59 +0800
Date: Thu, 14 Apr 2011 16:56:40 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 09/12] cronie: upgrade from 1.4.6 to the latest version 1.4.7
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
X-List-Received-Date: Thu, 14 Apr 2011 09:01:06 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../cronie/{cronie_1.4.6.bb => cronie_1.4.7.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cronie/{cronie_1.4.6.bb => cronie_1.4.7.bb} (93%)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.6.bb b/meta/recipes-extended/cronie/cronie_1.4.7.bb
similarity index 93%
rename from meta/recipes-extended/cronie/cronie_1.4.6.bb
rename to meta/recipes-extended/cronie/cronie_1.4.7.bb
index 09714c7..7d6093a 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.6.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.7.bb
@@ -20,8 +20,8 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
            file://crontab"
 
-SRC_URI[md5sum] = "968e3d3e7c8e1d0588d533883482d3fa"
-SRC_URI[sha256sum] = "4435484c28a4452ee37db27182675660cdebf16d8956771b28c8a6f2e9c8048b"
+SRC_URI[md5sum] = "dfc26c47756d0c40ee27ae3c7ee98e0d"
+SRC_URI[sha256sum] = "83bae15ae5504454ba74f4142f5db3aa22be594327fea19d2534f65803137fbd"
 
 inherit autotools update-rc.d
 
-- 
1.7.2



