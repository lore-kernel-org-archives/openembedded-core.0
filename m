Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1U2lLC-0004oH-EX
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:25:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Feb 2013 08:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="252888950"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 05 Feb 2013 08:09:57 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 18:13:09 +0200
Message-Id: <1360080789-6114-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] intltool: updated to 0.50.2
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
X-List-Received-Date: Tue, 05 Feb 2013 16:25:53 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../intltool-nowarn.patch}                               |    0
 .../noperlcheck.patch                                    |   14 +++++++-------
 .../remove-xml-check.patch                               |    0
 .../use-nativeperl.patch                                 |    0
 .../intltool/{intltool_0.50.0.bb => intltool_0.50.2.bb}  |    8 ++++----
 5 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0/intltool-nowarn-0.50.0.patch => intltool-0.50.2/intltool-nowarn.patch} (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/noperlcheck.patch (77%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/remove-xml-check.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.0 => intltool-0.50.2}/use-nativeperl.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool_0.50.0.bb => intltool_0.50.2.bb} (71%)

diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
rename to meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch
similarity index 77%
rename from meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
rename to meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch
index cc26749c..853ee1a 100644
--- a/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
+++ b/meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch
@@ -7,11 +7,11 @@ RP 31/8/2011
 
 Upstream-Status: Inappropriate [OE specific]
 
-Index: intltool-0.40.6/configure.ac
-===================================================================
---- intltool-0.40.6.orig/configure.ac	2011-08-31 11:21:13.061160535 +0100
-+++ intltool-0.40.6/configure.ac	2011-08-31 11:22:44.991160885 +0100
-@@ -11,24 +11,10 @@
+diff --git a/configure.ac b/configure.ac
+index 5338a76..e709a2b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,24 +11,10 @@ AC_SUBST(pkgdatadir) dnl automake does not need this, but libtoolize does
  aclocaldir='${datadir}'/aclocal
  AC_SUBST(aclocaldir)
  
@@ -35,6 +35,6 @@ Index: intltool-0.40.6/configure.ac
 +   AC_MSG_ERROR([PERL variable not set])
  fi
 +AC_SUBST(PERL)
+ AC_PATH_PROG(BZR, bzr)
+ 
  
- AC_OUTPUT([
- Makefile
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
rename to meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
rename to meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
similarity index 71%
rename from meta/recipes-devtools/intltool/intltool_0.50.0.bb
rename to meta/recipes-devtools/intltool/intltool_0.50.2.bb
index f890e92..c25e21a 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.50.2.bb
@@ -1,9 +1,9 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
+PR = "r0"
 
-SRC_URI += "file://intltool-nowarn-0.50.0.patch \
+SRC_URI += "file://intltool-nowarn.patch \
            ${NATIVEPATCHES} \
            "
 
@@ -15,5 +15,5 @@ NATIVEPATCHES = "file://noperlcheck.patch \
                  file://remove-xml-check.patch"
 NATIVEPATCHES_class-native = "file://use-nativeperl.patch" 
 
-SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
-SRC_URI[sha256sum] = "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"
+SRC_URI[md5sum] = "23fbd879118253cb99aeac067da5f591"
+SRC_URI[sha256sum] = "67f25c5c6fb71d095793a7f895b245e65e829e8bde68c6c8b4c912144ff34406"
-- 
1.7.10.4



