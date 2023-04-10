Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3946C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:00:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.39856.1681117230337241813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H38h6WeJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117228; i=@fujitsu.com;
	bh=Tm3TaxW/fI27Byc2XHvnwY8aekleNcVgxAoKsEAO11c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H38h6WeJlr4OUXTrzME9gvbMyhaaTdFWkCJXy0zWyIeMz6eDgAqrMPEJXX4JMARwK
	 Nd5wlvVS59S1MTDer9cFinefU3ckTFl1GqwQBcfwKSyyQLLOz6UrB1sWyzOimPUd+P
	 o4Y1wDGMq57EJuaKImvayUzmTYG9gf+UN/uLDNoKNfvLOo7UNbNBDXHfnAqT8tPUnO
	 c/o99tqIeYd0bqSMwHaz4oJip85zaN2U6vZIaue+TdTs7VyqCtmhCVF71zqx4boUhH
	 nkTtofmxJZHNh4EHI49U8DH6Czs3AYqiw+dosSZTtx4gDNREhn8Ob9GxYEc8jhHNw2
	 PxEvusYjgcVuw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWVfrgnG
  KwdnDJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8az+RcZC6ZxVixrvMnawLiSo4uRi0NI4AGj
  xOlVt9khnMtMEjNvr2WDcPYwSnyecZqxi5GTg01ASuLG/f9ACQ4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC5hJ/Jp5lBrFZBFQlVhzYD2bzCjhJXLjQBzZGQkBBYsrD92BxTgFniS2P97KCjBQCqr
  m0wRyiXFDi5MwnLBDjJSQOvnjBDNGqKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuoaleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJO
  il5easkmRmDophSzxO9gvNb3V+8QoyQHk5IobxeXcYoQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  V6Ds0A5waLU9NSKtMwcYBzBpCU4eJREeLPOA6V5iwsSc4sz0yFSpxh1Odq3dx1gFmLJy89LlR
  Ln5QApEgApyijNgxsBi+lLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5tx0GmsKTmVcCt+k
  V0BFMQEdwuRiAHFGSiJCSamBSZmVWzoj5eldbcL3H/Ydf6jSVfW/Nedh1LPL89winVMeoZY8U
  BJ4F8YW8+K/ic8slQURmie4Rjb+WmUdW7XDqmlRofKH6aY3ev0C7M8/ENmgqylQtj+zavONlw
  GqWkrk30iNCvf3LjcQrew4z+HJPvM/k0dt9OLypzKDu/zKJkm0L/2f4vzwSIyHOPiuIq/ON1D
  lBpg8OJTPF41e9n6L1rPy/bsm71bLvTxX4mX+6Z5nUc6rv2cFfGyNOlu99+z2Id8p5le08MxR
  M3K57hPm2zdm/3l1pfdTvUr6eSU3H6pm6MtbNrE5N7Vzbkh7ny/0tP814pt6tAiPFPYFhIp+k
  Hh1dqrJnglfqk6dMrEosxRmJhlrMRcWJAJRzNjVkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1681117226!380814!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6706 invoked from network); 10 Apr 2023 09:00:26 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:00:26 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 71B9815F
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:26 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 65419159
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:00:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:00:24 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.67 -> 2.68
Date: Mon, 10 Apr 2023 16:59:34 +0800
Message-ID: <1681117175-24783-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
References: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179856

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.67.bb => libcap_2.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.67.bb => libcap_2.68.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.67.bb b/meta/recipes-support/libcap/libcap_2.68.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.67.bb
rename to meta/recipes-support/libcap/libcap_2.68.bb
index 008183d9a0..a302c5a367 100644
--- a/meta/recipes-support/libcap/libcap_2.67.bb
+++ b/meta/recipes-support/libcap/libcap_2.68.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "ce9b22fdc271beb6dae7543da5f74cf24cb82e6848cfd088a5a069dec5ea5198"
+SRC_URI[sha256sum] = "90be3b6d41be5f81ae4b03ec76012b0d27c829293684f6c05b65d5f9cce724b2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.34.1


