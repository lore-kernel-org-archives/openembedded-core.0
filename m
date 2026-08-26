Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A4BC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:30:25 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6157.1787722219254549806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=MPa7X1mY;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4964; q=dns/txt;
  s=iport01; t=1787722219; x=1788931819;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vSzqs+V2QD8FKh5nam182P09IG5/KZG/2OfmYjPRwS0=;
  b=MPa7X1mY02y2fbMlp9j29dO9Zw83Z0APzN5Lwxlw98sXsABZ7EJk+iYe
   Q+ocq8yCpjnyTGLn3ls3L+wO3MaQa2NWr7z69hwZfUVKhHLycunHpNSpo
   RJIsCqCV566K07f+KUKwVzTd9TnKmNUGFopIkQuZxew0ZHiKcvo5So3UB
   ow1XamGlLs5/sN2lNCwW1nW2FVim1tTzp7YgGzV11bHaGJ8fHpldpzOkN
   eRmVpXBGnQdy4CBMQNoGJLjcKO5kU+iSecFfpFgzyLSkPvGN/Oep5ideF
   TH88QYfcR7jeg7ccqpWnTR4W+L/pLC2cKHaoqLHNyM76h5rocMWu4kBFC
   g==;
X-CSE-ConnectionGUID: 9rZAvLiNQbq8BfnVbhPv7w==
X-CSE-MsgGUID: Wpa8zZfKQtqgUeV89AU5bA==
X-IPAS-Result: =?us-ascii?q?A0BFAgBDeI5q/5QQJK1aglmCV3ReQ0kDlkeeHhSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBY1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgE1AUYsAwECWiMhG4JnAYJ0AxG+VoIsgQGEfdswAQsUAQWBM?=
 =?us-ascii?q?4U/iCJdGYR8JxsbgXKBFYNpgQUBgVsCgSOHAgSCInoSgVoegkyPHkiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEECMZNnyBCV6BKylgA?=
 =?us-ascii?q?RIXgQmCBwKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4HjmsfgkgBgQ4BBySBB?=
 =?us-ascii?q?SoWQAkeEQwFpVShDwoog3aMIpU6GjOFW6URmQiLN4JTlgNNK4Q+gWg8IoE3c?=
 =?us-ascii?q?BWDIglKGQ+OOINrzDknMgsDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:/FBARaONVYC7C4rvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUoigjwCn
 DZKWGqDa/iMYGD3Ktt0PYji/R9Sv8TTydVmT3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66R0PmgoGYw+w+xuUUtA8
 8ISKAgTMQ/W0opawJrjIgVtrs0nKM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY/BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FwriOm3aIGKJrRmQ+1qhk/It
 FDI3F3lGx4nOeLPmBO4r3iF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:6RYGjKhuNykTyu0cm5WwY9umw3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3A8CWrVWqUXzQGXZF1nIt8WnbmUZE/QFTD6Hb2GkW?=
 =?us-ascii?q?hWUxnToOfSWeOp7wxxg=3D=3D?=
X-Talos-MUID: 9a23:TyrP4wU486JMrmnq/AD0jWFwBslL2ri3B30Ar8VXkvTZPwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820920374"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:30:18 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 4D6E7180003A1;
	Wed, 26 Aug 2026 05:30:18 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id D9BAACC12A6; Tue, 25 Aug 2026 22:30:17 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] vim: Fix CVE-2026-28417 hostname regression
Date: Tue, 25 Aug 2026 22:30:17 -0700
Message-Id: <20260826053017.51184-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244287

From: Devansh Patel <devanshp@cisco.com>

The older Vim patch 9.2.0073 fixed CVE-2026-28417 by tightening netrw
hostname validation. That CVE fix requires follow-up regression patches
because it rejects valid hostnames containing optional ports or
underscores.

Vim 9.2.0340 already contains that CVE fix and patch 9.2.0089, which
corrects optional-port handling. It still needs patch 9.2.0553 to accept
underscores, so backport that commit and retain its _gateway regression
test.

The netrw history hunk is adapted to preserve Wrynose's existing
multi-line history and append the upstream 2026 May 28 entry. The
src/version.c hunk is omitted because this backport does not change the
recipe version or Vim's upstream patch-number table.

[1] https://github.com/vim/vim/commit/79348dbbc09332130f4c86045e1541d68514fcc1
[2] https://github.com/vim/vim/commit/a6198523fb28a50d96945458792cdb4787d3cdda
[3] https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11
[4] https://github.com/vim/vim/security/advisories/GHSA-m3xh-9434-g336

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../files/CVE-2026-28417-regression_p1.patch  | 64 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
new file mode 100644
index 0000000000..e6b81cc0ae
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-28417-regression_p1.patch
@@ -0,0 +1,64 @@
+From 2a49c9624cdd552ec975ee8b4f1853a0e4c2a78e Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Thu, 28 May 2026 20:53:53 +0000
+Subject: [PATCH] patch 9.2.0553: runtime(netrw): netrw rejects hostnames
+ containing _
+
+Problem:  runtime(netrw): netrw rejects hostnames containing _
+          (lilydjwg)
+Solution: Relax the restriction and allow the underscore
+
+fixes: #20344
+
+CVE: CVE-2026-28417
+Upstream-Status: Backport [https://github.com/vim/vim/commit/93d177cd2b69bac58fc51a5a514d7bc71e264b11]
+
+Backport Changes:
+- Preserved Wrynose's multi-line netrw change history and appended the
+  upstream 2026 May 28 change instead of replacing it with a single date.
+- Omitted src/version.c because this backport does not change the recipe's
+  Vim version or its upstream patch-number table.
+
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+(cherry picked from commit 93d177cd2b69bac58fc51a5a514d7bc71e264b11)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ runtime/pack/dist/opt/netrw/autoload/netrw.vim | 5 +++--
+ src/testdir/test_plugin_netrw.vim              | 1 +
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/runtime/pack/dist/opt/netrw/autoload/netrw.vim b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+index a04120d5f..e64274e70 100644
+--- a/runtime/pack/dist/opt/netrw/autoload/netrw.vim
++++ b/runtime/pack/dist/opt/netrw/autoload/netrw.vim
+@@ -24,6 +24,7 @@
+ " 2026 Mar 01 by Vim Project include portnumber in hostname checking #19533
+ " 2026 Apr 01 by Vim Project use fnameescape() with netrw#FileUrlEdit()
+ " 2026 Apr 05 by Vim Project Fix netrw#RFC2396() #19913
++" 2026 May 28 by Vim Project allow underscores in hostname checking #20344
+ " Copyright:  Copyright (C) 2016 Charles E. Campbell {{{1
+ "             Permission is hereby granted to use and distribute this code,
+ "             with or without modifications, provided that this copyright
+@@ -2603,8 +2604,8 @@ function s:NetrwValidateHostname(hostname)
+   " Username:
+   let user_pat = '\%([a-zA-Z0-9._-]\+@\)\?'
+   " Hostname: 1-64 chars, alphanumeric/dots/hyphens.
+-  " No underscores. No leading/trailing dots/hyphens.
+-  let host_pat = '[a-zA-Z0-9]\%([-a-zA-Z0-9.]\{0,62}[a-zA-Z0-9]\)\?'
++  " No leading/trailing dots/hyphens.
++  let host_pat = '[a-zA-Z0-9_]\%([-a-zA-Z0-9._]\{0,62}[a-zA-Z0-9_]\)\?'
+   " Port: 16 bit unsigned integer
+   let port_pat = '\%(:\d\{1,5\}\)\?$'
+ 
+diff --git a/src/testdir/test_plugin_netrw.vim b/src/testdir/test_plugin_netrw.vim
+index cfce82f68..00dc4e1cb 100644
+--- a/src/testdir/test_plugin_netrw.vim
++++ b/src/testdir/test_plugin_netrw.vim
+@@ -574,6 +574,7 @@ endfunc
+ func Test_netrw_hostname()
+   let valid_hostnames = [
+   \   'localhost',
++  \   '_gateway',
+   \   '127.0.0.1',
+   \   '::1',
+   \   '0:0:0:0:0:0:0:1',
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 20a5f7a054..ce59e9b539 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://CVE-2026-47167.patch \
            file://CVE-2026-55892.patch \
            file://CVE-2026-57452.patch \
+           file://CVE-2026-28417-regression_p1.patch \
            "
 
 PV .= ".0340"
-- 
2.35.6

