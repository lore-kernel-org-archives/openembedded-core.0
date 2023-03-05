Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C181CC6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:08:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5258.1678003683381796907
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jnWCrA4W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003681; i=@fujitsu.com;
	bh=dXLSXsdYF8LyESZiLBrFJn1HTO3O9G6s/bxMR1AWHoI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jnWCrA4W9fb1+IKUknQ3jlEG/4dzeXhLoEzNO9vp1bnGMWPbbGI+nRjHAUhYvNUN1
	 LjTJ+LPQerpCOaqxDI2IJoFtdl1LxlUuoF4uPGnhEYJgqbALkqoHPtPgciqq4r3HHm
	 NJzIR/iDOAQ5ulO60QKKhTupBNy5kvRX75Rd1j+10RbNyUH4GkRbD9O7fQ/56VUdaW
	 yUEuGR1zJnx6MnE9UAfprD3/7WopoqV1K4+H3JaI3///6ga5E260hnk9I6nSFLHRYO
	 2uRHlRaroL5eA/PTtfgMHK59I/I/1cz+zn52Cw/xAe0Iyqcp6T80YYD1aQ7amqNXzE
	 ONJuDHUWohijg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfeBL0u
  KwawH6hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bXb49YCnp4Kh7uOcPcwHiYq4uRi0NI4AGj
  xL5li1ghnMtMErO7lzNDOHsYJR7838bUxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAqYSM/snsoDYLEDxqbcXgbXyCjhJfOiaxQhiSwgoSEx5+J4ZxOYUcJZ4+nIKWK8QUM
  2WGxuZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpGuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWlwBlEsuL9VKLi/WKK3OTc1L0
  8lJLNjECQzelmIV5B+Phnr96hxglOZiURHkDfzGnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgf
  erGkiIkWJSanlqRlpkDjCOYtAQHj5II70NPoDRvcUFibnFmOkTqFKOilDjvMh+ghABIIqM0D6
  4NFruXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzGgATgRBPZl4J3PRXQIuZgBZrnGYAWVy
  SiJCSamBq4mPM8dwc9F4l4MveiLrCfyYM0n2LZI/+m1IctNR/2k221J0yijPm7XSZd/9ploLp
  VUXrdOEF8941XD7+WUc1ekPo8maN93FK99+bWWX0/f2RcSVo39N46/U58YuXXfq2/ePjxUrLO
  11mnS4z99xUl/5QNVNje/KebXMfKulcTrT+6HJOsuLVP5YPO7b0Ckjn3zVpS3x8ztjBqL75w6
  do1WNXNHTnsBq/XDJF9mCjnZVfAvO51R0a+7p047qrppx75yxaaa1acqGu0EaBdefT0wG2Fme
  n8/3XLVNN9a7ynt7HfP0uU+FKy8Q0nRQjjWMpT8+onLrqO39yCfvnPU5ZV5U4Th62LLd+dqxG
  Z6sSS3FGoqEWc1FxIgDKkLQ2WAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1678003680!188840!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27100 invoked from network); 5 Mar 2023 08:08:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:08:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 451BE150
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:08:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3916073
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:08:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:07:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 6.1 -> 6.2
Date: Sun, 5 Mar 2023 16:07:44 +0800
Message-ID: <1678003665-30591-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003665-30591-1-git-send-email-wangmy@fujitsu.com>
References: <1678003665-30591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178039

From: Wang Mingyu <wangmy@fujitsu.com>

* Improvements
  * Implemented collision resolution for overlapping ioctl commands
    from tty and snd subsystems.
  * Implemented decoding of IFLA_BRPORT_MAB and IFLA_DEVLINK_PORT
    netlink attributes.
  * Updated lists of ALG_*, BPF_*, IFLA_*, KEY_*, KVM_*, LANDLOCK_*,
    MEMBARRIER_*, NFT_*, NTF_*, and V4L2_* constants.
  * Updated lists of ioctl commands from Linux 6.2.

* Bug fixes
  * Fixed build on alpha architecture.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/strace/{strace_6.1.bb => strace_6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_6.1.bb => strace_6.2.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_6.1.bb b/meta/recipes-devtools/strace/strace_6.2.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.1.bb
rename to meta/recipes-devtools/strace/strace_6.2.bb
index ec5c10c80d..dc01b57d80 100644
--- a/meta/recipes-devtools/strace/strace_6.1.bb
+++ b/meta/recipes-devtools/strace/strace_6.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "2579e9cec37dbb786f6ea0bebd15f40dd561ef2bde2a2a2ecdce5963b01859fd"
+SRC_URI[sha256sum] = "0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8"
 
 inherit autotools ptest
 
-- 
2.34.1


