Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Re94n-0006vo-NV
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:38:37 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2F9842FE9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:31:25 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 09:31:16 -0800
Message-Id: <6fbbb1e08787e12ad6eb1f85f78c1a35dc15dcea.1324661415.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324661415.git.scott.a.garman@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2F9842FE9D.3515E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] chrpath: upgrade to 0.14
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
X-List-Received-Date: Fri, 23 Dec 2011 17:38:38 -0000

SRC_URI changed because Debian has not started packaging v0.14 yet.
So now we're using the true upstream for sources.

Confirmed license file is still GPLv2, checksum changed due to
updated FSF postal address in COPYING.

Added HOMEPAGE and BUGTRACKER fields.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-devtools/chrpath/chrpath_0.13.bb |   23 -----------------------
 meta/recipes-devtools/chrpath/chrpath_0.14.bb |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/chrpath/chrpath_0.13.bb
 create mode 100644 meta/recipes-devtools/chrpath/chrpath_0.14.bb

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.13.bb b/meta/recipes-devtools/chrpath/chrpath_0.13.bb
deleted file mode 100644
index d65725e..0000000
--- a/meta/recipes-devtools/chrpath/chrpath_0.13.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Tool to edit rpath in ELF binaries"
-DESCRIPTION = "chrpath allows you to change the rpath (where the application \
-looks for libraries) in an application. It does not (yet) allow you to add an \
-rpath if there isn't one already."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r3"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/c/chrpath/chrpath_${PV}.orig.tar.gz \
-        file://standarddoc.patch"
-
-SRC_URI[md5sum] = "b73072a8fbba277558c50364b65bb407"
-SRC_URI[sha256sum] = "c1aa5342eac0daad81b8da05aa282ae1ccd6f68bc75ca94064304f541eed071b"
-
-inherit autotools
-
-S = "${WORKDIR}/chrpath-${PV}"
-
-# We don't have a staged chrpath-native for ensuring our binary is relocatable
-# so must use the one we've just built
-CHRPATH_BIN_virtclass-native = "${S}/chrpath"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.14.bb b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
new file mode 100644
index 0000000..679f1aa
--- /dev/null
+++ b/meta/recipes-devtools/chrpath/chrpath_0.14.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Tool to edit rpath in ELF binaries"
+DESCRIPTION = "chrpath allows you to change the rpath (where the \
+application looks for libraries) in an application. It does not \
+(yet) allow you to add an rpath if there isn't one already."
+HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
+BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+PR = "r0"
+
+SRC_URI = "http://alioth.debian.org/frs/download.php/3648/chrpath-${PV}.tar.gz \
+           file://standarddoc.patch"
+
+SRC_URI[md5sum] = "ea6b212b23393bf58b0ef9bcf6491b86"
+SRC_URI[sha256sum] = "a1bc9abc42d2b97efc3a0ced7c5dbed37d5debff600386193750315fa5823eaa"
+
+inherit autotools
+
+# We don't have a staged chrpath-native for ensuring our binary is
+# relocatable, so use the one we've just built
+CHRPATH_BIN_virtclass-native = "${S}/chrpath"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



