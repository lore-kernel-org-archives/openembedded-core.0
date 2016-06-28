Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 80916731A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:06:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 28 Jun 2016 01:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,540,1459839600"; d="scan'208";a="129745522"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2016 01:06:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2016 11:06:16 +0300
Message-Id: <1467101180-23116-6-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1467101180-23116-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/10] gnutls: update to 3.5.1
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
X-List-Received-Date: Tue, 28 Jun 2016 08:06:38 -0000

Remove no longer supported --disable-crywrap option.
Add a checksum for the LICENSE file with licensing overview.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc                            | 6 +++---
 meta/recipes-support/gnutls/{gnutls_3.4.11.bb => gnutls_3.5.1.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.4.11.bb => gnutls_3.5.1.bb} (60%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e7c91eb..0ac7c37 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -8,8 +8,9 @@ LICENSE_${PN}-xx = "LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
+                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 DEPENDS = "nettle gmp virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone"
@@ -30,7 +31,6 @@ PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
-    --disable-crywrap \
     --disable-libdane \
     --disable-guile \
     --disable-rpath \
diff --git a/meta/recipes-support/gnutls/gnutls_3.4.11.bb b/meta/recipes-support/gnutls/gnutls_3.5.1.bb
similarity index 60%
rename from meta/recipes-support/gnutls/gnutls_3.4.11.bb
rename to meta/recipes-support/gnutls/gnutls_3.5.1.bb
index 4203548..85d9904 100644
--- a/meta/recipes-support/gnutls/gnutls_3.4.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.5.1.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
             file://0001-configure.ac-fix-sed-command.patch \
             file://use-pkg-config-to-locate-zlib.patch \
            "
-SRC_URI[md5sum] = "4da148b5a0048aaac4961e2d9ba95798"
-SRC_URI[sha256sum] = "70ef9c9f95822d363036c6e6b5479750e5b7fc34f50e750c3464a98ec65a9ab8"
+SRC_URI[md5sum] = "cb48bb0cf36d329f7321c6cdc0d7ae36"
+SRC_URI[sha256sum] = "bc4a0f80a627c3aca6e7ea59d30e50cda118c61e0e3fab367ff1451d6ec8bdbd"
-- 
2.8.1


