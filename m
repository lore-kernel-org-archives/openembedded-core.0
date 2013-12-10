Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63728610F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:16:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2013 11:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="450036638"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.207])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2013 11:16:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:16:07 -0800
Message-Id: <36e6cbb1f73d0e37eab9112d0d24cf14279939dd.1386650569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] dpkg: upgrade to 1.17.4
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
X-List-Received-Date: Tue, 10 Dec 2013 19:16:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb} (75%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
similarity index 75%
rename from meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index 525f759..9e2392c 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -11,6 +11,6 @@ SRC_URI += "file://noman.patch \
             file://arch_pm.patch \
            "
 
-SRC_URI[md5sum] = "ece3ae87a099158c17bde95c0036c575"
-SRC_URI[sha256sum] = "8912ea77bc9c14297c0a340f5f461fbd212582ce814e1805d1d0436ca885e3a1"
+SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
+SRC_URI[sha256sum] = "01cdc81c33e77c3d7c40df17e19171794542be7cf12e411381ffcaa8f87b1854"
 
-- 
1.8.3.1


