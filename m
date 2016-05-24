Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 40BF06FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326977"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:10 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:18 +0000
Message-Id: <49e3149be53890d3d6fae57b83d29856d40f666a.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 09/10] cpio: Add native variant
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
X-List-Received-Date: Tue, 24 May 2016 20:49:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/recipes-extended/cpio/cpio_v2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 1bdc617..31adb71 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -39,3 +39,5 @@ ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 
 ALTERNATIVE_PRIORITY[rmt] = "50"
 ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
+
+BBCLASSEXTEND = "native"
-- 
2.6.6


