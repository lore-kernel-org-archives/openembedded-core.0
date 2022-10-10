Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479BDC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:39:03 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.4014.1665391135851821750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GPoahKHj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391134; i=@fujitsu.com;
	bh=VPKKxf+WiHHhR63oPFWI0jsigaK6FEW6hLJ8N30jvGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GPoahKHjlMT20GyKyShL7HuFNNDFpz/C7xN+pZbarP/FKaLbWx6FDuuc7578IdPzM
	 mLsxxLR413gXy1sqwisUUqGOLiGWCZfujEVkw43N3qgKyS/msp2eNvarpYtw2LP4xN
	 qUG4wLwgKKgcEYftq5NLbLx61LXciAfpVP22/pEhvzVQZHFSs/IaanB6RDYtBgzUtp
	 0mCO/v+5Vmg1lgnH42saHekGtWmRTSzH90knXQP1binHVHVGDQZSWc93bkYMRncuD8
	 v7iI5OyHWebztzTAFI9mR/iSguITvyIWknS+vSX0lrlq/EQqYkEvu5ErkDqFfvK3+w
	 utd+EK3JtFFIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSVf2lnO
  ywaJlphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8arjtCCKxwVbb2tzA2Mj9i7GLk4hAQeM0qs
  mfSXtYuRE8i5xiSxqdMDIrGHUeLShulsIAk2ATWJ6bduABVxcIgI6Elc/ScKEmYWUJF48buHH
  SQsLGAl8eFyKojJIqAqcft6AEgFr4CjxOnZS8GmSwgoSEx5+J4ZxOYUcJL4+XQVM8RWR4mdO6
  8wQtQLSpyc+YQFYrqExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SirKTM8oyU3MzNE1NDDQNTQ01TXQNTIx1kus0k3USy3VLU8tLtE11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzelGKGzzsYF/T91DvEKMnBpCTKa3DIOVmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO/qq0A5waLU9NSKtMwcYCTBpCU4eJREeB9cBErzFhck5hZnpkOkTjFackyd/W8/M8dyMD
  nza9sBZiGWvPy8VClx3gU3gBoEQBoySvPgxsGi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkY
  lYd5LV4Cm8GTmlcBtfQV0EBPQQSevOoEcVJKIkJJqYNLfGhptLayvs5AxeOK+Lz9Z9pkXZ+Rs
  akuuzYgJMPnflfDE0n6fn0qNo5znXfn86ONblAQqLfhzyzdu2SC030n3j9zSjJN3Lc9oV4Xk8
  8oIfknSO3532ymt1SU1rNy5s/ZEzsmyuCfxV5Rzwf0dnd8N9Yzvf7MsWuops71B4NNWL9Oem/
  MPll+bpK3i93zZJRulK6zX+bXvCtdLO3bOtXfKumc1i+e6jm5Z9LHTwkEmMUHd4pq9V/bwcgZ
  +NXdQUTprLM6+bOH/beL1L6sSJS3+lJ6OD3x/x7Jd9g5P0UGjrGOb+EXiLxSeu7ho1bop8by9
  v6+tPR5176n/0VvsMV2iLR9/3W11zJrLOn29EktxRqKhFnNRcSIAx45YxnEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1665391133!346427!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5610 invoked from network); 10 Oct 2022 08:38:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:38:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7F7231000CD
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7319F1000E7
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:38:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 0.63.2 -> 0.63.3
Date: Mon, 10 Oct 2022 16:38:31 +0800
Message-ID: <1665391113-8040-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
References: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:39:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171560

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/meson/{meson_0.63.2.bb => meson_0.63.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.63.2.bb => meson_0.63.3.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.63.2.bb b/meta/recipes-devtools/meson/meson_0.63.3.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.63.2.bb
rename to meta/recipes-devtools/meson/meson_0.63.3.bb
index 890faacec9..9267077422 100644
--- a/meta/recipes-devtools/meson/meson_0.63.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.3.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf"
+SRC_URI[sha256sum] = "519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.25.1


