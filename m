Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1782CC433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 17:31:59 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.18139.1653240717973447423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=R6BXI12a;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93,
 mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653240718; x=1684776718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Fr5b8/Suyn0/937eu2VY6LIojYFKkTWGjlzaJ2X25s=;
  b=R6BXI12a4I6wXMB4PiVQw2C/ebOyusQ7XtgkuPIneZsWMDddvgkA88S4
   e1vkYkgnbfy9W0RNixP3RDn+yQPPX0ecHuWhy4PTFMRYaQsV9QQx1efB2
   ToUfjXe9TAeB5/CrkOeSrSpz8YjD/zTDGNoOnqtwBwOU9KX0HzO660R7v
   jwl1MNQmD5B7K0etO1xXq2tyOFwrIVuL+zfVRaZsd/qx9gYzFlEx4DnvO
   r49ZGOpg9wEWtWhLCA7kf1nBxgX+smgzhApU9mrRHQOw8zs6H9Ykh1EfU
   JU0LufDN6qin60BUAPb1HZET0Mvpa26c0mwq/WujVyHEr6QcoOBaIbcbP
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="270597919"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="270597919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="571693872"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:56 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH 1/4] systemd: Drop
 0001-test-parse-argument-Include-signal.h.patch
Date: Mon, 23 May 2022 01:31:42 +0800
Message-Id: <20220522173145.1015305-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
References: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 17:31:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165981

This patch has already been upstreamed in commit systemd/850f0008bff7
("test-parse-argument: Include signal.h") since v249 stable release.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...test-parse-argument-Include-signal.h.patch | 27 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
deleted file mode 100644
index 898e8af904..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 93c7e482d39cf7765974b3c729d29c1b120a60e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 May 2021 18:26:27 -0700
-Subject: [PATCH] test-parse-argument: Include signal.h
-
-Fixes
-src/test/test-parse-argument.c:49:29: error: use of undeclared identifier 'SIGABRT'
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19718]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/test/test-parse-argument.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/test-parse-argument.c b/src/test/test-parse-argument.c
-index cf3d54288a..15104e5282 100644
---- a/src/test/test-parse-argument.c
-+++ b/src/test/test-parse-argument.c
-@@ -5,6 +5,7 @@
- #include "parse-argument.h"
- #include "stdio-util.h"
- #include "tests.h"
-+#include <signal.h>
- 
- TEST(parse_json_argument) {
-         JsonFormatFlags flags = JSON_FORMAT_PRETTY;
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index c121fb763e..aca140d4d4 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -24,7 +24,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
-           file://0001-test-parse-argument-Include-signal.h.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
-- 
2.34.1


