Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VS-0002ZN-J0
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:55:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486004"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:45 -0800
Message-Id: <3439512952a64dc9537aa9842c64489219a76ee5.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 06/14] gnutls: Update to 2.12.16
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
X-List-Received-Date: Thu, 02 Feb 2012 23:55:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.14.bb => gnutls_2.12.16.bb}       |    6 +++---
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.14 => gnutls-2.12.16}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.14.bb => gnutls_2.12.16.bb} (77%)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.16/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.14/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.16/configure-fix.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.16/correct_rpl_gettimeofday_signature.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.16/correct_rpl_gettimeofday_signature.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls-2.12.16/fix-gettext-version.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.16/fix-gettext-version.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.16/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.16/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.16/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.14/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls-2.12.16/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.16.bb
similarity index 77%
rename from meta/recipes-support/gnutls/gnutls_2.12.14.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.16.bb
index 6a50cec..3c9b809 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.16.bb
@@ -7,6 +7,9 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
            "
 
+SRC_URI[md5sum] = "0414bba9760201f27d66787997cbadfb"
+SRC_URI[sha256sum] = "d04328857d9e420eca53f7f7fd615bc76d2f5d74984a9b90c0f2c5f7b5bf5b4a"
+
 python() {
     if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
         # if GPLv3 add patch
@@ -14,6 +17,3 @@ python() {
         src_uri.append("file://fix-gettext-version.patch")
         d.setVar("SRC_URI", " ".join(src_uri))
 }
-
-SRC_URI[md5sum] = "555687a7ffefba0bd9de1e71cb61402c"
-SRC_URI[sha256sum] = "5ee72ba6de7a23cf315792561954451e022dac8730149ca95f93c61e95be2ce3"
-- 
1.7.6.5



