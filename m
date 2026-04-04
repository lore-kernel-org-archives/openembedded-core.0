Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66388E7E34C
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 15:51:48 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18864.1775317907778945875
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 08:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: +H6zwI5jRlCTib2Vyj1f+w==
X-CSE-MsgGUID: yzLOGKOzS1yvcBiEblWrDQ==
X-IPAS-Result: =?us-ascii?q?A0BdAwA8MtFp/4z/Ja1aglkCglVxXkNJA5ZIgxWIYpImg?=
 =?us-ascii?q?g4BAQEPRA0EAQE/AgSRbgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw1JAQwBhgMBOAEpHSYGAwECTwIJIyEbgmcBgjkBAzYDE?=
 =?us-ascii?q?bRNgg8FAhaBAYNoAkNP13wKGSgNcYFhAQsUAYE4hHgpHUEBgjeFI1sYAYR6J?=
 =?us-ascii?q?xt9gRCBFYNogQWBGkIBAYEnhn0EgiJ6FIFhHoIaBow0CAcfEggBHAYKAkgVE?=
 =?us-ascii?q?gMEAwQEAQILEwkDAwIOAggDAggGGQE/EgQTCgMKCwcFHwoCDBQKKCISKwoDN?=
 =?us-ascii?q?RIPGxUBCAYCAgQEAgQMAgkCAgUHAhEDBAEBCAICLQMBAxkICQgCCwURGAwLB?=
 =?us-ascii?q?zEDEAkDHxcaCAFFCAYWARoHBQYLOBUFDBEBAQJHAgYEAwMDCgcHBAMBBwMDD?=
 =?us-ascii?q?AICEAIEBAISAwMEAxADAQIpAwMHCAMCBwQWChkEBQIBLgMFBwIEAQcBAwMHA?=
 =?us-ascii?q?wIMAgIRBQQGAgEDDAMEAwUFCy0RBxMKBgQHBQICAhQGAhISAwMEBAIBAgICO?=
 =?us-ascii?q?gQOGg4ECAcDBwEYBQIDAgUBAwEHGQIKCAMOAR0CAgQCCQEBCg4CAgYCAgEDC?=
 =?us-ascii?q?BgDBB8EAwMHAgIMCQMEDQISChIbAw4DDQ8CBAMMCjAQBAIHEAIJCAYKGAICA?=
 =?us-ascii?q?gYCAwMDBAkBAgEBAQEBAQECBwMDAwIDBgMPCgMFBwYDBAYBBAQDAwYDAwUFA?=
 =?us-ascii?q?QMDBQUFBwIDBgMGBwcECAMHCwEBAQEBAwICCQEDCAMMCQQDBQMkDwMLCQgHD?=
 =?us-ascii?q?AE8DAcKKAQ2ARQUBwQlGWcHB4tOKII2dBoBK4FDAmcRC5ZGjxKgHXFogz6MH?=
 =?us-ascii?q?o8+hXwaM4VbpRALmHuLNoJThAmSR4RoNoEyPIFHCwczGiOBAYI2CUkZD444g?=
 =?us-ascii?q?2mBf8QJJjILAzABBwIHDgKBc4kxhk+BfQEB?=
IronPort-Data: A9a23:hEicxqm+tB6BeNx5dC9+8Lbo5gzoJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDGyDbP+OMGH3f9wnbIS1oxtU6MPdm4BhTgI5+3w8FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpIs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc44pPRoIDxMz
 /gzFDEHNC6Shbu4g63uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnDkczxDs1LKjaE2+GPUigd21dABNfKKIozaHJ0EzhjwS
 mTu7nbdJT45E86kkCub+Vitq+XLojnXYddHfFG/3rsw6LGJ/UQLAR0fWVqnrPK5i0OWVNdWK
 khS8S0rxYA17EGtQ9z3UhG0rXLBtRkGVvJUEvYm80eK0qfS7gOTC2QIQzIHb8Yp3PLaXhQw3
 VOP2tesDjt1vfjNEjSW96yfqnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:5ESCHaNEiWi+f8BcTvejsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxflZnOjf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkW2F+xJK+qjgzEhu7t2uqEtQcQ==
X-Talos-CUID: 9a23:TV197m++/5FTyEC/yHaVvw00RNI6UyDf9nP7H06yU1h4SuSbCkDFrQ==
X-Talos-MUID: 9a23:Tv6cMgmpDEcV9yjqzq5zdnpzJuNPzIeJGntUgIsNkcipPyhPIRuk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,160,1770595200"; 
   d="scan'208";a="708810986"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Apr 2026 15:51:46 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id C04B0180005BD;
	Sat,  4 Apr 2026 15:51:46 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id 6CCBFCC1288; Sat,  4 Apr 2026 08:51:46 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ashissh7@cisco.com,
	Ashish Sharma <pahaditechie@gmail.com>
Subject: [OE-core][master][PATCH] vim: Fix CVE-2026-33412
Date: Sat,  4 Apr 2026 08:51:28 -0700
Message-Id: <20260404155128.2020863-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21720.cisco.com [10.128.165.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 15:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234614

Pick patch from [1], also referenced by NVD [2].

The upstream fix escapes newline in SHELL_SPECIAL to prevent command

injection via glob() shell expansion.

[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a

[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
---
 .../vim/files/CVE-2026-33412.patch            | 52 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 0000000000..44d7ae6d24
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,52 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+
+Backport Changes:
+- Excluded changes to src/version.c from this backport. The recipe tracks Vim
+  tag v9.2.0110, so upstream patchlevel bookkeeping updates are not needed for
+  the security fix.
+
+Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
+---
+ src/os_unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ #  define SEEK_END 2
+ # endif
+
+-# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+-- 
+2.50.1
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9a5ec9652f..7a3c65b5c2 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".0110"
-- 
2.35.6


