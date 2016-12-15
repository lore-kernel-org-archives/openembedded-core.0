Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BA54F772C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480852"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:05 +0200
Message-Id: <977b552fbd1928e7ab37ff7daa60f4d9cffc0134.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/16] sysprof: update to 3.22.3
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:40 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/sysprof/{sysprof_3.22.2.bb => sysprof_3.22.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/sysprof/{sysprof_3.22.2.bb => sysprof_3.22.3.bb} (87%)

diff --git a/meta/recipes-kernel/sysprof/sysprof_3.22.2.bb b/meta/recipes-kernel/sysprof/sysprof_3.22.3.bb
similarity index 87%
rename from meta/recipes-kernel/sysprof/sysprof_3.22.2.bb
rename to meta/recipes-kernel/sysprof/sysprof_3.22.3.bb
index a1ed7c8..50be960 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.22.2.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.22.3.bb
@@ -13,8 +13,8 @@ SRC_URI += " \
            file://0001-Disable-check-for-polkit-for-UI.patch \
            file://0001-Avoid-building-docs.patch \
           "
-SRC_URI[archive.md5sum] = "2634bf35f5592e5e4520ccaba87e909e"
-SRC_URI[archive.sha256sum] = "d57fb19a3e5d4ad37d5fb554dc93d9a03f332779c3bffd9c2aa8f176e85269d7"
+SRC_URI[archive.sha256sum] = "e6dca325b3014440f457a92db18ffe342a35888db3f0756694a99b9652796367"
+SRC_URI[archive.md5sum] = "9514065dc752105240e5567c13708af4"
 
 AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
-- 
2.10.2


