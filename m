Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRbZ-0006SL-5A
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2011 07:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,470,1315206000"; d="scan'208";a="87070066"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2011 07:53:05 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:32 -0600
Message-Id: <adf84088055d90a8ab1bf63ca1f199394806847b.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
References: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320638388.git.tom.zanussi@intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
Subject: [PATCH 2/6] tune-ivb: Add tune file for Intel Ivy Bridge machines
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
X-List-Received-Date: Mon, 07 Nov 2011 15:59:25 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a tune file for Intel Ivy Bridge machines.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/conf/machine/include/tune-ivb.inc |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ivb.inc

diff --git a/meta/conf/machine/include/tune-ivb.inc b/meta/conf/machine/include/tune-ivb.inc
new file mode 100644
index 0000000..3c0b670
--- /dev/null
+++ b/meta/conf/machine/include/tune-ivb.inc
@@ -0,0 +1,11 @@
+DEFAULTTUNE ?= "ivb"
+TUNE_PKGARCH ?= "${@bb.utils.contains("TUNE_FEATURES", "ivb", "ivb", "", d)}"
+
+require conf/machine/include/tune-x86_64.inc
+
+TUNEVALID[ivb] = "Enable ivb-specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ivb", "-march=core-avx-i", "", d)}"
+
+AVAILTUNES += "ivb"
+TUNE_FEATURES_tune-ivb = "${TUNE_FEATURES_tune-x86-64} ivb"
+PACKAGE_EXTRA_ARCHS_tune-ivb = "${PACKAGE_EXTRA_ARCHS_tune-x86-64} ivb"
-- 
1.7.0.4



