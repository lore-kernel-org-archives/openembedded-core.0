Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BEEB177501
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440267"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:58 +0300
Message-Id: <3494ef1830d4834b476d0fe3dca9f4a52f6fd2ce.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/25] libksba: update to 1.3.4
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libksba/{libksba_1.3.3.bb => libksba_1.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.3.bb => libksba_1.3.4.bb} (86%)

diff --git a/meta/recipes-support/libksba/libksba_1.3.3.bb b/meta/recipes-support/libksba/libksba_1.3.4.bb
similarity index 86%
rename from meta/recipes-support/libksba/libksba_1.3.3.bb
rename to meta/recipes-support/libksba/libksba_1.3.4.bb
index 9c901f6..e68255c 100644
--- a/meta/recipes-support/libksba/libksba_1.3.3.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.4.bb
@@ -17,8 +17,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "a5dd3c57fca254935f5cf8db26e39065"
-SRC_URI[sha256sum] = "0c7f5ffe34d0414f6951d9880a46fcc2985c487f7c36369b9f11ad41131c7786"
+SRC_URI[md5sum] = "2bfc3d69053db7b6983b5627706033f4"
+SRC_URI[sha256sum] = "f6c2883cebec5608692d8730843d87f237c0964d923bbe7aa89c05f20558ad4f"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.8.1


