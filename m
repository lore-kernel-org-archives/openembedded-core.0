Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67F3C71B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201693"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:27 +0300
Message-Id: <ba96419a95d6657c0469479178e0e5ac16230663.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 09/10] mailx: depend on openssl 1.0
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
X-List-Received-Date: Wed, 10 May 2017 14:13:30 -0000

We only carry this recipe for LSB compatibility; if we need
a modern supported implementation of mail/mailx, then
s-nail (http://sdaoden.eu/code.html) or mailutils (http://mailutils.org/)
should be used.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/mailx/mailx_12.5-5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mailx/mailx_12.5-5.bb b/meta/recipes-extended/mailx/mailx_12.5-5.bb
index 9dd710a7181..0a191a00c18 100644
--- a/meta/recipes-extended/mailx/mailx_12.5-5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5-5.bb
@@ -9,7 +9,7 @@ SECTION = "console/network"
 LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl10"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5.orig.tar.gz;name=archive \
            file://0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch \
-- 
2.11.0


