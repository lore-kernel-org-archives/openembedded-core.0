Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F081705B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJiB5012728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:15 -0700
Message-ID: <1cf638d8a153440ef72da2a1f7f0131934b99804.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/38] pax-utils: add bash to RDEPENDS_pax-utils
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:43 -0000
Content-Type: text/plain

Bash script:
pax-utils/usr/bin/lddtree

[YOCTO #1662]

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


