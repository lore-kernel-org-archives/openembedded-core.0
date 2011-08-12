Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma6-0004dc-0h
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:55:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809732"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:07 -0700
Message-Id: <909c1bcfcd2aebbc2bebf9e724e562e580a83afd.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/25] meta-rt: canonicalize directory structure
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:02 -0000

From: Darren Hart <dvhart@linux.intel.com>

Use the more standard recipes-*/*/*.bb layout.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta-rt/conf/layer.conf                            |    5 +++--
 .../{ => linux}/linux-yocto-rt_2.6.34.bb           |    0
 .../recipes-tests/{ => rt-tests}/rt-tests_0.73.bb  |    0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-rt/recipes-kernel/{ => linux}/linux-yocto-rt_2.6.34.bb (100%)
 rename meta-rt/recipes-tests/{ => rt-tests}/rt-tests_0.73.bb (100%)

diff --git a/meta-rt/conf/layer.conf b/meta-rt/conf/layer.conf
index f105405..59f42b6 100644
--- a/meta-rt/conf/layer.conf
+++ b/meta-rt/conf/layer.conf
@@ -5,8 +5,9 @@ RSP_ROOT ?= "sda1"
 BBPATH := "${BBPATH}:${LAYERDIR}"
 
 # We have an images and various recipe-* directories, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/images/*.bb ${LAYERDIR}/images/*.bbappend ${LAYERDIR}/recipes-*/*.bb ${LAYERDIR}/recipes-*/*.bbappend"
-	
+BBFILES := "${BBFILES} ${LAYERDIR}/images/*.bb ${LAYERDIR}/images/*.bbappend \
+            ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
 BBFILE_COLLECTIONS += "rt"
 BBFILE_PATTERN_rt := "^${LAYERDIR}/"
 BBFILE_PRIORITY_rt = "8"
diff --git a/meta-rt/recipes-kernel/linux-yocto-rt_2.6.34.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
similarity index 100%
rename from meta-rt/recipes-kernel/linux-yocto-rt_2.6.34.bb
rename to meta-rt/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
diff --git a/meta-rt/recipes-tests/rt-tests_0.73.bb b/meta-rt/recipes-tests/rt-tests/rt-tests_0.73.bb
similarity index 100%
rename from meta-rt/recipes-tests/rt-tests_0.73.bb
rename to meta-rt/recipes-tests/rt-tests/rt-tests_0.73.bb
-- 
1.7.3.4



