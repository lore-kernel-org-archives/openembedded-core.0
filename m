Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD571C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:19:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.20760.1656562795712674199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v1aUm8t/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656562794; i=@fujitsu.com;
	bh=U93rf1iNgfcE7s1GLRDnQjdalHmOa+32/9iPShoMJMY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v1aUm8t/dPqNVVffaKDZ67Vr58ICukPhVJaJ2YmwwpZ/ROGfI10TFczOU9NvyeOMB
	 7xjkgq9udgzzRxFrBIvHlRewyFpMZlMD6PBM4ATWCznkOR5qxC7ib+IZNW8nIr8Kdo
	 +q/s04OvQ3N0LO+Hks9HBPsaE/hS2ezpJThCJLM7ypLyiQGIVT3O1o2gP6WWgE8OKj
	 38y1GEULR2D0uy1R0uaPKkICSeNBv8IC+QVjKccx+k/7OAC7Kz6RMHYoo2UPKMNtDX
	 SK6cPHzmYDB1f89WTTbGx2ajJeSeXV+axK5GKfu1AehZMhLLi4WW4eh/WEhsfhPuOB
	 9cw/CNjKH7TIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8OxWTdTZW+
  SwYefvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a6SS+YCpZzVJxtO8TUwLiTvYuRi0NI4AGj
  xPVNZ1m6GDmBnMtMEnO+S0Ak9jBK3Nv7DSzBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICjhJzDu0Fs1kEVCWuH/vHBGLzCjhJfP25FmyMhICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5uh6iskZszYxgZhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKprbKpraGGil1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJQpxco7
  djC2rfqpd4hRkoNJSZTXkH1vkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3uNKQDnBotT01Iq0z
  BxghMCkJTh4lER4Q0HSvMUFibnFmekQqVOMilLivBXKQAkBkERGaR5cGywqLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5tUGGc+TmVcCN/0V0GImoMU7p+0BWVySiJCSamCa137s8qeA3Td
  OMedLO9W+Z2gX7S280dno0jhl3xKnZq8l1+dtnpdjdydgqdPnw+7OjzPb/IX7Gj/dleE+LSK3
  S5ejve/8ixlWOjwzz97UcjkXNOv6q8WHWq+UvFnrH6q5/ZsYd7mh5bnlnp+bu3Qkrs5auGW1U
  D/DWyMzF/3tvdMdHm/8eDm3g//VvhiZqxckzM1Tdk45bLzkgZ7y25PbS7ccEXAXWqO0N/oFQ+
  0s0+83tierzoprLrY7e+fpC+mOENOaFZHXHp05nt60g6PhZtuzdfO89OPerVzzju9GNlPM/Hv
  ltV5z+XUTJfw5Z/5vkb+6yqZukd55++Jj5cqCH+b9O3o2alu8dbdM7e9PSizFGYmGWsxFxYkA
  VtExd0UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1656562793!21202!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2761 invoked from network); 30 Jun 2022 04:19:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:19:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EBF1414E
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DF72B14C
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:19:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.20.0 -> 0.20.1
Date: Thu, 30 Jun 2022 12:19:29 +0800
Message-ID: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167391

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_0.20.0.bb => createrepo-c_0.20.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.20.0.bb => createrepo-c_0.20.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
index bc61cac955..d309bb895f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "e53188f86f4dfad46f5b81d6931cbaec19e44ea2"
+SRCREV = "af14e164a3e4ab9dfaef1212e852b9ecebc326a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


