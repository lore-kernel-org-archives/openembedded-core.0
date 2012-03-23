Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SB6HD-00063n-Cb
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 16:19:39 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2012 08:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="124320209"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2012 08:10:42 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:08:29 +0800
Message-Id: <c7afff9b2bafd38d6a2cc7c542572bfd8d6eeee3.1332514975.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1332514975.git.dongxiao.xu@intel.com>
References: <cover.1332514975.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1332514975.git.dongxiao.xu@intel.com>
References: <cover.1332514975.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] bitbake.conf: Define runnable and deployable pattern
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
X-List-Received-Date: Fri, 23 Mar 2012 15:19:39 -0000

Define runnable image type and machine pattern.
Define deployable image type.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bitbake.conf |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2b0e7ce..36f71d6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -743,3 +743,8 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER D
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
+RUNNABLE_MACHINE_PATTERNS ?= "qemu"
+
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
-- 
1.7.4.1



