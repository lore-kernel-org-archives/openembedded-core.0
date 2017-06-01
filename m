Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 56DAD77E2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="109594856"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2017 03:37:09 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E3FEE5800D3;
	Thu,  1 Jun 2017 03:37:08 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:54 +0300
Message-Id: <19cb2d6005a64d000bbb35e91edb2a1ce4b2185c.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/10] xkbcomp: Upgrade 1.3.1 -> 1.4.0
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:08 -0000

Release with a small amount of bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.1.bb => xkbcomp_1.4.0.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb
rename to meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
index 1c98359..c9dc327 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.0.bb
@@ -15,5 +15,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "a4d8353daf6cb0a9c47379b7413c42c6"
-SRC_URI[sha256sum] = "0304dc9e0d4ac10831a9ef5d5419722375ddbc3eac3ff4413094d57bc1f1923d"
+SRC_URI[md5sum] = "cc22b232bc78a303371983e1b48794ab"
+SRC_URI[sha256sum] = "bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b"
-- 
2.1.4


