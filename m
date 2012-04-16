Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SJgv8-0005jD-VX
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 10:04:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2012 00:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89461238"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2012 00:54:56 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 15:52:01 +0800
Message-Id: <762170e63dc2157f377eec792e12499d38036c4b.1334562084.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1334562084.git.dongxiao.xu@intel.com>
References: <cover.1334562084.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1334562084.git.dongxiao.xu@intel.com>
References: <cover.1334562084.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] bitbake.conf: Include abi_version.conf in a early stage
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
X-List-Received-Date: Mon, 16 Apr 2012 08:04:23 -0000

We may define new OELAYOUT_ABI variable in ${DISTRO}.conf, therefore we
need to move the abi_version.conf before that.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b4669d3..501863b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -648,6 +648,7 @@ CPU_FEATURES_arm ?= "vfp"
 # Include the rest of the config files.
 ##################################################################
 
+require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
@@ -659,7 +660,6 @@ include conf/distro/${DISTRO}.conf
 include conf/distro/defaultsetup.conf
 include conf/documentation.conf
 require conf/sanity.conf
-require conf/abi_version.conf
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
-- 
1.7.4.1



