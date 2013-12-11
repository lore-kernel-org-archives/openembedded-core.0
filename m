Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1E66A59E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 17:21:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2013 09:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,872,1378882800"; d="scan'208";a="450651278"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2013 09:21:43 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2013 19:24:02 +0200
Message-Id: <41afbfdd0113c46bc755c8a5603a2f82a13caf20.1386782484.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386782484.git.cristian.iorga@intel.com>
References: <cover.1386782484.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] rpcbind: upgrade to 0.2.1
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
X-List-Received-Date: Wed, 11 Dec 2013 17:21:45 -0000

fix_host_path.patch and obsolete_automake_macros.patch
are no longer necessary, removed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-extended/rpcbind/rpcbind/fix_host_path.patch | 16 ----------------
 .../rpcbind/rpcbind/obsolete_automake_macros.patch       | 14 --------------
 .../rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb}       |  8 ++------
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.0.bb => rpcbind_0.2.1.bb} (88%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch b/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
deleted file mode 100644
index 590b344..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-This fixes the hardcoded HOST path
-
-Signed-off-by: Saul Wold <saul.wold@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
---- rpcbind-0.2.0/src/Makefile.am	2010-09-02 11:47:16.725763886 -0700
-+++ rpcbind-0.2.0_fixed/src/Makefile.am	2010-09-02 11:47:36.077763138 -0700
-@@ -29,6 +29,6 @@
- 
- rpcbind_LDFLAGS = -lpthread -ltirpc
- rpcbind_LDADD = $(LIB_TIRPC)
--AM_CPPFLAGS = -I/usr/include/tirpc -DCHECK_LOCAL -DPORTMAP \
-+AM_CPPFLAGS = -I=/usr/include/tirpc -DCHECK_LOCAL -DPORTMAP \
-                        -DFACILITY=LOG_MAIL -DSEVERITY=LOG_INFO
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch b/meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
deleted file mode 100644
index a12c4dd..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3603149&group_id=201237&atid=976751]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd rpcbind-0.2.0/configure.in rpcbind-0.2.0/configure.in
---- rpcbind-0.2.0/configure.in	2009-05-29 16:38:22.000000000 +0300
-+++ rpcbind-0.2.0/configure.in	2013-02-03 04:04:06.577480682 +0200
-@@ -4,7 +4,7 @@
- # AM_MAINTAINER_MODE
- AC_CONFIG_SRCDIR([src/rpcbind.c])
-  AC_PROG_CC
-- AM_CONFIG_HEADER(config.h)
-+ AC_CONFIG_HEADERS(config.h)
-  AC_HEADER_DIRENT
-  AC_PREFIX_DEFAULT(/usr)
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
similarity index 88%
rename from meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
rename to meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index 16fb7b7..6043501 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
-           file://fix_host_path.patch \
-           file://obsolete_automake_macros.patch \
            ${UCLIBCPATCHES} \
            file://rpcbind.conf \
            file://rpcbind.service \
@@ -24,10 +22,8 @@ UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
                             "
 UCLIBCPATCHES ?= ""
 
-SRC_URI[md5sum] = "1a77ddb1aaea8099ab19c351eeb26316"
-SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497a00de3"
-
-PR = "r4"
+SRC_URI[md5sum] = "0a5f9c2142af814c55d957aaab3bcc68"
+SRC_URI[sha256sum] = "da169ff877a5a07581fad50a9a808ac6e96f0c277a3df49a7ef005778428496e"
 
 inherit autotools update-rc.d systemd
 
-- 
1.8.3.2


