Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B504CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 12:43:41 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.16070.1756039419177245152
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 05:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UMPvRElC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202508241243342f684e850af76f2210-unkjx2@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202508241243342f684e850af76f2210
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 14:43:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=I+xd89LidzMr44c0Te511XCesbtKd3A6Wmm9GitbQUI=;
 b=UMPvRElCzG75jrtpEi58YXtMbhJ49Nxcovukof2A81sNdww63Vo8+6tvupXUYGZT0p8JDu
 M9wZImaOKuZdgByNAMF4qzlvVC+33aRWzllTFX3nga7b0qFgipLrIlByOihl6VqTVs4IXu4b
 hve0scvqJZcSx86koi0hWrFG5y2VKDYSs8i/sj/6mmqHkvCQn54LL5tN4pOM4+pNv6/K4jAR
 PR0ze86E+ryvcETrHOQSFxLzqUSRWS+VBQgumLBA3vr3uGEzqdNmjXOmMKJuDLLqwFtt84+D
 vcK2PZkWL/9rYiKAuGiwWMq5RzpKPsvv2Q8hA5o8F8qdDR8lGMEuEd3A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 1/2] binutils: set status for CVE-2025-8224
Date: Sun, 24 Aug 2025 14:42:47 +0200
Message-Id: <20250824124248.1093100-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 12:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222370

From: Peter Marko <peter.marko@siemens.com>

Commit mentioned in CVE report is already included in current hash.
Can be verified by trying to cherry-pick.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 32928ee167..67ced2863b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -19,6 +19,7 @@ SRCBRANCH ?= "binutils-2_44-branch"
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
+CVE_STATUS[CVE-2025-8224] = "cpe-stable-backport: fix available in used git hash"
 
 SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"

