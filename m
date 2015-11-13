Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B31A772E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686818"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:02 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:55 +0200
Message-Id: <b284d179b02fb371896d3113fed07722026fa465.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/19] libxcb: Upgrade 1.11 -> 1.11.1
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:02 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxcb_1.11.bb => libxcb_1.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.11.bb => libxcb_1.11.1.bb} (48%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
similarity index 48%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
index c162702..23a83ef 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 DEPENDS += "libxdmcp"
 
-SRC_URI[md5sum] = "5a873ebd383d1a60612dd6ec6b42c781"
-SRC_URI[sha256sum] = "03635d70045b9ede90778e67516135828a57de87ac508f987024f43c03620ff7"
+SRC_URI[md5sum] = "f97a65e6158775de518ac391935634c2"
+SRC_URI[sha256sum] = "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30"
-- 
2.1.4


