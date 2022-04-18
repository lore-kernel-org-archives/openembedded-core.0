Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF938C64EC1
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.38161.1650283889017176330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OpUTklxa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283887; i=@fujitsu.com;
	bh=LUxQ3XgimUkS3+x6SwFeJgXGgOHdU2Ihe/mM1bQMqWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OpUTklxaIfZP/5mPUNe4ee06Bl6P1W/U8NIT6/IycRW9mOjeq3W8e7s3gc0i3UWWM
	 OAptxYOTF+H7gdgQ8PSg+1d+6ZTBiNrJLxRL8XbEIZnNB9uVJrj+JVrPDb2WBudQUA
	 lhQR+5xlwk+uwEXgmoIj3HoEktfK2xKp5WOhpwSADb43RlWry+YeA7a/qavBoxPaiT
	 8jIoXhLIxT4c7bOXW/TbK7oH/dVWsxeAnu3QBtld1oXSWPi0yatVIV8i4G3BUspWxZ
	 Ws5HrVRSy118pJcjocHwGvshcBqlxqHWpWJ5yaXCZn5jeGJznA99JcfD3CHSNs4uF3
	 CN4lXshsslW3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSTcvNDb
  J4MYtY4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPhP7WCWRwVay4ZNDAeZO9i5OIQEnjMKLFx
  2TKmLkZOIOc8k8S1nnCIxB5GifYbF9hBEmwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPW
  ImwgK3EhpYHYDaLgKrEgd4uMJtXwEni3KeFYPMlBBQkpjx8zwxicwo4SxzeN4cFYq+TxKJTi9
  gg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/AyLS
  K0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2ELXyNBIL7FKN1EvtVS3PLW4RBfILS/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4JRitSs7GPes+ql3iFGSg0lJlPe/b2ySEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QnelgCgnGBRanpqRVpmDjCaYNISHDxKIrwcgUBp3uKCxNzizHSI1ClGRSlx3ifBQAkBkERGaR
  5cGyyCLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5hUNAZrCk5lXAjf9FdBiJqDF2+dHgiw
  uSURISTUwRQkHOkY4xIlZrl1yxuedMZ/Mxrw9TnWiiXk2L6TU3vM9W5FQ5rflho+wfh/bRLlW
  7vknZjSwZCz+ZM3IUSYrd6jcIi9N8eOqRw6PuDYG72/Q37j2aGuEza7aDZ/F2ef7maw4sPyXQ
  c+njV3bLevdz3UWr85zljgp0Hx/U8t++evFq0pU/32KqZ5/yjHi9JNnam1V7TdclD9tn6vm+o
  zx2qWbC4w5Q1ILtp83NFokHyx+4MXy/Ya9ZiET/9l+SmR6bNXE3/GX00/0k9XGs/XLA5rWdjf
  Zye/aqpf5jfGD1xGHA3/Npe/pruzefHzfo+BJ63avZrdfGBXg3/hk5efiaSlH9+mqLDn2ffG5
  nMhjSizFGYmGWsxFxYkA0LbPmlsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1650283886!202359!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13719 invoked from network); 18 Apr 2022 12:11:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:11:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 792FD100476
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6B502100441
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:11:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] help2man: upgrade 1.49.1 -> 1.49.2
Date: Mon, 18 Apr 2022 20:10:54 +0800
Message-ID: <1650283855-16427-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
References: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164588

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../help2man/{help2man_1.49.1.bb => help2man_1.49.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.49.1.bb => help2man_1.49.2.bb} (89%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.49.1.bb b/meta/recipes-devtools/help2man/help2man_1.49.2.bb
similarity index 89%
rename from meta/recipes-devtools/help2man/help2man_1.49.1.bb
rename to meta/recipes-devtools/help2man/help2man_1.49.2.bb
index 32c1b2fc06..62e1f67b55 100644
--- a/meta/recipes-devtools/help2man/help2man_1.49.1.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.49.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fd99a664ec4be9a86a0dd89719989f14f367a9c079d75d0e1d71e18a7bb51b03"
+SRC_URI[sha256sum] = "9e2e0e213a7e0a36244eed6204d902b6504602a578b6ecd15268b1454deadd36"
 
 inherit autotools
 
-- 
2.25.1


