Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9F376FB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 07:52:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G7qjYs008142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:52:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 00:52:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 00:52:43 -0700
Message-ID: <8bf3ec997007d1d921f4dce21f55612da0dce585.1442389930.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442389930.git.liezhi.yang@windriver.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] subversion: 1.8.13 -> 1.8.14 since 1.8.13.tar.gz was gone
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
X-List-Received-Date: Wed, 16 Sep 2015 07:52:51 -0000
Content-Type: text/plain

The subversion-1.8.13.tar.bz2 is gone from ftp, so upgrade to 1.8.14.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../disable_macos.patch                            |    0
 .../libtool2.patch                                 |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |    0
 .../{subversion_1.8.13.bb => subversion_1.8.14.bb} |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.8.14.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/disable_macos.patch b/meta/recipes-devtools/subversion/subversion/disable_macos.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.13/disable_macos.patch
rename to meta/recipes-devtools/subversion/subversion/disable_macos.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch b/meta/recipes-devtools/subversion/subversion/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch b/meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
rename to meta/recipes-devtools/subversion/subversion/serf.m4-Regex-modified-to-allow-D-in-paths.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.14.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.8.13.bb
rename to meta/recipes-devtools/subversion/subversion_1.8.14.bb
index f843b95..115ae16 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.14.bb
@@ -14,8 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
 "
-SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
-SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
+SRC_URI[md5sum] = "fe476ba26d6835eba4393780ea907361"
+SRC_URI[sha256sum] = "7f3883cdfcad4174e06dd94d6e3e8ec91856823268eebe60c924be76f5229a1f"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
 
-- 
1.7.9.5


