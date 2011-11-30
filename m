Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVfxC-0001ys-J8
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:55:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAU8n4RI024806
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:49:06 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 Nov 2011 00:49:03 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 16:45:42 +0800
Message-ID: <55d11186d02105dcb2f41d3e6c2d010aa33741ec.1322642187.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322642187.git.wenzong.fan@windriver.com>
References: <cover.1322642187.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/5] m4: Extend to provide nativesdk recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 08:55:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

We need to provide autoconf-natviesdk in meta-toolchain, the
m4-nativesdk is required by it.

Both extend the m4 recipes for GPLv2 and GPLv3.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/m4/m4_1.4.16.bb |    4 +++-
 meta/recipes-devtools/m4/m4_1.4.9.bb  |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
index b50c022..58b0491 100644
--- a/meta/recipes-devtools/m4/m4_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 	file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
 
-PR = "r0"
+PR = "r1"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch"
 
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570
 inherit autotools
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/m4/m4_1.4.9.bb b/meta/recipes-devtools/m4/m4_1.4.9.bb
index 94c8bde..e79239b 100644
--- a/meta/recipes-devtools/m4/m4_1.4.9.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.9.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
 	file://examples/COPYING;md5=1d49bd61dc590f014cae7173b43e3e5c"
 
-PR = "r0"
+PR = "r1"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
 	file://fix_for_circular_dependency.patch "
 
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "815ce53853fbf6493617f467389b799208b1ec98296b95be44a683f8bc
 inherit autotools
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.0.4



