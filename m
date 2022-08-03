Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A36C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:44:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.6173.1659516261617556430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bDMs0H9W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516259; i=@fujitsu.com;
	bh=/dzjD1t5XBK9TAbRrOftQwDj92TFoL/LIqV3Y06c+nk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bDMs0H9WzuB0rk0P4AaIoXG4kEzRjUm5e8CMYSXLeEZMElBh3uPVlKBAFQQlkrV9G
	 s2kOlUhHBllHD6rDPGaXvrCIt5sReZkv0/Kldc2D+Sc6j7kkc+8agVcDyXoFPkYOrt
	 Rw+7NcR3RYkHqoXecfKM6N3sqJeBnv3XpcNs7PE1+vrFserZR0Gw1TNcTxRwKYBYRh
	 /GwlPzy6Miu2FHmYw/LAPk+CGBtWqfP1F7ZQoZP0kyoI5xBeHG7w4Zjx15l9qdETpL
	 7QANZW7XWFvcEi+jBnTXP0Key4ZWSmkWKXsMZ7yE96dcKWIfp+wLoFFx0s1n4k3TXZ
	 nPfHU4nLURMjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqJts+ir
  JYMVZGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNO21Pmgle8FZfeHmBsYJzN08XIxSEk8JhR
  4ta8HaxdjJxAzjUmiclPdCESuxkl5rydC5ZgE1CTmH7rBpDNwSEioCdx9Z8oSJhZQEXixe8ed
  pCwsICrRPPKOpAwC1B40u+XbCA2r4CTxMQV91lAbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF8
  wQNYoSsy83Q9VXSMyYsY0NwlaTuHpuE/MERv5ZSNpnIWlfwMi0itEyqSgzPaMkNzEzR9fQwED
  X0NBU11jX0EIvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwHFOKmYV2MK7v
  +6l3iFGSg0lJlJdJ8VWSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneDC2gnGBRanpqRVpmDjA2Y
  NISHDxKIrzCSkBp3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpUqJ8540BioSACnKKM2DGwGL00
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnrTYCm8GTmlcBtegV0BBPQETpcL0COKElESEk
  1MJlx9Ddu7zu7MdLwfOr/qufnxeYa3fWdGHr6F+uvO7xCFZWrO2fv3m7OJFulPKX8eHbJeTuP
  jTs3MX1rjj2yQ/zssVAznT4HT6ZLNUdYxG5unKohqDHj5oGPhmFVJXmnGSuZxXy+dmU809sfo
  9Pbmn7HwGy9x5qgFIm016U6102sErNOLkoSUe1n99nVw7Bn0azHR6s23GH8dfPJK33BpOilJZ
  s5ru2+EL3yps3yY2dFixPfvp75r6G4wuwrl4xmtHLg72jPM64f74i2vztzV6br7dm7UyYYSOf
  35IZeyCxy95FP+Vm5+s8hgQfby+vub3g6faM/W/+Wh0lvvW1snLX0b6RJfFFuWMdeeY35vBJL
  cUaioRZzUXEiABTfndFOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1659516259!36543!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3780 invoked from network); 3 Aug 2022 08:44:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:44:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 18E1F100191
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0CC68100190
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:44:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-jsonschema: upgrade 4.7.2 -> 4.9.0
Date: Wed, 3 Aug 2022 16:44:03 +0800
Message-ID: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168807

Changelog:
===========
-Fix relative $ref resolution when the base URI is a URN or other scheme (#544).
-pkgutil.resolve_name is now used to retrieve validators provided on the command
 line. This function is only available on 3.9+, so 3.7 and 3.8 (which are still
 supported) now rely on the pkgutil_resolve_name backport package. Note however
 that the CLI itself is due to be deprecated shortly in favor of check-jsonschema.
-best_match no longer traverses into anyOf and oneOf when all of the errors
 within them seem equally applicable. This should lead to clearer error messages
 in some cases where no branches were matched.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-jsonschema_4.7.2.bb => python3-jsonschema_4.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.7.2.bb => python3-jsonschema_4.9.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb b/meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb
index af728ab2d6..66e0affc64 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.7.2.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "73764f461d61eb97a057c929368610a134d1d1fffd858acfe88864ee94f1f1d3"
+SRC_URI[sha256sum] = "df10e65c8f3687a48e93d0d348ce0ce5f897b5a28e9bbcbbe8f7c7eaf019e850"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


