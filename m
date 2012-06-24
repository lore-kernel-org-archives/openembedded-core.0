Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKY-0004YM-2C
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983151"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:36 -0700
Message-Id: <4df4d43eaa64e18252430d7a8833d764394cf43a.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 11/14] gnutls: Upgrade to 2.12.20
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{gnutls-2.12.19 => gnutls}/configure-fix.patch |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.19.bb => gnutls_2.12.20.bb}       |    4 ++--
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.19 => gnutls}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.19.bb => gnutls_2.12.20.bb} (77%)

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch b/meta/recipes-support/gnutls/gnutls/configure-fix.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
rename to meta/recipes-support/gnutls/gnutls/configure-fix.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday_signature.patch
rename to meta/recipes-support/gnutls/gnutls/correct_rpl_gettimeofday_signature.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch b/meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patch
rename to meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
rename to meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls/gnutls-texinfo-euro.patch
similarity index 100%
rename from meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patch
rename to meta/recipes-support/gnutls/gnutls/gnutls-texinfo-euro.patch
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.19.bb b/meta/recipes-support/gnutls/gnutls_2.12.20.bb
similarity index 77%
rename from meta/recipes-support/gnutls/gnutls_2.12.19.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.20.bb
index 7d76510..248c90f 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.19.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.20.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://gnutls-openssl.patch \
             file://configure-fix.patch \
            "
 
-SRC_URI[md5sum] = "14228b34e3d8ed176a617df40693b441"
-SRC_URI[sha256sum] = "8f167b39de4e2fddd83f7e29c98ce2e7fc76f4d79ccf4d3d66d1379b971160ec"
+SRC_URI[md5sum] = "f1dea97da5d4dcdbc675720c9aad9ee3"
+SRC_URI[sha256sum] = "4884eafcc8383ed23209199bbc72ad04f4eb94955a50a594125ff34c6889c564"
 
 python() {
     if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-- 
1.7.7.6



