Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Q9UAp-0003TA-Be
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Apr 2011 05:21:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2011 20:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,193,1301900400"; d="scan'208";a="908332329"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2011 20:18:31 -0700
Message-Id: <3688af2767fadcd43e6dcf3b4e6fc9b28cb69e7b.1302576423.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302576423.git.dexuan.cui@intel.com>
References: <cover.1302576423.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:07:59 +0800
Date: Tue, 12 Apr 2011 11:16:28 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 09/12] cronie: upgrade from 1.4.6 to the latest version 1.4.7
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
X-List-Received-Date: Tue, 12 Apr 2011 03:21:51 -0000

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



