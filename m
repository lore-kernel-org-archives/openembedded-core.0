Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A64C3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:44:32 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.6303.1659516266540617047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Bs6dIcIj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516264; i=@fujitsu.com;
	bh=1EMviOkBwZ0+o78Qojxd5B34XvcT345kV96rAPqv8w8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Bs6dIcIjuktWcEfbaJwQuTNGdK8QpcW2FwIUAV3LrD/8/dn4CD/H7QSxi3a0BqR7I
	 hgqwqm4Js3OSrZ+sCUXDRpL2355k2etwBaeaYuGvYtJdsvrD45Lbu7IaGTN4OXD45f
	 MnC/yZnrwcUG24/fCToJAnIwBcqvxctDhQ0+k2Bb8EMB5UOlklFPlGQtj2i8Hx4yAu
	 ISG0m6qrrSHQuqTBy90cXikw4W1rhRb+jDDqA6IQUB8enxgFzoOrG/hbcV4l90wJB7
	 TaaESDRqN7Z5obw1cpcAekCX3fe95uzK74J7KCITqlanoPgQ997oBBYNGIhbhbh9lc
	 0el0N6iBrKa2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSTfD9FW
  SQfteUYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPXzacsBQ+4Kp7tXsXUwPies4uRi0NI4DGj
  xPsTj1khnGtMEnOvfGKGcHYzSqxb8Qgow8nBJqAmMf3WDSCbg0NEQE/i6j9RkDCzgIrEi9897
  CC2sIC7RNvsmUwgNgtQ/FzvQWaQcl4BJ4kT58tAwhICChJTHr5nBrE5BZwlzu1vZgSxhYBK5j
  dtZwGxeQUEJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01QWSRsZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBIZxSzFC9g/F/70+9Q4ySHExKorxMiq+ShPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwZmgB5QSLUtNTK9Iyc4DxBJOW4OBREuEVVgJK8xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS
  8/L1VKnPekMVCRAEhRRmke3AhYbF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbbwI0hSc
  zrwRu0yugI5iAjtDhegFyREkiQkqqgak/Q1f5vrD3FIclcTMq18t7dGy1LTwV9yvejv35m+dK
  39fN+aK1OUuv9WjZXyHb6B+/st1mli3vYK+NfnVZ9pFB7J5fT8rizzIZy71V2ZQdErj5s3vFh
  DaH+w+tjXUWhV5o8eIxZWA61Hq+ZNXWU5KdNb1aKnyfT/oWfqxOi/nb+mDNiTnB3g9NNoW7V/
  /OCpX+W7ONY/s7pvbHfKwS12eml911ti+KeSEq8VU07M3kcxwrb7hufL4g4IX7EdELa752LD2
  19OiuCUZrVyUoVuz2LLvYzK/LeGlnwLRFvRsTrXr25Hs6xp88XVH6sMJucrVslPkxefZu9v0K
  jQIChmzm3b4FM9dO1Nuacfq6sBJLcUaioRZzUXEiAD/qKo1oAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1659516264!36608!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30840 invoked from network); 3 Aug 2022 08:44:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:44:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F1F4A1000EE
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E53951000C2
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:44:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 63.2.0 -> 63.3.0
Date: Wed, 3 Aug 2022 16:44:06 +0800
Message-ID: <1659516246-31185-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
References: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168810

Merge with pypa/distutils@129480b, including substantial delinting and cleanup,
some refactoring around compiler logic, better messaging in cygwincompiler (pypa/distutils#161).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_63.2.0.bb => python3-setuptools_63.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_63.2.0.bb => python3-setuptools_63.3.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_63.3.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_63.3.0.bb
index 15c171b846..da7e7892fd 100644
--- a/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_63.3.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450"
+SRC_URI[sha256sum] = "273b6847ae61f7829c1affcdd9a32f67aa65233be508f4fbaab866c5faa4e408"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1


