Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A375D783E4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 02:40:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w152eQ0b003270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Feb 2018 18:40:26 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Feb 2018 18:40:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Feb 2018 10:41:03 +0800
Message-ID: <1d77f91111a704c9ae72060da6814f276ece3a83.1517798422.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517798422.git.liezhi.yang@windriver.com>
References: <cover.1517798422.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] ccache: 3.3.4 -> 3.3.5
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
X-List-Received-Date: Mon, 05 Feb 2018 02:40:25 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM is changed because of year updated, the contents are the
same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/{ccache_3.3.4.bb => ccache_3.3.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.3.4.bb => ccache_3.3.5.bb} (48%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.4.bb b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
similarity index 48%
rename from meta/recipes-devtools/ccache/ccache_3.3.4.bb
rename to meta/recipes-devtools/ccache/ccache_3.3.5.bb
index 1e535b1..929f0f1 100644
--- a/meta/recipes-devtools/ccache/ccache_3.3.4.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
@@ -1,10 +1,10 @@
 require ccache.inc
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7fe21f9470f2305e95e7d8a632255079"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
 
-SRC_URI[md5sum] = "95ab3c56284129cc2a32460c23069516"
-SRC_URI[sha256sum] = "24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f"
+SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
+SRC_URI[sha256sum] = "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
-- 
2.7.4


