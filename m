Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C2AC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:27:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web09.9581.1644316033559082749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vxOpHWPT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644316031; i=@fujitsu.com;
	bh=x+eHu4AoFwRKK5vae8ttKbOkgHdNZD0l1OYHFgFZ0HQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vxOpHWPT/3vGveCNlxUwnZcQXMFQ+gZ9g9oHAep7xiVzmiheRbhaFoHyzYckGVepw
	 jIbSE6EgQiHorONQznxZEmpR6Q8Mqsur1hsJ6vbWBpiWcIGoBn8h9h2P5vwwOhQEDc
	 ACUBV5viXM/Jll7QFD860dXWpve4NTL0Uq3nsbUbePze5LJN1fI65cCDIrvyp83u4d
	 K7smZMal4Q0nwGulFquHoVlzGU0/f4jYaNBzqFMc5ZYRqteeyRLNoMQNbBXDQ7HSQC
	 J0W5d9xSKy0UfQgTw2uX37xhFjL0pfGCZX7r9s6EDwq6kgYPpOOO3Q3xiCD7HrCEbB
	 tDb/TPuhymS5g==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 90/4C-28285-F7542026;
 Tue, 08 Feb 2022 10:27:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSbfOlSn
  J4NA8XYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP+3YUsBe85Kx5O/cHawHifo4uRi0NI4DGj
  xL4n69ghnPNMEjt3n2aGcI4zSix99g8ow8nBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  4CVCAs4Saw5v4URxGYBiv9c38UGYvMKOErMunkPzJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eM
  EMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjVVJRZnpGSW5iZo6uoYG
  BrqGhqa6ZrqGZpV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmBQphSzrdzB
  uLLvp94hRkkOJiVR3iRVpiQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzWLkA5waLU9NSKtMwcY
  ITApCU4eJREeFeDpHmLCxJzizPTIVKnGBWlxHllQBICIImM0jy4NlhUXmKUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzOsCMoUnM68EbvoroMVMQIu/LvqXCLS4JBEhJdXAtJjls7ws7//2Bld
  bjZDDbdoG/9MtL/skzbpu0sQv7cm+cZ7j8e6YfAurmsDG/FkpQrOm9/vqx6s0zujscNt6T5ih
  rFItbZmfUuwxz/Tbi+PYDNvf+LduerryUcKVOcvEWxYm9phcYJSW3XMsr0auzNFb6VjNvsYz+
  hPTC1ml+q/PixJ5v+Xvv8j9UinrnXOVhG8Xsc15Kil7bualbQdfzl7zoUE2OuBd/XKuhU7Fs8
  2Yc0/ouMp77V3fvmCT5KT3FqvdujbNXpRnMZlJWWLxr86bnqE7vaZ8rvkxq/hfi82f9hW9PH9
  v3P8elVwnZSIVefbkMmsNd51SmQI122CXCr9ah/z4qFrB5PrOLCWW4oxEQy3mouJEAH/EDlRF
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1644316030!1394!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6283 invoked from network); 8 Feb 2022 10:27:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 10:27:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 41DAC10044D
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 358EE10033B
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 10:27:10 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 10:26:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-magic: upgrade 0.4.24 -> 0.4.25
Date: Tue, 8 Feb 2022 18:26:36 +0800
Message-ID: <1644316000-5853-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161493

Changelog:
=========
  - Support os.PathLike values in Magic.from_file and magic.from_file
  - Handle some versions of libmagic that return mime string without charset
  - Fix tests for file 5.41
  - Include typing stub in package

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-magic_0.4.24.bb => python3-magic_0.4.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.24.bb => python3-magic_0.4.25.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.24.bb b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.24.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.25.bb
index ae895fbd53..efc8b6daaa 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.24.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "de800df9fb50f8ec5974761054a708af6e4246b03b4bdaee993f948947b0ebcf"
+SRC_URI[sha256sum] = "21f5f542aa0330f5c8a64442528542f6215c8e18d2466b399b0d9d39356d83fc"
 
 RDEPENDS:${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.25.1


