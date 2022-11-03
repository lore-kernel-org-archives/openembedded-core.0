Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAAEC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:33:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.15933.1667453588695107964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mS6C9pnL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453587; i=@fujitsu.com;
	bh=LhrYVTYx6d4nGg0gyMrsh/RhACbKl+ra+8r13d4jawc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mS6C9pnLHJcjPlyIXsM0fTgCEtDdybGuP9QnsMY5eP8N9QS0fpjzKHMY0n342N2+d
	 7vICxWjfiX5jQCmHNjzBK+fV7FiAW658ynMwCj8AgImGsusD2aHtaZhGzim2/Hc6nW
	 CEvYiVpsPtU2ZkSnUzs85NCw5CYUXFMXj8G0ZuFcttVG2tFrWTcvZiMV9cKmWcLBJ6
	 rrT+/XfYIr8kj/cviusXjrYxl88qsu+HFC+2U7w99qg2XHgnRrAfpXuvUlpzfI6IcE
	 2u9NWjQDWQ4uXHw9A2K1UzkfR/32HVbQjSsf7v0wDbbEc6KH4IMG0Bvapr2rOgcrYv
	 FbQMKGaGt9+bA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqDspKDn
  Z4PUTFYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP7151MBbt4K96+E2xgfM7dxcjFISTwmFFi
  5d1bTF2MnEDONSaJrt3REIndjBKtP5cygiTYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAQuLb9F5mEJsFKN5/ehPYTF4BJ4nNTQfAbAkBBYkpD9+D1XAKOEt8uriABWKvk8TXNZ
  uh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjX0EIvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzBwU4pZHuxg3LHsj94hRkkOJiVR3is7k5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfBqB
  SYnCwkWpaanVqRl5gCjCCYtwcGjJMJ73Q8ozVtckJhbnJkOkTrFaMwx82vbAWaOzv1dB5iFWP
  Ly81KlxHkjQSYJgJRmlObBDYJF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxbQRbyZOa
  VwO17BXQKE9Ap26qTQE4pSURISTUwxexZ/3Z/8/bu8H2/6udsY3+qlOLtbxkyxUjj9JfDVbvX
  HUuRlfEK/ai2WnS66gMOeaEmpifH/wgZPV6crz5pyqHTDzxXBhTxdkw/1VdqWfpl5wMOiV0sJ
  7fGqrp8myh0eV/J764vodv/H1/G//Dj8cW8huZ7Fi+TXKovZ35Af1/Ht/J7UmfeHXBN2vrBdH
  L/y/CJL5+7zdiduiY84NtVLV6Tr0/1Cnv/yT3c9//Na9GP9+3lMp5NdV6/Z0rXh/7Xp9z/X+t
  72uzveTVvup2mXeO31SeLz93/OuF7xPUSN58K/8bdGxQfSPKEZW7PVYq7zxkRnNWusC/0nbSN
  +t+zaXtkHNcL2RusPX0sMCHqyl4lluKMREMt5qLiRABs9PHuaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-28.tower-585.messagelabs.com!1667453586!2650!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11311 invoked from network); 3 Nov 2022 05:33:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-28.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:33:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3AA5F10019B
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2EEAD100199
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:33:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] orc: upgrade 0.4.32 -> 0.4.33
Date: Thu, 3 Nov 2022 13:32:50 +0800
Message-ID: <1667453571-28233-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
References: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172608

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  - Add support for aarch64 (64-bit ARM) architecture (not yet enabled on Windows though)
  - aarch32: Implement loadupdb instruction used e.g. for video pixel
    format packing/unpacking/conversions
  - neon: Fix unsigned only implementation of loadoffb, loadoffw and loadoffl
  - neon: Fix testsuite not passing on arm CPUs
  - orccodemem: Fix use-after-free in error paths
  - orccpu-powerpc: Fix build with kernel < 4.11
  - Add support for macOS Hardened Runtime
  - Enable only SSE and MMX backends for Windows
  - Fix ORC_RESTRICT definition for MSVC
  - pkgconfig: add -DORC_STATIC_COMPILATION flag to .pc file for static-only builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.33.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtools/orc/orc_0.4.33.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.32.bb
rename to meta/recipes-devtools/orc/orc_0.4.33.bb
index 829255f110..873fe3920b 100644
--- a/meta/recipes-devtools/orc/orc_0.4.32.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.33.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
+SRC_URI[sha256sum] = "844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.25.1


