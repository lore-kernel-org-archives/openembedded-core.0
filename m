Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97D316E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 06:40:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t746eCW6009690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 23:40:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 3 Aug 2015 23:40:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 23:40:09 -0700
Message-ID: <84ee27d8d5387c2d45b54e7381f4166637ae29fa.1438670283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438670283.git.liezhi.yang@windriver.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] binutils: 2.25 -> 2.25.1
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
X-List-Received-Date: Tue, 04 Aug 2015 06:40:14 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{binutils-2.25.inc => binutils-2.25.1.inc}     |    2 +-
 ...n_2.25.bb => binutils-cross-canadian_2.25.1.bb} |    0
 ...tils-cross_2.25.bb => binutils-cross_2.25.1.bb} |    0
 ...rosssdk_2.25.bb => binutils-crosssdk_2.25.1.bb} |    0
 .../{binutils_2.25.bb => binutils_2.25.1.bb}       |    0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/binutils/{binutils-2.25.inc => binutils-2.25.1.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.25.bb => binutils-cross-canadian_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.25.bb => binutils-cross_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.25.bb => binutils-crosssdk_2.25.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.25.bb => binutils_2.25.1.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.inc b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.25.inc
rename to meta/recipes-devtools/binutils/binutils-2.25.1.inc
index c9a5fe0..15ef36c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
@@ -16,7 +16,7 @@ def binutils_branch_version(d):
 
 BINUPV = "${@binutils_branch_version(d)}"
 
-SRCREV = "bff55dd20499331280c96697a25b48dd4d7b69e8"
+SRCREV = "2bd25930221dea4bf33c13a89c111514491440e2"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.25.bb b/meta/recipes-devtools/binutils/binutils-cross_2.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.25.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.25.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.25.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.25.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.25.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.25.bb b/meta/recipes-devtools/binutils/binutils_2.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.25.bb
rename to meta/recipes-devtools/binutils/binutils_2.25.1.bb
-- 
1.7.9.5


