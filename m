Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E1B2F7716F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703415"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:32 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:55 +0300
Message-Id: <9765a07d60a9006165ac7d98fa68827b9015b4be.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/31] swig: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/swig/swig.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
index 9da40df..704bb27 100644
--- a/meta/recipes-devtools/swig/swig.inc
+++ b/meta/recipes-devtools/swig/swig.inc
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
 
 SECTION = "devel"
 
-DEPENDS = "libpcre python"
+DEPENDS = "libpcre python3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-inherit autotools pythonnative
+inherit autotools python3native
 
 EXTRA_OECONF = " \
-    --with-python=${PYTHON} \
+    --with-python3=${PYTHON} \
     --without-allegrocl \
     --without-android \
     --without-boost \
@@ -33,7 +33,6 @@ EXTRA_OECONF = " \
     --without-perl5 \
     --without-pike \
     --without-php \
-    --without-python3 \
     --without-r \
     --without-ruby \
     --without-tcl \
-- 
2.8.1


