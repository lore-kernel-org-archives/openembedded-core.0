Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQi-0006gd-Pb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:06:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772229"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:53 -0700
Message-Id: <1e2b195fb64261ff433a9c6d22b369850266d280.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 34/36] gnutls: Update to 2.12.18
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
X-List-Received-Date: Thu, 03 May 2012 02:07:11 -0000

Change the SRC_URI to use the GNU_MIRROR

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls.inc             |    2 +-
 .../{gnutls_2.12.17.bb => gnutls_2.12.18.bb}       |    4 ++--
 7 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.17 => gnutls-2.12.18}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.17.bb => gnutls_2.12.18.bb} (77%)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.17/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.17/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.17/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.17/correct_rpl_gettimeofday_signature.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.17/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.17/fix-gettext-version.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.17/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.17/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.17/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.17/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 157612e..f489fb6 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://libextra/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/gnutls/gnutls-${PV}.tar.bz2"
 
 inherit autotools binconfig pkgconfig gettext
 
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.17.bb b/meta/recipes-support/gnutls/gnutls_2.12.18.bb
similarity index 77%
rename from meta/recipes-support/gnutls/gnutls_2.12.17.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.18.bb
index 7a33ec2..7355855 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.17.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.18.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
            "
 
-SRC_URI[md5sum] = "f08990f1afa4e1d0ee13e64e537c7854"
-SRC_URI[sha256sum] = "588ad6b0901c789f2f6afcec88ac4d688801bf1a024c9afa08706bb8d9868bf3"
+SRC_URI[md5sum] = "e9215d00d2930e09bc8f23f02b54f2d1"
+SRC_URI[sha256sum] = "780b12e3f05191316390611a3d9d982d29ca3f3abc234517b2fc542064b6f07a"
 
 python() {
     if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-- 
1.7.7.6



