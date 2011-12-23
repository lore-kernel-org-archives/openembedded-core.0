Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Re952-0006zd-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:38:52 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 496D52FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:31:29 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 09:31:17 -0800
Message-Id: <32acb074ef8b4ea5408f42449024d36e316fb45b.1324661415.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 496D52FEF5.73D2C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/2] libevent: upgrade to 2.0.16
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
X-List-Received-Date: Fri, 23 Dec 2011 17:38:52 -0000

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
1.7.5.4



