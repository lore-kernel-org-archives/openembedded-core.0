Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C344672694
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5ib1J021741
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:37 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:37 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:05 +0800
Message-ID: <3e315694979852e4c21a128e40a23ac737f87d60.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] man-pages: upgrade to 3.76
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:37 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_3.75.bb => man-pages_3.76.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.75.bb => man-pages_3.76.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.75.bb b/meta/recipes-extended/man-pages/man-pages_3.76.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_3.75.bb
rename to meta/recipes-extended/man-pages/man-pages_3.76.bb
index 18e2bca..ed8a15f 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.75.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.76.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "74ad4aef657a046fe214bf981a9a2b30"
-SRC_URI[sha256sum] = "ba23f57a98d032a742ff506f32550dfa2c3076c8bf8d5f6b59305c6b015077d3"
+SRC_URI[md5sum] = "d00cf09677caefc3e827737afc565583"
+SRC_URI[sha256sum] = "eff558c13b61a46136994514b3ec00a74dcf00414d3bde4f0edca80a36d36359"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.9.1


