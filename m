Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 04CEB773E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220245"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:35 +0200
Message-Id: <8a239f3c454a03a9e0cb66e6c45bfd57da747b20.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/19] vala: update to 0.30.1
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.30.0.bb => vala_0.30.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.30.0.bb => vala_0.30.1.bb} (42%)

diff --git a/meta/recipes-devtools/vala/vala_0.30.0.bb b/meta/recipes-devtools/vala/vala_0.30.1.bb
similarity index 42%
rename from meta/recipes-devtools/vala/vala_0.30.0.bb
rename to meta/recipes-devtools/vala/vala_0.30.1.bb
index 2a20ac6..4452298 100644
--- a/meta/recipes-devtools/vala/vala_0.30.0.bb
+++ b/meta/recipes-devtools/vala/vala_0.30.1.bb
@@ -2,5 +2,5 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
 
-SRC_URI[md5sum] = "acfaac43a65cc20d80e08fe6c81c7663"
-SRC_URI[sha256sum] = "61f0337b000f7ed6ef8c1fea87e0047d9bd7c0f91dd9c5b4eb70fd3fb883dedf"
+SRC_URI[md5sum] = "cc2eb2384fc10038b643753d734a5a51"
+SRC_URI[sha256sum] = "23add78e5c6a5e6df019d4a885c9c79814c9e0b957519ec8a4f4d826c4e5df2c"
-- 
2.7.0


