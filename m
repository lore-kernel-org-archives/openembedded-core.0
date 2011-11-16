Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3P-0007yL-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:52 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068970"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:40 -0800
Message-Id: <0b04b4120dac8dde1a77fdda2367e28096db9e03.1321470759.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/8] tcl: upgrade from 8.5.10 to 8.5.11
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:52 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../tcltk/{tcl_8.5.10.bb => tcl_8.5.11.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.5.10.bb => tcl_8.5.11.bb} (92%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.10.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
similarity index 92%
rename from meta/recipes-devtools/tcltk/tcl_8.5.10.bb
rename to meta/recipes-devtools/tcltk/tcl_8.5.11.bb
index a9d80af..b1424f4 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.5.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
@@ -19,8 +19,8 @@ BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
 SRC_URI = "${BASE_SRC_URI} \
 	   file://fix_non_native_build_issue.patch "
 
-SRC_URI[md5sum] = "a08eaf8467c0631937067c1948dd326b"
-SRC_URI[sha256sum] = "f582063edd5419a39ee8f7b5c8f95d557b5daad13efb0ed2f0967ca185613bb7"
+SRC_URI[md5sum] = "b01a9691c83990b3db0ce62d1012ca67"
+SRC_URI[sha256sum] = "8addc385fa6b5be4605e6d68fbdc4c0e674c5af1dc1c95ec5420390c4b08042a"
 
 SRC_URI_virtclass-native = "${BASE_SRC_URI}"
 
-- 
1.7.6.4



