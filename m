Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30591771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w625lUEH022576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:31 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:11 +0800
Message-ID: <f40e29fc182ad642e1ea28ebbff4a2bb7ed35086.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] help2man-native: 1.47.5 -> 1.47.6
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:30 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../help2man/{help2man-native_1.47.5.bb => help2man-native_1.47.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.5.bb => help2man-native_1.47.6.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.5.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.6.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.5.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.6.bb
index 2dd6d38..794d308 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.5.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.6.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "1c886063c9e0ab463906de804596aa2f"
-SRC_URI[sha256sum] = "7ca60b2519fdbe97f463fe2df66a6188d18b514bfd44127d985f0234ee2461b1"
+SRC_URI[md5sum] = "7424901e6eca8af372d2ad62be5cf659"
+SRC_URI[sha256sum] = "d91b0295b72a638e4a564f643e4e6d1928779131f628c00f356c13bf336de46f"
 
 inherit autotools native
 
-- 
2.7.4


