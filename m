Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Ua4Mp-0001UI-Gm
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 15:25:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2013 06:07:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,634,1363158000"; d="scan'208";a="330818126"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2013 06:07:06 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 16:10:45 +0300
Message-Id: <1368018645-31886-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oprofileui(-server): upgraded to GIT revision f168b8bf
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
X-List-Received-Date: Wed, 08 May 2013 13:25:12 -0000

'obsolete_automake_macros.patch' is not needed anymore, because it
was integrated in the specified commit.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../obsolete_automake_macros.patch                 |   20 --------------------
 .../oprofile/oprofileui-server_git.bb              |    7 ++-----
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    3 +--
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch

diff --git a/meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch b/meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch
deleted file mode 100644
index 2f86f48..0000000
--- a/meta/recipes-kernel/oprofile/oprofileui-server/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff --git a/configure.ac b/configure.ac
-index 2a7010b..62a177e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,11 +3,10 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(oprofileui, 0.2.0)
-
- AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_ISC_POSIX
- AC_PROG_CC
--AM_PROG_CC_STDC
- AC_HEADER_STDC
- AC_PROG_RANLIB
- AC_PROG_INTLTOOL
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index 6b848af..a872acc 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -1,15 +1,12 @@
 require oprofileui.inc
 
-SRCREV = "82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
+SRCREV = "f168b8bfdc63660033de1739c6ddad1abd97c379"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git \
-           file://init \
-           file://obsolete_automake_macros.patch \
-"
+           file://init"
 
 EXTRA_OECONF += "--disable-client --enable-server"
 
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index cafbf1a..03a7932 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -2,9 +2,8 @@ require oprofileui.inc
 
 DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf"
 
-SRCREV = "82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
+SRCREV = "f168b8bfdc63660033de1739c6ddad1abd97c379"
 PV = "0.0+git${SRCPV}"
-PR = "r1"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4



