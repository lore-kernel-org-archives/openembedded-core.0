Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05857730F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655747; x=1521191747;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=DJWniT6qcT9B4fJ5Hn8ZNsVwkgA5ng2IkkGlls7amhQ=;
	b=PpHsGtmaPlYWReC+Jtx29KiDBzTIsSS9/0FFJmR/j4ygvTX6nCSCVEj8
	co4INJ+AxvgWCEnOEfGwmmTSi3m+8Q==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="76043265"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Mar 2017 02:15:46 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 930132C8001;
	Thu, 16 Mar 2017 02:15:41 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:30 +0200
Message-Id: <cb7e88f07b80ab5bf97199776a904ad1d00d65f2.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/11] readline: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:46 -0000

config-dirent-symbols.patch was removed from SRC_URI as "already
applied in upstream" in 983a4986947.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../readline/files/config-dirent-symbols.patch     | 34 ----------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/config-dirent-symbols.patch

diff --git a/meta/recipes-core/readline/files/config-dirent-symbols.patch b/meta/recipes-core/readline/files/config-dirent-symbols.patch
deleted file mode 100644
index cfff03c..0000000
--- a/meta/recipes-core/readline/files/config-dirent-symbols.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Fix the names of the STRUCT_DIRENT_D symbols to match the names used by both
-configure and the source code.
-
-Upstream-Status: Submitted (http://lists.gnu.org/archive/html/bug-readline/2014-05/msg00008.html)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From e48656811550774892fd4e0f4b3c7d418422da52 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 27 May 2014 22:32:31 +0100
-Subject: [PATCH] config.h.in: fix names of STRUCT_DIRENT_D symbols
-
----
- config.h.in |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/config.h.in b/config.h.in
-index a67e43e..a42acc5 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -244,9 +244,9 @@
- 
- #undef HAVE_GETPW_DECLS
- 
--#undef STRUCT_DIRENT_HAS_D_INO
-+#undef HAVE_STRUCT_DIRENT_D_INO
- 
--#undef STRUCT_DIRENT_HAS_D_FILENO
-+#undef HAVE_STRUCT_DIRENT_D_FILENO
- 
- #undef HAVE_BSD_SIGNALS
- 
--- 
-1.7.10.4
-
-- 
2.1.4


