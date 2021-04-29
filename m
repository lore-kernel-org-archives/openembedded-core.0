Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.6268.1619700222574280496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aX36HCFm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619700220; i=@fujitsu.com;
	bh=VX0zfuBxw0vgKO47qyzNk9Wlz97G/AxWIliKU9AAZpo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aX36HCFmodNqKEtyU4fpKam37yFpQWjA87ifPgZF12vxOiflIoF77H60Am8mdeXDH
	 WzKmb94zT4jEnyhIu3MqOwPy3ETaIvhJla5uEGG5tbD6hLjiBwWPeopRGA2ZmTmMZq
	 TojXYKhyXvkW5Do1oHhSb7BvBY4xJgApbfwhIDUNS1bP0TjmZPGpkHEIZQ7kJ/m6iC
	 GaEafD4juas18iZxLMT3yUmB8c/AlawzZY95Ojpu5eJrqRRqFKgeDJV9cqr2g4vU1a
	 JaHvWm30Z4X+IAA0e7ZsFveP2u9y/XcjlKW1oEBHXbcJ2kigqMoueT6txrnUBJC+Yb
	 8tR5ervhCD60A==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 5E/A7-53635-CF9AA806; Thu, 29 Apr 2021 12:43:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+EI0f2zsiv
  BYOZFUYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePI1Z+sBRNZKtbMFmpgvMncxcjFISQwi0ni
  /6Hv7BDObkaJ7R0zgBxODjYBXYlzj9cC2RwcIgJ6Elf/iYKEhQVsJF6cagMrYRFQlXjW9YQVx
  OYVcJe40HEQLC4hoCAx5eF7Zoi4oMTJmU9YQGxmAQmJgy9eMIOMlBBQlJg9XR6ivFJi+7SzjB
  MYeWYh6ZiFpGMBI9MqRvOkosz0jJLcxMwcXUMDA11DQyNdQ0tTXWMTvcQq3US91FLd8tTiEl1
  DvcTyYr3iytzknBS9vNSSTYzAAEopOKy0g/Hd6w96hxglOZiURHm3dHYmCPEl5adUZiQWZ8QX
  leakFh9ilOHgUJLg3bCiK0FIsCg1PbUiLTMHGMwwaQkOHiUR3iJgQAvxFhck5hZnpkOkTjEqS
  onzzgTpEwBJZJTmwbXBIugSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeDpApPJl5JXDTXw
  EtZgJavOx8G8jikkSElFQDU+WeCu/XbbNn/OUMrZN1tHR1aPvXm3cv+YF7hNBdf36vx/r78j6
  7cV+fkWXydG35sV8Ku5cqp+/KnqlhsEHvbtxEtz1XvjtvbpZsaLGJ5Ly8f/VtXZfunId/U1gr
  P8k11mtfMMy2DDq/4uKxg5cd8jqVP/lnm5t8+/7ii3fLzvrPeuuuXr1vknxdpfjJ6ZTu2T9S2
  SsPZ6lprFpmkGXiX3k2h+n++cXpgj0mH5M0rp4Mem77wrLEnqH4fkdvrNj/DVNMbzl5rVmZ33
  ROP5wlavo+6xPFukHtn8L2z8g1ZpsR2Nkpflv+fHHAsc8mzvJlL7znB9iIfP8QKn5/0wF5s6q
  XZ+Zf5WBOlWyxjfRUYinOSDTUYi4qTgQAxu1a1BsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-31.tower-271.messagelabs.com!1619700220!247359!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20443 invoked from network); 29 Apr 2021 12:43:40 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-31.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:43:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TChdj6028583
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 13:43:39 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:43:38 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] shaderc: upgrade 2020.5 -> 2021.0
Date: Thu, 29 Apr 2021 20:43:30 +0800
Message-ID: <1619700210-5544-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2020.5.bb => shaderc_2021.0.bb} (100%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.5.bb b/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
similarity index 100%
rename from meta/recipes-graphics/shaderc/shaderc_2020.5.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.0.bb
-- 
2.25.1

