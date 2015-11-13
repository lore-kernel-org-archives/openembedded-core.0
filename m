Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 92C4577306
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599687018"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:10 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:47:02 +0200
Message-Id: <d87660eddf278f8144b48c9eb991cab5d306dffe.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 17/19] xinput: Upgrade 1.6.1 -> 1.6.2
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:10 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} (66%)

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.1.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.2.bb
similarity index 66%
rename from meta/recipes-graphics/xorg-app/xinput_1.6.1.bb
rename to meta/recipes-graphics/xorg-app/xinput_1.6.2.bb
index 5befcc8..25cd047 100644
--- a/meta/recipes-graphics/xorg-app/xinput_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.2.bb
@@ -8,7 +8,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
 
 DEPENDS += " libxi libxrandr libxinerama"
 
-
-SRC_URI[md5sum] = "305980ac78a6954e306a14d80a54c441"
-SRC_URI[sha256sum] = "b7632d0f228a8a6be93b09857ea413940fcf44091e60f4a0fe9f5fd82efd871f"
-
+SRC_URI[md5sum] = "6a889412eff2e3c1c6bb19146f6fe84c"
+SRC_URI[sha256sum] = "3694d29b4180952fbf13c6d4e59541310cbb11eef5bf888ff3d8b7f4e3aee5c4"
-- 
2.1.4


