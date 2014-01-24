Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 653D16E8C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 22:22:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jan 2014 14:22:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,715,1384329600"; d="scan'208";a="470458999"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2014 14:22:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 14:22:49 -0800
Message-Id: <1390602169-3059-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] combo-layer: Make directories only if they don't exisit yet
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
X-List-Received-Date: Fri, 24 Jan 2014 22:22:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/combo-layer | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index ae97471..9da1d3a 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -194,7 +194,8 @@ def action_init(conf, args):
             dest_dir = repo['dest_dir']
             if dest_dir and dest_dir != ".":
                 extract_dir = os.path.join(os.getcwd(), dest_dir)
-                os.makedirs(extract_dir)
+                if not os.path.exists(extract_dir):
+                    os.makedirs(extract_dir)
             else:
                 extract_dir = os.getcwd()
             file_filter = repo.get('file_filter', "")
@@ -354,7 +355,8 @@ def action_update(conf, args):
 
     import uuid
     patch_dir = "patch-%s" % uuid.uuid4()
-    os.mkdir(patch_dir)
+    if not os.path.exists(patch_dir):
+        os.mkdir(patch_dir)
 
     # Step 1: update the component repos
     if conf.nopull:
-- 
1.8.3.1


