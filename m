Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999F5C43219
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 08:34:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7004.1653381261876260357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LLkxxGeS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653381260; i=@fujitsu.com;
	bh=4tPIOKyhzcrkvw/+vDO2hZ15Qx2zWNRZw8y44f/uBo8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LLkxxGeS2aMGQ7UXfNadgxVzCdJe7/axlZLA0+L4oQXjwttWWJYNaWIGoqpowUNEL
	 uUHqY3ZiN4BjKfbGnURrgbU5Xjuq4ng1PT7dz1uT5g33GOqRf6vmDICDABMcQxlMzf
	 69QE2WZ0bazibadfOnxMPmGh8+YBSpGoiDBf3FMz23mgFQRZLTNnuN8RgkpnAK2EAz
	 A7FesJIGUfBtlajfPPoZsl786f5DfRlxx1Vzn7xV57X390KsIhxmVIMnRSC2TOHhdp
	 ehGzaPGjB+dkOMhGdgUsmbljOLHCrYNo+0RIoWo1wmSLstpGBnM4rz2pRqfHWBViT0
	 ANxgotI/KoKIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqNs9oyf
  JYMN7JYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaOx8wxzwSmBir+LX7A3MK7g62Lk4hASeMwo
  cfTBGxYI5zyTxMdni1khnD2MEr8unGPvYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfP
  WAlwgI+En+urmIFsVkEVCU+TH/HBmLzCjhKbF00FcyWEFCQmPLwPTOIzSngJLHs9DFGEFsIqG
  bK8onsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7ZBzVSTuHpuE/MERsFZSNpnIWl
  fwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU11TXyMhUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFiv
  uDI3OSdFLy+1ZBMjMIhTilkf7mBc3PdT7xCjJAeTkihvRktPkhBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3ux2oJxgUWp6akVaZg4womDSEhw8SiK87dOB0rzFBYm5xZnpEKlTjLocV69c2cssxJ
  KXn5cqJc7bBVIkAFKUUZoHNwIW3ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNGgUzhycw
  rgdv0CugIJqAjeiU6QY4oSURISTUwWU7eyKbYem2qwrMU1r+zctcs1RetaZPa6aqnZnjey2eS
  93HxbWZFdlKl/4U/dP+qsGA5+PNQ1MPJDy2WRy6UrNolrVWkdGD9rt9FsbsVDCVSTu1JZRAJD
  PefeX3VLFVuBYfN86bpHY8qyjVjcV3b6Je9ZOZl1wknheKdZpy/fjdnv0d04+xVK6pWVy4tO+
  hXJVix91/G2Z91+bdK6z/c4H3w0WXvq/s+AXbvVlwTVbhdY7SzRehwRtxP8/9afI2H2a8qrpj
  IuP/G+dbPdw8ZnN/frnL9yWvh6Q7TK+ZfkZy8Xalg9erLZ9i39znMO3nvz2PLCwab13t9nst5
  f9rb+k3bDt9q+PUihn3ZzX7Ry6lKLMUZiYZazEXFiQBzGMyBaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1653381259!65722!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9663 invoked from network); 24 May 2022 08:34:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 08:34:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D80BA100183
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A86B7100190
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 09:34:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 09:34:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] init-system-helpers: upgrade 1.62 -> 1.63
Date: Tue, 24 May 2022 16:33:44 +0800
Message-ID: <1653381225-6080-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
References: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 08:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166053

Changelog:
==========
  * Remove constraints unnecessary since buster
    * init-system-helpers: Drop versioned constraint on perl-base in Depends.
    * init: Drop versioned constraint on init-system-helpers in Depends.

  * t/helpers.pm: use installed version of deb-systemd-helper if
    TEST_INSTALLED is set
  * add DPKG_ROOT support (Closes: #983421)

  * Add additional error checking on write operations.
    The 'close()' call can fail on both read and write - while the read is
    usually relatively benign, for the write counter part can include "fun"
    errors. Most of these would most likely be persistent issues, but it makes
    sense to detect errors as early possible.

  * service: use 'grep -F' instead of 'egrep'
    'egrep' and 'fgrep' have been deprecated in GNU grep since 2007, and in
    current post 3.7 Git they have been made to emit obsolescence warnings.
    The occurrence in 'service' uses a non-regex argument, so switch to 'grep
    -F' instead of '-E'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{init-system-helpers_1.62.bb => init-system-helpers_1.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.62.bb => init-system-helpers_1.63.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.62.bb b/meta/recipes-core/initscripts/init-system-helpers_1.63.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.62.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.63.bb
index d5c05ff8e5..1251ddf639 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.62.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.63.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
 
-SRCREV = "bbe4b508f3216cdc124683ba449e2295974a6b4a"
+SRCREV = "af94bae943a80954af7fd486c1cab3f900e0975f"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


