Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvI-0004HI-1B
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206365"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:23 -0800
Message-Id: <a8ba002b5eb3c2e57550483d7b3ea99f0cc8a9cb.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/35] busybox: Add flock utility to default configuration.
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:04 -0000

From: Peter Tworek <tworaz666@gmail.com>

Flock is required by by pm-utils package to function properly
(/usr/lib/pm-utils/functions). It's shipped in both busybox and
util-linux. Both versions work fine with pm-utils. Enabling it
in busybox seems like simpliest solution for the problem.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index b474ad4..fa9c078 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
-# CONFIG_FLOCK is not set
+CONFIG_FLOCK=y
 # CONFIG_FREERAMDISK is not set
 CONFIG_FSCK_MINIX=y
 # CONFIG_MKFS_EXT2 is not set
-- 
1.7.6.5



