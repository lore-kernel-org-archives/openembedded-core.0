Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339A6C352A8
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.5010.1650605985676527066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 22:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cBNdZyWU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650605984; i=@fujitsu.com;
	bh=BbbeYhXASyvWWxDByhJ4MAFXsxGY7nJesrwpTstJ6rA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cBNdZyWU5FCiKCmqczayHCnCcfmTDkG0ml/nvV7TRXMQK1acEwWiXJWah6Vnu9+Ry
	 hdjfvzj5LpmjydCCH957yNboDDj77NTnG0DaDBswkjdUTo80TjyelREnqMMI7o6EC0
	 pnGwL4JIjSP7ZfvqN+rNGZN60I4qpu2/Rq27G6vmK1mrh5Wt9cHPkpGdKLTLkLYCr0
	 WXTZWTIv8BKSmJG3ID7/xdRw4/P1tTdTUW1ZrMn/1UvCTYwMRNQ5pKJPCike2pq7lR
	 xC/qk6WxV/NqOsK+4LAgDBBashSu5cmFQN+NQzvzacjhb7f61hHdVMxx6Q5l5CujTk
	 g1usv5TGROdjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSXe+fVK
  SwZ+bkhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8amY03sBYc4KuZc2c3SwHievYuRi0NI4DGj
  xJsrb5khnPNMEn1rVkJl9jBKrLjwGyjDycEmoCYx/dYN1i5GDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgJmEms7JoPZLAKqEvd+zAUr5xVwkujaWwcSlhBQkJjy8D3YRF4BQYmTM5+wQIyRkDj44g
  UzRI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWM1klFmekZJbmJmTm6hgY
  GuoaGprrGFkCmpV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBQphSr5e5g
  nLLyp94hRkkOJiVRXtNziUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhtbZOShASLUtNTK9Iyc
  4ARApOW4OBREuFtNwNK8xYXJOYWZ6ZDpE4xKkqJ81baASUEQBIZpXlwbbCovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmPcNyHaezLwSuOmvgBYzAS126UwEWVySiJCSamDKPxnk21zDMFd
  4++HEMKZdNz6sOe1/7cTaH9vZu3757BB5XnDZ3Cho+gbDvdM+5AnLf2C9LaYpKhmR4bU3svH5
  uWe1e6bHNKfblB1Tdk7+mSh3duWhPVMkjmrFb7rqFnmR4d9Mw/T1F/6/WVan1T9HmcN2f+XiA
  h/JQpH1kfliV2Ya3G5gn1Los/mnTPZ+39kf5rm/aTlQe1q1LvTL4+sTC000b0k8/c7C+in+tl
  RN+P9sVrvIr09WPVmxTnTCzOiKOX9Td8+stNx9bs/byHS+p0rLY5dv/frvWJVA3qt1rJUb9hw
  21Z5ZqmT3W3PBl32fpnZECUiJe69/NPPBP+5jZZe4LyVw/mrk5hMLmMGYqMRSnJFoqMVcVJwI
  AMKmXhpFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1650605983!179656!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31020 invoked from network); 22 Apr 2022 05:39:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Apr 2022 05:39:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 03A4C10046E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 06:39:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EB4B0100467
	for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 06:39:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Apr 2022 06:39:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] apt: upgrade 2.4.4 -> 2.4.5
Date: Fri, 22 Apr 2022 13:39:12 +0800
Message-ID: <1650605953-10177-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164775

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_2.4.4.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.4.bb
rename to meta/recipes-devtools/apt/apt_2.4.5.bb
index 9faf1e7ea9..95c25e3036 100644
--- a/meta/recipes-devtools/apt/apt_2.4.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "d6d83d122ddd7cc83b2c2f839a55940c13ab93e5cf6024a010d6a6b4110dcf0e"
+SRC_URI[sha256sum] = "5552f175c3a3924f5cda0c079b821b30f68a2521959f2c30ab164d2ec7993ecf"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


