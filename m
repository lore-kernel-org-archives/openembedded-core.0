Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A22A72DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548577"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:59 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:45 +0200
Message-Id: <64b6afeac8ed9498325095f40cd78d889728ee5a.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/7] pixz: fix upstream version check
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/pixz/pixz_1.0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/pixz/pixz_1.0.6.bb b/meta/recipes-extended/pixz/pixz_1.0.6.bb
index 279fb54..67681d4 100644
--- a/meta/recipes-extended/pixz/pixz_1.0.6.bb
+++ b/meta/recipes-extended/pixz/pixz_1.0.6.bb
@@ -10,6 +10,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5cf6d164086105f1512ccb81bfff1926"
 
 SRC_URI += "file://936d8068ae19d95260d3058f41dd6cf718101cd6.patch"
+UPSTREAM_CHECK_URI = "https://github.com/vasi/pixz/releases"
 
 EXTRA_OECONF += "--without-manpage"
 
-- 
2.7.0


