Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q0dPc-00028Y-Je
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 18:24:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2011 10:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,206,1299484800"; d="scan'208";a="614770154"
Received: from unknown (HELO helios) ([10.255.12.183])
	by orsmga002.jf.intel.com with SMTP; 18 Mar 2011 10:21:41 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 18 Mar 2011 17:21:44 +0000
Message-Id: <71ef85f4c7c1d32d0103939beb3f1eda42167dfb.1300467808.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1300467808.git.paul.eggleton@linux.intel.com>
References: <cover.1300467808.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 12:10:46 +0000
Date: Fri, 18 Mar 2011 17:21:44 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] busybox: enable unmount all feature
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
X-List-Received-Date: Fri, 18 Mar 2011 17:24:32 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This allows "umount -f -a -r" in our initscripts to actually do something.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/busybox/busybox-1.17.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.17.3.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.17.3/defconfig b/meta/recipes-core/busybox/busybox-1.17.3/defconfig
index 87e6244..5327a64 100644
--- a/meta/recipes-core/busybox/busybox-1.17.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.17.3/defconfig
@@ -567,7 +567,7 @@ CONFIG_SWAPONOFF=y
 # CONFIG_FEATURE_SWAPON_PRI is not set
 CONFIG_SWITCH_ROOT=y
 CONFIG_UMOUNT=y
-# CONFIG_FEATURE_UMOUNT_ALL is not set
+CONFIG_FEATURE_UMOUNT_ALL=y
 
 #
 # Common options for mount/umount
diff --git a/meta/recipes-core/busybox/busybox_1.17.3.bb b/meta/recipes-core/busybox/busybox_1.17.3.bb
index c5fbe9c..28342fe 100644
--- a/meta/recipes-core/busybox/busybox_1.17.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.17.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.1



