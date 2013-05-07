Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZfSM-00088M-Nn
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:49:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2013 03:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="330167572"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2013 03:30:58 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:34:36 +0300
Message-Id: <1367922876-26933-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mpfr: upgraded to 3.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:49:27 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../mpfr/{mpfr-3.1.1 => mpfr-3.1.2}/long-long-thumb.patch      |    0
 meta/recipes-support/mpfr/{mpfr_3.1.1.bb => mpfr_3.1.2.bb}     |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr-3.1.1 => mpfr-3.1.2}/long-long-thumb.patch (100%)
 rename meta/recipes-support/mpfr/{mpfr_3.1.1.bb => mpfr_3.1.2.bb} (59%)

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch
similarity index 100%
rename from meta/recipes-support/mpfr/mpfr-3.1.1/long-long-thumb.patch
rename to meta/recipes-support/mpfr/mpfr-3.1.2/long-long-thumb.patch
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.1.bb b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
similarity index 59%
rename from meta/recipes-support/mpfr/mpfr_3.1.1.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.2.bb
index 7f34e71..2c2aaf3 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.2.bb
@@ -3,14 +3,14 @@ LICENSE="GPLv3&LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
-PR = "r0"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
+SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
            file://long-long-thumb.patch \
            "
 
-SRC_URI[md5sum] = "e90e0075bb1b5f626c6e31aaa9c64e3b"
-SRC_URI[sha256sum] = "7b66c3f13dc8385f08264c805853f3e1a8eedab8071d582f3e661971c9acd5fd"
+SRC_URI[md5sum] = "ee2c3ac63bf0c2359bf08fc3ee094c19"
+SRC_URI[sha256sum] = "79c73f60af010a30a5c27a955a1d2d01ba095b72537dab0ecaad57f5a7bb1b6b"
+
 S = "${WORKDIR}/mpfr-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4



