Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33AFC64EC4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.38233.1650284414515073461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x4CG4naP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284412; i=@fujitsu.com;
	bh=TuoOCKnep61orK0da4iVK1ft9LN1/cIfSuY29tvNY0A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=x4CG4naPNbK7clnOziE+wd/7V/Vg3/+ydHQBptRe/PV/hL7X/7Fgyt3gzV1HRGoN5
	 1neFPRfpuINXaz8itsfspIwHlSkE6Nj+pYGmh4MvZG+/jz9zOFWRV6msToryRCnyU3
	 qUPzoz5XR1FYVWvWoiv0kKBppIEXAXquuPYIsOMqYe/wDVHeRIsXJHGraxXZl/qzxK
	 tXQjQSTyMgUhfcqv95RrYHOMf/DWhHtJl28r/BLFm2LpeXqGfKqmj2nbi/9WaFot7E
	 1rI6nUwf5No36RyFOoRN5uNwhMkALTARzpJBzbjnWVUdAJV6VrQFV6iIrNxoh3cmz+
	 2q2OFgFXwEtkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqFsTHpt
  k8G2ypMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnH2+HrGghu8Fc+7LrA3MN7k7mLk4hASeMwo
  MX3lF3YI5zyTxJvGOUwQzh5GidZX05i7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwF3i1rlGsHIWAVWJJevWs4DYvAJOEtub7oHZEgIKElMevger4RRwlpjY08kIMlIIqK
  a73QeiXFDi5MwnLBDjJSQOvnjBDNGqKDH7cjPUmAqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZOKMtMzSnITM3N0DQ0MdA0NTXWNzXUNzYz0Eqt0E/VSS3XLU4tLdIHc8mK91OJiveLK
  3OScFL281JJNjMAgTilWXbSDcf+qn3qHGCU5mJREef/7xiYJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCdFQKUEyxKTU+tSMvMAUYUTFqCg0dJhLcfJM1bXJCYW5yZDpE6xWjMsenwlb3MHH8//d
  3LLMSSl5+XKiXOWx0GVCoAUppRmgc3CBbplxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/4
  MBZrCk5lXArfvFdApTECnbJ8fCXJKSSJCSqqBSapWyXSz4JoNZdf3i70xaFr6njn07ZzbF2Vn
  FspG8GqEhftfme5dP+fqndyJ1w5wMJ4sPVD3jevZBeYDXUJ9AhuOH6vQ7q/3f7VWJCbSp8Xxn
  MMUHftjGsp32K5uTzGeIsamzy1RcEVf7HdWm07pRY5tYkwTIqysuzP6c6c5aPz88+vH2Scr2V
  vP336Wcrz/B/fnvSfdHV6XLZ43a9rVxqUfVm05/bu4ddX62dYf5MxaUzcn7GgTzl8jYrWs8Wn
  cdN68b4cPHlUWj01t5cpn1+UoCnL/kTvdOvl1t4vmuRBdhaBrU4T0fwRZVnXK6k3ulS2a3cPX
  O4ftwQd+38O+FQ61X7sUXKLS1P40ztqlxFKckWioxVxUnAgAxR7+BG8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-548.messagelabs.com!1650284412!202527!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24860 invoked from network); 18 Apr 2022 12:20:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:20:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02493100196
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:20:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D906B100182
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:20:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:19:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] linux-firmware: upgrade 20220310 -> 20220411
Date: Mon, 18 Apr 2022 20:19:23 +0800
Message-ID: <1650284363-16570-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
References: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164596

License-Update:
    Version of driver files updated
    Added files for some drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{linux-firmware_20220310.bb => linux-firmware_20220411.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
index fa0f906db0..c7d9e1126e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220310.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220411.bb
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=45a9c4a92d152e9495db81e1192f2bdc \
+                    file://WHENCE;md5=4cf67d71a21887c682c3989a4318745e \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -205,7 +205,7 @@ PE = "1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182"
+SRC_URI[sha256sum] = "020b11f6412f4956f5a6f98de7d41867d2b30ea0ce81b1e2d206ec9840363849"
 
 inherit allarch
 
-- 
2.25.1


