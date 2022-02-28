Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B806C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:05:31 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.19943.1646057128995030474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P/AaVbBG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057127; i=@fujitsu.com;
	bh=j4PojJec4HJYNp1qKrXqLTfIA2pTrR8LLBEnDAppzo8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=P/AaVbBGl3jJZMKE1Sp7Z5lMIxCrw99ikXmpl4fcnmIe+6wqhRa/2R/LOED3MOFdB
	 ug9SPz7zzimeh1mo13195wdagbPgrFf9JTob6kshv2eArHyrk05ODty07ecTXKUmaa
	 ooEPhtqRvKsBlWbQBVi/w4LkuLlxMmxMD+f+TKC6fqIN48e6lz2ws9OKZI1pPrcW6X
	 Ej6iH2kORXiLacMN4vplq8XHMqtj/45/u8EZZARBTahYkoC6Je0rxUFQpTdfB1PZ0Y
	 ibUCCWVyjG0fSAe86+R+SZBm7ttCaZ5XmyXM4GvKLyH7x3Cl+Bw9Lx1RXfWVDtv+Ei
	 Llihljxo4Cdaw==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 0E/77-13301-6A6DC126; Mon, 28 Feb 2022 14:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSXfZNZk
  kgw33pC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxd564yFWzlqLh1toWtgXE3excjF4eQwGNG
  icfb17NBOOeZJOYcesMK4ZxglJizoJ2xi5GTg01ATWL6rRtACQ4OEQE9iav/REHCzAIqEi9+9
  7CD2MICJhL37r5iBbFZBFQlLnYuZwGxeQWcJLYfbgezJQQUJKY8fM8MEReUODnzCQvEHAmJgy
  9eMEPUKErMvtwMVV8hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo11SUWZ6RkluYmaOrqG
  Bga6hoamumaWuoamZXmKVbqJeaqlucmpeSVEiUFovsbxYL7W4WK+4Mjc5J0UvL7VkEyMwOFOK
  XefsYLzQ91PvEKMkB5OSKC9nl2SSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnezmMySUKCRanpq
  RVpmTnASIFJS3DwKInwPr0MlOYtLkjMLc5Mh0idYlSUEue1vAqUEABJZJTmwbXBovMSo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWHeiyBTeDLzSuCmvwJazAS0+G+wFMjikkSElFQDU9Pp1vj
  4gjn+nUqyORvmNT2eIRUptcV79spZy5r5e89UlFkb3OW7r8L2Z0lnwQ5J1Q96Lelr2ib8fhrR
  E7B8vUJItaN4X63VXJHlS4/J1rGusDN9MX+Gmt0nwfPOh+bHsz1krnF0LE07nn1q78IL697UZ
  k/Z+3xZu/nRt7O5iw7syd/jpOaxfPo61oU9QlE5s0+9jg1paK4U38w4cfaJ+wlPbx5e8Pu0Jm
  v53pSkeL/531futg7Y6jhjV15Zbfq0QwqfJ/JUcAlPe9B+0P1GG990Dd4ey5QpLs805mV06H7
  zvevTJuypr9iSe/3s5LLby2abnNj79cL33QvcPpq+TZszYXO39L/LdhU19+WFDyixFGckGmox
  FxUnAgC3x9WcSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-532.messagelabs.com!1646057126!45955!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17645 invoked from network); 28 Feb 2022 14:05:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-24.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:05:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F162F100440
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:05:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E47B4100352
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:05:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:05:21 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.48 -> 0.49
Date: Mon, 28 Feb 2022 22:05:10 +0800
Message-ID: <1646057112-35964-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:05:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162496

Changelog:
==========
 Fix issue with multiple offers from the same DHCP server.
 Fix issue with Base64 decoding and bytes consumed validation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.48.bb => ell_0.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.48.bb => ell_0.49.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.48.bb b/meta/recipes-core/ell/ell_0.49.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.48.bb
rename to meta/recipes-core/ell/ell_0.49.bb
index 6c5d315034..9edd6fc92a 100644
--- a/meta/recipes-core/ell/ell_0.48.bb
+++ b/meta/recipes-core/ell/ell_0.49.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "9894943042a5d6165d3e5cc354f92274fb1304004d02b4bee682ab6067cdbbd5"
+SRC_URI[sha256sum] = "a7ff8ecbc76b187d942dd22b61cb489711400897c790319ffb7e944791687c3f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


