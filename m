Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrF-0004L1-FJ
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752175"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:21 -0800
Message-Id: <03d572f3e1ec25502429b46e2b441a73ccd20061.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 035/113] libevent: upgrade to 2.0.16
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:26 -0000

From: Scott Garman <scott.a.garman@intel.com>

Updated HOMEPAGE and SRC_URI to reflect project's new home.

From the whatsnew-2.0.txt document:

COMPATIBILITY:

  Nearly all existing code that worked with Libevent 1.4 should still
  work correctly with Libevent 2.0.

So this upgrade is expected to be safe.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-support/libevent/libevent_1.4.14b.bb |   19 ------------------
 meta/recipes-support/libevent/libevent_2.0.16.bb  |   22 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-support/libevent/libevent_1.4.14b.bb
 create mode 100644 meta/recipes-support/libevent/libevent_2.0.16.bb

diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb b/meta/recipes-support/libevent/libevent_1.4.14b.bb
deleted file mode 100644
index 36468dc..0000000
--- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "An asynchronous event notification library"
-DESCRIPTION = "An asynchronous event notification library"
-HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
-SECTION = "libs"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://event.c;endline=26;md5=bc20aa63bf60c36c2d8edb77746f6b7c"
-
-PR = "r0"
-
-SRC_URI = "http://www.monkey.org/~provos/${BPN}-${PV}-stable.tar.gz"
-
-SRC_URI[md5sum] = "a00e037e4d3f9e4fe9893e8a2d27918c"
-SRC_URI[sha256sum] = "afa61b476a222ba43fc7cca2d24849ab0bbd940124400cb699915d3c60e46301"
-S = "${WORKDIR}/${BPN}-${PV}-stable"
-
-inherit autotools
-
-LEAD_SONAME = "libevent-1.4.so"
diff --git a/meta/recipes-support/libevent/libevent_2.0.16.bb b/meta/recipes-support/libevent/libevent_2.0.16.bb
new file mode 100644
index 0000000..6da3d94
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent_2.0.16.bb
@@ -0,0 +1,22 @@
+SUMMARY = "An asynchronous event notification library"
+DESCRIPTION = "An asynchronous event notification library"
+HOMEPAGE = "http://libevent.org/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=50884&atid=461322"
+SECTION = "libs"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=50aad300de703db62baae12146832b45"
+
+PR = "r0"
+
+SRC_URI = "http://github.com/downloads/libevent/libevent/${BPN}-${PV}-stable.tar.gz"
+
+SRC_URI[md5sum] = "899efcffccdb3d5111419df76e7dc8df"
+SRC_URI[sha256sum] = "a578c7bcaf3bab1cc7924bd4d219f2ea621ab8c51dfc4f886e234b6ef4d38295"
+
+S = "${WORKDIR}/${BPN}-${PV}-stable"
+
+inherit autotools
+
+# Needed for Debian packaging
+LEAD_SONAME = "libevent-2.0.so"
-- 
1.7.6.4



