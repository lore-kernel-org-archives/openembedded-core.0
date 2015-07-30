Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB4E764B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407645"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:20 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:51 +0300
Message-Id: <321a8796e529b520084674868bb25d3da2203308.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/26] unzip, zip: fix PV to allow upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:40 -0000

Upstream does not separate major and minor version numbers in the tarball
filename, so the best we can do is to squash them together as well :-/

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 ++-
 meta/recipes-extended/zip/zip.inc        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 4a0a713..8ac3745 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
 PR = "r5"
 
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
+PV = "60"
+SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip${PV}.tgz \
 	file://avoid-strip.patch \
 	file://define-ldflags.patch \
 	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index 6221c5e..5e92daa 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -5,7 +5,8 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${@d.getVar('PV',1).replace('.', '')}.tgz"
+PV = "30"
+SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/zip${PV}.tgz"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
 		'CFLAGS=-I. -DUNIX ${CFLAGS}' 'INSTALL=install' \
-- 
2.1.4


