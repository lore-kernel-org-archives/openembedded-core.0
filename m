Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD336C4167B
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 01:30:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13874.1702431033997413954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 17:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UwORFJiY;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702431033; x=1733967033;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kEXbKLKXtljBVWd7ZvY/Bdgxc/s8KRXnsJU/3iT6yKY=;
  b=UwORFJiYknBxkVGOG2qYYgZa/8Xilma0LnCuns4iYIArez840pIGIdA4
   id2725aGrshHHpRGtPtRKhiNfylnwXgBDz4S5VoOLeTY4tNLcuPsaBmep
   0/9YMOk5Cvaiji09Z/1h2kpt5L1aerIieksOJ8FqacelDMQgTOf7W/vTV
   Om+O3H3Wlpmd4FwQagm8YxHYX/fjzByN3q3fKXQRF+T+9NFvlHtaFUs/a
   cu91sOpeqVkKflB1o9Cu4ETDJPq/5nNt92HKb5i1tq0i1BEgybQ9FeEsi
   N9lnDdQ+ofd06SG2UJsE333IQaLOVhIzarVkudS4OadO8qUuAw+nrR7+M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394649506"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="394649506"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897142576"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897142576"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 17:30:32 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] perlcross: update to 1.5.2
Date: Wed, 13 Dec 2023 09:10:53 +0800
Message-Id: <20231213011054.3411751-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 01:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192256

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


