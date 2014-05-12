Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E24D601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 07:01:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4C71WTp018196
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 May 2014 00:01:32 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 00:01:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 15:01:26 +0800
Message-ID: <00cdf95da01555eadb6f7146fc8a6ae50a2649cd.1399877999.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399877999.git.hongxu.jia@windriver.com>
References: <cover.1399877999.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] pax-utils: upgrade to 0.8.1
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
X-List-Received-Date: Mon, 12 May 2014 07:01:33 -0000
Content-Type: text/plain

Build success for qemux86-64, and test on core-image-minimal.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pax-utils/{pax-utils_0.7.bb => pax-utils_0.8.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.7.bb => pax-utils_0.8.1.bb} (82%)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
similarity index 82%
rename from meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
rename to meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
index 30fb0e6..e79347f 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.7.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8ae7743ad11500f7604f2e817221d877"
-SRC_URI[sha256sum] = "1ac4cee9a9ca97a723505eb29a25e50adeccffba3f0f0ef4f035cf082caf3b84"
+SRC_URI[md5sum] = "bc42279c5aff3682c12be40f72805cec"
+SRC_URI[sha256sum] = "844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9"
 
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
-- 
1.8.1.2


