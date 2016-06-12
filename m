Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85F4E606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C8PID0000540
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:18 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:05 -0700
Message-ID: <741380d64afe5952cdacfdadebc1dec7effa1bdb.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] mklibs-native: 0.1.40 -> 0.1.41
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:17 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../mklibs/{mklibs-native_0.1.40.bb => mklibs-native_0.1.41.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.40.bb => mklibs-native_0.1.41.bb} (84%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
similarity index 84%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
index 59fec29..a5da936 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.x
 	file://fix_cross_compile.patch \
 "
 
-SRC_URI[md5sum] = "e1dafe5f962caa9dc5f2651c0723812a"
-SRC_URI[sha256sum] = "1db24ae779d21ccfed49f22e49a2b7ee43ec0e9197bc206d81cd02f96e91e125"
+SRC_URI[md5sum] = "6b2979876a611717df3d49e7f9cf291d"
+SRC_URI[sha256sum] = "058c7349f8ec8a03b529c546a95cd6426741bd819f1e1211f499273eb4bf5d89"
 
 inherit autotools gettext native pythonnative
-- 
2.8.0


