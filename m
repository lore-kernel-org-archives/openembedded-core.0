Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 77E1F772AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480779"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:29 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:54 +0200
Message-Id: <9dc2718c75461f4ab2592b6c00202d98369387ea.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/16] pigz: fix upstream version check
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/pigz/pigz_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.3.4.bb
index 49d9d78..87b61bf 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.4.bb
@@ -2,6 +2,7 @@ require pigz.inc
 LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
 
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
+UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
 SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
 SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
-- 
2.10.2


