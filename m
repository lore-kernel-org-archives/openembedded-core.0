Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F33EC3DA79
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:00:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.10348.1671591595145485224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c2z4qtJp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591593; i=@fujitsu.com;
	bh=Nv4W6axu1dzV0Nu5n+F3jdTstlLJ5qNu/UhykXYCHg4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c2z4qtJplxb97cs0EUEpz5Kh4bFdZVA0LaD9eJRmDbEcnaIErdc0B0xrb1fetGg/W
	 tQVLohn5DdHP0tM/duEZZPsF9pF+VQMO2RdJEmHLwGEPlGfQoXAIVCDNK31pdK2eJY
	 hRzzDeliAliczj9UYzCU77pPb10JL53Eyxq6ppKiHuPq9Ta5ebL8K4H/lLNSdJcGZC
	 wkwAbCwNyclQlAPozDbVtlA3kINUa6O/IaRs5ttlg5TInMhZEg8f7/548ryPEXf1QW
	 feHIPvvWktsQJfHt0+X4Df0FU+olpJ2gJyAB21CaZwCceN4+2jHAnRVPYporbqc0xp
	 /dtdaufIgqDgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWXdF2aJ
  kg1v/+Szu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozVG6YzFpyUqOhveMLUwLhDtIuRi0NI4AGj
  xOrf79i6GDmBnEtMEp8aDCASexgl3u1YyAySYBOQkrhx/z9QEQeHiICexNV/oiBhZgEViRe/e
  9hBbGEBR4nOv3eYQGwWAVWJmxs+sYDYvAJOEoevXmAFsSUEFCSmPHwPNpJTwFni6Lu9UHudJM
  4d/8oEUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itGsOLWoLLVI18hAL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5
  J0UvL7VkEyMwdFOK1S/uYOxc9kfvEKMkB5OSKK8Pw6JkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8pqVAOcGi1PTUirTMHGAcwaQlOHiURHjtSoDSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/N
  p2gFmIJS8/L1VKnDcUZJ4ASENGaR7cOFisX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBs
  DspYnM68EbusroIOYgA6adnMhyEEliQgpqQamMKX9z6S/vtjwJPb4/sMZRooPZd9NmC69Tb4x
  aJrnbGUt226X3+cvrTjwmq84LKj9YWq0b+N3UZPkD8HXgha9Or72R59KzOIoz3jFNU0rz/d/n
  mtfOuHZn84X0zasqAs692Xtcr1nXJsu71Y6f/55X4i/CseeyHKxG6vum84JP7kgp7yoXrooi9
  2rzqPAZd5ey9ybE7Tv/Dz27OUOhl1Blcxf5e4FMC/PqdxW/CDeMZEt1b3siiWnL7Oy6tEtN8O
  5bu251OfHrLH0wowdf/7fLbf8UTLhetgvSdcglhPaNZ/FJdkNwh8fV1fdpvty81P5I6Yv7jdf
  m6L6r08ntfBsbu3UvNUKTDOvWLM0LpTTVmIpzkg01GIuKk4EAOiUcYxwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1671591592!448794!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26036 invoked from network); 21 Dec 2022 02:59:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 02:59:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EE544150
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E1AB873
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:59:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 02:59:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.4 -> 1.20.5
Date: Wed, 21 Dec 2022 10:59:10 +0800
Message-ID: <1671591551-12455-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174892

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
systemclock waiting fixes for certain 32-bit platforms/libcs
alphacombine: robustness improvements for corner case scenarios
avfvideosrc: Report latency when doing screen capture
d3d11videosink: various thread-safety and stability fixes
decklink: fix performance issue when HDMI signal has been lost for a long time
flacparse: Fix handling of headers advertising 32 bits per sample
mpegts: Handle when iconv doesn't support ISO 6937 (e.g. musl libc)
opengl: fix automatic dispmanx detection for rpi4 and fix usage of eglCreate/DestroyImage
opusdec: Various channel-related fixes
textrender: event handling fixes, esp. for GAP event
subparse: Fix non-closed tag handling
videoscale: fix handling of unknown buffer metas
videosink: reverse playback handling fixes
qtmux: Prefill mode fixes, especially for raw audio
multiudpsink: allow binding to IPv6 address
rtspsrc: Fix usage of IPv6 connections in SETUP
rtspsrc: Only EOS on timeout if all streams are timed out/EOS
splitmuxsrc: fix playback stall if there are unlinked pads
v4l2: Fix SIGSEGV on state change during format changes
wavparse robustness fixes
Fix static linking on macOS (opengl, vulkan)
gstreamer-vaapi: fix headless build against mesa >= 22.3.0
GStreamer Editing Services library: Fix build with tools disabled
webrtc example/demo fixes
unit test fixes for aesdec and rtpjitterbuffer
Cerbero: Fix ios cross-compile with cmake on M1; some recipe updates and other build fixes
Binary packages: pkg-config file fixes for various recipes (ffmpeg, taglib, gstreamer)
Binary packages: Enable high bitdepth support for libvpx (VP8/VP9 encoding/decoding)
Binary packages: ship aes plugin
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements
Performance improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
index d0ba2919ee..bb4dba3861 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
+SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


