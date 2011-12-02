Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWJse-0007Am-4m
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:33:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 19:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81359966"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 19:27:00 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:27:01 +0800
Message-Id: <56b60d05263360197628eff1b8173c188b438bba.1322796369.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
Subject: [PATCH 2/3] lzo: remove the uncessary autoconf.patch
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
X-List-Received-Date: Fri, 02 Dec 2011 03:33:44 -0000

Now we already have autoconf-2.68 that is newer than 2.67 that is required
by lzo. So the patch is not needed any longer.

Thanks Khem Raj for pointing this out!

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-support/lzo/lzo-2.06/autoconf.patch |   28 ----------------------
 meta/recipes-support/lzo/lzo_2.06.bb             |    3 +-
 2 files changed, 1 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/lzo/lzo-2.06/autoconf.patch

diff --git a/meta/recipes-support/lzo/lzo-2.06/autoconf.patch b/meta/recipes-support/lzo/lzo-2.06/autoconf.patch
deleted file mode 100644
index 63c1d2d..0000000
--- a/meta/recipes-support/lzo/lzo-2.06/autoconf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Date: 12/31/2010
-Didn't find 2.67 specific features, so lower the requirement
-to pass build
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-
-
-Wed Nov 30 14:42:01 CST 2011
-Rebase to lzo-2.06.
-Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
-
----
-diff --git a/configure.ac b/configure.ac
-index 650749a..2a78845 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,7 +36,7 @@ All Rights Reserved.
- This configure script may be copied, distributed and modified under the
- terms of the GNU General Public License; see COPYING for more details.])
- 
--AC_PREREQ(2.67)
-+AC_PREREQ(2.65)
- AC_INIT([LZO],[2.06],[markus@oberhumer.com],[lzo],[http://www.oberhumer.com/opensource/lzo/])
- AC_MSG_NOTICE([Configuring LZO $PACKAGE_VERSION])
- AC_CONFIG_SRCDIR(src/lzo_init.c)
diff --git a/meta/recipes-support/lzo/lzo_2.06.bb b/meta/recipes-support/lzo/lzo_2.06.bb
index b2cc171..4862082 100644
--- a/meta/recipes-support/lzo/lzo_2.06.bb
+++ b/meta/recipes-support/lzo/lzo_2.06.bb
@@ -4,10 +4,9 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzo_init.c;beginline=23;endline=40;md5=924a0f71f5394f6d404be3b458474769"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
-           file://autoconf.patch \
            file://acinclude.m4 \
            "
 
-- 
1.7.6



