Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC2AC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:05:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.20402.1646057133800991742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yh8oksIg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646057132; i=@fujitsu.com;
	bh=m3nKNJi5WXG+ZaqgS13DBJZj3e97bvgQQ+HuE52Y3mE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Yh8oksIgXgb/4XHVW7xUD7c7a4CjuZpVpbI+x9K85xYWLkDTQKYzmXAT2Jtnu3rBF
	 PTlTKRA+44hZ9xd9HkbjC5RAq0PCVypXQ+je8MNimmL31so7tkLtCZPjuH8Tv5gR68
	 xm8NJgcAi3bZqNF8xAUtoDy02BqfmUCpoMAbvw2+6PlRGIWlWL40H2rC0VXOyUayWC
	 JiWIni46YOoBp6Bb6Z/WDEOVg/u8zHCjtyTXksfzHBG73LiWi4F0vtH38m0IV+x3Nt
	 EmyoU9nuDzPhLgI/xpYEOitJRIrq653L6ZN3Ex7ounb+/djh6kZXZ1tHaMknNGblgT
	 1eOjlR7lnz7cw==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 65/EE-25243-BA6DC126; Mon, 28 Feb 2022 14:05:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MRorv6mky
  SwYTTahZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bpf9NYC05zVryb9IKxgfEcRxcjF4eQwAwm
  iVvP7jBBOCcYJW4unsjaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfPewgtrCAlcThv
  uUsIDaLgKrEtd7JTCA2r4CTxPutH8HiEgIKElMevmcGsTkFnCXOrv/FCGILAdU0vupkhagXlD
  g58wkLxHwJiYMvXjBD9CpKzL7cDDWnQmLWrDamCYz8s5C0zELSsoCRaRWjXVJRZnpGSW5iZo6
  uoYGBrqGhqa6Zua6hmZleYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzA0
  U4qdl+1gfNf3U+8QoyQHk5IoL2eXZJIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7OYzJJQoJFq
  empFWmZOcA4gUlLcPAoifA+vQyU5i0uSMwtzkyHSJ1iNOa4euXKXmaOGyBSiCUvPy9VSpzX8i
  pQqQBIaUZpHtwgWPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexFkCk9mXgncvldApzA
  BnfI3WArklJJEhJRUA9Py3HKrLc6HY3RaFWQ3SfX9XPrOb+4D47OnDvPMOeucXe1wfYV/wwzF
  2As3a2dtPsp25/ndB/ylnVWhR6b4807edjVZwknm/jw55Vclb+qWx3H+7eLgtlZcys5UdmTFW
  s0pJ6Ted214K3zu/r7a3zMYbm9W1TOdp2yxwXyGTNvpzQstjzprSn97+MBcVGLThLuy7zzXXr
  3Xf9lekKlwoYTu/dNffXJmqYbXPTI7X1bLfa1gzb6td2OZLwatzHooveZw9JykPavZt90s0Ts
  9werH/u5v/IIuTOliH689P6RmGcR079PtZR9P8XzJL3Qzjbv+OjPaNU3GIEt4meOj/LY+k9sl
  65pOPMmdpd75r/S9EktxRqKhFnNRcSIASfVxBloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-528.messagelabs.com!1646057131!31499!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11547 invoked from network); 28 Feb 2022 14:05:31 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Feb 2022 14:05:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21SE5QkA014971
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:05:31 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Feb 2022 14:05:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libgit2: upgrade 1.4.1 -> 1.4.2
Date: Mon, 28 Feb 2022 22:05:11 +0800
Message-ID: <1646057112-35964-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646057112-35964-1-git-send-email-wangmy@fujitsu.com>
References: <1646057112-35964-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:05:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162497

This is a bugfix release with the following changes:
====================================================
remote: do store the update_tips callback error value
win32: find_system_dirs does not return GIT_ENOTFOUND

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgit2/{libgit2_1.4.1.bb => libgit2_1.4.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.1.bb => libgit2_1.4.2.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.1.bb b/meta/recipes-support/libgit2/libgit2_1.4.2.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.1.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.2.bb
index da33893b97..88bf5a8520 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.1.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "fdd15bcfca6b2ec4b7ecad1aa11a396cb15bd064"
+SRCREV = "182d0d1ee933de46bf0b5a6ec269bafa77aba9a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


