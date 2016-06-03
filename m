Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 49A01774EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440136"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:40 +0300
Message-Id: <e9f8f3df2d8afa3bcf8e5cc76e3779729928db23.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/25] webkitgtk: upgrade to 2.12.3
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.12.1.bb => webkitgtk_2.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.1.bb => webkitgtk_2.12.3.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index 23ead72..9a2387e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -18,8 +18,8 @@ SRC_URI = "\
   file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
   file://musl-fixes.patch \
   "
-SRC_URI[md5sum] = "adcbee440d81acfb1ead9ada91bd5e79"
-SRC_URI[sha256sum] = "5b1a2d5227553f3cecbdb258c68b384f9235747b2c07c15afb555fe4fa6ae896"
+SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
+SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even gobject-introspection
 
-- 
2.8.1


