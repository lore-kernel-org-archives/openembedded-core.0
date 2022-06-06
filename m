Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2736CCA483
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:26:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.31197.1654518373026588346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cDjs+Cwx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518371; i=@fujitsu.com;
	bh=X8AcQI++8HxJo544KLzyZHsApQm4i162zQOSTXEc4ZY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cDjs+Cwx9AuzbTTKlGgVKchwJeqgzwz0IY3TUxvgywTtefoWTueTx0vRjWaMy6szI
	 t0rkTzM2peJLEnxZMUXsdUI3h6zjgluw2skOS2bUGHgfLPVSgNl/iPN1QCq1kzUfzb
	 pmZD+GOApFqFz7jaQfNLIW7cTZDAa05UTTx+1eF8rUcWywYeS//VwcZbvzcNoHa82W
	 /JY2cOb/R7JVIubHdCiCF0pNSqrCgolDAJ6POIDsLE+g0WZc8+ZluoV8t7FBPG1fqO
	 rfWYceC+csLditwDIsA/To76stcjYG4KJMvaGJ+zXxOBcK2ffPvti0XbsNG9w1WAEK
	 zKsGJgOvmYBHQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqJv0aW6
  SQUunlcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH1+E/Ggja+irmrt7E2MG7n6WLk4hASeMwo
  8bF9PhOEc55JYu7PeawQzm5Gia+3DwBlODnYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAr0bx7BSOIzQIU//tpNjOIzSvgKDH7xEs2EFtCQEFiysP3YHFOASeJo0u+g9lCQDWbms
  +wQNQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzNgGNVNN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXWNLXQsjvcQq3US91FLd8tTiEl0gt7xYL7W4WK+4Mjc5
  J0UvL7VkEyMwiFOK1YN2MH5b8VPvEKMkB5OSKK/9tblJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR46z4A5QSLUtNTK9Iyc4ARBZOW4OBREuG1fgeU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOO9xkBkCIEUZpXlwI2DRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8DkCk8mXklcJt
  eAR3BBHSEz4M5IEeUJCKkpBqYcnj/cFle2+O+NDpvjfn7FQ977rbmnWT17t/1OvWmOWu05TOD
  j/1PVyzmycmSD/smlM40rfvJdlOFD/xKj9Wk1q0q38p2an1f55qYnG5+FaXkO0517Y6PZ9e9s
  7aNiZKL2fee25aBZ9LE5z1hEqcyAwVr+LNnXNJsnzDtMyuL2tYjWrsUP34K3tCjly+adPg/P/
  9L7XsfRMIYjZfsKdYQmvv24IbgiJZdf0zElzIXHN0tUP/oz00DEZ2TeZbZ7Tx2Nheb7+wTjW/
  VeHj78vrSxlXelnw3Hp3adNQo+ZOBwzeGb/WRxROenuWaKqv5zsKrXW0nS4hbjX3UjuZi0SMV
  Fu3Kb0obTgfxbuqx41JiKc5INNRiLipOBAB5BUzFaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1654518370!628983!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24845 invoked from network); 6 Jun 2022 12:26:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:26:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 893C31001B3
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7AB1410018D
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:25:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] iso-codes: upgrade 4.9.0 -> 4.10.0
Date: Mon, 6 Jun 2022 20:25:34 +0800
Message-ID: <1654518337-9206-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
References: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166617

Changelog:
==========
Added
--------
Update ISO 639-2 codes to include Montenegrin (cnr) added in 2017.
Update ISO 4217. Fixes #24
ISO 639-3: New translation for Friulian
ISO 639-5: New translations for Esperanto, Hindi, Russian
ISO 4217: New translation for Esperanto

Changed
--------
Translation updates for ISO 3166-1
Translation updates for ISO 3166-2
Translation updates for ISO 3166-3
Translation updates for ISO 639-2
Translation updates for ISO 639-3
Translation updates for ISO 639-5
Translation updates for ISO 4217
Translation updates for ISO 15924

Fixed
--------
ISO 3166-2: Add parent codes for GB. Fixes #36
ISO 3166-2: Fix subdivision names for Finland. Fixes #37

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.9.0.bb => iso-codes_4.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.9.0.bb => iso-codes_4.10.0.bb} (94%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
similarity index 94%
rename from meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
index f51edf09a4..857fe463ef 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.10.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "35ae2024024eb8e6603d3034dbbc406594f3874c"
+SRCREV = "9a6c24ee40e737ab34273c1af13a8dabcae888dd"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.25.1


