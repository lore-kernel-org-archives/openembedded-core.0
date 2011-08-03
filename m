Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qoimh-0001tY-45
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:15:23 +0200
Received: by iyj12 with SMTP id 12so1429382iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 14:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0Ex6Vw9uRFLKcQvblZPXN5uXBHdJyQP2jiqKaDRhscw=;
	b=QF40oARMCsz0l2Ilx1eG7IwwX9b3dsouvjgrG1EXUeeMmWbvZF8lFTAdJJ/oqNOvTd
	aXuOzptritOT3HlKyzK3ffSEMBrCEQru3Pr0ansvxcw38g9PtgO4xDaOgKuuXQO6isqv
	Gfo10D5ElnCpQ/IqAIxr/rmuPYE285ptVec1s=
Received: by 10.231.171.201 with SMTP id i9mr5110838ibz.89.1312405856702;
	Wed, 03 Aug 2011 14:10:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id v16sm783426ibe.51.2011.08.03.14.10.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 14:10:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:12:28 -0700
Message-Id: <1312405950-15032-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 1/3] autoconf: Remove patch=1 from SRC_URI
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
X-List-Received-Date: Wed, 03 Aug 2011 21:15:23 -0000

Edit summary field s/produced/produce/

Fix the license related warning

WARNING: autoconf-native: No generic license file exists for:
GPLv2|GPLv3 at /b/openembedded-core/meta/files/common-licenses
WARNING: autoconf-native: There is also no SPDXLICENSEMAP for this
license type: GPLv2|GPLv3 at
/b/openembedded-core/meta/files/common-licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    4 ++--
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |   19 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 47b2b84..08a1b02 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A GNU tool that procuded shell scripts to automatically configure software."
+SUMMARY = "A GNU tool that procude shell scripts to automatically configure software."
 DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
@@ -9,6 +9,6 @@ DEPENDS += "m4-native"
 RDEPENDS_${PN} = "m4 gnu-config"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
-	   file://program_prefix.patch;patch=1"
+	   file://program_prefix.patch"
 
 inherit autotools
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 638e677..3b196a6 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -6,16 +6,17 @@ PARALLEL_MAKE = ""
 
 DEPENDS += "m4-native"
 RDEPENDS_${PN} = "m4 gnu-config"
-LICENSE = "GPLv2|GPLv3"
+LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
-SRC_URI += "file://autoreconf-include.patch;patch=1 \
-	   file://autoreconf-exclude.patch;patch=1 \
-	   file://autoreconf-foreign.patch;patch=1 \
-	   file://autoreconf-gnuconfigize.patch;patch=1 \
-	   file://autoheader-nonfatal-warnings.patch;patch=1 \
-	   ${@['file://path_prog_fixes.patch;patch=1', ''][bb.data.inherits_class('native', d)]} \
-           file://config_site.patch;patch=1"
+SRC_URI += "file://autoreconf-include.patch \
+	    file://autoreconf-exclude.patch \
+	    file://autoreconf-foreign.patch \
+	    file://autoreconf-gnuconfigize.patch \
+	    file://autoheader-nonfatal-warnings.patch \
+	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d)]} \
+            file://config_site.patch \
+           "
 
 SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
 SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
@@ -23,6 +24,6 @@ SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e57145
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 
-SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch;patch=1"
+SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



