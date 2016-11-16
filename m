Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC7FF71975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 13:15:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 16 Nov 2016 05:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; d="scan'208";a="31539471"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 16 Nov 2016 05:15:08 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 806C36A4080;
	Wed, 16 Nov 2016 05:14:28 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 15:15:01 +0200
Message-Id: <194123a720a31cadff0adb23de4059e26dc50edf.1479301275.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
References: <21d8313a85d99df758d09cacc1926c109b1e1adc.1479301275.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1479301275.git.jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/4] core-tools-testapps: Re-add piglit
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
X-List-Received-Date: Wed, 16 Nov 2016 13:15:11 -0000

Piglit was removed from testapps in 9e227ecb3a because it made
sdk images massive. Add piglit back now that the installed size is
no longer humongous: it still needs 1.5 GB free space at runtime but
the image sizes stay reasonable.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 3170978..69cfd57 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -17,6 +17,8 @@ KEXECTOOLS_nios2 ?= ""
 
 X11GLTOOLS = "\
     mesa-demos \
+    piglit \
+    piglit-generated-tests-compressed \
     "
 
 3GTOOLS = "\
-- 
2.1.4


