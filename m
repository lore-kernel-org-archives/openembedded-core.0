Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E2D40710C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:11:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 09:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="593549179"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 09:11:43 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:11:39 +0300
Message-Id: <8ece0cf761b780c9d192d172b0bb7ae5ce987980.1409069458.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409069458.git.roxana.ciobanu@intel.com>
References: <cover.1409069458.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409069458.git.roxana.ciobanu@intel.com>
References: <cover.1409069458.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] gdb: Upgrade gdb 7.7.1 -> 7.8
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
X-List-Received-Date: Tue, 26 Aug 2014 16:11:51 -0000

From: Roxana Ciobanu <roxana.ciobanu@intel.com>

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc}              | 4 ++--
 .../gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb}    | 0
 meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb}    | 0
 meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb}                | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-7.7.1.inc => gdb-7.8.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.1.bb => gdb-cross-canadian_7.8.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.7.1.bb => gdb-cross_7.8.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.7.1.bb => gdb_7.8.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-7.7.1.inc b/meta/recipes-devtools/gdb/gdb-7.8.inc
similarity index 70%
rename from meta/recipes-devtools/gdb/gdb-7.7.1.inc
rename to meta/recipes-devtools/gdb/gdb-7.8.inc
index aa16d5a..f4e9a9e 100644
--- a/meta/recipes-devtools/gdb/gdb-7.7.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.8.inc
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "45b07b53d81832d32ccd4829465d4886"
-SRC_URI[sha256sum] = "eefadb9831e3695d1eaef34e98b8f1fb441df6fe5071317ea49c6bd6ba213eff"
+SRC_URI[md5sum] = "38d816d641093db2e13ba284e26090b4"
+SRC_URI[sha256sum] = "46be505fc1bc157a01124333ef37ed195147fa6a405cbfd32dea63bacaaabbe4"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_7.8.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb b/meta/recipes-devtools/gdb/gdb-cross_7.8.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_7.8.bb
diff --git a/meta/recipes-devtools/gdb/gdb_7.7.1.bb b/meta/recipes-devtools/gdb/gdb_7.8.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_7.7.1.bb
rename to meta/recipes-devtools/gdb/gdb_7.8.bb
-- 
1.9.1


