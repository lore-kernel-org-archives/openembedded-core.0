Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B10C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:53:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.25594.1702439628421583079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mieyZc2c;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702439629; x=1733975629;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kEXbKLKXtljBVWd7ZvY/Bdgxc/s8KRXnsJU/3iT6yKY=;
  b=mieyZc2c8m2bx9A/KMRq2xL8DzU/2Su5ZXFBazoutKPS78hrK2nFuoME
   QzL5Jwx+mLaZ+L42RtV8xaYNAICxxjaoXLsD5bNwTl1y3dgKVHgNr4p/+
   iqUIzbyaGB6iyIRxvG11G32g6uKZxhDSPfV3gPUJTgD77mP1zFtCl/Bku
   iT0E/jbQ6oFs9VgIf6STAEdvHmegDa83e7VZBtnh5eTipWg31nLGKBW5/
   JSrF3IJ0QMrxJOIHsUtXN5fprXPJ2LD1HLhBFxjU4CiPXXjIMBPV45MxN
   0QGRnLtW4DFlYa0/p/HXKUKwZAZHhHg3fS2LddcNtImG6l8AOP6YTvjbl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="481109654"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="481109654"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 19:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917523936"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="917523936"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 19:53:49 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 3/6] perlcross: update to 1.5.2
Date: Wed, 13 Dec 2023 11:34:06 +0800
Message-Id: <20231213033409.2101308-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213033409.2101308-1-chee.yang.lee@intel.com>
References: <20231213033409.2101308-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192262

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove upstreamed 0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 ...mt.sh-add-32-bit-integer-format-defi.patch | 28 -------------------
 .../{perlcross_1.5.bb => perlcross_1.5.2.bb}  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.bb => perlcross_1.5.2.bb} (86%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
deleted file mode 100644
index 4de4a5b955..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 920abf3dc39c851a655b719622c76a6f0dc9981d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Sep 2023 19:47:33 +0200
-Subject: [PATCH] cnf/configure_pfmt.sh: add 32 bit integer format definitions
-
-These started to matter in perl 5.38 where they are used to print
-line numbers.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/143]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- cnf/configure_pfmt.sh | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/cnf/configure_pfmt.sh b/cnf/configure_pfmt.sh
-index 8f93da1..7bb4b6f 100644
---- a/cnf/configure_pfmt.sh
-+++ b/cnf/configure_pfmt.sh
-@@ -52,3 +52,9 @@ else
- 	define uvxformat '"lx"'
- 	define uvXUformat '"lX"'
- fi
-+
-+define i32dformat 'PRId32'
-+define u32uformat 'PRIu32'
-+define u32oformat 'PRIo32'
-+define u32xformat 'PRIx32'
-+define u32XUformat 'PRIX32'
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
similarity index 86%
rename from meta/recipes-devtools/perl-cross/perlcross_1.5.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
index 7ca4977b97..b41c182fad 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
@@ -15,11 +15,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "d744a390939e2ebb9a12f6725b4d9c19255a141d90031eff90ea183fdfcbf211"
+SRC_URI[perl-cross.sha256sum] = "584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.37.3


