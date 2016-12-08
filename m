Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 26E1B71BB6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:56:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 08 Dec 2016 08:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1096507325"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2016 08:57:00 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A4AA26A4080;
	Thu,  8 Dec 2016 08:56:14 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:56:49 +0200
Message-Id: <1481216209-15959-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-trim-schemas: create usage output
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
X-List-Received-Date: Thu, 08 Dec 2016 16:57:00 -0000

Created usage output for oe-trim-schemas script.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-trim-schemas | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 66a1b8d..7c199ef 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -18,6 +18,15 @@ def children (elem, name=None):
         l = [e for e in l if e.tag == name]
     return l
 
+if len(sys.argv) < 2 or sys.argv[1] in ('-h', '--help'):
+    print('oe-trim-schemas: error: the following arguments are required: schema\n'
+          'Usage: oe-trim-schemas schema\n\n'
+          'OpenEmbedded trim schemas - remove unneeded schema locale translations\n'
+          '                            from gconf schema files\n\n'
+          'arguments:\n'
+          '  schema                gconf schema file to trim\n')
+    sys.exit(2)
+
 xml = etree.parse(sys.argv[1])
 
 for schema in child(xml.getroot(), "schemalist").getchildren():
-- 
2.1.4


