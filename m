Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E9DF774F99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:21:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 01:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="64092205"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 Jun 2018 01:21:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 11:21:52 +0300
Message-Id: <20180604082153.5814-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180604082153.5814-1-alexander.kanavin@linux.intel.com>
References: <20180604082153.5814-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] meta: replace Alex Kanavin's @intel email address with a personal one
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
X-List-Received-Date: Mon, 04 Jun 2018 08:21:39 -0000

As I will be leaving Intel, this address will no longer be valid,
so swap it for my personal one for now.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/apmd/apmd/legacy.patch                         | 2 +-
 .../blktool/blktool/0001-fix-typos-in-manpage.patch             | 2 +-
 .../blktool/blktool/0002-fix-string-error.patch                 | 2 +-
 ...003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/apmd/apmd/legacy.patch b/meta/recipes-bsp/apmd/apmd/legacy.patch
index 5db895e8fec..88713118057 100644
--- a/meta/recipes-bsp/apmd/apmd/legacy.patch
+++ b/meta/recipes-bsp/apmd/apmd/legacy.patch
@@ -7,7 +7,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/a/apmd/apmd_3.2.2-15.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  Makefile |  2 +-
diff --git a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
index fee368dac25..25a2fabe156 100644
--- a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
+++ b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
@@ -7,7 +7,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  blktool.8 | 4 ++--
diff --git a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
index d08aba5f051..401e41e3ed1 100644
--- a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
+++ b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
@@ -7,7 +7,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  util.c | 2 +-
diff --git a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
index d7ed0b9f4d2..d1f1e797fe1 100644
--- a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
+++ b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
@@ -14,7 +14,7 @@ This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
 
 Upstream-Status: Inappropriate [upstream is dead]
-Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  blktool.c | 11 +++++++++--
-- 
2.17.0


