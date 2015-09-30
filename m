Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EECE877065
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:46:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2015 06:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,612,1437462000"; d="scan'208";a="655095421"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 06:46:10 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Sep 2015 05:38:35 +0000
Message-Id: <1bd1af92dae8adfec0da17f088bee75b4301eb81.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443591038.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 4/5] scripts/lib/bsp/engine: Indent the karch properties when stored into a file
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
X-List-Received-Date: Wed, 30 Sep 2015 13:46:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Make a bit more human-friendly the karch properties when storing
into a file.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/bsp/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index aac35d3..d0d5d72 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1684,7 +1684,7 @@ def yocto_layer_list_properties(arch, scripts_path, properties_file, expand_comm
             print "Couldn't open properties file %s for writing, exiting" % properties_file
             sys.exit(1)
 
-        json.dump(properties, of)
+        json.dump(properties, of, indent=1)
     else:
         print_dict(properties)
 
-- 
1.8.4.5


