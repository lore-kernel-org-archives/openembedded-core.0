Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3314377CEC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="1136887754"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2017 03:37:01 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CE3B95800D3;
	Thu,  1 Jun 2017 03:37:00 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:48 +0300
Message-Id: <85c5ef3c6d3a1d12cc933a66a0274f201dfadf75.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/10] xdg-utils: Upgrade 1.1.1 -> 1.1.2
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:02 -0000

Also inherit allarch: The utils are just shell scripts.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb} (83%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
similarity index 83%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
index 5007498..930e7cf 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
@@ -22,13 +22,13 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Don-t-build-the-in-script-manual.patch \
           "
 
-SRC_URI[md5sum] = "2d0aec6037769a5f138ff404b1bb4b15"
-SRC_URI[sha256sum] = "b0dd63a2576e0bb16f1aa78d6ddf7d6784784a098d4df17161cd6a17c7bc4125"
+SRC_URI[md5sum] = "361e75eb76c94d19f6f4f330d8ee626b"
+SRC_URI[sha256sum] = "951952e2c6bb21214e0bb54e0dffa057d30f5563300225c24c16fba846258bcc"
 
 UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
 
 # Needs brokensep as this doesn't use automake
-inherit autotools-brokensep distro_features_check
+inherit autotools-brokensep distro_features_check allarch
 
 # The xprop requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.1.4


