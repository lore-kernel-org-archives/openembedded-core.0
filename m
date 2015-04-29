Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DF1A73DA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T7TugW010850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 00:29:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 00:29:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 00:29:53 -0700
Message-ID: <5cbe660e52d40f4ac3f7c56059dd986288fb1e6f.1430292533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430292533.git.liezhi.yang@windriver.com>
References: <cover.1430292533.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] man-pages: 3.82 -> 3.83
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
X-List-Received-Date: Wed, 29 Apr 2015 07:29:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{man-pages_3.82.bb => man-pages_3.83.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.82.bb => man-pages_3.83.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.82.bb b/meta/recipes-extended/man-pages/man-pages_3.83.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_3.82.bb
rename to meta/recipes-extended/man-pages/man-pages_3.83.bb
index 7c1a7dc..790995d 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.82.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.83.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "ce4bffb9982d197bf35b59d0a12453ca"
-SRC_URI[sha256sum] = "9c22781f485d00e6b258dcaaf1efd220fee9f8d4ce59cd881b062be06be5efe8"
+SRC_URI[md5sum] = "f3ec499e5d2d164a14ac3f63b7c07c7b"
+SRC_URI[sha256sum] = "b12844bee3746fa0e4020d360e21f3ac66d121688eb5df5e9d937595240c6492"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5


