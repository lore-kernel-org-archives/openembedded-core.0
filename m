Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8B46B7852B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6V9oKBm029859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:20 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:10 -0700
Message-ID: <09444d8ff773df256ac6e32a9742a26ebed2d33f.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] testimage.bbclass: update comments
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:19 -0000
Content-Type: text/plain

It's very important to add IMAGE_CLASSES += "testimage" in local.conf firstly,
otherwise the var like TEST_LOG_DIR (defined in testimage.bbclass) will not be
in testdata.json.

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 0c4a84e1119..6a435604222 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -7,8 +7,8 @@
 # Most of the tests are commands run on target image over ssh.
 # To use it add testimage to global inherit and call your target image with -c testimage
 # You can try it out like this:
-# - first build a qemu core-image-sato
-# - add IMAGE_CLASSES += "testimage" in local.conf
+# - first add IMAGE_CLASSES += "testimage" in local.conf
+# - build a qemu core-image-sato
 # - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
-- 
2.11.0


