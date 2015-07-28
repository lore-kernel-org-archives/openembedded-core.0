Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5DF763BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CZ1G028028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:30 -0700
Message-ID: <fb3b02d2c90d18388d77e329863fc39c9afc521c.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] help2man-native: 1.46.4 -> 1.47.1
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:35 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-native_1.46.4.bb => help2man-native_1.47.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.46.4.bb => help2man-native_1.47.1.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.46.4.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.1.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.46.4.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.1.bb
index 5b90da9..bc6d50e 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.46.4.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a1b7fe49eddae8a2537ed74ee9ef11cb"
-SRC_URI[sha256sum] = "1ae7f15f53b0cc55b070ae49df2ee5caa942c71529054e157599427bba3c5633"
+SRC_URI[md5sum] = "cf7aaaeea40bff1176df825430694173"
+SRC_URI[sha256sum] = "c59b26f60cb06e45b00e729dea721e7a17220e2c17d800eb428271a750382b06"
 
 inherit autotools native
 
-- 
1.7.9.5


