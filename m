Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iF-0001nM-8q
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065341"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:14:56 -0700
Message-Id: <ca0b404b5d726c3d58ab78d5006675b22e48f0af.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 02/28] autoconf: upgrade from 2.68 to 2.69
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
X-List-Received-Date: Thu, 03 May 2012 18:25:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
 .../{autoconf_2.68.bb => autoconf_2.69.bb}         |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf_2.68.bb => autoconf_2.69.bb} (84%)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 3ae98c8..778c9a1 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "m4 gnu-config"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_virtclass-nativesdk = "m4-nativesdk gnu-config-nativesdk"
 
-SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
 
 inherit autotools
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
similarity index 84%
rename from meta/recipes-devtools/autoconf/autoconf_2.68.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 8d466e0..8c84e4a 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,6 +1,6 @@
 require autoconf.inc
 
-PR = "r7"
+PR = "r0"
 
 PARALLEL_MAKE = ""
 
@@ -17,8 +17,8 @@ SRC_URI += "file://autoreconf-include.patch \
             file://remove-usr-local-lib-from-m4.patch \
            "
 
-SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
-SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
+SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
+SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
 
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
-- 
1.7.7



