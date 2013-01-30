Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0Ycw-0002FG-1H
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:27:10 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE665p007213; Wed, 30 Jan 2013 14:06:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nl2mgIv7T2a3; Wed, 30 Jan 2013 14:06:06 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE60JC007169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:01 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDw-00082m-OO; Wed, 30 Jan 2013 14:01:12 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:00:54 +0000
Message-Id: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/17] alsa-tools: upgrade to 1.0.26.1
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
X-List-Received-Date: Wed, 30 Jan 2013 14:45:34 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Removed the following tools:
- all related to hdsp (required gtk+ and fltk-config)
- ld10k1, qlo10k1 (required QT)
- hdajackretask

Fixed the automake issue for cross-compilation

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{alsa-tools-1.0.25 => alsa-tools}/autotools.patch     |   13 +++++++------
 .../alsa/{alsa-tools_1.0.25.bb => alsa-tools_1.0.26.1.bb} |   11 +++++++----
 2 files changed, 14 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.25 => alsa-tools}/autotools.patch (81%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.25.bb => alsa-tools_1.0.26.1.bb} (71%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
similarity index 81%
rename from meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
rename to meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index c7bc2d6..294e970 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools-1.0.25/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -19,16 +19,17 @@ diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.1/ld10k1
 diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
 +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
-@@ -1,9 +1,8 @@
- VERSION = 1.0.24.1
+@@ -1,9 +1,9 @@
+ VERSION = 1.0.26.1
  TOP = .
 -SUBDIRS = ac3dec as10k1 envy24control hdsploader hdspconf hdspmixer \
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
--	  hwmixvolume
-+SUBDIRS = ac3dec as10k1 hdsploader mixartloader pcxhrloader sb16_csp \
-+          seq sscape_ctl us428control usx2yloader vxloader ld10k1 \
-+          hwmixvolume
+-	  hwmixvolume hdajackretask hda-verb
++SUBDIRS = ac3dec as10k1 envy24control \
++	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
++	  us428control usx2yloader vxloader echomixer \
++	  hwmixvolume hda-verb
  
  all:
  	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
similarity index 71%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 7d96b85..0fe4bee 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.25.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -1,5 +1,3 @@
-BROKEN = "1"
-
 DESCRIPTION = "Alsa Tools package contains advanced tools for certain sound cards."
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
@@ -15,11 +13,16 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch"
 
-SRC_URI[md5sum] = "57bfec98a814d12e0f7ab379aaeccd87"
-SRC_URI[sha256sum] = "a974d0f3e837796f67d04df88c783aebcf4ac3c5f9ac31e2b65c10e8cb4b1dca"
+SRC_URI[md5sum] = "805526ea5d6c40e1f2c94cee86141230"
+SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e733841"
 
 inherit autotools
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
 
+do_compile_prepend () {
+    #Automake dir is not correctly detected in cross compilation case
+    export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
+}
+
 FILES_${PN} += "${datadir}/ld10k1"
-- 
1.7.10.4



