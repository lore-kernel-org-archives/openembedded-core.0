Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QemXE-0000Oc-KY
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 13:14:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jul 2011 04:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="23783567"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 04:10:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 12:10:22 +0100
Message-Id: <71a1f16e2b2e5ae311922781981220d5b438bf77.1310036935.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310036935.git.paul.eggleton@linux.intel.com>
References: <cover.1310036935.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310036935.git.paul.eggleton@linux.intel.com>
References: <cover.1310036935.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] busybox: bump PR to ensure ipv4 is enabled
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
X-List-Received-Date: Thu, 07 Jul 2011 11:14:20 -0000

Now that ipv4 has been added to the default DISTRO_FEATURES we need to
bump PR as busybox will need to be rebuilt.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
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
1.7.4.1



