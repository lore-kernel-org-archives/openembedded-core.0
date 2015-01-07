Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB48B65CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:31:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t071V721025755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jan 2015 17:31:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 17:31:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jan 2015 17:31:05 -0800
Message-ID: <476ff6b268358d813ffa26a149e8bc686f0d670e.1420594233.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420594233.git.liezhi.yang@windriver.com>
References: <cover.1420594233.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pax-utils: RDEPENDS on python
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
X-List-Received-Date: Wed, 07 Jan 2015 01:31:07 -0000
Content-Type: text/plain

python script:
pax-utils/usr/bin/lddtree

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb b/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
index ac14306..ea3d78e 100644
--- a/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
+++ b/meta/recipes-devtools/pax-utils/pax-utils_0.9.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://gentoo.osuosl.org/distfiles/pax-utils-${PV}.tar.xz"
 SRC_URI[md5sum] = "34c41888cec67759c21333bef13e950c"
 SRC_URI[sha256sum] = "578801df0661b1b7b8fed0ce4a9859239f919fd37529907681e51091a1bcb4de"
 
-RDEPENDS_${PN} += "bash"
+RDEPENDS_${PN} += "bash python"
 
 do_install() {
     oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
-- 
1.7.9.5


