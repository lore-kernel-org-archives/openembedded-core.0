Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 482AE7FC03
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 10:08:16 +0000 (UTC)
IronPort-SDR: bgX8c30nwhhVSR6eSEFU4TCA/61aZV71RwAlsGkV50gzf4udZJC6HujWUqYKdcDMeyV2yCFsPZ
	Wujg41RwFvbVO5MQFmQmnSrb67099g2uoZHe2FfU2/ad8G4nQDmnEq2WPr7V6tMOPK060rpDbA
	/SjEouEixvoeB4ZZXXtP5WyqTZmumpAg54iGy7qVG0+DLBgQ43b8Ye76qIkoTQbdqIp0FjsHMv
	yoI4GWWFhRyy7/Evic6kYTVnIF07d0ybvcp6H93Ntr1KxbUfA418vTINSHuWfbUEqztsjtQE2d
	kqs=
X-IronPort-AV: E=Sophos;i="5.69,241,1571695200"; 
   d="scan'208";a="2880067"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Axis-NonUser-Spam: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 11:08:13 +0100
Message-Id: <20191125100813.24338-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125100813.24338-1-pkj@axis.com>
References: <20191125100813.24338-1-pkj@axis.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] libpng: Remove duplicate license information
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
X-List-Received-Date: Mon, 25 Nov 2019 10:08:16 -0000
Content-Transfer-Encoding: 8bit

The LICENSE file contains all the license information so there is no
need to also include it from the png.h file (and additionally some
lines were left out from the latter).

License-Update: Remove duplicate license information
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 2ed87a8437..78f3248d73 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -2,9 +2,7 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000\
-                    file://png.h;endline=144;md5=8acd23d544623816b097e07be0139509\
-                    "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000"
 DEPENDS = "zlib"
 
 LIBV = "16"
-- 
2.21.0


