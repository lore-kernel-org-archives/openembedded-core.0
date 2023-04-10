Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D93C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:34:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.40195.1681119278107769902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v5tCr6QO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119276; i=@fujitsu.com;
	bh=g+ETgIhLhmqPv9KrnSFdkVpiS3RlVDk8HWoOUNby1Bo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=v5tCr6QOhzEmDyQDzC1O6kp2dSzFhGPF2T69mbeT+wDA5//B20LHov37FgsRM4/0h
	 SJ4PC7nuOAXmXtmwQlOCW9JwmS/SWLNvs6tL8HcyiYnrhderr7lCZc2ChckhPv6R+R
	 2ulxxIuPhflh4oPDyKbSssmEXFCljgccBujXFuhrazeDkb7nK31qttQa/yYMwkHcJA
	 FPUyAFqu4FDAMRFKOzKzhVUMhTGep5oPHvOoW5Mxk3WkYFkZWcT2eQB9pT+Ib3eMwC
	 EurW0EnOD543F7CDofJnUcuPF28AFRzmJmIsXiWAoaL+ObhUOlOgPTekFRvj4nG2xt
	 2YVff96G5AGCA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSVf7hnG
  KwfQ3JhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b8HzdYCy5wVkzes4itgfEsRxcjF4eQwGNG
  ib531xghnGtMEovvX2aFcPYwSpxe9Z+ti5GTg01ASuLGfRCbg0NEQE/i6j9RkDCzgIrEi9897
  CBhYQEbiQ/djCBhFgFVif4vR1hBbF4BJ4kFrxewg9gSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI1NNBLKsp
  MzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzFlGJF1h2Ml/r+
  6h1ilORgUhLl7eIyThHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwctwGSgnWJSanlqRlpkDjAuYt
  AQHj5IIr8Q1oDRvcUFibnFmOkTqFKOilDgvx3mghABIIqM0D64NFouXGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKgnznrkINIUnM68EbvoroMVMQIu5XAxAFpckIqSkGph4n3BbHdjS5HOm6q6
  XwY453z4INaTq3T9Ru3DT1/mOKwq81TXu+fXsSOOLl/c22zTzgMgeiYu/zi/V9N13/+HCJYEM
  qSZSAQVb/74Ljs7d+zm19lduU8lUS+Uq1TdnrH5K5Qien3FD8ODca6/Ob7jqKrpK4udN36dXo
  tqtq4/G5vtsFZZeJaomyb91Vf1TJjG3CfFnWyPP2uzqNY9I7Nug6Wifb/5fUvBVIrPzHg3rlD
  1Tls5ptV7Zz1Su0Lb9Kdv8xt9pK30z/Eu4TYMF2u0rftQyW5u+qH+le+Eby4qWF8rPzrSnLlt
  +LTN1+8JQh9o18SHOr8uWWl/NusokeuDdqutSVxNr/r5bnTsjUUqJpTgj0VCLuag4EQCAw5F/
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-571.messagelabs.com!1681119275!197187!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29317 invoked from network); 10 Apr 2023 09:34:35 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:34:35 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 92C6E100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:35 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8596B1000EE
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:34:34 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wayland: upgrade 1.21.0 -> 1.22.0
Date: Mon, 10 Apr 2023 17:34:12 +0800
Message-ID: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{wayland_1.21.0.bb => wayland_1.22.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland_1.21.0.bb => wayland_1.22.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.21.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/wayland_1.21.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.22.0.bb
index ce59e601d2..26bad580eb 100644
--- a/meta/recipes-graphics/wayland/wayland_1.21.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac"
+SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


