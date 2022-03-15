Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C99CC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 10:51:46 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.9420.1647341504441992735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 03:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D6BJ8Eet;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647341502; i=@fujitsu.com;
	bh=+dpSXAZvDvgrlXxFLdWZXKddonR/tW6hPU7v3cnQc+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D6BJ8EetWhyN29xRSA+e0F2qIE3JDnKN/w5STged4HguOL0x9LL9Po12/JASPGAXx
	 SBzxyAL9T9hsu9HhKCCy91X6WzJbOCLxc+T7FMECtIhdbakIWsWd8+Z1A1WU6lBg74
	 cNGUa0oKvLTlWepMxFvEB6D7Z99sF09AGDhYCH+BtK4ykCW/OGEQTZ9GVRuOttF4+U
	 rScolVZ6xe4LRmDzckMjQda0EiObPuhzr1jvKIXGpABA9iq0mLcXakv10t+UaMOtOY
	 fQ17lLPAtpL0g7tU8UwkVGnNpOUeivFVnSvo5BzkcL83QfMcAF2PNJg5vSTocW16+I
	 RAK/zE4KMxcAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSXdfvkG
  SwYnrTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8asptWsBdd5Kx5N7WVvYJzO08XIxSEk8JhR
  YlvvVlYI5zyTxO8fa5kgnBOMEpd+HgdyODnYBNQkpt+6AVTFwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBa4sGrv8wgNouAqsTytsPMIOW8Ak4SM54Kg4QlBBQkpjx8D1bCKeAscWTHeVYQWwioZN
  +CG2BjeAUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjHaJRVlpmeU5CZm5ugaGhjoGhqa6pqZ6RpamOklVukm6qWW6ian5pUUJQKl9RLLi/VS
  i4v1iitzk3NS9PJSSzYxAkM5pdhp1w7Gg30/9Q4xSnIwKYnysogYJAnxJeWnVGYkFmfEF5Xmp
  BYfYpTh4FCS4A3KBcoJFqWmp1akZeYA4womLcHBoyTCuzwNKM1bXJCYW5yZDpE6xagoJc4rkw
  eUEABJZJTmwbXBYvkSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHefpApPJl5JXDTXwEtZgJ
  aPE9aD2RxSSJCSqqBSWDDnQKLgyczLu77vT5JleXJqo07zixlOBv9dXndCsNPWTL5L7LqVvYm
  vXENmxl8v/iyrEac2F4nkfS9a29aWPBy6qxTt9q0K83NfYKknsOj3Tezt+aKVJTGunewsr6a7
  v5efIOvUk3xiicHg6a1mPAvSeTWVQizjfLf/+KzV+mf61+3B8cf2aow64LikyU8CfF7TLSvvm
  TTiZdc3XdIwnpr+6FlJ8Ul/89hO+5+rt+8oCwhRd3096MZ0lGvJK03syRPSLrbH1w3o7d1Fmf
  S8anreZevyl//TcFXZu7z1V3rk6WrBS1aP3tXfnq/cVv7t702Tyd69Hs+ncjhon/M7Tdf3Ixn
  u1LaGxUfXufLVGIpzkg01GIuKk4EAOPP+5tgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1647341501!11258!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19015 invoked from network); 15 Mar 2022 10:51:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 10:51:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 85BE6100453
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 793E8100354
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 10:51:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 4.0.0 -> 4.0.1
Date: Tue, 15 Mar 2022 18:51:04 +0800
Message-ID: <1647341464-78625-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
References: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 10:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163231

Changelog:
=========
- Update OpenType to AAT mappings for hist and vrtr features.
- Update IANA Language Subtag Registry to 2022-03-02.
- Update USE shaper to allow any non-numeric tail in a symbol cluster, and remove
  obsolete data overrides.
- Fix handling of baseline variations to return correctly scaled values.
- A new experimental hb_subset_repack_or_fail() to repack an array of objects,
  eliminating offset overflows. The API is not available unless HarfBuzz is
  built with experimental APIs enabled.
- New experimental API
  +hb_link_t
  +hb_object_t
  +hb_subset_repack_or_fail()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_4.0.0.bb => harfbuzz_4.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.0.0.bb => harfbuzz_4.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index 39146ade66..bf77a5e56c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ab61d4e3fc0c30072e98b46aa7727fc3eed36a85d2b6b9274cec7eaadea97cb7"
+SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.25.1


