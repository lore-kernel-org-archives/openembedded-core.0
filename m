Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D849C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:46:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.3868.1653461174052894137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W5Qh0v6R;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653461172; i=@fujitsu.com;
	bh=8g8PEnk+x5rrim5DwzIeKzboFTMNVy4eNk6AhZBvj0s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W5Qh0v6RbLDZEJYp0XDEWiSpXvSW8+w62Q+FwdGun9l/tVWRbf3oiQsgNvcE+hpZZ
	 54nIUnInzg0AAXX3s5oNbfH77/gQBqjxi7O9+kVpoQQPMjM8E8WXs3Ps4aOkLoeLgo
	 ftgkXCitWH2x1ZfWYk3522a64a2QtfkhoFmeWt3EpGlpMD7Cc7Xg0lJMOaWF0SCMKQ
	 +XqcQN37j1I9h3jsqXaRwnbHy5nS8aHEiGR/U+XOQRsDjb/3ugubvk3CWl5avM+k7y
	 4xu22IC6umoPpgFFV/O46C2BUzpXGx5eYQ0QLr+PfeA5KozZnC1vCPeEgl2LE6FIRl
	 BmuY0tnbMAXvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqLv5Qm+
  SwZbtahZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bLkqusBXs4K2a/ucDcwHiSo4uRi0NI4DGj
  xMsn09ghnPNMEg0ty5ghnD2MEv2z9wBlODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  rASYQEnie5JzUwgNouAqsTZjy8YQWxeoPjPD/eYQWwJAQWJKQ/fg9mcAs4Sr3a+ZgWxhYBq3p
  +/wwZRLyhxcuYTFoj5EhIHX7yA6lWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqS6QNDXRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxN
  zknRy0st2cQIDOKUYoZZOxhn9f3UO8QoycGkJMp7YkNvkhBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3uTzQDnBotT01Iq0zBxgRMGkJTh4lER4f4CkeYsLEnOLM9MhUqcYdTmOff2+n1mIJS8/L1
  VKnPcbSJEASFFGaR7cCFh0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsCTBVCPJl5JXC
  bXgEdwQR0RD4v2BEliQgpqQamvJjtB6bqum6c+l6sXTPr0MQ5iTwM4bNyyjV/zXjNGM15xHzj
  8YvXl2abat29YrhT1ivc3/iHoLVnNW+iRUqQ1krGePX++ZnnQi+qPF4e3vGobxenMI8gf5rEh
  mMXBZ7N1VgidTz4RlJoYNmFk/LetVdOek3tyj/AJX7u66pXx023M73jelzLdr5n7hwPeT81kz
  OWCh9iXFI6JnZ0fzSWn9hjclHovlsjq/2WJSUTLB8dsPBbw3HerL/kj3iZlHK1W/5m4YAJutn
  FG4OULKe8XC5xKZvlEtPtUn97R5mKrsV8SrfFf+YVbp92RV1FMO+B4v7QA6ea/zmaFgYLOEiy
  rOj+asFev1Zk7sLnW5RYijMSDbWYi4oTAZLymkppAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-585.messagelabs.com!1653461171!331308!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31450 invoked from network); 25 May 2022 06:46:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-24.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:46:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F2BD510019A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CABD910004E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:45:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.22.3 -> 1.22.4
Date: Wed, 25 May 2022 14:45:31 +0800
Message-ID: <1653461133-12463-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
References: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166102

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.3.bb => python3-numpy_1.22.4.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.22.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.22.4.bb
index b5b1c4e714..7aa473a7e9 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a906c0b4301a3d62ccf66d058fe779a65c1c34f6719ef2058f96e1856f48bca5"
+SRC_URI[sha256sum] = "b4308198d0e41efaa108e57d69973398439c7299a9d551680cdd603cf6d20709"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


