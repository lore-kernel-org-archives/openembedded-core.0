Return-Path: <radu.moisan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A31876B029
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:12:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 08:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="340516505"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2013 08:12:21 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 18:14:00 +0300
Message-Id: <f624cff3d0e07f602a64d294988bda6a12e6a36c.1372950678.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372950678.git.radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
In-Reply-To: <cover.1372950678.git.radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
Subject: [PATCH 05/10] ed: Upgrade to v1.8
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
X-List-Received-Date: Thu, 04 Jul 2013 15:12:21 -0000

License files chenged but not the license type

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch |   43 --------------------
 meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb}  |   11 +++--
 2 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
 rename meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb} (49%)

diff --git a/meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch b/meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
deleted file mode 100644
index d30b393..0000000
--- a/meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-http://lists.gnu.org/archive/html/bug-ed/2008-12/msg00001.html
-
-2007-04-16  Mike Frysinger  <vapier@gentoo.org>
-
-	* Do not set CC/CXX/CPPFLAGS/LDFLAGS to "" so that user can
-	  override if they so choose.
-	* Only set CFLAGS/CXXFLAGS if user did not specify any.
-
-ed had already taken GPLv3 when this patch out, so it should be GPLv3.
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Pending
-
-Index: ed-1.5/configure
-===================================================================
---- ed-1.5.orig/configure	2010-08-30 07:34:49.000000000 -0700
-+++ ed-1.5/configure	2010-11-20 16:42:20.490645823 -0800
-@@ -26,10 +26,6 @@
- mandir='$(datadir)/man'
- sysconfdir='$(prefix)/etc'
- program_prefix=
--CC=
--CPPFLAGS=
--CFLAGS='-Wall -W -O2'
--LDFLAGS=
- 
- # Loop over all args
- while [ -n "$1" ] ; do
-@@ -105,6 +101,14 @@
- 	esac
- done
- 
-+# Defaults if the user did not select any
-+if [ x"${CFLAGS+set}" != xset ] ; then
-+	CFLAGS='-Wall -W -O2'
-+fi
-+if [ x"${CXXFLAGS+set}" != xset ] ; then
-+	CXXFLAGS='-Wall -W -O2'
-+fi
-+
- # Find the source files, if location was not specified.
- srcdirtext=
- if [ -z "${srcdir}" ] ; then
diff --git a/meta/recipes-extended/ed/ed_1.7.bb b/meta/recipes-extended/ed/ed_1.8.bb
similarity index 49%
rename from meta/recipes-extended/ed/ed_1.7.bb
rename to meta/recipes-extended/ed/ed_1.8.bb
index 0057438..c6b5075 100644
--- a/meta/recipes-extended/ed/ed_1.7.bb
+++ b/meta/recipes-extended/ed/ed_1.8.bb
@@ -4,8 +4,8 @@ BUGTRACKER = ""
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://ed.h;endline=20;md5=c708cda1b2e8d723d458690b7db03878 \
-                    file://main.c;endline=24;md5=1bd039d59e04ee5f82adcc970144a2c3"
+                    file://ed.h;endline=20;md5=375a20cc2545ac1115eeb7b323c60ae3 \
+                    file://main.c;endline=24;md5=1b31246da5e3864d7b30094ff76bf7ed"
 
 SECTION = "base"
 PR = "r0"
@@ -13,11 +13,10 @@ PR = "r0"
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz \
-           file://ed-1.2-build.patch"
+SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0aa4e2428e325203d0d7c3e86c961b1c"
-SRC_URI[sha256sum] = "894241019a5ff2b7816d20c5bd5a7048fb8f336ca52e97b3cc88d45b16472031"
+SRC_URI[md5sum] = "2268d2344b3c52d23730acb2e3c942fe"
+SRC_URI[sha256sum] = "64c138d33b1ea4b9daa88e045da0619e2a43cb99a9d378417d20163f410a7273"
 
 do_configure() {
 	${S}/configure
-- 
1.7.9.5


