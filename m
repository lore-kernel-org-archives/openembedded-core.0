Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNVtr-0002TC-Ru
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 21:34:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 12:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71966759"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2011 12:28:21 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 14:28:51 -0600
Message-Id: <1a5b579ec7f3f34b2bc3c99b4449eb50ada36df9.1320697346.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <bb5c0a2e7d5a9ee1c22a0eb1422ae5454b033b53.1320697346.git.tom.zanussi@intel.com>
References: <bb5c0a2e7d5a9ee1c22a0eb1422ae5454b033b53.1320697346.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320697346.git.tom.zanussi@intel.com>
References: <cover.1320697346.git.tom.zanussi@intel.com>
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
X-List-Received-Date: Mon, 07 Nov 2011 20:34:36 -0000

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



