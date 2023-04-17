Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069C4C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:52:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.47780.1681714357188782460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qFBcqp6l;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714355; i=@fujitsu.com;
	bh=JI6SDY30JW6XTLGt/1cV6yPtgezkWh9TnmXxUxhUxt4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qFBcqp6lmVUlPRNXZGElUTmt3IaloOjSipFZOiKjCTVQLbKWMCbTBNc8Ti0rDwEcn
	 FO7bgUkvCPm7IbfecY3jgyLenL3X5oBJ82zFZrRNXaMYrF+nRV6U4/D7DLlhiGS3aj
	 DWF/WAgVSDHZ11ecyNGMLXXVhn0CrF84/aUVAcSeIK25Jyx5/I8nWJBJFQc0hwCAef
	 XYnWrkGbQAPr9ioSUyegfl00av8uWSMALJoneOmOX9qpInEkc1BsW0GDC+ONHqnFAs
	 Nvga4/lupFJ16frwj2EQ5K1wcYMP9W1MqHJMq+bFPtcvNHbJYT6sgQQ+XA694whgz1
	 XsmbDh090RqJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqLvpjU2
  KwaJdZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bP7gtsBS85K1Ysu8jcwPifo4uRi0NI4DGj
  xL43V9ghnOtMEv+6LrJBOHsZJbq+fgPKcHKwCUhJ3Lj/HyjBwSEioCdx9Z8oSJhZQEXixe8es
  BJhgUCJfxfugtksAqoSR7seMYHYvAJOEgv7m1lAbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy/D1FdKtH74BWWrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtoqZdUlJmeUZK
  bmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGIwpxazHdzDO6vurd4hR
  koNJSZT3Rap1ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3obXNilCgkWp6akVaZk5wMiASUtw8
  CiJ8Bo/A0rzFhck5hZnpkOkTjEqSonztoL0CYAkMkrz4Npg0XiJUVZKmJeRgYFBiKcgtSg3sw
  RV/hWjOAejkjDvtRdAU3gy80rgpr8CWswEtFhOCWxxSSJCSqqBKYdXtSOsdt1UXSfegzdlZv9
  232PyrfGD88+pya1heTb7uBxiL7H+lg3yS26ffdQhqGCZISPnpIVe8kULbnEaSaRHtXsxrOBI
  M1Q5r39360zrSMWJsbtivm/lm+U5LWrOSYNEzuUtAmsbm6un69VF/eWV+6ZU8ujYg8ehTj/6s
  3rmc0/lXPrCp+t2zkKhkjoZ0eLyy8++6V5jfntjymPehXP/PTwg/m2jadTGw9fb9ZUKlq3Zp+
  DA3axR4lWxMGZuAEvhXhbnOdei4t/43lZnebemZ/X7ysyUpTe8VjjMvX5n1rZIs2QxvaOV69y
  un4vPOZPiupyZQVu503Gy/bmtv7RWdbNw7stO7bNPy+1QYinOSDTUYi4qTgQAok5FlUEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1681714354!144904!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9689 invoked from network); 17 Apr 2023 06:52:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:52:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7D21D1001A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:34 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7083B1001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:52:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:52:33 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.17.2 -> 2.17.3
Date: Mon, 17 Apr 2023 14:52:15 +0800
Message-ID: <1681714339-18687-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:52:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180131

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
=========
    Add useEmailAzp claim for id token iam flow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.17.2.bb => python3-google-auth_2.17.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.17.2.bb => python3-google-auth_2.17.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
index 42f84087a..a767710ea 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.17.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "295c80ebb95eac74003c07a696cf3ef6b414e9230ae8894f3843f8215fd2aa56"
+SRC_URI[sha256sum] = "ce311e2bc58b130fddf316df57c9b3943c2a7b4f6ec31de9663a9333e4064efc"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


