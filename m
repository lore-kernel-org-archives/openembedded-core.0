Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B25B6F737
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 08:49:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2014 01:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,808,1389772800"; d="scan'208";a="488493111"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga001.jf.intel.com with ESMTP; 07 Apr 2014 01:49:39 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Apr 2014 11:50:24 +0300
Message-Id: <1396860624-22648-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH][review-request] toaster.bbclass: image file is missing a "/"
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
X-List-Received-Date: Mon, 07 Apr 2014 08:49:40 -0000

Relaced the key with the join between path and file name.

[YOCTO #6090]
Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/classes/toaster.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 9fb2cec..d2fa82d 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -153,7 +153,8 @@ python toaster_image_dumpdata() {
     for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
         for fn in filenames:
             if fn.startswith(image_name):
-                image_info_data[dirpath + fn] = os.stat(os.path.join(dirpath, fn)).st_size
+                image_output = os.path.join(dirpath, fn)
+                image_info_data[image_output] = os.stat(image_output).st_size
 
     bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
 }
-- 
1.7.9.5


