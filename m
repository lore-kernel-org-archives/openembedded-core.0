Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 30D9E77335
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 13:33:57 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id E5269401835;
	Wed,  3 Feb 2016 14:33:57 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  3 Feb 2016 14:33:45 +0100
Message-Id: <1454506425-15246-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454506425-15246-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454506425-15246-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 2/2] scripts/lib/bsp/engine: trailing whitespace cleanup
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

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 scripts/lib/bsp/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 4cca7d6291a3fac8ec5dc7f3c8f94a2295b0a1e7..66e2162ea866f171d7d55d760e97c3bd98253a22 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -438,7 +438,7 @@ class ListInputLine(InputLine):
                 self.parse_error("No entries available for input list",
                                  self.lineno, self.line)
             choicepairs = self.gen_choicepair_list()
-            
+
         return choicepairs
 
     def gen_choices(self, context = None, checklist = False):
@@ -1822,7 +1822,7 @@ def yocto_layer_list_property_values(arch, property, scripts_path, properties_fi
             sys.exit(1)
 
         json.dump(values_list, of)
-    
+
     print_values(type, values_list)
 
 
-- 
2.5.0


