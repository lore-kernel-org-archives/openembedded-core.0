Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPLHE-0000o3-8l
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 00:10:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 15:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135871096"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 15:00:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 15:00:42 -0700
Message-Id: <8039ae2201ff482e75962a1da7453e5f689aa968.1335909595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
References: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335909595.git.nitin.a.kamble@intel.com>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/6] quilt: upgrade from 0.51 to 0.60
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
X-List-Received-Date: Tue, 01 May 2012 22:10:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../quilt/{quilt-0.51.inc => quilt-0.60.inc}       |    4 ++--
 .../{quilt-native_0.51.bb => quilt-native_0.60.bb} |    2 +-
 .../quilt/{quilt_0.51.bb => quilt_0.60.bb}         |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.51.inc => quilt-0.60.inc} (84%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.51.bb => quilt-native_0.60.bb} (83%)
 rename meta/recipes-devtools/quilt/{quilt_0.51.bb => quilt_0.60.bb} (98%)

diff --git a/meta/recipes-devtools/quilt/quilt-0.51.inc b/meta/recipes-devtools/quilt/quilt-0.60.inc
similarity index 84%
rename from meta/recipes-devtools/quilt/quilt-0.51.inc
rename to meta/recipes-devtools/quilt/quilt-0.60.inc
index 824e624..1e240a0 100644
--- a/meta/recipes-devtools/quilt/quilt-0.51.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.60.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
         file://install.patch"
 
-SRC_URI[md5sum] = "d56d23d5212297d5777502e84dc0ee80"
-SRC_URI[sha256sum] = "05441399d36399b3f26cb12e29c98a8ce4d1287d036957fa22408807860af614"
+SRC_URI[md5sum] = "058a08a9b626bdec9ec8c519dc92158c"
+SRC_URI[sha256sum] = "3d72a292e432beb9a73f9d0acfe3a77c9b4d7e42209919bb244e9958c7cfe64b"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.51.bb b/meta/recipes-devtools/quilt/quilt-native_0.60.bb
similarity index 83%
rename from meta/recipes-devtools/quilt/quilt-native_0.51.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.60.bb
index 1494bf2..b99b9b6 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.60.bb
@@ -1,4 +1,4 @@
 require quilt-${PV}.inc
 require quilt-native.inc
 
-PR = "r1"
+PR = "r0"
diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.60.bb
similarity index 98%
rename from meta/recipes-devtools/quilt/quilt_0.51.bb
rename to meta/recipes-devtools/quilt/quilt_0.60.bb
index 4e51b49..b085daf 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.60.bb
@@ -4,7 +4,7 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r4"
+PR = "r0"
 
 PERLPATH = "${bindir}/env perl"
 PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-- 
1.7.7



