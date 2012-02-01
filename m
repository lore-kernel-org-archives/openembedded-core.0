Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsiI7-00007O-Sv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:04:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 13:55:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102140818"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 13:55:24 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 13:55:19 -0800
Message-Id: <a7393e75b2f774b7dd27ce2ce45b7b08246869e6.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/8] quilt: upgrade from 0.50 to 0.51
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
X-List-Received-Date: Wed, 01 Feb 2012 22:04:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../quilt/{quilt-0.50.inc => quilt-0.51.inc}       |    4 ++--
 .../{quilt-native_0.50.bb => quilt-native_0.51.bb} |    0
 .../quilt/{quilt_0.50.bb => quilt_0.51.bb}         |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.50.inc => quilt-0.51.inc} (86%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.50.bb => quilt-native_0.51.bb} (100%)
 rename meta/recipes-devtools/quilt/{quilt_0.50.bb => quilt_0.51.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-0.50.inc b/meta/recipes-devtools/quilt/quilt-0.51.inc
similarity index 86%
rename from meta/recipes-devtools/quilt/quilt-0.50.inc
rename to meta/recipes-devtools/quilt/quilt-0.51.inc
index 5a72169..c41e25e 100644
--- a/meta/recipes-devtools/quilt/quilt-0.50.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.51.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
         file://install.patch"
 
-SRC_URI[md5sum] = "ff5e1e041363c3af3c8fda4b968c9d1d"
-SRC_URI[sha256sum] = "fa4579628a98cf94472b36869e74f5cd0cb057d6fd13c1872a53f01c45aba8c3"
+SRC_URI[md5sum] = "d56d23d5212297d5777502e84dc0ee80"
+SRC_URI[sha256sum] = "05441399d36399b3f26cb12e29c98a8ce4d1287d036957fa22408807860af614"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.50.bb b/meta/recipes-devtools/quilt/quilt-native_0.51.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.50.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.51.bb
diff --git a/meta/recipes-devtools/quilt/quilt_0.50.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.50.bb
rename to meta/recipes-devtools/quilt/quilt_0.51.bb
-- 
1.7.6.4



