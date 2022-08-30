Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73FDC0502A
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:10:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.7858.1661832589896681635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K/3pS2NJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832592; i=@fujitsu.com;
	bh=rJa0x798cQKWamlxe3Gk1Wi4tGh0tAUf3Ex5dtCSoIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K/3pS2NJlDN54n6KFPOdoscH7x61rhwogMCZOIh57d2OxzapSpgUwx3cNi1La+On5
	 v+DvyWV4OaU1HL7Ylkn96Q6Eql3d3d3xUcN1fuQxAxmCpMNAhGYzm28gln2C6DksUQ
	 tQVQL7u4ideGANz6o4npDsupBITAY6GIdg4bcdNlx/PTt0bXmA9hjBIJwa6iFyr0qL
	 4HsZ7/Q/IWf8iFkRI/xQBE8Be5BUVpbvnX37rhuNiuborkjDDxQ/yxsSK/bRMci1zV
	 eATGkD6uH2PDfeWhumEjVGEFJ0zKUh4GGlLPE/N0lUDLc0okatd6ikZzBvGU566FfD
	 b5sDGKqaTJoDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWbe/lzf
  ZoO2JocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFt0i/2gk0cFbP+WTcwXmHvYuTiEBK4zygx
  c/VKJgjnMpPEuw3P2SCcvYwS7b93M3YxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAjcT2xhZmEJtFQFXi1ZK5bCA2r4CTxLrtL8DGSAgoSEx5+B6shlPAWWL11VdMILYQUM
  2mFytYIOoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRJ7ZvUzQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpb6BoZGuklVukm6qWW6panFpfoArnlxXqpxcV6
  xZW5yTkpenmpJZsYgUGcUqx2ZQfjnlU/9Q4xSnIwKYnyLmzlTRbiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwXu5GygnWJSanlqRlpkDjCiYtAQHj5IIr3cXUJq3uCAxtzgzHSJ1ilFRSpx3Qg9QQg
  AkkVGaB9cGi+JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5N4BM4cnMK4Gb/gpoMRPQ4od
  LuEEWlyQipKQamFa81qgtWrrvUX6Y+54z3F7Sdw+72PlL7rcwXrWN9e6rE/8zdWua0uPnxnku
  L6/fvLXE9dKkqpqQG+ECTrPvHp++quLolqsXJrXwXSsMdztSM8mS7cjsFFbtrw97DquukDot1
  fFbfOaZuG8WT1x16zbcP6mYrPuFsyU+5sEJl8235wTNLw4JtJBaze0VZql7ynNy/7XZS42d90
  3V0qu2cEiuLDOyqTkXc+Ou5x5Z+YPC/drb6mZezmdjm3vIx/RDfHCPzLTolgUyIVHLrjW67Xm
  xs3HzhmWxF3ylb80LzCo7PN9+kZxU8dL14imrcu+sTvgSfLee22un4iQx/TVfJfu1O8VVRVZ3
  dHZlJ675pMRSnJFoqMVcVJwIAJVGtrhdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1661832591!398828!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16669 invoked from network); 30 Aug 2022 04:09:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:09:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7F5A67B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:51 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7275073
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:09:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] liburcu: upgrade 0.13.1 -> 0.13.2
Date: Tue, 30 Aug 2022 12:09:20 +0800
Message-ID: <1661832561-12506-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
References: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:10:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170050

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.13.1.bb => liburcu_0.13.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.13.1.bb => liburcu_0.13.2.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb b/meta/recipes-support/liburcu/liburcu_0.13.2.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.13.1.bb
rename to meta/recipes-support/liburcu/liburcu_0.13.2.bb
index 66763349d2..6ecf2e21c0 100644
--- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.13.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "3213f33d2b8f710eb920eb1abb279ec04bf8ae6361f44f2513c28c20d3363083"
+SRC_URI[sha256sum] = "1213fd9f1b0b74da7de2bb74335b76098db9738fec5d3cdc07c0c524f34fc032"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.25.1


