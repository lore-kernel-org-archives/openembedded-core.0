Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QcaTi-0005oV-R1
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:57:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jul 2011 02:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,457,1304319600"; d="scan'208";a="25127476"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2011 02:53:53 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 17:53:54 +0800
Message-Id: <1aa106d547c9e10d025a011922335cc3ea1bbb69.1309513694.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1309513694.git.dexuan.cui@intel.com>
References: <cover.1309513694.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309513694.git.dexuan.cui@intel.com>
References: <cover.1309513694.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] busybox: bump PR to enable largefile support
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
X-List-Received-Date: Fri, 01 Jul 2011 09:57:39 -0000

[YOCTO #1205 ]

In the previous commit we enable largefile setting in
meta-yocto/conf/distro/poky.conf, so we need to re-build busybox to
actually enable it.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index cb41ac6..5883cc6 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.6



