Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnp-000278-2Q
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720807"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:17 -0800
Message-Id: <f4875734cee458b3cd8b5bd49f66d48a71848c8f.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 17/26] gdbm: Update to 1.10
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:29 -0000

* This version is now GPLv3, so keep older version
* The patches are not needed for this version

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/gdbm/gdbm_1.10.bb

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
new file mode 100644
index 0000000..4ed5881
--- /dev/null
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GNU dbm is a set of database routines that use extensible hashing."
+HOMEPAGE = "http://www.gnu.org/software/gdbm/"
+SECTION = "libs"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
+
+PR = "r0" 
+
+SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "88770493c2559dc80b561293e39d3570"
+SRC_URI[sha256sum] = "23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db773441"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



