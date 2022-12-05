Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F81C4708D
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:25:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.5181.1670207125279433157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xbfqzV6p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207127; i=@fujitsu.com;
	bh=oHNEN5nXKfqpbJtIObPeCP/BdMMl4uO3bmRX1JGeVzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xbfqzV6pmESSRDscF7Gb2loUqeN73WlONib2fXVIkB1oqPE4jnZ52xCbGzNCW41Px
	 df4O4T+KEJ0algQJd2L6HrUODtLD/2FVyT1p6+pjuxZ3xOQvGv/SL0Ml7M5OJf6Mqf
	 eebIFXi3HpvJBdQ0zH37/vwbnEGPqZhT2FI6gq2uvjNI+td/nBopRsOt/QF0Xpnfa/
	 /vE5N9tS9VXKtfWCQvGgSIQst3jiNnjMAe81vU2CXFKjDvBAF4hLRtATs1bz3VYeYK
	 b9xxja9BuQsk0w70zNuEepEzlM7YybDglnzCnmSXXZweZWNsasCJ0mpligCMm7R+rE
	 XcmOOmyuuR9Dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSXdaWG+
  yweMJ2hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bdrSYF++UqmrfZNTA+lepi5OIQEnjMKPH/
  eAMzhHONSWL5yr/sEM5uRolXF7aydjFycrAJSEncuP+frYuRg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC9xJG/X5lAbBag+Lk9E5lBbF4BR4m7e2+wgNgSAgoSUx6+B4tzCjhJfF79HGy8EFDNm+
  8nWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN0PNqZCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRvDi1qCy1SNfQXC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4pTX+9gPLbsj94hRkkOJiVRXqVH3clCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HhXBvUmCwkWpaanVqRl5gDjCCYtwcGjJMIr5A2U5i0uSMwtzkyHSJ1itOSYOvvffmaO5WBy5t
  e2A8xCLHn5ealS4rzdIUANAiANGaV5cONgsX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjC
  vmy/QFJ7MvBK4ra+ADmICOmgjfxfIQSWJCCmpBqaNGQx/YsQX3m4qvMXK+c/ottaV1j1MXFHn
  ef3/Wn2I6D59VnKOwb+3kV1npBc/jc06E9O/UnJ6Qvr30yHS7x7FvzubHS+V5HOF3e3ZrUyG9
  Yub5l2xdJmvdOnk/T/d7XtS7Lr/rK2M/qQbxfctSVpNmsPf4pGXaff1GD67JNXbUy/8MrxX3b
  HDYH3zfOUb8tbcb/d+sFX2FnRLmJb54uueTmYbo69XFTafWrtU1+g90/bqMLd3rwU4LpVtU8w
  60nFZ6+KiJ1GbbzWnr1939Ez8xv6zL+7pip5fu5lfu2dVkFHYa42n2Wz/Th9OXrTBo8lPTfzE
  Zt4vQndOrao4/PvEezuWvW1zt3L3S2ldLtiqxFKckWioxVxUnAgANM1iXnADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1670207126!6021!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18118 invoked from network); 5 Dec 2022 02:25:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:25:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2758E1000D7
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1B03B1000D2
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:25:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:25:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dropbear: upgrade 2022.82 -> 2022.83
Date: Mon, 5 Dec 2022 10:24:52 +0800
Message-ID: <1670207094-6846-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
References: <1670207094-6846-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174258

From: Wang Mingyu <wangmy@fujitsu.com>

0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
removed since it's included in 2022.83

Changelog:
==========
- Disable DROPBEAR_DSS by default
- Added DROPBEAR_RSA_SHA1 option to allow disabling sha1 rsa signatures.
- Add option for requiring both password and pubkey (-t)
- Add 'no-touch-required' and 'verify-required' options for sk keys
  DROPBEAR_SK_KEYS config option now replaces separate DROPBEAR_SK_ECDSA
  and DROPBEAR_SK_ED25519 options.
- Add 'permitopen' option for authorized_keys to restrict forwarded ports
- Added LTM_CFLAGS configure argument to set flags for building
  bundled libtommath. This also restores the previous arguments used
  in 2020.81 (-O3 -funroll-loops). That gives a big speedup for RSA
  key generation, which regressed in 2022.82.
  There is a tradeoff with code size, so -Os can be used if required.
- Add '-z' flag to disable setting QoS traffic class. This may be necessary
  to work with broken networks or network drivers, exposed after changes to use
  AF21 in 2022.82
- Allow overriding user shells with COMPAT_USER_SHELLS
- Improve permission error message
- Remove HMAC_MD5 entirely

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-failure-use-DROPBEAR_PRIO_LOWDELAY.patch | 28 -------------------
 ...ropbear_2022.82.bb => dropbear_2022.83.bb} |  4 +--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
 rename meta/recipes-core/dropbear/{dropbear_2022.82.bb => dropbear_2022.83.bb} (96%)

diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
deleted file mode 100644
index 042dccbb94..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 64292091fe3e8ea7c9bfe74af730b2ff5428bf10 Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Sat, 23 Apr 2022 22:33:31 +0800
-Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
-
-Upstream-Status: Backport
-
-Signed-off-by: Daniel Gomez <daniel@qtec.com>
----
- svr-x11fwd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/svr-x11fwd.c b/svr-x11fwd.c
-index 353cb12..5d9e6a9 100644
---- a/svr-x11fwd.c
-+++ b/svr-x11fwd.c
-@@ -206,7 +206,7 @@ void x11cleanup(struct ChanSess *chansess) {
- }
-
- static int x11_inithandler(struct Channel *channel) {
--	channel->prio = DROPBEAR_CHANNEL_PRIO_INTERACTIVE;
-+	channel->prio = DROPBEAR_PRIO_LOWDELAY;
- 	return 0;
- }
-
---
-2.35.1
-
diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
similarity index 96%
rename from meta/recipes-core/dropbear/dropbear_2022.82.bb
rename to meta/recipes-core/dropbear/dropbear_2022.83.bb
index 4ed4c65cc1..0c7a8f4caa 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -21,9 +21,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://dropbear.default \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
-           file://0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch"
+           "
 
-SRC_URI[sha256sum] = "3a038d2bbc02bf28bbdd20c012091f741a3ec5cbe460691811d714876aad75d1"
+SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
 
 PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
                file://0006-dropbear-configuration-file.patch \
-- 
2.25.1


