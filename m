Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21FED731F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B0Vgp8007350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Jan 2016 16:31:42 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:42 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:38 +0800
Message-ID: <b0b72d1ccd2df40f44dc12ac95db7bea0cdbf932.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] help2man-native: 1.47.1 -> 1.47.3
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:42 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../help2man/{help2man-native_1.47.1.bb => help2man-native_1.47.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.1.bb => help2man-native_1.47.3.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.1.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.3.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.1.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.3.bb
index bc6d50e..232b0c3 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.1.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.3.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "cf7aaaeea40bff1176df825430694173"
-SRC_URI[sha256sum] = "c59b26f60cb06e45b00e729dea721e7a17220e2c17d800eb428271a750382b06"
+SRC_URI[md5sum] = "d1d44a7a7b2bd61755a2045d96ecaea0"
+SRC_URI[sha256sum] = "c232af6475ef65bee02770862a362f4c4c2e6c9967d39e987eb94cadcfc13856"
 
 inherit autotools native
 
-- 
1.9.1


