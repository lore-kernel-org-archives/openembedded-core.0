Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SUdA9-00008c-1J
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:17:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2012 05:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100728107"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.104.85])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2012 05:05:51 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 15:07:37 +0300
Message-Id: <1337170057-8358-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gnutls: update to 2.12.19
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
X-List-Received-Date: Wed, 16 May 2012 12:17:05 -0000

Tested with curl in qemux86/core-image-lsb.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.18.bb => gnutls_2.12.19.bb}       |    4 ++--
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.18.bb => gnutls_2.12.19.bb} (77%)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday_signature.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.18.bb b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
similarity index 77%
rename from meta/recipes-support/gnutls/gnutls_2.12.18.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.19.bb
index 7355855..7d76510 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.18.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
            "
 
-SRC_URI[md5sum] = "e9215d00d2930e09bc8f23f02b54f2d1"
-SRC_URI[sha256sum] = "780b12e3f05191316390611a3d9d982d29ca3f3abc234517b2fc542064b6f07a"
+SRC_URI[md5sum] = "14228b34e3d8ed176a617df40693b441"
+SRC_URI[sha256sum] = "8f167b39de4e2fddd83f7e29c98ce2e7fc76f4d79ccf4d3d66d1379b971160ec"
 
 python() {
     if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-- 
1.7.4.1



