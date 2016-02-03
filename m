Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDFA76FF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 13:33:57 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 9BD7C400A74;
	Wed,  3 Feb 2016 14:33:57 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  3 Feb 2016 14:33:44 +0100
Message-Id: <1454506425-15246-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 1/2] scripts/lib/bsp/engine: fix path separator
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
X-List-Received-Date: Wed, 03 Feb 2016 13:34:00 -0000

Make path to newly generated README file legitimate

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 scripts/lib/bsp/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index d0d5d726aa7c50b741bbe5b38bd799f969d6ed7b..4cca7d6291a3fac8ec5dc7f3c8f94a2295b0a1e7 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1598,7 +1598,7 @@ def yocto_layer_create(layer_name, scripts_path, layer_output_dir, codedump, pro
     yocto_common_create(layer_name, "layer", scripts_path, layer_output_dir, codedump, properties_file, properties, False)
 
     print "\nNew layer created in %s.\n" % (layer_output_dir)
-    print "Don't forget to add it to your BBLAYERS (for details see %s\README)." % (layer_output_dir)
+    print "Don't forget to add it to your BBLAYERS (for details see %s/README)." % (layer_output_dir)
 
 
 def yocto_bsp_create(machine, arch, scripts_path, bsp_output_dir, codedump, properties_file, properties=None):
-- 
2.5.0


