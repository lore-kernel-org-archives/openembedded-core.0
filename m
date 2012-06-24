Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKZ-0004YM-Fd
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983156"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:39 -0700
Message-Id: <6a73991c1abc0fa0b663d144c1a6f7f332e07b43.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 14/14] libtiff: Upgrade to 4.0.2
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:44 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libtiff/{tiff_4.0.1.bb => tiff_4.0.2.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.1.bb => tiff_4.0.2.bb} (84%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.2.bb
similarity index 84%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.2.bb
index 72d99a1..5188963 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.2.bb
@@ -3,13 +3,13 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg xz"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
 
-SRC_URI[md5sum] = "fae149cc9da35c598d8be897826dfc63"
-SRC_URI[sha256sum] = "9a7a039e516c37478038740f1642818250bfb1414cf404cc8b569e5f9d4bf2f0"
+SRC_URI[md5sum] = "04a08fa1e07e696e820a0c3f32465a13"
+SRC_URI[sha256sum] = "aa29f1f5bfe3f443c3eb4dac472ebde15adc8ff0464b83376f35e3b2fef935da"
 
 inherit autotools
 
-- 
1.7.7.6



