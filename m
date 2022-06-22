Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B278BC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:49:30 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.4651.1655884160436097398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cNGNrEZd;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655884158; i=@fujitsu.com;
	bh=TkgElUShPp0/4T7y1s2EjZXininJnmRz038j8S1Ewzg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cNGNrEZdukb98rgYn+htUUZ5AXZrcu6W2MeUkFbozxgooKF+Tv42PFuFqMMI70YHT
	 EObD1m6RNlqHAGskyeV5RM2qNv1iQxlIE6Qw/nr/iPBMbxU2grK2CJYtyWFYq4rAeX
	 FZt74yevrfnW3co78tJidXzmTTqw1OVnA/RMYgiQVP3CagCWN0wIhiUPuh+f2Rf6VQ
	 WaP/XQfwtX/HDN/yEa9qwjnezNh039Zp8yAyBBwM41fOSMxoKFWBMQi17kU2iM2Fp3
	 lmIwlrgKZk2BECFtZm5oR5LzZne4DO8DouEsEJUh9J8Igbx0DFuWR1hUj2TkwkgHlg
	 V6pcqpXPN+vgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqFt3clO
  SwZEGdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP/0nOsBRu5Kp4d2cncwLids4uRi0NI4DGj
  xKaPD1ghnDtMEq/fvGaBcPYwSsw7cgbI4eRgE1CTmH7rBlAVB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFXiaaX68FsFgFViTkLNzKC2LwCThIfFk1gA7ElBBQkpjx8zwxicwo4Syy+ux/MFgKqaV
  36gAmiXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWPGNqiZahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiYVZaZnlOQmZuboGhoY6Boamuoa6xpa6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfm
  Juek6OWllmxiBIZwSjGz0A7G9X0/9Q4xSnIwKYnySh7YlCTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgjfuOFBOsCg1PbUiLTMHGE8waQkOHiURXtsTQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzfj0IVCQAUpRRmgc3AhbblxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8xaDrOLJzCu
  B2/QK6AgmoCOeLN8AckRJIkJKqoEpmE1Iy9F974uMw5VdGwqdLhd61Ltvlew9+kbWM8L+D/+E
  LU4a149X/TlX+tb7o9biGNOa7iDFpGcvV4jeyzGtXBtblmtrfqBch/dwzXGR2oScggl/mif/8
  N91foqXgNKVNb/1Lx16f2WajsOi1Cib+psJEe/DKg+uPzgvTTfBROdwe1ONxm2GZXNPalQ/F5
  izaEP37Htf2AX2Zl+4uznkh3iFkcJxxR9NISvZtx4qeupwg9Pg13n9JXz886zWrSy7rhxYc1g
  6SKrQNLp06om/4aeaf31YeKvkWjSvO8Nh/gc7o5YVJk1sCPgjs7n1bOL/9OI3y/TrU3v2/y6x
  3H+bLTRs+tywmF0vZOV3TWRXYinOSDTUYi4qTgQAWtAq7WgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1655884157!401350!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1884 invoked from network); 22 Jun 2022 07:49:18 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:49:18 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A3C03100043
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8D326100193
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:49:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.27.5 -> 0.28.0
Date: Wed, 22 Jun 2022 15:48:47 +0800
Message-ID: <1655884130-22843-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167218

Changelog:
===========
    Drop unmaintained and broken accountsservice template
    testcase: Throw an error when spawning a well-known name that exists
    mockobject: Allow sending signals with extra details

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.27.5.bb => python3-dbusmock_0.28.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.27.5.bb => python3-dbusmock_0.28.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb b/meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb
index 852d1555be..6155c866a2 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0bff30d8d01e7eef491f75d359c87765abba7001307fa8fed19cb59f06ed3c2a"
+SRC_URI[sha256sum] = "c63edeacec7796c4f379b2e17566d62afa404c048931ac9eba446470cec80ada"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


