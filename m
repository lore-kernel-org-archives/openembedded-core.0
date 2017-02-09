Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43BDF71E02
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v196jw84022511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Feb 2017 22:45:59 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:45:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:38 -0500
Message-ID: <7bd2a3694252c2e7bd67927f7e529b77f1bc5d50.1486622006.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] man-pages: 4.08 -> 4.09
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
X-List-Received-Date: Thu, 09 Feb 2017 06:46:00 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.08.bb => man-pages_4.09.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.08.bb => man-pages_4.09.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.08.bb b/meta/recipes-extended/man-pages/man-pages_4.09.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.08.bb
rename to meta/recipes-extended/man-pages/man-pages_4.09.bb
index 8fc6cb0..55fc21e 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.08.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.09.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "88760ffa6cf92495327758b828850015"
-SRC_URI[sha256sum] = "1fa6529ab2784e7db2a498feb2c5307f4afb87dff0e3321e5964265e2e8433fd"
+SRC_URI[md5sum] = "9e3c7b12a5fecda9a717a4bcc0ae3a67"
+SRC_URI[sha256sum] = "5fac324cefce0fbfae0df6c06ef3f6d6ab5227b9aad2a94f8657a0e3901f9185"
 
 RDEPENDS_${PN} = "man"
 
-- 
2.8.1


