Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F0D6F7756F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655757; x=1521191757;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=FCbXSLyl2rZYIptPZbdxNouwzeEcj6WL8nVnDt7CeGU=;
	b=xdtlxmb2Jn52hOmihA5L3fdcDNk3QOp4Rp/cTrQx3esN+XmkxeIe5QsO
	8l+1vCt6S7k0tt7AcuP0Hobx66Y1AQ==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1123331323"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2017 02:15:56 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7B7B92C8001;
	Thu, 16 Mar 2017 02:15:51 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:38 +0200
Message-Id: <edd3c7b2c6ebadb01799c0fc164bc24c10cbedc6.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/11] gstreamer1.0-vaapi: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:55 -0000

This patch has seemingly never been applied in the recipe (even when
it lived in meta-intel). I don't think we should have unused patches
in the repo: If the patch is useful it could be reintroduced so that
the binaries are packaged into a separate package.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gstreamer1.0-vaapi/install-tests.patch         | 43 ----------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
deleted file mode 100644
index d7def3a..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2791dfde0de0abe8100fa833dfe1a9c2e74c2629 Mon Sep 17 00:00:00 2001
-From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
-Date: Thu, 21 Jan 2016 16:25:44 -0800
-Subject: [PATCH] Install tests
-
-This patch is updated for 0.6.1
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
----
- tests/Makefile.am | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 3637d92..7cc6a97 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = \
-+bin_PROGRAMS = \
- 	simple-decoder			\
- 	test-decode			\
- 	test-display			\
-@@ -9,13 +9,13 @@ noinst_PROGRAMS = \
- 	$(NULL)
- 
- if USE_ENCODERS
--noinst_PROGRAMS += \
-+bin_PROGRAMS += \
- 	simple-encoder			\
- 	$(NULL)
- endif
- 
- if USE_GLX
--noinst_PROGRAMS += \
-+bin_PROGRAMS += \
- 	test-textures			\
- 	$(NULL)
- endif
--- 
-1.9.1
-
-- 
2.1.4


