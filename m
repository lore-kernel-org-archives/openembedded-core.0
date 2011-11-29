Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWns-000278-IO
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:32 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720809"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:19 -0800
Message-Id: <61a8e791612aaa126e79007fc748d7a5d79e73e6.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 19/26] gnutls: Update to 2.12.14
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-fix.patch                            |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls_2.12.11.bb      |    9 ---------
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   10 ++++++++++
 5 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.11.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.14.bb

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.11/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch
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



