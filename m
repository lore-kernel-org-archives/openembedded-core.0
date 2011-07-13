Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu18-0003mD-Um
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:37:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272047"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:33:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:34 -0700
Message-Id: <79c857d74346635be316e2bf42dc8d4224095da2.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 02/25] shlibpackaging.bbclass: create common class
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
X-List-Received-Date: Wed, 13 Jul 2011 07:37:59 -0000

This class is for packages that do not work with debian library naming

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/shlibpackaging.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/shlibpackaging.bbclass

diff --git a/meta/classes/shlibpackaging.bbclass b/meta/classes/shlibpackaging.bbclass
new file mode 100644
index 0000000..3406793
--- /dev/null
+++ b/meta/classes/shlibpackaging.bbclass
@@ -0,0 +1,9 @@
+#
+# This bbclass it a common case for lib${PN} shared libraries
+#
+SUMMARY_lib${PN} ?= "${SUMMARY} - Shared Libraries"
+DESCRIPTION_lib${PN} ?= "${DESCRIPTION} This package contains the shared libraries"
+
+PACKAGES =+ "lib${PN}"
+FILES_lib${PN} = "${libdir}/*${SOLIBS} ${base_libdir}/*${SOLIBS}"
+RDEPENDS_lib${PN} = "${PN}"
-- 
1.7.3.4



