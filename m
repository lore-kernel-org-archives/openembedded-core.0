Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D700C54E71
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:22:14 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.1142.1747772529913649848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Y4TTeMKO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250520202207f7f75bc2bd4627664a-nyp9c_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250520202207f7f75bc2bd4627664a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:22:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8HlConhfNC0pQsdoKMS4ve+atTSnID7W9wHIz7ZSgG8=;
 b=Y4TTeMKOtt9741vKqwUnEHdt7sr1jb+aAr5mLYNvSpGj79lNF72rbRCttGnIBzBWlLxVhB
 lOJX23Q9tehtpd8G/tk0v14Iq1LBvlDbauJCT1klhn+S+2x/0B+scJT1K34rDng4KneZDbz0
 wJnV9bi10HPo1IkAIw3f/ezZAOVV40bRZaUy4Lubc0lLFfqCT4QpslziTWueexmO/i/vOSmM
 uuxSj3/JiRWMrJEHWpS1b4WAG7HkCUMtaK22Imnayx1jVkBeqA8+Q9Hy+jpnGdXigHtoNPgh
 hkN8GNG8q3dffCnEBoqWoDLXI2v4IK6m3NZq2ErraUeEj2FPBfp2yYPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][walnascar][PATCH 7/8] binutils: mark CVE-2025-1153 as fixed
Date: Tue, 20 May 2025 22:20:32 +0200
Message-Id: <20250520202033.2352749-7-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216949

From: Peter Marko <peter.marko@siemens.com>

We had this CVE patched but the patch was removed with last 2.44 branch
updates as it is now included.
Since there is no new version which could be set in NVD DB, this needs
to be explicitly handled.

(From OE-Core rev: 32f18145dee54f61203506daef339cd132908287)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 41071fada1..28100abbe9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
+
 SRCREV ?= "819d713b6340ed3657e00ad0bc8d5f2b73094a0f"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

