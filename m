Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D387CC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:38:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.47610.1681713491287109515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JVpQ5az1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681713489; i=@fujitsu.com;
	bh=NtSWrEgPw7nCVFoFg5QZNuhFCYD4lbejDhPDmvRm7pM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JVpQ5az1DLVjK1yel7YKuiV21lMZtDW4deZyTJd5ZLKrRpN5PSPtBETQ/+NGMDZcX
	 c7bB+wtC7iasDuKQ9c//FI4+Xl/oWxyrnnCWRQg1T0yzlWDukLxcrqnxWrBUdFPoLv
	 0CEI5Rxk3azGdNvQUU/YNtk1U4cv9g877OVQyUqxGshiMZAVmwl5AKE2uEEjQtpXwT
	 7WMFgSv4vs3hfRK2UiN/7CMRPdqbiT0+BLjpZ8fLQljGU2Y63P0CnJSwAqgl5/nwAU
	 iXPVPSL+KfypSddmE3WgXH722PJhQvOca8R8xZVfaXffaMAqfPeti3V3Tjpp6ahiSR
	 HB5RfVqWgou4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTfwpU2
  KwY57YhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bGa11MBct5K95vdWlg3MPdxcjFISTwmFHi
  7clOdgjnOpNEV8tmJghnL6PEnebnzF2MnBxsAlISN+7/Z+ti5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgLTF/6ytWEJtFQFXi96E2NhCbV8BJ4lf7UyYQW0JAQWLKw/dgIzkFnCVW7FnMAmILAd
  Uca3sIVS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0FwvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4qVj+xg3NH3V+8QoyQHk5Io74tU6xQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwBz21ShASLUtNTK9Iyc4BxBJOW4OBREuE1fgaU5i0uSMwtzkyHSJ1iVJQS5xUCSQiAJDJK8+
  DaYLF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb+5joCk8mXklcNNfAS1mAlospwS2uCQ
  RISXVwOTxO2Bx0II9nBF6HEwbdpycoZ0fsvtu8/uTXHVrpmUq6pxziGHYb1aR7Z+z9OrvQzxP
  Gl4pbPwSsuieEHfexgKbuGmbci8uZJxiVjx9TniTd8HG+0cn2qasEKhgvHOxOjbvRvrsP0vS+
  P0Lf3+cGF3wsVN4k8ic2xpXzCrer6g1Nk7gMX7EPveF6gcWiYPL7cvkVne5+Jn5/J7Sd535Ud
  7kNb2bFB+ubbhYvfTgidWipSnuh12Xneb1fnyCW0n+CXddg+CjksnZoZ+P+z1kj/hbX2P5cMU
  TZdl9rttCT3bELd/+aJNHuLiE9lSZtzY+F4PsWwKefwzkVb22QTJ/Y/HWXx94DjlN33fFmDni
  m4sSS3FGoqEWc1FxIgBKQfveWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1681713489!428892!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7555 invoked from network); 17 Apr 2023 06:38:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:38:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1258D1000E7
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:09 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0549D1000D2
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:38:07 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.4 -> 8.2.5
Date: Mon, 17 Apr 2023 14:37:39 +0800
Message-ID: <1681713459-18443-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
References: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180125

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Added optional support for max_execution_time in ZTS/Linux builds
    Fixed use-after-free in recursive AST evaluation.
    Fixed bug GH-8646 (Memory leak PHP FPM 8.1).
    Re-add some CTE functions that were removed from being CTE by a mistake.
    Remove CTE flag from array_diff_ukey(), which was added by mistake.
    Fixed bug GH-10801 (Named arguments in CTE functions cause a segfault).
    Fixed bug GH-8789 (PHP 8.0.20 (ZTS) zend_signal_handler_defer crashes on apache).
    Fixed bug GH-10015 (zend_signal_handler_defer crashes on apache shutdown).
    Fixed bug GH-10810 (Fix NUL byte terminating Exception::__toString()).
    Fix potential memory corruption when mixing __callStatic() and FFI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.4.bb => php_8.2.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.4.bb b/meta-oe/recipes-devtools/php/php_8.2.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.4.bb
rename to meta-oe/recipes-devtools/php/php_8.2.5.bb
index d5954d976..ff432f3ad 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.5.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "79186f94bd510db86e31e535dd448277a1eb92a87878303a1ead44602d8b1197"
+SRC_URI[sha256sum] = "e5a80663cca4f6044ad86a489798147c7af037eca96f6cd357ab36d28cb63757"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


