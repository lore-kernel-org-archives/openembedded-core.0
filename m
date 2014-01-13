Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E591D6DC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:22:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 07:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="465875299"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2014 07:22:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:22:06 +0000
Message-Id: <22e55847d586b78290e659ab8430e95cc97c20f5.1389626446.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] dropbear: upgrade to 2013.62
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
X-List-Received-Date: Mon, 13 Jan 2014 15:22:40 -0000

LIC_FILES_CHKSUM has changed with the introduction of a BSD-3-Clause
algorithm (curve25519-donna); this has prompted a re-evaluation of the
LICENSE value which should now reflect the licenses declared in the
upstream documentation. Thanks to Beth Flanagan for helping with this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc                               | 4 ++--
 .../0001-urandom-xauth-changes-to-options.h.patch                     | 0
 .../{dropbear-2013.60 => dropbear}/0002-static_build_fix.patch        | 0
 .../dropbear/{dropbear-2013.60 => dropbear}/0003-configure.patch      | 0
 .../dropbear/{dropbear-2013.60 => dropbear}/0004-fix-2kb-keys.patch   | 0
 .../{dropbear-2013.60 => dropbear}/0005-dropbear-enable-pam.patch     | 0
 .../0006-dropbear-configuration-file.patch                            | 0
 .../0007-dropbear-fix-for-x32-abi.patch                               | 0
 meta/recipes-core/dropbear/dropbear_2013.60.bb                        | 4 ----
 meta/recipes-core/dropbear/dropbear_2013.62.bb                        | 4 ++++
 10 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0001-urandom-xauth-changes-to-options.h.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0002-static_build_fix.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0003-configure.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0004-fix-2kb-keys.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0005-dropbear-enable-pam.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0006-dropbear-configuration-file.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0007-dropbear-fix-for-x32-abi.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.60.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2013.62.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 4262b1d..e85a9e6 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -4,8 +4,8 @@ SECTION = "console/network"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de74413ba7e05b7a37c4722e75f436cd"
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4d290ce0ac102c828dfc9ce836784688"
 
 DEPENDS = "zlib"
 RPROVIDES_${PN} = "ssh sshd" 
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to-options.h.patch b/meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0001-urandom-xauth-changes-to-options.h.patch
rename to meta/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch b/meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0002-static_build_fix.patch
rename to meta/recipes-core/dropbear/dropbear/0002-static_build_fix.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0003-configure.patch
rename to meta/recipes-core/dropbear/dropbear/0003-configure.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0004-fix-2kb-keys.patch
rename to meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0005-dropbear-enable-pam.patch
rename to meta/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-file.patch b/meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0006-dropbear-configuration-file.patch
rename to meta/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
diff --git a/meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi.patch b/meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2013.60/0007-dropbear-fix-for-x32-abi.patch
rename to meta/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
diff --git a/meta/recipes-core/dropbear/dropbear_2013.60.bb b/meta/recipes-core/dropbear/dropbear_2013.60.bb
deleted file mode 100644
index 42d9985..0000000
--- a/meta/recipes-core/dropbear/dropbear_2013.60.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "fffa2fec0c887201bed3a3cc6df7fa35"
-SRC_URI[sha256sum] = "4c0c52453b4dd96ef79e5968ed3676de008ee0cf133632acae12bbad588681bb"
diff --git a/meta/recipes-core/dropbear/dropbear_2013.62.bb b/meta/recipes-core/dropbear/dropbear_2013.62.bb
new file mode 100644
index 0000000..3cae940
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2013.62.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "ca2c7932a1399cf361f795aaa3843998"
+SRC_URI[sha256sum] = "c6656302bbcc54b0a9c361f505822f6994039117ec32d2897ead3364da079ffa"
-- 
1.8.1.2


