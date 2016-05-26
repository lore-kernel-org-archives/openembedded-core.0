Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47BEC731A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020357"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:16 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:51 +0300
Message-Id: <560a7cd3fa966ffef0b31f805ce94405a74a7ec9.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] liburcu: upgrade to 0.9.2
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
X-List-Received-Date: Thu, 26 May 2016 14:01:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.9.1.bb => liburcu_0.9.2.bb} (83%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.9.1.bb b/meta/recipes-support/liburcu/liburcu_0.9.2.bb
similarity index 83%
rename from meta/recipes-support/liburcu/liburcu_0.9.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.9.2.bb
index aadc32f..23fb8c4 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
         file://0002-Support-for-aarch64_be.patch \
 	"
 
-SRC_URI[md5sum] = "124eaeea06863271c0bdf2a0cc1d8e4b"
-SRC_URI[sha256sum] = "f8d278e9d95bec97c9ba954fc4c3fb584936bc0010713a8fe358b916bafd8715"
+SRC_URI[md5sum] = "49f86e68c1e2f41d303381a271b791d1"
+SRC_URI[sha256sum] = "8f7fa313b1e0a3f742cea24ce63a39c0efe63e615a769e2961e55bd2663ecaa3"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.8.1


