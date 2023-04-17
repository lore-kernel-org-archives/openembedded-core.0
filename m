Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BF4C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.48707.1681718694124921950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f5JRaxY+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718692; i=@fujitsu.com;
	bh=Sv0T1v0B/5ciHfufSVqvd5MnmrwFCo42f5v+T4sjnhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f5JRaxY+K/t+L/BKmeH+cLTiiViS/5DiNTwiFdLY+7YsF9nO5s7XPyn76QKlog3JT
	 J31rxBWV11sN20rnYc1+qsxAraIl5zi1Y9ijECaYYaxj3WslWjBop7gbNLx8QQpn6L
	 gck+kXevRi+3TzyO2kxGrDg5rS8//ZQlvaXQHyAyyA/SHctZpM2ID9XG/1ahaRy+fE
	 ehWI7mngTHUj5XWffUv/DtPASBglGQDe6a632WVeZLTR19WZDy6PgU6BuvLXCf807o
	 P08SrZfkH2ZbBUZR001sZzozc0bLeUrvwqSeZXOEhwAIRVzQPZdVlUeFkpPcHsYoBs
	 BJy+Zux+dGO4Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqLv4r02
  KwcftihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0Zf1w7GgtecFW82/mBsYLzH0cXIySEk8JhR
  YsUbri5GLiD7OpPE52WHmCCcvYwSX65eZAWpYhOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhARuJ+XOfMoGUsAioSnQdYQQJ8wo4SRw8sp0JxJYQUJCY8vA9M4jNKeAsceLYTBaIG5
  wkli67zwxRLyhxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6UaP3wC8pWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRvDi1qCy1SNfQQi+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzB0U4oT63Ywruj7q3eIUZKDSUmU90WqdYoQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd6XP21ShASLUtNTK9Iyc4BxBJOW4OBREuE1fgaU5i0uSMwtzkyHSJ1i1OX4cOjKXmYhlr
  z8vFQpcd7Xf4CKBECKMkrz4EbAYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFedmCCEOL
  JzCuB2/QK6AgmoCPklMCOKElESEk1MPl57pS4wZRb9Sln4akDB09UvPT9lSq1+Q9bKcvOial2
  lbqnw5KvarxZ3uJy4viEsNaZTr5flWaHbmJoeLMu7b9HBOtLBiXHO+Kc+Qf5v58pDet4tObdt
  2txokoXt+oulzGtqVHX+HVx3oW9XS0b9t05ffn7pLMzFvxgeiluHnN5zqlQPy7e+xtcF/HbyG
  et3CZyjcuj8t+DiJZ3oYLusSK/dlRmT1AtTtyxvurxa7OSqY/S3xqJn1BKm7DFaasyt8Gj+JW
  yHZetxJ4dvRbb/2zJ2l8cp+wS1k/dMue1t5j5XlvbJkmPsitn5h9acUliuvZ89pLN7+c7rmPQ
  3SJW25fSW6syc3KLTIOh142EK6eUWIozEg21mIuKEwElRN/vZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1681718691!221548!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27280 invoked from network); 17 Apr 2023 08:04:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:04:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F06FD1001A0
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:50 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E41C11001A9
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:04:49 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.23 -> 0.7.24
Date: Mon, 17 Apr 2023 16:04:28 +0800
Message-ID: <1681718671-19418-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
References: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180147

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- selected bug fixes:
  * handle learnt rules in solver_alternativeinfo()
- new features:
  * support x86_64_v[234] architecture levels
  * implement decision sorting for package decisionlists

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.23.bb => libsolv_0.7.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.23.bb => libsolv_0.7.24.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.23.bb b/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.23.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.24.bb
index 1256905720..7c8f1fd372 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.23.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "6deaca7cf61ec2b32c4a3b494a751c8d15efbe8b"
+SRCREV = "4d05dca3974156faf2f025ca4a82b68904848307"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


