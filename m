Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMI-0002iO-MD
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587152"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:53 -0800
Message-Id: <21d48d4281891931ff1a163388a69e27544e7cbf.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/17] tune-ivb: Add tune file for Intel Ivy Bridge machines
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:23 -0000

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
1.7.6.4



