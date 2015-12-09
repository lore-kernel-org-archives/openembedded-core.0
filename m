Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0CC6612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661967"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:30 +0200
Message-Id: <5204a2732a9ca0fcec0b87fe33ec7f7ae1a10bca.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/10] slang: update upstream URI to (official) jedsoft.org
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/slang/slang_2.2.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 5122f53..e33e868 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -16,7 +16,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
 
 
-SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
+SRC_URI = "http://www.jedsoft.org/releases/slang/old/slang-${PV}.tar.bz2 \
            file://rpathfix.patch \
            file://fix-check-pcre.patch \
            file://change-char-type-to-signed-char-in-macros.patch \
@@ -24,6 +24,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://slang-fix-the-iconv-existence-checking.patch \
            file://0001-Fix-error-conflicting-types-for-posix_close.patch \
           "
+UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
 
 inherit autotools-brokensep
 
-- 
2.6.2


