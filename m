Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjL-0005b8-Nu
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491804"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:10 -0700
Message-Id: <1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 03/26] shared_lib.bbclass: create common class
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:36 -0000

This class is for packages that do not work with debian library naming

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/shared_lib.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/shared_lib.bbclass

diff --git a/meta/classes/shared_lib.bbclass b/meta/classes/shared_lib.bbclass
new file mode 100644
index 0000000..4237c8c
--- /dev/null
+++ b/meta/classes/shared_lib.bbclass
@@ -0,0 +1,9 @@
+#
+# This bbclass it a common case for lib${PN} shared libraries
+#
+SUMMARY_lib${PN} ?= "${SUMMARY} - Shared Libraries"
+DESCRIPTION_lib${PN} ?= "${DESCRIPTION} This package contains the shared libraries"
+
+PACKAGES += "lib${PN}"
+FILES_lib${PN} = "${libdir}/*${SOLIBS} ${base_libdir}/*${SOLIBS}"
+RDEPENDS_lib${PN} = "${PN}"
-- 
1.7.3.4



