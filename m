Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CFC95731C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875740059"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:53 +0200
Message-Id: <25b239baea3cf8cf0317067b786bd54f80b5af55.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/17] icu: fix upstream version check
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:38 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/icu/icu_56.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/icu/icu_56.1.bb b/meta/recipes-support/icu/icu_56.1.bb
index 90c93e8..db0de10 100644
--- a/meta/recipes-support/icu/icu_56.1.bb
+++ b/meta/recipes-support/icu/icu_56.1.bb
@@ -25,3 +25,5 @@ SRC_URI_append_class-target = "\
 SRC_URI[md5sum] = "c4a2d71ff56aec5ebfab2a3f059be99d"
 SRC_URI[sha256sum] = "3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2314816"
 
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.6.2


