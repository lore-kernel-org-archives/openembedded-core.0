Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1DD73180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739959"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:47 +0200
Message-Id: <1b1867f2b582ed5196b4e4efb8d9aac20740267e.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/17] tiff: update to 4.0.6
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.0.4.bb => tiff_4.0.6.bb} (92%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
similarity index 92%
rename from meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
index 74f0a72..e2e24e0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
@@ -7,8 +7,8 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch \
           "
 
-SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
-SRC_URI[sha256sum] = "8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890"
+SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
+SRC_URI[sha256sum] = "4d57a50907b510e3049a4bba0d7888930fdfc16ce49f1bf693e5b6247370d68c"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.6.2


