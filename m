Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EA8C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:48:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.4042.1665391677103579465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mAE2M2h0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391675; i=@fujitsu.com;
	bh=KBQoMwTNrvM00vcDNwv1POcj8JbDL+TgUDShdaMhOkw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mAE2M2h0QED42DFEJNarz8Gz97r/WLtH/0+PTBOjfH3r6Xiq10tvsNJ+pipL+48TG
	 te8lOdD0a5HSBTUn/fsWVzvpM+PuIkwC54CQ5g1WB7h+kP54w0Ejb6lHw2wgquFYKR
	 6jyQWXk9CPSXJ3n/YMV1lpnHNSTmNpZwXpuvWU+0x77ImA/8/g+Q4NyVOI1rVU0HfP
	 1fJQX6BUBJ3x/Xcy0AaR6Ekoahg3qZGx7fnWJ9MBnVeDTXUR8YFY7AkVnHJRH7Gacs
	 1se7ZUFkexF0V90aEu9z4E9YtAX9RlElyCfzvYwgWOEldC9iDPzdrGNaP7CYz9ZfVw
	 7fCBzz4P3Ypgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpGt1xzn
  ZoG+9qsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH/zz2mgi2cFSdO9LI1MN7i6GLk4hASeMAo
  cXvpHzYI5zKTxLEnbcwQzh5GiZ4f79m7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52kLCwgJvE6hlaIGEWAVWJBe8bGEFsXgFHiV/vO8FsCQEFiSkP3zOD2JwCThK/JuwBs4WAam
  ZNb2GGqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2yha2hkrpdYpZuol1qqW55aXKJrpJdYXqyXWlys
  V1yZm5yTopeXWrKJERjEKcVq9TsYX6z8qXeIUZKDSUmU1+CQc7IQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCd4nN4BygkWp6akVaZk5wIiCSUtw8CiJ8D64CJTmLS5IzC3OTIdInWLU5Zj5te0Asx
  BLXn5eqpQ4b90toCIBkKKM0jy4EbDovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPc9yBS
  ezLwSuE2vgI5gAjri5FUnkCNKEhFSUg1MQh7Pn3gUvxJ7aGF34oJ37hNRzjMWmsdyXYISn5Rs
  0X89wdZv4dfitI1pbUJcub9efWcQ1/uT9/js3e3Pz8n8E6s6dy3XpP1Giq/h4rQ77yyCymrbF
  V8l35nuf2Lxzpxv68U/5l1Zy33tlcp8y12Tr2gmRx1gSJ4WU1C2hC1XtLo1Q1H90LRQ1vvLbj
  3SLxOSVE+2ndz7SVCSY/7Gx4WbT+nO9fsZlVw+/aXChMzTu88WbWZvDuOtcSwwXzlx/+aP0V9
  jkrIz5NySX/VPtpmVacmkrz3bIZ9njt/xLTqSq/4uF3mtNOHqBFO1LysvbxMMi5u1I9V7+dWQ
  3FM102K0JUW4LsisCvy+kV+N4cEaJZbijERDLeai4kQAtfDHcGkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1665391674!80953!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15418 invoked from network); 10 Oct 2022 08:47:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:47:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 58EFB1AC
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 4D6121B1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:47:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.10.0 -> 1.11.0
Date: Mon, 10 Oct 2022 16:47:32 +0800
Message-ID: <1665391655-8162-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
References: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:48:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171566

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.10.0.bb => python3-hatchling_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.10.0.bb => python3-hatchling_1.11.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.10.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.11.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.10.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.11.0.bb
index a0d41d4b0d..00c4c598b5 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.10.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.11.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "5d31f43dffaf6265c808e1b5353662ffa5146d844278b55caa6c7f74f427ec50"
+SRC_URI[sha256sum] = "a263a8c50817cd2dfcd4dd6d0d55a5ebcb078eeec9858cc3d056314b3438ec8f"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.25.1


