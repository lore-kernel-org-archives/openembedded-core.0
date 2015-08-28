Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3344F76DF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550251014"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:56 +0300
Message-Id: <838cec7998682f102d8db694548d9eda8ddfe214.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/8] ccache: update to 3.2.3
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

The LICENSE checksum has changed because of updated copyright years.

SRC_URI has been changed to git, because upstream tarball is broken
(includes configure.ac but not .m4 files it depends on).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ccache/ccache.inc       | 4 +++-
 meta/recipes-devtools/ccache/ccache_3.1.11.bb | 7 -------
 meta/recipes-devtools/ccache/ccache_3.2.3.bb  | 6 ++++++
 3 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.11.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.3.bb

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 087cb7d..4790021 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,7 +9,9 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://samba.org/ftp/ccache/ccache-${PV}.tar.xz"
+SRC_URI = "git://git.samba.org/ccache.git"
+
+S = "${WORKDIR}/git"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.1.11.bb b/meta/recipes-devtools/ccache/ccache_3.1.11.bb
deleted file mode 100644
index 7696003..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.1.11.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
-
-SRC_URI[md5sum] = "0f6df80c8941d9020a1fd5df5ad57dd7"
-SRC_URI[sha256sum] = "60e9f3f1e60f528cfce910f3224bcc698029320f6ab77ec09a7b46bda2bc678e"
diff --git a/meta/recipes-devtools/ccache/ccache_3.2.3.bb b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
new file mode 100644
index 0000000..06d04fc
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
@@ -0,0 +1,6 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c337e7664559a789d9f7a93e5283c1"
+
+SRCREV = "4cad46e8ee0053144bb00919f0dadd20c1f87013"
-- 
2.1.4


