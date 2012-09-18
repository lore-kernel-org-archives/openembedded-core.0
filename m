Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TDyzI-0005H2-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 16:41:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 07:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,442,1344236400"; d="scan'208";a="223571155"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 07:28:38 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:33:58 +0300
Message-Id: <1347975238-6208-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] intltool: include intltool.m4 and add missing rdepends
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
X-List-Received-Date: Tue, 18 Sep 2012 14:41:20 -0000

- include /usr/share/aclocal/intltool.m4 into the intltool
package (the files from intltool-dev must be included into the
main package, as intltool is a development tool)
- add missing rdepends: gettext-dev, libxml-parser-perl

[YOCTO #2597]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/intltool/intltool_0.50.0.bb |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
index d1ee31d..52de5df 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://intltool-nowarn-0.50.0.patch \
            ${NATIVEPATCHES} \
@@ -17,3 +17,10 @@ NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
 
 SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
 SRC_URI[sha256sum] = "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"
+
+RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
+
+FILES_${PN}-dev = ""
+FILES_${PN} += "${datadir}/aclocal"
+
+INSANE_SKIP_${PN} += "dev-deps"
-- 
1.7.9.5



