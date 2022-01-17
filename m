Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C91C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 14:31:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.11771.1642429917245802942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 06:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xVboIf3k;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642429915; i=@fujitsu.com;
	bh=hkdtHASP8PCWB+sx10INQwNHxDnOJT155FrHAKHf7VI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xVboIf3kmi1+PBgUJS8ACr+Vov3G0tOOwNinUmYYlsCHJBLLWvSl2ViUeQL4YYwg9
	 0FYxc0XDDwG+uTM7anM8Mj/hy6AcJ4HPosJ5iMiInB/UzZix6mCS6pwek2ML1kdJKE
	 SjR5wEZ3CdOge0yVWzS3zPsYrKzWK7AvDlHIwEMJWkBVu2fatoAg3hVQz0U5AuNLOA
	 /RLGFKSMsMFP1H42XVEKQ4MLh7RgqDs+darIB/VXuniEZ3QQ/W120aMu9xsI2KuJVj
	 7PS+IUYQ/ZzgN86PrYCmoiUKSZMNkXRsZfHLSiVHr1n1TbGZPEaJ7v9ZhbGZmg283q
	 jSKuAcFo+9j+A==
Received: from [100.115.37.147] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id F9/AD-28974-BDD75E16;
 Mon, 17 Jan 2022 14:31:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRonu79mm
  iwbPLohZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8axScfYC24IVazcPoe1gXGFQBcjF4eQwAwm
  iSUftzJDOCcYJTbcWc7excjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfveAlQgLmEvsm
  rGbEaSERUBVYs9Fc5Awr4CTxNJZz9hAbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF8wQNYoSsy
  83s0DYFRKzZrUxTWDknYWkZRaSlgWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXWNLXUtjPQSq3Q
  T9VJLdctTi0t0gdzyYr3U4mK94src5JwUvbzUkk2MwABLKVYP2sH4bcVPvUOMkhxMSqK8nGFP
  E4X4kvJTKjMSizPii0pzUosPMcpwcChJ8N6uAcoJFqWmp1akZeYAgx0mLcHBoyTCqw0MeCHe4
  oLE3OLMdIjUKUZFKXHeBpA+AZBERmkeXBsswi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEu
  b9AjKFJzOvBG76K6DFTECLV318BLK4JBEhJdXApLq69JnMq0vrG3/GbfgaorByZdl8jlkXHrf
  yXP1XG30gefcjB6McbpY6S4UZXHP2dJk3Kn1T7dz740z/297HNmJBMqbBr/LSUsVrn6gysac+
  4W6vnfFt05Hza76+X/BGsbTlUnrtX8P1yzcW2jkal/mrl8l8Y1if/cXvIt/9L3N2BpdM1rK8n
  n2Ee+/VTzl5KQ4rjthetjoaOZPv0nTrKQ/nrZs7RVDqReDvudqHz59v/80l8+g1M/vxiIwSFr
  8Fea9+zex19Dh/J8Txn6h0247p21SXMHB/dGbquLd8k5J2SXXB6mnv5/w+Eeo629N06RqtVez
  GQl+6Dt5U2Ph8opnvrmPrT/AuWnbgSRpD0SMlluKMREMt5qLiRABsf+8KKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-548.messagelabs.com!1642429915!1188!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19901 invoked from network); 17 Jan 2022 14:31:55 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-25.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jan 2022 14:31:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20HEVtel023919
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:55 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 14:31:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 5.15 -> 5.16
Date: Mon, 17 Jan 2022 22:31:43 +0800
Message-ID: <1642429904-13928-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 14:31:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160650

License-Update: year updated to 2022.

Changelog:
=========
Improvements
-----------
-Implemented --secontext=mismatch option to find mismatches in SELinux contexts.
-Implemented decoding of futex_waitv syscall introduced in Linux 5.16.
-Implemented decoding of BPF_LINK_GET_NEXT_ID and BPF_LINK_GET_FD_BY_ID bpf
 syscall commands.
-Enhanced decoding of BPF_MAP_CREATE, BPF_PROG_TEST_RUN, and BPF_PROG_LOAD
 bpf syscall commands.
-Enhanced decoding of BTRFS_IOC_FS_INFO ioctl command.
-Updated lists of AUDIT_*, BPF_*, BTRFS_*, DEVCONF_*, FAN_*, ETH_P_*,
 IPV4_DEVCONF_*, KVM_*, NDA_*, SO_*, and V4L2_* constants.
-Updated lists of ioctl commands from Linux 5.16.

Bug fixes
---------
-Fixed build for older Android.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strace/{strace_5.15.bb => strace_5.16.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.15.bb => strace_5.16.bb} (92%)

diff --git a/meta/recipes-devtools/strace/strace_5.15.bb b/meta/recipes-devtools/strace/strace_5.16.bb
similarity index 92%
rename from meta/recipes-devtools/strace/strace_5.15.bb
rename to meta/recipes-devtools/strace/strace_5.16.bb
index 716806d22f..1874ef1017 100644
--- a/meta/recipes-devtools/strace/strace_5.15.bb
+++ b/meta/recipes-devtools/strace/strace_5.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://strace.io"
 DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1+ & GPL-2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=318cfc887fc8723f4e9d4709b55e065b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59a33f0a3e6122d67c0b3befccbdaa6b"
 
 SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc"
+SRC_URI[sha256sum] = "dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285"
 
 inherit autotools ptest
 
-- 
2.25.1


