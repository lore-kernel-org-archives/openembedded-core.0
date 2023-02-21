Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E8C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:20:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.38687.1676974831390896456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RLjegm9+;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974829; i=@fujitsu.com;
	bh=xjpMpSFnHM8avMxfxqEtI8/oS8Mo9UyB/Y7M0LPxc+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RLjegm9+cFiP6+JUXvQSnOPLEtJWz+wcnpLmzB668sXb6aa63ENkZT119Q/gFrVo4
	 8VSL0z6RMlGV0wEo4E1PjpPBf8D12A3rqdrb8toTNf7G/Y3+7rmTElN3JPhfem2Evd
	 GKZ4dIGVdxGRUahyKWSl3ck3Cfq+/7hA9zz2F0EJQO3dCvbyjjdxGXR4nS8IjyUYdn
	 jIlkJHdwtwVg4mZeqpBUTyJUXo/yWa0mSTMO1DdjQHCEyJ8tHrHfn7FcWrza49ReWH
	 m1jqek+3l+Pz3Svg4LwR0ju+0zcxJTPYVcLl2J4/9B635vKWroxoFkCVTHL7C+gu4/
	 WxvyBZPtPAaxQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpPt21pd
  kg94VPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJFdvZC15xVbw7mNfA+Iqzi5GLQ0jgAaPE
  x43P2SCcK0wSWxp3MkI4exklni/rZuli5ORgE5CSuHH/P1AVB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQF3ibZJ65hBbBYBVYktp/eB2bwCThKff0xlArElBBQkpjx8DxbnFHCW+DjhECuILQRUc/
  LkUjaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGJnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgaGbUszIsIPxed9fvUOMkhxMSqK83059ThbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  es3/UuykGBRanpqRVpmDjCOYNISHDxKIrx1XUBp3uKCxNzizHSI1ClGRSlx3tqZQAkBkERGaR
  5cGyx2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p0CTARCPJl5JXDTXwEtZgJa7P7jA8j
  ikkSElFQD08VXpZ2uIY9mblMLKWV/Wf5td0Hz+oW72ncwq6aqlajliK3JsEuWXeLXwPZr376I
  VJ3zh+bx/rwqN32O5UsRLXNRq0e5EoIxaX4H/m3OjKxUXl4X6c2o6P191kcBvQZHpxUxFc8Ey
  uYdfMsc3PaiOuHDnkmBOyfI6kc9if18amLJlylfjfclTZm9kOPV7N0p6zy23KtQXt91y+p4yX
  GhGaW2J5r8Wl59mJqxr8hy3U/Ln0Xy+TtfuQen2G67ud9EeWXLIxcf9mdijd5yglpCfezCLwu
  CvLU4frFM1w+z+7jDP6uJ+S3TBwuDdHeODfPMSnbv0zh8mz3zheuRqLbHVmKtRxaslO31vPQ6
  S0FEiaU4I9FQi7moOBEA+NK9fVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1676974828!103118!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17874 invoked from network); 21 Feb 2023 10:20:29 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:20:29 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C90F61B0
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:28 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id BD2781AE
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:20:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-setuptools: upgrade 67.3.1 -> 67.3.3
Date: Tue, 21 Feb 2023 18:20:00 +0800
Message-ID: <1676974800-24948-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974800-24948-1-git-send-email-wangmy@fujitsu.com>
References: <1676974800-24948-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177489

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
#3820: Restore quoted #include argument to has_function.
#3827: Improve deprecation warning message on pkg_resources.declare_namespace
        to display package name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_67.3.1.bb => python3-setuptools_67.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.3.1.bb => python3-setuptools_67.3.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_67.3.1.bb b/meta/recipes-devtools/python/python3-setuptools_67.3.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.3.3.bb
index ef759c8bef..053b671e2a 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.3.3.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "daec07fd848d80676694d6bf69c009d28910aeece68a38dbe88b7e1bb6dba12e"
+SRC_URI[sha256sum] = "ed4e75fafe103c79b692f217158ba87edf38d31004b9dbc1913debb48793c828"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.34.1


