Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact5-0005Xs-Cj
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596735"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:25 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:17 -0800
Message-Id: <6952cd1eb977eb825d79a35b4c58dca1af7720ab.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 09/13] tiff: Update to 4.0.3
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libtiff/{tiff_4.0.2.bb => tiff_4.0.3.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.2.bb => tiff_4.0.3.bb} (85%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
similarity index 85%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.2.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index 5188963..256e75e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -8,8 +8,8 @@ PR = "r0"
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
 
-SRC_URI[md5sum] = "04a08fa1e07e696e820a0c3f32465a13"
-SRC_URI[sha256sum] = "aa29f1f5bfe3f443c3eb4dac472ebde15adc8ff0464b83376f35e3b2fef935da"
+SRC_URI[md5sum] = "051c1068e6a0627f461948c365290410"
+SRC_URI[sha256sum] = "ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872"
 
 inherit autotools
 
-- 
1.7.7.6



