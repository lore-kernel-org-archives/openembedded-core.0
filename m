Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61DEC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 12:09:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.11006.1636459781023384241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 04:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Fx3CNkQA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636459778; i=@fujitsu.com;
	bh=0NxLsJMSgVyjln+CtaTyO1nR/50iZoL+GS2I2vsDsS0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Fx3CNkQAp+xAoM/Whjd60zD1ZkeywcmVYtSWdrNifMpNESXE9PbBvn5N+oplUv6dP
	 k98LeCQg+bFG2xTxT0nCk6ahFMHNQzIOYLczCCACLioyMO0QbGHOc/7IVtYVqvclFu
	 H96m02t7mBQn5I/o4EmJ2ZnLKzwMjZL+Ph8Pa9rZ8Vm1s0N0OuLCoctbVj3bRDrATz
	 +Gj1St11uwLhS7V5BDbDnzv+v8cmyWnktvrntrZLKJ7vADubnphGtp9dP5Gg8SLkUi
	 fQeGxVtzDiCCTe/1BedXlxbdnm9VunKReVgCmtzmxBCjtB0mJ+5nJaLDVRfN59W2bu
	 bB4k7lF6TVHQw==
Received: from [100.115.36.144] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 7B/2C-17169-2056A816;
 Tue, 09 Nov 2021 12:09:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSZcptSv
  RoHOCkMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFnXjNjwUyOij9nmxgbGBexdzFycQgJPGaU
  2NJ6mxnCOc8ksevHKjYI5zijxMK9s1m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7h
  x3EFhYwkTj+bQszSAkLUPzfhBSQMK+Ak0TTis1sILaEgILElIfvmUFsTgFnia2T7jCB2EJANe
  unrGCBqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2ypa2hpqpdYpZuol1qqW55aXKJrpJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcXqh3cwvrn0Te8QoyQHk5Io72WxrkQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErx9SUA5waLU9NSKtMwcYETBpCU4eJREeI2TgdK8xQWJucWZ6RCpU4yKUuK8P0ESAi
  CJjNI8uDZYFF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7OhFoCk9mXgnc9FdAi5mAFh/
  80g6yuCQRISXVwMR8Uf2WmunOxn97pqS+LQxhvnNQc8bfruPePxvM7zVaLAouWNm7VWZRnGTJ
  6h75WEO9r+u5/u/4fF2F95ZGtLtcf9qL77sTI7qnqc8o7/9/KP1XxsS4wxu+8/p+nvvPIq9dn
  yuSPZXhxKvj796uKOtf80m/bFYvx5VtGv8YlDPmeivpn0qUP7/gyD+Jtw1d20PcD4nucfJtPj
  HZP/MA26rQYuM5/8SDvRf897q+tJzLOfbHstba3fU7r97Plz6zdN2S+7VmWj5MapurbLenJHE
  5vor4zXZYbNXhiTsmlUYbp058Jzx/9tRDHi9lxU/cFOmZlNU1NWLrhK+8rIc2vwgtn9GxL9rg
  iU9px66DU78qsRRnJBpqMRcVJwIAOIjjH10DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1636459778!270808!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5634 invoked from network); 9 Nov 2021 12:09:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 12:09:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D2227100470
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C596C10045F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 12:09:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.44 -> 0.45
Date: Tue, 9 Nov 2021 20:09:05 +0800
Message-ID: <1636459745-60491-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636459745-60491-1-git-send-email-wangmy@fujitsu.com>
References: <1636459745-60491-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 12:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158015

Fix issue with ICMPv6 and handling re-entrantly callbacks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.44.bb => ell_0.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.44.bb => ell_0.45.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.44.bb b/meta/recipes-core/ell/ell_0.45.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.44.bb
rename to meta/recipes-core/ell/ell_0.45.bb
index d1f1691645..8453720f42 100644
--- a/meta/recipes-core/ell/ell_0.44.bb
+++ b/meta/recipes-core/ell/ell_0.45.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f"
+SRC_URI[sha256sum] = "fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


