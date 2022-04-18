Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75627C64EB4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.38706.1650283953716589409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DF6od/oX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283952; i=@fujitsu.com;
	bh=Kly6Snl7wwZaK6VaHF4Wol4xVcTqMQ6CqudI4PvQtjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=DF6od/oXGraW/z7W3Fr4mglG3wKp3Jj8sSSOLOVHrOWzvsDum7H//UZNH45Cyeju5
	 hBmKDSGSVVdtbKITEJrXaudJA2Ji/WIR0GuRDsunFIYEuati+cirFNtVLCqbm3bNOg
	 l8NYPBihPLH8jluejYQcR6DqMxNIMaKh8LWQkjneFSYlO/p0O2Al901pNjaMiYHhev
	 ZJv2re4Mdr6LNnqe26FNH75y2cdWvJoSOwDCgZy+gfFHA0IYY+mvV7EZTret0jlTu8
	 EBzmqCu+yMgcM6VXUbADPWharrde6o+t/1A0BIE4jzSQySE9XsU6Aw+WX9Q88aXpw0
	 DYy/sTZ/Im99g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxRXd9aGy
  SwdmlShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8amtavZC+6JVkz7foS5gXG6cBcjJ4eQwCwm
  idnNVhD2HkaJ52sDQWw2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhawlXj18wgbi
  M0ioCrxp+8+K4jNK+Ak8e//XjBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy80sEH
  aFxKxZbUwTGHlnIWmZhaRlASPTKkbbpKLM9IyS3MTMHF1DAwNdQ0NTXTNLXXMTvcQq3US91FL
  d5NS8kqJEoKxeYnmxXmpxsV5xZW5yTopeXmrJJkZgkKUUu3rtYDzS91PvEKMkB5OSKO9/39gk
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK8LQFAOcGi1PTUirTMHGDAw6QlOHiURHg5AoHSvMUFi
  bnFmekQqVOMxhxXr1zZy8xxA0QKseTl56VKifM+CQYqFQApzSjNgxsEi8RLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR5RUOApvBk5pXA7XsFdAoT0Cnb50eCnFKSiJCSamDqvpBRyfTBrvN
  zuJNHx8lQg2McOyIUyn4s/Jfl/0S0LKZz37V5O2zCbnkYttWl1YR2elhxtnFwvt2e2P1gY8iZ
  6atdntcKXaipPbHwLMdMmfIrd550Xn8i0qF98GCb437+zTw3JK+8M2ww0ttn9O4eW8lp3zs3Z
  iuafzmbd9vtdLv9mi2z709h1HvDllZ+hnuDTVPY9nlr2OsmxT17/WJT661D96f6lYkJ6RndUj
  LbOb/fU++VRgbn7G9P9rOc+f34VHmJSmR96vtk/lzWc15xnN01XA0H7/0NTPtmwrm7UGT+OeM
  Vv/j3BhvwhgrKWN09xN42OS5Tfwtv591b/tsEpRPC9wiZmXVOtix5bKzEUpyRaKjFXFScCADg
  Ynf2PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-532.messagelabs.com!1650283951!200728!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24367 invoked from network); 18 Apr 2022 12:12:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-23.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:12:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICCVgn031116
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:31 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:12:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libaio: upgrade 0.3.112 -> 0.3.113
Date: Mon, 18 Apr 2022 20:12:21 +0800
Message-ID: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164590

refresh 00_arches.patch for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/libaio/libaio/00_arches.patch  | 12 ++++++------
 .../libaio/{libaio_0.3.112.bb => libaio_0.3.113.bb}  |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/libaio/{libaio_0.3.112.bb => libaio_0.3.113.bb} (92%)

diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index bec189f87c..18c8c546c1 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -1,4 +1,4 @@
-From ceba1e03e5b57cdae0b3b2d2c9afebc085c986d8 Mon Sep 17 00:00:00 2001
+From 546f2708ffa1aa44018be65172013289cf896710 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Fri, 27 Aug 2010 10:15:31 +0800
 Subject: [PATCH] libaio: add new recipe
@@ -8,9 +8,9 @@ Upstream-Status: Inappropriate [embedded specific]
 from openembedded, added by Qing He <qing.he@intel.com>
 
 ---
- src/syscall-m68k.h   |  78 ++++++++++++++++++
- src/syscall-mips.h   | 223 +++++++++++++++++++++++++++++++++++++++++++++++++++
- src/syscall-parisc.h | 146 +++++++++++++++++++++++++++++++++
+ src/syscall-m68k.h   |  78 +++++++++++++++
+ src/syscall-mips.h   | 223 +++++++++++++++++++++++++++++++++++++++++++
+ src/syscall-parisc.h | 146 ++++++++++++++++++++++++++++
  src/syscall.h        |   6 ++
  4 files changed, 453 insertions(+)
  create mode 100644 src/syscall-m68k.h
@@ -483,12 +483,12 @@ index 0000000..ff61746
 +}
 +
 diff --git a/src/syscall.h b/src/syscall.h
-index 9b9e9c1..9ecd3b4 100644
+index d2a117b..8cf8470 100644
 --- a/src/syscall.h
 +++ b/src/syscall.h
 @@ -29,6 +29,12 @@
  #include "syscall-sparc.h"
- #elif defined(__aarch64__) || defined(__riscv)
+ #elif defined(__aarch64__) || defined(__loongarch__) || defined(__riscv)
  #include "syscall-generic.h"
 +#elif defined(__m68k__)
 +#include "syscall-m68k.h"
diff --git a/meta/recipes-extended/libaio/libaio_0.3.112.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
similarity index 92%
rename from meta/recipes-extended/libaio/libaio_0.3.112.bb
rename to meta/recipes-extended/libaio/libaio_0.3.113.bb
index 859ba65c9f..87ab22ed17 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.112.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
            "
-SRCREV = "d025927efa75a0d1b46ca3a5ef331caa2f46ee0e"
+SRCREV = "1b18bfafc6a2f7b9fa2c6be77a95afed8b7be448"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
-- 
2.25.1


