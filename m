Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1410CC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 09:09:17 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.24549.1640596155449722672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 01:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BsJ/4bhl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640596153; i=@fujitsu.com;
	bh=8+F1vTw591s9UudrzT3KNRQozxSxXm70GNz4dWBR/uw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BsJ/4bhlkcvKauZsDHieC44dAlPttcXBz/2eBO6I7OxvEJdAMjWvwSkBUR6uxY8UC
	 ENuWtqfsAGrpC5XhV6jD4kokQ5Q191gkh6SLT9ZTwrNv1pONuCL+rj458jJoj6ZzAQ
	 0n+Bb7x6JbSldjwuJln09xa01cXhOono2u95fKaqPS1RUgH64aJsAz1SPXsgJU1psK
	 /JEfXpkdlXlREnSKJC4n98ZV7U30rzMwV0oEuxddvcKimOZdFHmJdlhcstjpGGwhiO
	 fowVVdwKMNwyEBshz4ie6Evvu489rpEEiKxu6kpr1prUT24GzH64muWTRsXRdLlaxZ
	 WR9e4nKXatJSQ==
Received: from [100.115.69.8] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 F9/0F-06990-9B289C16; Mon, 27 Dec 2021 09:09:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSXdn08l
  Eg8cX2C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owvf1+zFMzlqphwq4WtgXE9ZxcjF4eQwGNG
  idPvL7BDOOeZJM71X4NyTjBKXHu+k62LkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFXCX6N+1jBLFZBFQldhxsZwWxeQWcJG7t+s4EYksIKEhMefieGSIuKHFy5hMWiDkSEg
  dfvGCGqFGUmH25mQXCrpCYNasNqldN4uq5TcwTGPlnIWmfhaR9ASPTKka7pKLM9IyS3MTMHF1
  DAwNdQ0NTXTMLXUMTY73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFecWVuck6KXl5qySZGYHCm
  FLv072C83/dT7xCjJAeTkihvdOrJRCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvD8agXKCRanpq
  RVpmTnASIFJS3DwKInw/gdJ8xYXJOYWZ6ZDpE4xKkqJ824BSQiAJDJK8+DaYNF5iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5IwbyTIFJ7MvBK46a+AFjMBLZ7pcBxkcUkiQkqqgak/QHSqxXv
  TiYZaEiJ+M3fx/BfTVW0t3mIn02kX572rPzppy6ot++0Nvm7X91e84npu6/opM0q/9ynX2P38
  Vf8z9m3rVomfN3T2/nRxOR4pPc3zC7PL5FMhjWe/auoJzr9QGDzjkcGUWlXmkvpXeuVyWyeWF
  m/hbH3/JKHwm1vy/+z4i3elF510Wf/YNEkyt3Rx23um1Tt9jgbYLJ/zr72nVNqji98lk4VTRH
  zPxzPniq4oPmLhFOhJS5Jj/3OzQTnE+vuTe2uZyu6eWr3n2y6Jp01Xbizk2/PDV0pv3jP/fcr
  i6xLrWPbWb6o/0PTvRsHR8HrhxuMCnBOYrZcce3fA37dZ2GrhuzNWFwumH1FiKc5INNRiLipO
  BABZq2Q9SQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-528.messagelabs.com!1640596152!187578!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18968 invoked from network); 27 Dec 2021 09:09:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 09:09:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9C29D10044C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:12 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8FDB01000FF
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:12 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 09:08:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.24.1 -> 0.25.0
Date: Mon, 27 Dec 2021 17:08:47 +0800
Message-ID: <1640596128-22182-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 09:09:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160017

Changelog:
========
bluez template: Implement adapter discovery, connect, disconnect, and removal
Fix changing array properties
Fix CLI upower tests
Add testing and Fedora updating through packit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.24.1.bb => python3-dbusmock_0.25.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.24.1.bb => python3-dbusmock_0.25.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index cf272328b3..e64e343a1e 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.24.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "56d660bd5f5d0edfe8b0eedfbb9b0814a134eb94b46fca16c379dca68be5724f"
+SRC_URI[sha256sum] = "6f4ce7650ecbb022684dc158df720e199635f3a3df75f7020f4fe8f6ff0394db"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


