Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1192771A3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 03:17:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v183HOeK021233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 7 Feb 2017 19:17:24 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 7 Feb 2017 19:17:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 22:17:04 -0500
Message-ID: <71eff13673cc54da469e518f09ab8f4719b3c1dd.1486523726.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] man-pages: 4.08 -> 4.09
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
X-List-Received-Date: Wed, 08 Feb 2017 03:17:24 -0000
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


