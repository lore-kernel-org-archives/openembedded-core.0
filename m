Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC5B776A6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:37:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 04:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="752149057"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2015 04:37:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:39:18 +0300
Message-Id: <3e2150ea28539ba5780188819fd16172c9b2e7d3.1440070230.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440070230.git.jussi.kukkonen@intel.com>
References: <cover.1440070230.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] lsof: Upgrade 4.88 -> 4.89
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
X-List-Received-Date: Thu, 20 Aug 2015 11:37:48 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-extended/lsof/{lsof_4.88.bb => lsof_4.89.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.88.bb => lsof_4.89.bb} (91%)

diff --git a/meta/recipes-extended/lsof/lsof_4.88.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
similarity index 91%
rename from meta/recipes-extended/lsof/lsof_4.88.bb
rename to meta/recipes-extended/lsof/lsof_4.89.bb
index c0f34b6..9b7de9a 100644
--- a/meta/recipes-extended/lsof/lsof_4.88.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -6,8 +6,8 @@ LICENSE = "BSD"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "1b29c10db4aa88afcaeeaabeef6790db"
-SRC_URI[sha256sum] = "fe6f9b0e26b779ccd0ea5a0b6327c2b5c38d207a6db16f61ac01bd6c44e5c99b"
+SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
+SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
-- 
2.1.4


