Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B370C54E92
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:22:04 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.1106.1747772520386310440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CnV20HCX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2025052020220255a91aede5b07f93cc-perrdm@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025052020220255a91aede5b07f93cc
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EbFpGqrcoQfaZAvQWtCk29wkcTwux/7bK1Tndalbg3w=;
 b=CnV20HCXzubam2Jogrut0jcJQcDnTHukMMVEotKio0QfL1ri+L4SnMZ6rUpXQbgKwu0rjM
 tdMIkgHjXjuJPEE9G4+G1mmWJ6+IwdFHkoFI/APf3OKtA+aWpgnUpa1m641d+qO/xqQzPPh5
 pI06wJffESOwi5d++O1B+8WdjrFQn2koA1DHw0+0tUPGgHLbKo6yVPktn8i1qt2YaMMFoPqW
 VU1Biy9SINaq+FfAB+E4I1PAvdqSVf6OtxXbPQPG8NHtrsLQUisDHLQAZ0muqEEUzVprKpPe
 HKZm8qKSJK4/bHfjQh6n4rHQLibwZkj4vIEYmb0kL+Bdckr7QTpWNH5Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][walnascar][PATCH 6/8] binutils: drop obsolete CVE_STATUS
Date: Tue, 20 May 2025 22:20:31 +0200
Message-Id: <20250520202033.2352749-6-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216948

From: Peter Marko <peter.marko@siemens.com>

NVD has CVE-2023-25584 listed as < 2.40, so we don't need to ignore it
for version 2.44 anymore.

(From OE-Core rev: eaf80096f96e5bebed53076c1dfe7e35e539f383)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 7a19aa31d5..41071fada1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,8 +18,6 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
-
 SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

