Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJP-0001in-J5
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="917582035"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 16:44:46 -0700
Message-Id: <10813df30689747bd0e5c3ca8e97054b476b7197.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 16:14:53 +0800
Date: Tue, 03 May 2011 16:44:46 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 19/33] libcap: upgrade to version 2.20
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
X-List-Received-Date: Tue, 03 May 2011 23:47:28 -0000

From: Qing He <qing.he@intel.com>

from 2.19
 - set RAISE_SETFCAP=no in make option to inhibit target binary run

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-support/libcap/libcap.inc     |    2 +-
 meta/recipes-support/libcap/libcap_2.19.bb |    6 ------
 meta/recipes-support/libcap/libcap_2.20.bb |    6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/libcap_2.19.bb
 create mode 100644 meta/recipes-support/libcap/libcap_2.20.bb

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index a1c93f1..292fa78 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -18,7 +18,7 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= lib=lib SYSTEM_HEADERS=${STAGING_INCDIR}"
+EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= lib=lib SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
 EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= lib=lib"
 
 do_compile() {
diff --git a/meta/recipes-support/libcap/libcap_2.19.bb b/meta/recipes-support/libcap/libcap_2.19.bb
deleted file mode 100644
index 9abd3b5..0000000
--- a/meta/recipes-support/libcap/libcap_2.19.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libcap.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "eb1ff04d39bfa2342b8e78b0fd60dc2d"
-SRC_URI[sha256sum] = "ed1693e344054a398e68a7cc840892e3d1a880562743bdf28fd918649aa5a4ce"
diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
new file mode 100644
index 0000000..2fa949b
--- /dev/null
+++ b/meta/recipes-support/libcap/libcap_2.20.bb
@@ -0,0 +1,6 @@
+require libcap.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
+SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"
-- 
1.7.4.1



