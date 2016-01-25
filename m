Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 521D677115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143994"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:11:03 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:25 +0200
Message-Id: <c7da440dcb6bc0bf0f606f4c31a08c5f25bfe2d4.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 15/16] vala: update to 0.30.0
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/vala/{vala_0.28.0.bb => vala_0.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.28.0.bb => vala_0.30.0.bb} (42%)

diff --git a/meta/recipes-devtools/vala/vala_0.28.0.bb b/meta/recipes-devtools/vala/vala_0.30.0.bb
similarity index 42%
rename from meta/recipes-devtools/vala/vala_0.28.0.bb
rename to meta/recipes-devtools/vala/vala_0.30.0.bb
index 120906c..2a20ac6 100644
--- a/meta/recipes-devtools/vala/vala_0.28.0.bb
+++ b/meta/recipes-devtools/vala/vala_0.30.0.bb
@@ -2,5 +2,5 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch"
 
-SRC_URI[md5sum] = "8d4ceac3451a0d5497e7be38e5e4c2ad"
-SRC_URI[sha256sum] = "0d9e3bd3f82145664875f7c29b2f544ba92d2814f75412948f774c0727fc977f"
+SRC_URI[md5sum] = "acfaac43a65cc20d80e08fe6c81c7663"
+SRC_URI[sha256sum] = "61f0337b000f7ed6ef8c1fea87e0047d9bd7c0f91dd9c5b4eb70fd3fb883dedf"
-- 
2.7.0.rc3


