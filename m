Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yJ-0005Qe-4F
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2012 01:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147142449"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2012 01:15:58 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:30 +0800
Message-Id: <baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 6/8] ofono: upgrade to version 1.6
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:39 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../ofono/{ofono_1.5.bb => ofono_1.6.bb}           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.5.bb => ofono_1.6.bb} (97%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.6.bb
similarity index 97%
rename from meta/recipes-connectivity/ofono/ofono_1.5.bb
rename to meta/recipes-connectivity/ofono/ofono_1.6.bb
index dad813f..d0f273b 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
@@ -1,6 +1,6 @@
 require ofono.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
 	          file://ofono"
-- 
1.7.4.1



