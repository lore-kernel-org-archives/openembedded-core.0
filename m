Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.527.1631662572231110546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 16:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O0I9VN9P;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631662570; i=@fujitsu.com;
	bh=rl9rk9hidIxZgB0xIo7bEai++VXiShwBhm5+gSLnUWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=O0I9VN9PvH7YzWkb9N5JElamTR4Aqa1uuFS9MGvWlr3qoyxdNSC5mWr1DCR2ZA3nL
	 XH3YDrLfNb8Ch3egSCg3+AqqS5J8/+uJ0UNF9cEAUgN93F3H08Pu4zYk41KhGd5yIA
	 o7PN5OoVv1KxOjaId6iUECNkpuQY6bBYKJlFFM/C21ivWCBmDDb63NdMjA9Z43ntZE
	 0C31OlwIt6QMzPJ4otwRKNhaCReDLmYzQsRhUO3zuSg9WVmiT0qk5Qh0gvaU29D7o5
	 AGpNOSVYswDEkRMpc1JkTSMSUC/cRlTeoN80gwqdjQXllUUAnM2kvjwpep1pzf3esU
	 bkjqjkhFN/UYg==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 1C/54-32481-AE131416; Tue, 14 Sep 2021 23:36:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRovvK0DH
  R4ESAxZ2f79gdGD3ObVzBGMAYxZqZl5RfkcCasf9PB2vBK46Kz4d72BoYJ3J0MXJyCAnMYpI4
  +oi9i5ELyD7BKDFl/TIWkASbgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdww5iCwt4SNw58
  JQNxGYRUJX4/PACK4jNK+Ak8X/SebAaCQEFiSkP3zOD2JwCzhLbD11kgtjrJDH/51EmiHpBiZ
  Mzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBx
  dQwMDXUNDY11DXSMjM73EKt1EvdRS3eTUvJKiRKCsXmJ5sV5xZW5yTopeXmrJJkZgMKYUMj7a
  wXj69Qe9Q4ySHExKorw7eBwThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwPtADygkWpaanVqRl5
  gAjAyYtwcGjJMLraACU5i0uSMwtzkyHSJ1iVJQS5xUFxpOQAEgiozQPrg0WjZcYZaWEeRkZGB
  iEeApSi3IzS1DlXzGKczAqCfOy6ANN4cnMK4Gb/gpoMRPQ4iP7HUAWlyQipKQamNY+OWZXU9l
  +6u5C74ztSY9apz85+yLs8J+POtwh7+NbNqqzNiuzdUdxvfq+eEn4qjiOzHkPJ4Vp5xo8lDFb
  dX56t0bciwm9H79WGuS8+ulxtqQ6NfPHl6OivfNW/piT8bV14Wb9jvffjU/s1M9v2pzU0Dn9n
  rySs2Ct6jGt/3eZImJ8ywwUFhyfrn3ljtDB4OPKb4Pnma7e6nWubH3kr2SzHU7Pk6fv3W5WsM
  5vk3FYkvHbqqs/H/V+8JjWz31CZCL/3JzX/M6Bm8+qvJw76/GMe1e7fMXidq6Zrvi3f8cnzxQ
  jjwJfrq4nknlRttOlZIPnxbwvbpw4Q4qvfFL53rValhv0ZucFlFyPSaqa+ESJpTgj0VCLuag4
  EQDDzpdcQQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-232.messagelabs.com!1631662569!98373!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27966 invoked from network); 14 Sep 2021 23:36:09 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Sep 2021 23:36:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18ENa1bR013232
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 00:36:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 00:36:05 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/3] vulkan-tools: upgrade 1.2.182 -> 1.2.191
Date: Wed, 15 Sep 2021 07:35:46 +0800
Message-ID: <1631662546-37061-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631662546-37061-1-git-send-email-wangmy@fujitsu.com>
References: <1631662546-37061-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.2.182.0.bb => vulkan-tools_1.2.191.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.182.0.bb => vulkan-tools_1.2.191.0.bb} (89%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
index d0a298ecfc..5350b6edf1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.182.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.182"
-SRCREV = "9d3305731c3be8de05c9f223a79959d448506a37"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git"
+SRCREV = "f4974ccd170cf2338c0582f607af5d8dfc3dac51"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

