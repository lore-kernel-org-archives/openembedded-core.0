Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4E06FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5D9Gj9i004397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 02:16:45 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:29 -0400
Message-ID: <719ddc8e3a642e98a3f7427b8a409bf5d6704888.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] help2man-native: upgrade to 1.47.4
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:44 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../help2man/{help2man-native_1.47.3.bb => help2man-native_1.47.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.3.bb => help2man-native_1.47.4.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.3.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.4.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.3.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.4.bb
index 232b0c3..64dc32c 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.3.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.4.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d1d44a7a7b2bd61755a2045d96ecaea0"
-SRC_URI[sha256sum] = "c232af6475ef65bee02770862a362f4c4c2e6c9967d39e987eb94cadcfc13856"
+SRC_URI[md5sum] = "544aca496a7d89de3e5d99e56a2f03d3"
+SRC_URI[sha256sum] = "d4ecf697d13f14dd1a78c5995f06459bff706fd1ce593d1c02d81667c0207753"
 
 inherit autotools native
 
-- 
2.8.1


