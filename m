Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsN-00085l-KG
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6498067"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:23 -0700
Message-Id: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: [UPGRADES 1/5] git: upgrade from 1.7.4.3 to 1.7.5.1
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
X-List-Received-Date: Tue, 24 May 2011 00:53:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/git/files/autotools.patch    |   16 ----------------
 meta/recipes-devtools/git/git.inc                  |    3 +--
 .../git/{git_1.7.4.3.bb => git_1.7.5.1.bb}         |    6 +++---
 3 files changed, 4 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/autotools.patch
 rename meta/recipes-devtools/git/{git_1.7.4.3.bb => git_1.7.5.1.bb} (56%)

diff --git a/meta/recipes-devtools/git/files/autotools.patch b/meta/recipes-devtools/git/files/autotools.patch
deleted file mode 100644
index cb21193..0000000
--- a/meta/recipes-devtools/git/files/autotools.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status:Inappropriate [configuration]
-
-Index: git-1.7.2.1/configure.ac
-===================================================================
---- git-1.7.2.1.orig/configure.ac	2010-07-28 18:03:43.000000000 +0100
-+++ git-1.7.2.1/configure.ac	2010-08-13 14:54:29.181971250 +0100
-@@ -697,7 +697,8 @@
- 		else if (strcmp(buf, "12345"))
- 		  return 2;]])],
- 	[ac_cv_c_c99_format=yes],
--	[ac_cv_c_c99_format=no])
-+	[ac_cv_c_c99_format=no],
-+	[ac_cv_c_c99_format=yes])
- ])
- if test $ac_cv_c_c99_format = no; then
- 	NO_C99_FORMAT=YesPlease
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 49292fa..c884f9c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -3,8 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "perl-native openssl curl zlib expat"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 \
-           file://autotools.patch;patch=1"
+SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.bz2 "
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
diff --git a/meta/recipes-devtools/git/git_1.7.4.3.bb b/meta/recipes-devtools/git/git_1.7.5.1.bb
similarity index 56%
rename from meta/recipes-devtools/git/git_1.7.4.3.bb
rename to meta/recipes-devtools/git/git_1.7.5.1.bb
index 45ef61b..bfdbf62 100644
--- a/meta/recipes-devtools/git/git_1.7.4.3.bb
+++ b/meta/recipes-devtools/git/git_1.7.5.1.bb
@@ -1,10 +1,10 @@
 require git.inc
 
-PR = "r2"
+PR = "r0"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
 
-SRC_URI[md5sum] = "da6c8f4967393342a4397b955db72cb1"
-SRC_URI[sha256sum] = "44b3ebc87d83b34468718fb6fa424420877e1f66c190389d693d090662a3556d"
+SRC_URI[md5sum] = "a49291116e3b0564e069ae989e4db6fb"
+SRC_URI[sha256sum] = "a1d4a1c59300e68fbc493a2cbe9257048d4d6f4363924bf34f38c413a825f80c"
-- 
1.7.3.5



