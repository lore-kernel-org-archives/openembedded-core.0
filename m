Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SroCL-0001Nt-SG
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:43:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 03:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168403599"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 03:31:43 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:33:52 +0300
Message-Id: <1342694032-31936-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] autoconf: updated to 2.69
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
X-List-Received-Date: Thu, 19 Jul 2012 10:43:10 -0000

Tested with core-image-sato-sdk and lib32-core-image-sato-sdk.
This update was done mainly because multilib builds failed on master with this error:

| autoreconf: running: aclocal -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ --force --warnings=cross
| aclocal: warning: unknown warning category 'cross'
| configure.ac:18: error: Autoconf version 2.69 or higher is required

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
 .../{autoconf_2.68.bb => autoconf_2.69.bb}         |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf_2.68.bb => autoconf_2.69.bb} (85%)

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
similarity index 85%
rename from meta/recipes-devtools/autoconf/autoconf_2.68.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 8d466e0..478f8ed 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -17,8 +17,8 @@ SRC_URI += "file://autoreconf-include.patch \
             file://remove-usr-local-lib-from-m4.patch \
            "
 
-SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
-SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
+SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
+SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd4c2969"
 
 SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
-- 
1.7.9.5



