Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E95CE7829F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 13:35:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2017 06:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,421,1498546800"; d="scan'208";a="1187719557"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2017 06:35:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 16:32:26 +0300
Message-Id: <20170824133226.43386-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824133226.43386-1-alexander.kanavin@linux.intel.com>
References: <20170824133226.43386-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] libva: fix upstream version check
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
X-List-Received-Date: Thu, 24 Aug 2017 13:35:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/libva/libva_1.8.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libva/libva_1.8.3.bb b/meta/recipes-graphics/libva/libva_1.8.3.bb
index bb5f829fcc5..ceeda842832 100644
--- a/meta/recipes-graphics/libva/libva_1.8.3.bb
+++ b/meta/recipes-graphics/libva/libva_1.8.3.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
 SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.8-branch "
 SRCREV = "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
-UPSTREAM_CHECK_GITTAGREGEX = "libva-(?P<pver>(\d+(\.\d+)+))"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>(\d+(\.\d+)+))$"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


