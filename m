Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNSfo-0003MH-3H
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:44:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2013 11:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="313146086"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.159])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2013 11:27:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 19:27:24 +0100
Message-Id: <a436545d67cbcfc46e31155949bcbeb86f49a5c3.1365013369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365013369.git.paul.eggleton@linux.intel.com>
References: <cover.1365013369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365013369.git.paul.eggleton@linux.intel.com>
References: <cover.1365013369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] icon-naming-utils: import version 0.8.90 from meta-oe
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
X-List-Received-Date: Wed, 03 Apr 2013 18:44:40 -0000

* Use newer version 0.8.90
* Updates to a BBCLASSEXTENDed recipe instead of just a native recipe
* Use PV in SRC_URI instead of hardcoded version number

In copying over the recipe from meta-oe, some minor changes were made:
* Preserve the existing OE-Core nativeperl wrapper usage
* Drop setting of S which is effectively the default value

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...tils-native_0.8.7.bb => icon-naming-utils_0.8.90.bb} |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/icon-naming-utils/{icon-naming-utils-native_0.8.7.bb => icon-naming-utils_0.8.90.bb} (58%)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
similarity index 58%
rename from meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
rename to meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 4d1e19e..63a485d 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -4,16 +4,17 @@ PR = "r4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-0.8.7.tar.gz"
+SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
+SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
+SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
 
-SRC_URI[md5sum] = "4abe604721ce2ccb67f451aa7ceb44d6"
-SRC_URI[sha256sum] = "1cb49ce6a04626939893a447da696f20003903d61bd80c6d74d29dd79ca340d2"
-
-S = "${WORKDIR}/icon-naming-utils-${PV}"
-
-inherit autotools native perlnative
+inherit autotools allarch perlnative
 
 do_configure_append() {
 	# Make sure we use our nativeperl wrapper.
 	sed -i -e "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/icon-name-mapping.pl.in
 }
+
+FILES_${PN} += "${datadir}/dtds"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



