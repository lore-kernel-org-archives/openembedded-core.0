Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 559D061005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:16:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2013 11:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="450036632"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.207])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2013 11:16:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:16:06 -0800
Message-Id: <39a4a5e209907f76e493e19ef0313b98548c606f.1386650569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] util-macros: upgrade to 1.18.0
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
X-List-Received-Date: Tue, 10 Dec 2013 19:16:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-util/{util-macros_1.17.1.bb => util-macros_1.18.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.17.1.bb => util-macros_1.18.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb b/meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb
index 9274a3a..79759f6 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb
@@ -15,5 +15,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "886de1940334e097c5f66233a8393122"
-SRC_URI[sha256sum] = "67bd01d5f4713c9e9d57dc742504d06292dd9c4fb73041ea16fed034c56c622a"
+SRC_URI[md5sum] = "fd0ba21b3179703c071bbb4c3e5fb0f4"
+SRC_URI[sha256sum] = "cf4ab0e17bfee0f7689cdcff8c7d7f164c9a710f851f91c488f5cd81fac9c0aa"
-- 
1.8.3.1


