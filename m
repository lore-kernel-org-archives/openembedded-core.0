Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14CF771B13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945826"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:22 +0300
Message-Id: <13c04cc9f3024c5304514b61de9d2c11acb8acce.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 30/50] xdg-utils: update to 1.1.2
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.1.bb => xdg-utils_1.1.2.bb} (89%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
similarity index 89%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
index 34f8d107b24..7339289de6c 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Don-t-build-the-in-script-manual.patch \
           "
 
-SRC_URI[md5sum] = "2d0aec6037769a5f138ff404b1bb4b15"
-SRC_URI[sha256sum] = "b0dd63a2576e0bb16f1aa78d6ddf7d6784784a098d4df17161cd6a17c7bc4125"
+SRC_URI[md5sum] = "361e75eb76c94d19f6f4f330d8ee626b"
+SRC_URI[sha256sum] = "951952e2c6bb21214e0bb54e0dffa057d30f5563300225c24c16fba846258bcc"
 
 UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
 
-- 
2.14.1


