Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84FE871D18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256705"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:22 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:03 +0300
Message-Id: <353e8869cca52aa5de1444a928a97b6c27ca4dec.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/15] xproto: Upgrade 7.0.29 -> 7.0.31
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:20 -0000

Tiny bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{xproto_7.0.29.bb => xproto_7.0.31.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.29.bb => xproto_7.0.31.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
index 412b6a2..febcc67 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
@@ -15,5 +15,5 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "eeeae1f47d43a33ef0d5c56727410326"
-SRC_URI[sha256sum] = "6c1a477092ca73233902b8d5f33012635c4b0208f17e7833cc7efe5c93ba9f8a"
+SRC_URI[md5sum] = "16791f7ca8c51a20608af11702e51083"
+SRC_URI[sha256sum] = "c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747"
-- 
2.1.4


