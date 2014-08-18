Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1875070E44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:24:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6OATd026465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:24:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:24:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:24:04 -0700
Message-ID: <fe6726fcabfd74cac5d84dd296d4122fd42ad972.1408342506.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342506.git.liezhi.yang@windriver.com>
References: <cover.1408342506.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] pax-utils: add bash to RDEPENDS_pax-utils
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
X-List-Received-Date: Mon, 18 Aug 2014 06:24:12 -0000
Content-Type: text/plain

Bash scripts:
pax-utils/usr/bin/symtree
pax-utils/usr/bin/lddtree

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
index e79347f..79e58ba 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.8.1.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 SRC_URI[md5sum] = "bc42279c5aff3682c12be40f72805cec"
 SRC_URI[sha256sum] = "844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9"
 
+RDEPENDS_${PN} += "bash"
+
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
 }
-- 
1.7.9.5


