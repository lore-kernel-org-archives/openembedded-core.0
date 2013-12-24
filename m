Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF5A617AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 00:29:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 16:29:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,539,1384329600"; d="scan'208";a="454819336"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2013 16:29:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 16:29:07 -0800
Message-Id: <1387844949-23516-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
References: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] python: fix unrecognised options: --without-cxx --with-cyclic-gc
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
X-List-Received-Date: Tue, 24 Dec 2013 00:29:10 -0000

The -with-cxx changed to with-cxx-main sometime around the 2.5 time frame
It appears that there never was a with-cyclic-gc configure option, or if
there was it was from some past patch we no longer have.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/python/python.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index fcfeda5..cecfb3a 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -22,8 +22,7 @@ PYTHONLSBOPTS_linuxstdbase = "ac_cv_sizeof_off_t=8"
 EXTRA_OECONF = "\
   --with-threads \
   --with-pymalloc \
-  --with-cyclic-gc \
-  --without-cxx \
+  --without-cxx-main \
   --with-signal-module \
   --enable-shared \
   --enable-ipv6=${@base_contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
-- 
1.8.3.1


