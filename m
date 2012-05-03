Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQb-0006gj-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:58 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772206"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:44 -0700
Message-Id: <83817fbc646758383d87f9aa7e27962723dcf022.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/36] libtasn1: Update to 2.12
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
X-List-Received-Date: Thu, 03 May 2012 02:06:02 -0000

Use the GUN_MIRROR correctly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb}  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.11.bb => libtasn1_2.12.bb} (71%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.11.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
similarity index 71%
rename from meta/recipes-support/gnutls/libtasn1_2.11.bb
rename to meta/recipes-support/gnutls/libtasn1_2.12.bb
index 1a87fc8..aae409e 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.11.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PR = "r0"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ee8076752f2afcbcd12f3dd9bc622748"
-SRC_URI[sha256sum] = "f4d43c77c12ceabf1a72911472fc8c67e43728b328dfb1b83fd519ed5d079afb"
+SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
+SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.7.6



