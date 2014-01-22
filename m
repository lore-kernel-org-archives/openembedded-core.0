Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A1E486002A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:02:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2014 00:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,698,1384329600"; d="scan'208";a="442767913"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2014 01:01:46 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 11:04:22 +0200
Message-Id: <edd9dd0d71775cc36546dfb43809c904f6a15766.1390381388.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] neard: upgrade to 0.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 09:02:11 -0000

switched from git version to tarball,
as new releases are now versioned.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/neard/neard_0.10.bb | 10 ----------
 meta/recipes-connectivity/neard/neard_0.14.bb |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard_0.10.bb
 create mode 100644 meta/recipes-connectivity/neard/neard_0.14.bb

diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes-connectivity/neard/neard_0.10.bb
deleted file mode 100644
index 3a1c368..0000000
--- a/meta/recipes-connectivity/neard/neard_0.10.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require neard.inc
-
-SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git \
-           file://neard.in \
-           file://neard.service.in \
-          "
-
-S = "${WORKDIR}/git"
-SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
-PV = "0.10+git${SRCPV}"
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
new file mode 100644
index 0000000..ac9aaf1
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -0,0 +1,9 @@
+require neard.inc
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
+           file://neard.in \
+           file://neard.service.in \
+          "
+SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
+SRC_URI[sha256sum] = "6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"
+
-- 
1.8.3.2


