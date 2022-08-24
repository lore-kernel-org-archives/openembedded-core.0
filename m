Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65144C3F6B0
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:47:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.8716.1661330806724282528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vyt3me/W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661330804; i=@fujitsu.com;
	bh=Ga6zVP+TYpfgOpVZ99KBly03yVMPpkCfdJPj5bYzbTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vyt3me/WOjA+BGbqC79izNhVe4WDuDQ7tFrDk3a/VMXZ/f6nVichUH0PpdKGImqyI
	 HohJEi/gSTEAj59kAeHe1LXqJOxNEXKdAB4B7sTyL7HAns0rP9SOWFu5w/eeON34wg
	 OqjPBpWHxeo6y6BLNCRM7hHo+nCbKohqUnFiP7zgkMzYVVuZx54yGKBhmvW0kGyLpB
	 5Xke3rX3pQMd+lP+PHBpq0gI55AMBF0EABSIlWwOoIBWDuyQ+AmodQoBM9nEBTCcGl
	 rPbbfjAwFif/IwsnTMCguEEPjz4+yXCL21FcLzCgOoi/PjU3rXnKNcJSON+7M0axK1
	 5Ut7pjU9+AMbw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8MxSbfkKWu
  ywdxn8hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRZouC69wVP7u+MDUwTuLqYuTiEBJ4zCgx
  a9o3VgjnOpPE/YYXQA4nkLOXUWJjmz+IzSagJjH91g2gOAeHiICexNV/oiBhZgEViRe/e9hBb
  GEBa4k1P/YygtgsAqoSt15MYAKxeQWcJPq3zAAbKSGgIDHl4XtmEJtTwFli26Ej7BCrnCQ62n
  pYIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRJ7ZvUzQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJhVlpmeU5CZm5ugaGhjoGhqa6proWhrrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEhm9KMUvsDsatfT/1DjFKcjApifLePMOaLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCV+AJUE6wKDU9tSItMwcYSzBpCQ4eJRFeCZBW3uKCxNzizHSI1ClGe46rV67sZeaYOvvffm
  aO5WBy5te2A8xCLHn5ealS4rypj4DaBEDaMkrz4IbCYv8So6yUMC8jAwODEE9BalFuZgmq/Ct
  GcQ5GJWHeLQ+ApvBk5pXA7X4FdBYT0FlBu5lBzipJREhJNTBJr/mj+c/2wzcbH2ld1ru/2flS
  Xs+elD/10s9Zuo0fn8+et8HXffGvHK4vE60SooyEOh5YZfut7HdpNLl0co3pu3fFl1cd5T8/p
  U5N8c3F2m9bCiolPvpdzIm493zKubnf3H8w8oT/bfLJ2NKtU5u36YyX8Oz2eS9O+Um83PC5jX
  k2p07eildX9bO3du1T2Pbu2Kv1Hd+vcvU+EW0SZrP/e+amz9VZ11wuNqxcf+fptPmnPS0i/1z
  cuXRRYuZBnvDb0Qcu/W00M101f8+pStsLLfUrhFr//1ha/s2Xc78w37EVvZfE3J17LWb82yT5
  +PtWAXeXCVOT/3ZWstfsOrtQafkhe56tjO+5Gg5+i/SY16zEUpyRaKjFXFScCADfdpjieAMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1661330804!19867!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14345 invoked from network); 24 Aug 2022 08:46:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Aug 2022 08:46:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2887C1000E7
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:44 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1C10C1000CE
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:46:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 24 Aug 2022 09:46:41 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.67.0 -> 0.68.0
Date: Wed, 24 Aug 2022 16:46:15 +0800
Message-ID: <1661330777-13307-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
References: <1661330777-13307-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:47:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169791

Changelog:
==========
New features:
    context: Support (NEVRA forms, provides, file provides) including globs in the dnf_context_remove func

Bug fixes:
    dnf-context: Disconnect signal handler before dropping file monitor ref
    Filter out advisory pkgs with different arch during advisory upgrade, fixes possible problems in dependency resulution
    Gracefully handle failure to open repo primary file
    Fix listing a repository without cpeid

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.67.0.bb => libdnf_0.68.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.67.0.bb => libdnf_0.68.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.68.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.67.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.68.0.bb
index 69255c5a57..86cf41c102 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.68.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "1742be5225b3a4928707696db8c69391def55f5a"
+SRCREV = "388e7699f8a75fa81aca05d09389acea7e489168"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


