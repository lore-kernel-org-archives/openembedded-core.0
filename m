Return-Path: <amanda.r.brindle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F1ED478792
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:45:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 12:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,403,1511856000"; d="scan'208";a="28903825"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2018 12:45:05 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 12:42:37 -0800
Message-Id: <70995c139bbab1a7ca91d9ec47915a39da393095.1516732731.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1516732731.git.amanda.r.brindle@intel.com>
References: <cover.1516732731.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 1/1] oe-pkgdata-util: Include colon when searching for variables
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
X-List-Received-Date: Tue, 23 Jan 2018 20:45:05 -0000

When searching for variables, include colon to ensure the script doesn't
find a variable that starts with the same name.

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 scripts/oe-pkgdata-util | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 040854f..78b3d7b 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -256,7 +256,7 @@ def lookup_recipe(args):
         with open(pkgdatafile, 'r') as f:
             found = False
             for line in f:
-                if line.startswith('PN'):
+                if line.startswith('PN:'):
                     print("%s" % line.split(':', 1)[1].strip())
                     found = True
                     break
@@ -292,19 +292,19 @@ def package_info(args):
             pe = ''
             pr = ''
             for line in f:
-                if line.startswith('PKGV'):
+                if line.startswith('PKGV:'):
                     pkg_version = line.split(':', 1)[1].strip()
-                elif line.startswith('PKGE'):
+                elif line.startswith('PKGE:'):
                     pkge = line.split(':', 1)[1].strip()
-                elif line.startswith('PKGR'):
+                elif line.startswith('PKGR:'):
                     pkgr = line.split(':', 1)[1].strip()
-                elif line.startswith('PN'):
+                elif line.startswith('PN:'):
                     recipe = line.split(':', 1)[1].strip()
-                elif line.startswith('PV'):
+                elif line.startswith('PV:'):
                     recipe_version = line.split(':', 1)[1].strip()
-                elif line.startswith('PE'):
+                elif line.startswith('PE:'):
                     pe = line.split(':', 1)[1].strip()
-                elif line.startswith('PR'):
+                elif line.startswith('PR:'):
                     pr = line.split(':', 1)[1].strip()
                 elif line.startswith('PKGSIZE'):
                     pkg_size = line.split(':', 1)[1].strip()
-- 
2.7.4


