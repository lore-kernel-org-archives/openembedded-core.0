Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44u-0006K2-Rh
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478130"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:10 +0300
Message-Id: <7398d67fc9b46c24d7e9623dbed1dc411d8c160a.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/12] gnutls: update to 2.12.19
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
X-List-Received-Date: Thu, 17 May 2012 17:01:29 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

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
1.7.7.6



