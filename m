Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0570CC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:19:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.1711.1668395958641630624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cUKbo1GM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668395956; i=@fujitsu.com;
	bh=gzuE48xvil8YXeTqAnVj4eIwAT2qtMqsLlA1RmsdR8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cUKbo1GMv10yJugGNcLZ1oGi3aAEngwkWLpQfbplXtZyXQ6z8+lIye8RPYf+VsYac
	 HgH1hARZyzgWYoM5GLhaSf7hwi1b/nRZhLJIFuDqTgPjCKt2kZiq3zTzMZ3SBa9VI4
	 OabuPskO35MT3h6xgNOaOP8aROs/kUEj7CCJOmo+nZCUhKJOUDmegY5RzgbL0bAu9z
	 eXNJ0e+VCJW7Ci4qVpBQP562AYny7xsbVShsTV/n+W9jhWgsbOrD5SSS6ESKCiAcBt
	 nrl3wCjzV1uaidf4jIkZSpEUn/pmL+8Q8hRWcEFybUwkMzB7Oep2JXsmkaPlQW+JUW
	 iCfDAx0BoO3yQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWXfz5sJ
  kg+537BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bMjlamgiXcFTfWazUw/uHsYuTiEBJ4wChx
  oPsgG4RziUni1+6rTBDOHkaJ9xu3s3YxcnKwCUhJ3Lj/H6iKg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICdxJ0bf5lBbBYBVYmmhfvB4rwCThLLuuaxgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNC9OLSpLLdI1NNFLKsp
  MzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxpTi9JgdjL+X
  /dE7xCjJwaQkysu/vjBZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSv0AagnGBRanpqRVpmDjAyY
  NISHDxKIrylm4DSvMUFibnFmekQqVOMuhzLll/byyzEkpeflyolzrsWpEgApCijNA9uBCxKLz
  HKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5jXbCDSFJzOvBG7TK6AjmICO+B6ZB3JESSJCSqq
  BaU5X0hLP2RmnZvx8Hr9MW8VHR5yfx2zd8wdLuPgSr0sFyywz+y36udNm794+lZgSmWMnMp5V
  iomzXj2xb6rGc2mlZ3e4dk7qzFSO75R0cvK6F9XqLVHL3v+2Kf8uc/MBqc59j38v7d900knwl
  2f4hBW5ixjWXvps79vyOPDDZK3gs1Lnrtcf3Pf4Z2py3JGSU1de3l3AnrX8x1NN//8u/te5+F
  s9jY4vVMhXvSH/MXyCTIrxo7qDff/+2W9+dkCnTPVY2O19kupKlmqqH/MXsCuESy7Zb130xdn
  ykvHj2Xv8Gg8zb/y+W9Bg0mL9uasls0q+S3y6Oim78L94JH98xtEAn+xUkeMr37zYdGy/tBJL
  cUaioRZzUXEiAPtEm6NNAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1668395954!748141!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8800 invoked from network); 14 Nov 2022 03:19:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:19:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A108A142
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9468173
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:19:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH] babeltrace: upgrade 1.5.8 -> 1.5.11
Date: Mon, 14 Nov 2022 11:18:54 +0800
Message-ID: <1668395934-23941-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 03:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173218

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix: distutils removed in python 3.12
* Fix: use-after-free with popt 1.19
* configure.ac: Basic fixes for autoconf 2.70
* Add gerrit config for stable-1.5
* port: disable debug-info by default on FreeBSD
* port: add missing includes for FreeBSD compat
* bindings: try importing collections.abc first for forward compatibility
* man: fix typo in babeltrace.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 19601e7d1b..8e2fe4164d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
-SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
+SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>1(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


