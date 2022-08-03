Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B041C19F2C
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:44:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6302.1659516265867713790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GwNyqoO4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516263; i=@fujitsu.com;
	bh=zdCrJ6MXF+QCPQgeNdPOQNQfYwRUClkOlGseJPL3M3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GwNyqoO4feuXuCIl4G1alQVbVGqDX4IXhr06GreHXkvkJ/RgClg5fI/8gAMMCqhZf
	 Y2X1XoMeEh+VGldOU3ZdV3y0Lic7ts5qAIfq8GkweWmMZqybFF200oJWHUYyA6oS2X
	 CNI7M0jA3I7GYDqlcgTrfQ71ZKJzUkCNAIP5Uv0RxeD+VZOt/qBNY1ggqCLKsaF+dK
	 katnowW6bymPXlI52oWydtCdGnnFPrzusT2f17YRn7dahEeAfoRMFktxbXc+4/0D8V
	 TcLetran7jEuqsOLFPm+pQY/ZeAxdSMF93MbSXKcsXLvwPR+8UGoa88F3RAg8aWc25
	 f3w1YCbSExhBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpJtu+ir
  JYMpHZos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePz/C+MBWs5Kpqf7GJsYLzB3sXIxSEk8IBR
  4sGFZSwQzmUmiZ4lzYwQzm5GiZObHjB1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgIPEzyeH2EBKWIDiDQ85QcK8Ak4SxxbvZwOxJQQUJKY8fM8MYnMKOEuc2w+yihNolZ
  PE/KbtLBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJGTO2Qc1Uk7h6bhPzBEbBWUjaZyF
  pX8DItIrRJqkoMz2jJDcxM0fX0MBA19DQVNfSTNfQ2FAvsUo3US+1VDcvv6gkQxfILy/WSy0u
  1iuuzE3OSdHLSy3ZxAgM45TihOYdjPf2/dI7xCjJwaQkysuk+CpJiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgRvhhZQTrAoNT21Ii0zBxhTMGkJDh4lEV5hJaA0b3FBYm5xZjpE6hSjLsfMr20HmI
  VY8vLzUqXEeU8aAxUJgBRllObBjYDF9yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz1JkB
  TeDLzSuA2vQI6ggnoCB2uFyBHlCQipKQamESF8z7vy79nuVop6ZuFWrbUos0lmx4eCNHRvCD1
  8NGbKbtefKp0WvLmjN5ie+354ddtAt40rVByP2B9pWlVjKxJkOGDNQevdD5IVrp0Qf0gy8WD+
  mZqE0tmKtf6Xzu57KLlZPcF31UzNjD6R3TE/N3KeKR9+aZe02jLG+oJKobrdLlPzbin/F+0JW
  bRv6YDzifM7R9GTpGVnaIi+SDMttGu7VXv2+mm+06+/NlwM/mYUMPRSTVKzC3H7qdmuc3ZO2X
  b3I7lcsHZl/SkLghv+d76YX2mZIVIcmtxrjBr0R2b2BzTPNMKySsrdz3s8z1//4V2Tr8Zc6nX
  w5M55Vv2CTdfzrphqPXZK9Wwt+XQSSWW4oxEQy3mouJEAKEeMsVqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1659516262!103802!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7991 invoked from network); 3 Aug 2022 08:44:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:44:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6B34B1B1
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 604F41AC
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:44:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:44:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-scons: upgrade 4.3.0 -> 4.4.0
Date: Wed, 3 Aug 2022 16:44:05 +0800
Message-ID: <1659516246-31185-3-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168809

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-scons_4.3.0.bb => python3-scons_4.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.3.0.bb => python3-scons_4.4.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.3.0.bb b/meta/recipes-devtools/python/python3-scons_4.4.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.3.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.4.0.bb
index ae91d980fe..ad1149597f 100644
--- a/meta/recipes-devtools/python/python3-scons_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "d47081587e3675cc168f1f54f0d74a69b328a2fc90ec4feb85f728677419b879"
+SRC_URI[sha256sum] = "7703c4e9d2200b4854a31800c1dbd4587e1fa86e75f58795c740bcfa7eca7eaa"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.25.1


