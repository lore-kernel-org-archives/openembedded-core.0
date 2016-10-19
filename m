Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F83060722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:20 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266958"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:47 +0300
Message-Id: <1bb50a1e519570f89bb40900ae6fc397bf966607.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/19] libksba: update to 1.3.5
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libksba/{libksba_1.3.4.bb => libksba_1.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.4.bb => libksba_1.3.5.bb} (86%)

diff --git a/meta/recipes-support/libksba/libksba_1.3.4.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
similarity index 86%
rename from meta/recipes-support/libksba/libksba_1.3.4.bb
rename to meta/recipes-support/libksba/libksba_1.3.5.bb
index e68255c..36b6670 100644
--- a/meta/recipes-support/libksba/libksba_1.3.4.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -17,8 +17,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "2bfc3d69053db7b6983b5627706033f4"
-SRC_URI[sha256sum] = "f6c2883cebec5608692d8730843d87f237c0964d923bbe7aa89c05f20558ad4f"
+SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
+SRC_URI[sha256sum] = "41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.9.3


