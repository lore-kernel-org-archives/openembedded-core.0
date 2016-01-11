Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED7373216
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0VePb024683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:41 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:37 +0800
Message-ID: <5c9354d149df1d33c856673b6f796bcd022acbc2.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] man-pages: 4.02 -> 4.04
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:40 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_4.02.bb => man-pages_4.04.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.02.bb => man-pages_4.04.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.02.bb b/meta/recipes-extended/man-pages/man-pages_4.04.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_4.02.bb
rename to meta/recipes-extended/man-pages/man-pages_4.04.bb
index 1b90a44..65df0aa 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.02.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.04.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "93df3279798a3345bb2c709584c83639"
-SRC_URI[sha256sum] = "42324f9ed47c89a43cb37b6bb0d5fbcad44838eee45cd394e181c98d038c49ff"
+SRC_URI[md5sum] = "901cd52e0ee2a9d7508ae1ab15d5e835"
+SRC_URI[sha256sum] = "bff072462baea8d1b8e4568759324c5ed6c760716fe830bca71129cc09e00668"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.9.1


