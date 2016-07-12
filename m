Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2A61606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 12:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6CC4880020308
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 05:04:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jul 2016 05:04:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2016 05:04:02 -0700
Message-ID: <8c81e893a669cb71e9ca20e8fab8ae99dd584ba1.1468324994.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468324994.git.liezhi.yang@windriver.com>
References: <cover.1468324994.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] testimage.bbclass: INHERIT -> IMAGE_CLASSES
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
X-List-Received-Date: Tue, 12 Jul 2016 12:04:09 -0000
Content-Type: text/plain

Use IMAGE_CLASSES which is only seen by image recipe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 7fd0f62..6d8cc6e 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -8,7 +8,7 @@
 # To use it add testimage to global inherit and call your target image with -c testimage
 # You can try it out like this:
 # - first build a qemu core-image-sato
-# - add INHERIT += "testimage" in local.conf
+# - add IMAGE_CLASSES += "testimage" in local.conf
 # - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
-- 
2.9.0


