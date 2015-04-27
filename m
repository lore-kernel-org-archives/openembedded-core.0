Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C18E965CD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:12:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3R8CVpm027362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 01:12:31 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 01:12:30 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 16:12:29 +0800
Message-ID: <1430122349-8674-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] subversion: upgrade it from 1.8.11 to 1.8.13
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
X-List-Received-Date: Mon, 27 Apr 2015 08:12:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to fix two CVE defects: CVE-2015-0248 and CVE-2015-0251

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../{subversion-1.8.11 => subversion-1.8.13}/disable_macos.patch      | 0
 .../{subversion-1.8.11 => subversion-1.8.13}/libtool2.patch           | 0
 .../subversion/{subversion_1.8.11.bb => subversion_1.8.13.bb}         | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.8.11 => subversion-1.8.13}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.11 => subversion-1.8.13}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.11.bb => subversion_1.8.13.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.11/disable_macos.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/disable_macos.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.11/disable_macos.patch
rename to meta/recipes-devtools/subversion/subversion-1.8.13/disable_macos.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.11/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.11/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.11.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.8.11.bb
rename to meta/recipes-devtools/subversion/subversion_1.8.13.bb
index 8e4cd9d..aaeb5cd 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.11.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
 "
-SRC_URI[md5sum] = "766a89bbbb388f8eb76166672d3b9e49"
-SRC_URI[sha256sum] = "10b056420e1f194c12840368f6bf58842e6200f9cb8cc5ebbf9be2e89e56e4d9"
+SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
+SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
 
-- 
2.1.0


