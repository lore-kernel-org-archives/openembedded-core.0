Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59642C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:28:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8781.1700036914387156275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139716270"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139716270"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:28:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3ECCDC145
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:28:29 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD0A3BF3C7
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:28:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id AEA1787FE6;
	Wed, 15 Nov 2023 17:28:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libuv: upgrade 1.46.0 -> 1.47.0
Date: Wed, 15 Nov 2023 16:27:13 +0800
Message-Id: <1700036833-1329-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27998.006
X-TMASE-Result: 10--1.907100-10.000000
X-TMASE-MatchedRID: zKuKCvN3HS6jz0nOeth/yUIIxwDaU5mra9qiaDSLgo14YeSlHZYFolWf
	r88tuxeLGSD9d3tfcVpAO+ZCMzaRsaiOHwlYzcGcWTWEh5N2a9EL//VMxXlyE+umZjiPfDR2Gxq
	fjjQHhtxJiDbchPhpMQP9EFwtavWCOakv2ZcTX6xBCylNHaZ/0Eld5Rsl9tmXACF5TKaad1+gfL
	RsBKsoGgnmxFlt/HYCHcw13aZ+BQ3eG4FwcWqASxvIDANBrnUNZ/pzkZFXmlS8B7vl7G5M0ftN2
	vjEPERNwn76N1IBRSRcgdP83ktOpwvDmMxdQUEu0wmR34xRQc8RNp7xD+4vUWWKhd+if2/GYvTq
	WIgbnZo45PBNB8uybZt/bv5fbH0yBcYknfrn02Op3Btb1bH20BdoyFlJ5UUMuzdiHYg4JjMyeAT
	R+6KxgGkmhKJCeiWETDW61Lsl8qM+5ueoPZcvCPLeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixttb2e7
	N2CFQyOmQanXOhdiw8kMeEPbtdepcLewwAa76fdXu122+iJtpOdKnCeVjjIZsoi2XrUn/Jn6KdM
	rRsL14qtq5d3cxkNfAxRSAc0OENRqpZoU2fpFIBe/ijTJuO0wC8cWYgcIfhGWqDE7riwdMvZqsQ
	GasfcMiPDPe2LjlL1KNroq3HvBPlkW8kuGbEojd6W3X6lOJQY7LTF3q8GHtLv5Eyr/YIrqsDhzt
	RXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* test: fix license blurb
* linux: fix harmless warn_unused_result warning
* darwin: fix build warnings
* linux: don't use io_uring on pre-5.10.186 kernels
* fs: fix WTF-8 decoding issue
* test: enable disabled tcp_connect6_error_fault
* test: enable disabled fs_link
* test: enable disabled spawn_same_stdout_stderr
* linux: handle UNAME26 personality
* build: move cmake_minimum_required version to 3.9
* unix: set ipv6 scope id for link-local addresses
* unix: match kqueue and epoll code
* win,spawn: allow `%PATH%` to be unset
* doc: switch to Furo, a more modern Sphinx theme
* darwin: make TCP_KEEPINTVL and TCP_KEEPCNT available
* win,fs: avoid winapi macro redefinition
* linux: add missing riscv syscall numbers
* doc: fix broken "Shared library" Wikipedia link
* unix: get mainline kernel version in Ubuntu
* unix: get mainline kernel version in Debian
* build: fix qemu install in CI-unix workflow
* unix: disable io_uring close on selected kernels
* test: skip tests when ipv6 is not available
* ibmi: implement ifaddrs, getifaddrs, freeifaddrs
* unix: reset signal counters after fork
* win,process: avoid assert after spawning Store app
* unix: remove pread/preadv conditionals
* unix: remove pwrite/pwritev conditionals
* darwin: remove workaround for data corruption bug
* src: default to stream=stderr in handle printer
* test: switch to new-style ASSERT_EQ macros
* zos: correctly get cpu model in uv_cpu_info
* test: fix get_passwd2 on IBM i
* unix: don't malloc on sync uv_fs_read
* freebsd: get fs event path with fcntl
* test: switch from ASSERT_* to ASSERT_PTR_*
* darwin: workaround apple pthread_cond_wait bug
* doc: uv_close should be called after exit callback
* test: 192.0.2.0/24 is the actual -TEST-NET-1
* unix: add back preadv/pwritev fallback
* unix: rename variable for consistency
* unix: merge read/write code into single functions
* doc: filename arg to uv_fs_event_cb can be NULL
* build,win: we need to link against shell32.lib
* unix: no preadv/pwritev workaround if not needed
* build: add CI for Windows ARM64
* linux: disable io_uring on 32 bits arm systems
* build: run sanitizers on macos ci
* misc: export WTF8 conversion utilities
* build: fix libuv.a file name for cmake
* build: add windows ubsan and clang ci
* win: improve accuracy of ProductName between arch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libuv/{libuv_1.46.0.bb => libuv_1.47.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.46.0.bb => libuv_1.47.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.46.0.bb b/meta/recipes-connectivity/libuv/libuv_1.47.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.46.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.47.0.bb
index c9aa25c518..50ad6ba5eb 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.46.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.47.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "f0bb7e40f0508bedf6fad33769b3f87bb8aedfa6"
+SRCREV = "be6b81a352d17513c95be153afcb3148f1a451cd"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


