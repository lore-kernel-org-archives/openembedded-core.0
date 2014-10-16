Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 495167180F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 07:19:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G7JVD5027901
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Oct 2014 00:19:31 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 00:19:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 16 Oct 2014 15:19:20 +0800
Message-ID: <6014b082e48f2fe886c94eac7e94b335e5aa1813.1413443882.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413443882.git.hongxu.jia@windriver.com>
References: <cover.1413443882.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] classes/image: remove obsolete MULTILIB_VENDORS
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
X-List-Received-Date: Thu, 16 Oct 2014 07:19:31 -0000
Content-Type: text/plain

In oe-core commit 03c5f39b4d7dd8c81e0a130b7d5884e5af039a24,
it removed obsolete codes about variable MULTILIB_VENDORS.

We clean up the rest obsolete codes related with
MULTILIB_VENDORS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/image.bbclass | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 940bdb6..fc08653 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -145,17 +145,6 @@ python () {
 
     d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
 
-    # Ensure we have the vendor list for complementary package handling
-    ml_vendor_list = ""
-    multilibs = d.getVar('MULTILIBS', True) or ""
-    for ext in multilibs.split():
-        eext = ext.split(':')
-        if len(eext) > 1 and eext[0] == 'multilib':
-            localdata = bb.data.createCopy(d)
-            vendor = localdata.getVar("TARGET_VENDOR_virtclass-multilib-" + eext[1], False)
-            ml_vendor_list += " " + vendor
-    d.setVar('MULTILIB_VENDORS', ml_vendor_list)
-
     check_image_features(d)
     initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
     if initramfs_image != "":
-- 
1.9.1


