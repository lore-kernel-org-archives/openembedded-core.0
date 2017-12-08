Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 164DA786E9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 21:04:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 13:04:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,379,1508828400"; 
   d="scan'208";a="1234782"
Received: from jairdeje-mobl1.zpn.intel.com ([10.219.4.135])
	by orsmga007.jf.intel.com with ESMTP; 08 Dec 2017 13:04:01 -0800
From: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Dec 2017 15:03:57 -0600
Message-Id: <dbe303bc50a0854d763d008bf0315618adba4d5d.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
References: <cover.1512765610.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Subject: [PATCH V4 2/2] imagefeatures.py: Add id to tests missing it
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
X-List-Received-Date: Fri, 08 Dec 2017 21:04:01 -0000

This commit adds an id to the following tests:

- test_useradd_static
- test_image_gen_debugfs

Signed-off-by: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 88fdf96..6623277 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -230,6 +230,7 @@ class ImageFeatures(OESelftestTestCase):
             self.assertTrue(os.path.exists(image_path),
                             "%s image %s doesn't exist" % (itype, image_path))
 
+    @OETestID(1955)
     def test_useradd_static(self):
         config = """
 USERADDEXTENSION = "useradd-staticids"
@@ -240,6 +241,7 @@ USERADD_GID_TABLES += "files/static-group"
         self.write_config(config)
         bitbake("core-image-base")
 
+    @OETestID(1956)
     def test_image_gen_debugfs(self):
         """
         Summary:     Check debugfs generation
-- 
2.7.5


