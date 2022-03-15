Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAF9C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 10:51:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.9225.1647341504138042999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 03:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BHR/6yEn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647341502; i=@fujitsu.com;
	bh=kjpMlsJ2jMJixv/ZhsXWo98UjrqSy+YwotG96FQRjuM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BHR/6yEnt4J9aUw+Nlr1kxTNiAYGDu8dtJfREKt0Q3u5VRfddlWxHA1BtCxoLJuZ7
	 8v/0qYUg4FUHpyrj2v4N8nMfnLwihgDU08ZwgJWDew4Eb2iAUws714YHnoOXmRNmo7
	 LU5P1DzhIhVQld8FVdNT/qOFTCCawzgaaGIdoCN0i2swgI8cALjFpAm0P81jCWGrhF
	 8bT+1O5ZWf1WdAkdbvbWX169MYTXCJXXF+sl038Ppn/4e5NzN6d1deKuburchUxjeL
	 OHSlmRPAKsl5RC0N5HJyXw7eIoh3K9RNuILWu9gKTGT11xzfeQmzq1Q2sgw9+KXvFh
	 RkDggiENqbR+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSXdfvkG
  SwaaVTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b5jsXMBQfYK1Yuf8nWwHiTrYuRi0NI4DGj
  xMRpr1ghnPNMEgc7f7BAOCcYJbraHgI5nBxsAmoS02/dAKri4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAhsWbraWYQm0VAVeLgultMIDavgJPE1hNnwOISAgoSUx6+B7M5BZwljuw4zwpiCwHV7F
  twgx2iXlDi5MwnLBDzJSQOvngB1asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6xrqGlpV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmAQpxQzH9/BOKXvp94hRkkOJiVRXhYRgyQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErxBuUA5waLU9NSKtMwcYETBpCU4eJREeJenAaV5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz
  8vVUqcVyYPqEgApCijNA9uBCy6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5u0HmcKTmVc
  Ct+kV0BFMQEfMk9YDOaIkESEl1cC0qXBxxY56zp4uFZEc23JB3+c3J8xYoCm+TmzJxaobAvGX
  3i695pO3vsn0hej7a9pNZ2/XZvhq3zt/K9xI4sRCj9MO/1hOtn2Nk4u9IL5X2kQ2/vJb9VMZT
  DKBQjv3TDtbulhJ7v3c64acXJ1LHyzL5PfQ3s80Jc31sJ9sw5b/Uibr+69cb62IFJqi2f70Q9
  cJkTud5/NNNdojjBf9vqG1Q1ajb6919afrfLy+Rl0PTkwI+meud3oX/5OZZ7qWSx6JcTIXlNV
  tUL7rWpG/teHVzgSltx6rrMt8Z8/NX7AubLO4xbUthzafOMUQ/U5SW0Ns2lrvun2am982MPLf
  s7vIfaPnfOBcJ6FIm83PtvQpsRRnJBpqMRcVJwIAHoIrz2kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1647341501!10896!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30151 invoked from network); 15 Mar 2022 10:51:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 10:51:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7F9CD100446
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 71DD6100344
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:51:41 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 10:51:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.10.0 -> 4.11.1
Date: Tue, 15 Mar 2022 18:51:02 +0800
Message-ID: <1647341464-78625-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
References: <1647341464-78625-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 10:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163229

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.10.0.bb => dnf_4.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.10.0.bb => dnf_4.11.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.11.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.10.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.11.1.bb
index f16e716b0d..00eed0ce96 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.11.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "bd691b784f2158e633072d368579898d740e4347"
+SRCREV = "fba1e2ec93f3d045a874567fd7ecafd606346509"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


