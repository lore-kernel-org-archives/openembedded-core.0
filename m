Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVz3F-0005fF-Ea
	for openembedded-core@openembedded.org; Thu, 01 Dec 2011 06:19:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 21:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81604967"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 21:12:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 21:12:31 -0800
Message-Id: <48fb72091dd5026b04b36026b9e20ca071da7408.1322716218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322716218.git.sgw@linux.intel.com>
References: <cover.1322716218.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322716218.git.sgw@linux.intel.com>
References: <cover.1322716218.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] gnutls: Update to 2.12.14
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
X-List-Received-Date: Thu, 01 Dec 2011 05:19:17 -0000

* Add patch for fixing gettext version from 0.17 -> 0.18

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-fix.patch                            |    0
 .../gnutls-2.12.14/fix-gettext-version.patch       |   20 ++++++++++++++++++++
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls_2.12.11.bb      |    9 ---------
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   10 ++++++++++
 6 files changed, 30 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/configure-fix.patch (100%)
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.11.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.14.bb

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
new file mode 100644
index 0000000..7a41120
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
@@ -0,0 +1,20 @@
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: gnutls-2.12.14/lib/po/Makefile.in.in
+===================================================================
+--- gnutls-2.12.14.orig/lib/po/Makefile.in.in	2011-11-28 20:15:56.000000000 -0800
++++ gnutls-2.12.14/lib/po/Makefile.in.in	2011-11-28 20:17:21.386078977 -0800
+@@ -8,8 +8,8 @@
+ # Please note that the actual code of GNU gettext is covered by the GNU
+ # General Public License and is *not* in the public domain.
+ #
+-# Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++# Origin: gettext-0.18
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.11/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.11.bb b/meta/recipes-support/gnutls/gnutls_2.12.11.bb
deleted file mode 100644
index bd5ebb3..0000000
--- a/meta/recipes-support/gnutls/gnutls_2.12.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require gnutls.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://gnutls-openssl.patch \
-            file://configure-fix.patch"
-
-SRC_URI[md5sum] = "f08234b64a8025d6d5aa1307868b02ed"
-SRC_URI[sha256sum] = "00b58e1aafe99bbd0cb371e7f1df9cc58bf807301cf70a7eebedeee093991360"
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
new file mode 100644
index 0000000..385bb2c
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
@@ -0,0 +1,10 @@
+require gnutls.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://gnutls-openssl.patch \
+            file://configure-fix.patch \
+            file://fix-gettext-version.patch"
+
+SRC_URI[md5sum] = "555687a7ffefba0bd9de1e71cb61402c"
+SRC_URI[sha256sum] = "5ee72ba6de7a23cf315792561954451e022dac8730149ca95f93c61e95be2ce3"
-- 
1.7.6.4



