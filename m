Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5462375669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vTBD007552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:29 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:23 -0700
Message-ID: <2bbd21cb79f7d53a23629ab6243bcf8816636545.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] man-pages: 3.83 -> 4.00
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
X-List-Received-Date: Thu, 28 May 2015 09:57:28 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{man-pages_3.83.bb => man-pages_4.00.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.83.bb => man-pages_4.00.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.83.bb b/meta/recipes-extended/man-pages/man-pages_4.00.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_3.83.bb
rename to meta/recipes-extended/man-pages/man-pages_4.00.bb
index 790995d..121dd6c 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.83.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.00.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "f3ec499e5d2d164a14ac3f63b7c07c7b"
-SRC_URI[sha256sum] = "b12844bee3746fa0e4020d360e21f3ac66d121688eb5df5e9d937595240c6492"
+SRC_URI[md5sum] = "c9bd70494ae18b19eb6be9c3845536ec"
+SRC_URI[sha256sum] = "6eea4583b8688c7d305b48d5908fa22700f57792617e4b1f3cd3766ddb520553"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.7.9.5


