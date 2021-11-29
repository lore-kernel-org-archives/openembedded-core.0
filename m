Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B5AC433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:01:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.62234.1638198087642667438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=edUvGQbJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638198085; i=@fujitsu.com;
	bh=4MAa7klw/KB5ibus/jmJZgg2rDCNIS6025n4pXNsE9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=edUvGQbJRljSdO5JZlhX5tdh38fnvW12ugxrWMYAOplVMUh8ksKxR2Qd3LVIdooMg
	 0YvKV1h+LWaan2tA5XSxBpOlOfC7ugdT7AkDbLta/XrF7OPCUbbtAK0wMlGgxDiaep
	 PxDdons2rGa1sQIEEGsaYaIvxWr7+9Kp7Zd1fb9zrzdOec9y51bfr27GjzYASl+l+u
	 q75nY2R6AfTFC6i93vwcFXSZcf2eqS7GNe3bk0bBcFWst/x+XcApvmjyQsiHeUiph/
	 rp++45hsHK653d4VAvS0PLbFUzMmZRwfX10Kbrc7xMbo9MFvCxwunYseO7BywEsjgV
	 ch3BVN4gHgTUw==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 6F/C3-14731-54BE4A16;
 Mon, 29 Nov 2021 15:01:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqOv6ekm
  iwdo2WYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPK0i+sBa0cFQ/7jzE1ME5n72Lk4hASeMwo
  8fDabmYI5zyTxIr7r1i7GDmBnBOMEmeWaoHYbAJqEtNv3QCKc3CICOhJXP0nChJmFlCRePG7h
  x3EFhawlrh+4Q4LiM0ioCpxYNItFpByXgFniV3fBEHCEgIKElMevmcGsTkFXCQmXLvJDFIiBF
  Ry4iXYRF4BQYmTM5+wQEyXkDj44gUzRKuixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMVklFmekZJbmJmTm6hgYGuoaGproGukYmxnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIHhm1LM8HkH44K+n3qHGCU5mJREebOWLEkU4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMHb/wooJ1iUmp5akZaZA4wlmLQEB4+SCG/xC6A0b3FBYm5xZjpE6hSjopQ4ryhInw
  BIIqM0D64NFr+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzqoBM4cnMK4Gb/gpoMRPQ4rd
  LF4MsLklESEk1MJXc6dp1Rz+hsZXz2n7ec/VG9cW390VzVLCHnKzPzv6ee/R5322p8rfHLnTO
  EORsmL1A87pEXEil85meuLtrBRonmYUZ23zZem5G2SbWBS6Wl4JKk8PmXvSertBcwu9W61x0s
  /xc7obkSY88zXVvvE7dZ3Wxvrs7ZNfqvREfS5c8/3hdu1DaTWbznVv7di0uMFm4i8+v3EQs4j
  eDdKvZlJNdmvEBu9a/f5QR+aXr1xYbV73Th2406Ab3Jyk6MS0xSV3X6fxi1ue7Sv+WH0lam+y
  fotq0RasuWCT72MSXCW0nKy0PeDtkBDhOmjCltKqhJGjWJYneoIU8GeekA15f0Rf9GW2TuUNk
  8rV9LvJvlViKMxINtZiLihMBieAktloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-591.messagelabs.com!1638198085!20864!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 909 invoked from network); 29 Nov 2021 15:01:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:01:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F40A91009E5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E57D410023B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:01:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:01:06 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.35 -> 4.0.36
Date: Mon, 29 Nov 2021 23:00:53 +0800
Message-ID: <1638198055-118993-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
References: <1638198055-118993-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 15:01:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158948

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.35.bb => mtools_4.0.36.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.35.bb => mtools_4.0.36.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.35.bb b/meta/recipes-devtools/mtools/mtools_4.0.36.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.35.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.36.bb
index 61e98bb0fe..c214b9b859 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.35.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.36.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "34769e173751d2f0d891a08c76c80427e929b8ee43438019b8666cc3d7a44749"
+SRC_URI[sha256sum] = "e5c0e5adf2dfbb9f72649d3a8299ff6fb73f269f8330a2975d91bcc5055240f4"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


