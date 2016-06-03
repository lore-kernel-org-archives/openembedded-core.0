Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CDCA3774F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440194"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:14:49 +0300
Message-Id: <076f1bd87dcb3db0274fd24d098c52ba56de9538.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/25] gcc: fix upstream check for 5.x version
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:20 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index c54fa68..8613a10 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -101,6 +101,7 @@ BACKPORTS = ""
 
 SRC_URI[md5sum] = "c9616fd448f980259c31de613e575719"
 SRC_URI[sha256sum] = "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"
+UPSTREAM_CHECK_REGEX = "gcc-(?P<pver>5\.\d+\.\d+).tar"
 
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-- 
2.8.1


