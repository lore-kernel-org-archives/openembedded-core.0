Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A676E7EC43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7SAdPnq008370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:39:25 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 03:39:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 19:04:56 +0800
Message-ID: <291150eead402d79d98fe76f733207856642400d.1566990265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566990265.git.liezhi.yang@windriver.com>
References: <cover.1566990265.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ccache: 3.7.1 -> 3.7.3
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
X-List-Received-Date: Wed, 28 Aug 2019 10:39:24 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/{ccache_3.7.1.bb => ccache_3.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.7.1.bb => ccache_3.7.3.bb} (45%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.1.bb b/meta/recipes-devtools/ccache/ccache_3.7.3.bb
similarity index 45%
rename from meta/recipes-devtools/ccache/ccache_3.7.1.bb
rename to meta/recipes-devtools/ccache/ccache_3.7.3.bb
index 1db7094..c6a682e 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.7.3.bb
@@ -3,5 +3,5 @@ require ccache.inc
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=0094c59039cec66b8a4c905204333514"
 
-SRC_URI[md5sum] = "74339465ab87e0b406985ed69515f19b"
-SRC_URI[sha256sum] = "e562fcdbe766406b6fe4bf97ce5c001d2be8a17465f33bcddefc9499bbb057d8"
+SRC_URI[md5sum] = "7be62ea6e190941a8c12a3d5394fd926"
+SRC_URI[sha256sum] = "355955a61562c53c4ec4669e1c92708b0008f50d214b27f07a87cf4a1fa6b01e"
-- 
2.7.4


