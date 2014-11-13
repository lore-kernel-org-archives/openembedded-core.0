Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 40D4E60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 23:40:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2014 15:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,381,1413270000"; d="scan'208";a="631674012"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Nov 2014 15:39:53 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 17:39:51 -0600
Message-Id: <65a349f8274ea9ccdc68b2af7aa37886e5b46183.1415920471.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <5eb96c248683354baf29db133c72e6c3a98cf16c.1415920471.git.alejandro.hernandez@linux.intel.com>
References: <5eb96c248683354baf29db133c72e6c3a98cf16c.1415920471.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1415920471.git.alejandro.hernandez@linux.intel.com>
References: <cover.1415920471.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/2 v2] cronie: Upgrade to 1.4.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 23:41:03 -0000

Fixed license BSD, it should've been BSD-3 & BSD-2

Added license GPLv2+ according to upstream

Patch fix-out-of-tree-build removed; already on upstream.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../cronie/cronie/fix-out-of-tree-build.patch      | 31 ----------------------
 .../cronie/{cronie_1.4.11.bb => cronie_1.4.12.bb}  | 13 +++------
 2 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
 rename meta/recipes-extended/cronie/{cronie_1.4.11.bb => cronie_1.4.12.bb} (90%)

diff --git a/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch b/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
deleted file mode 100644
index 7384a0b..0000000
--- a/meta/recipes-extended/cronie/cronie/fix-out-of-tree-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-For an out of tree build, the cronie-common.h file was not being
-found correctly, so point it to the top_srcdir
-
-Upstream-Status: Submitted
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: cronie-1.4.11/anacron/Makefile.am
-===================================================================
---- cronie-1.4.11.orig/anacron/Makefile.am
-+++ cronie-1.4.11/anacron/Makefile.am
-@@ -9,6 +9,7 @@ common_nodist = anacron-paths.h
- nodist_anacron_SOURCES = $(common_nodist)
- BUILT_SOURCES = $(common_nodist)
- 
-+AM_CFLAGS = -I$(top_srcdir)
- 
- LDADD = $(LIBSELINUX) $(LIBPAM) $(LIBAUDIT)
- 
-Index: cronie-1.4.11/src/Makefile.am
-===================================================================
---- cronie-1.4.11.orig/src/Makefile.am
-+++ cronie-1.4.11/src/Makefile.am
-@@ -15,6 +15,7 @@ nodist_crond_SOURCES = $(common_nodist)
- nodist_crontab_SOURCES = $(common_nodist)
- BUILT_SOURCES = $(common_nodist)
- 
-+AM_CFLAGS = -I$(top_srcdir)
- 
- LDADD = $(LIBSELINUX) $(LIBPAM) $(LIBAUDIT)
- 
diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.12.bb
similarity index 90%
rename from meta/recipes-extended/cronie/cronie_1.4.11.bb
rename to meta/recipes-extended/cronie/cronie_1.4.12.bb
index 02234f6..e404756 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.12.bb
@@ -7,16 +7,14 @@ HOMEPAGE = "https://fedorahosted.org/cronie/"
 BUGTRACKER = "mmaslano@redhat.com"
 
 # Internet Systems Consortium License
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
+LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd2a592170760e1386c769e1043b3722 \
                     file://src/cron.c;endline=20;md5=b425c334265026177128353a142633b4 \
                     file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
 
 SECTION = "utils"
 
-
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
-           file://fix-out-of-tree-build.patch \
            file://crond.init \
            file://crontab \
            file://crond.service \
@@ -25,18 +23,16 @@ SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[md5sum] = "2ba645cf54de17f138ef70312843862f"
-SRC_URI[sha256sum] = "fd08084cedddbb42499f80ddb7f2158195c3555c2ff40ee11d4ece2f9864d7be"
+SRC_URI[md5sum] = "199db91e514a4d75e3222d69874b132f"
+SRC_URI[sha256sum] = "0f5c9bf32f352599451c4ca0d6bc076d19e73ecfa5a90b34ecfe47c918c8bafd"
 
 inherit autotools update-rc.d useradd systemd
 
-
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
 
-
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
@@ -82,4 +78,3 @@ do_install_append () {
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
-
-- 
1.9.1


