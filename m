Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CEFFF7895F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 11:22:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2018 04:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,319,1517904000"; d="scan'208";a="25302678"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2018 04:22:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Mar 2018 13:15:39 +0200
Message-Id: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Sat, 17 Mar 2018 11:22:23 -0000

Exclude x.y.90* pre-release versions in particular.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/glibc/cross-localedef-native_2.27.bb | 2 +-
 meta/recipes-core/glibc/glibc_2.27.bb                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index f1e4a657cf4..6344c7acd05 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -19,7 +19,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
 SRCREV_glibc ?= "23158b08a0908f381459f273a984c6fd328363cb"
 SRCREV_localedef ?= "de5bdbd5e76b5403a4151b9b9f958b6cca36b3e7"
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index c4042d16fe2..827857dfc84 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -12,7 +12,7 @@ SRCREV ?= "23158b08a0908f381459f273a984c6fd328363cb"
 SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://etc/ld.so.conf \
-- 
2.16.1


