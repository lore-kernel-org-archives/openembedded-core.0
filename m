Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944B3C369C2
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 17:00:52 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.14603.1746291651840557746
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 10:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=J1HN+jrO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250503170050cf8c4c2b05bd478df4-ua7iqi@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250503170050cf8c4c2b05bd478df4
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 May 2025 19:00:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=R2z7bQkfdlUvFhlcHJaeLNq3oN95Fgj9DrLuhJgaPI4=;
 b=J1HN+jrOVEIjhsamGg/emGkxsp/uVhZD833LHTxLi/OADbH+Uj8+N+u40ZFuTBvbcmYMV2
 qkqMqNITGpJD8IPT0RvOQxJhhx01M7eZX5MS29qifzyPe6bZw9oVLqPhoWxo6az85RZnPEJZ
 R8D177sTYHRJsAg4kOnFK78RpUyDODD5NLNvvScZYfh3Pty4rRVjhOTR96u6K50nhz0NaPK3
 fgTKpPCO86YJfAG98oPYhc42gg1AvQpjC50FhBu6hZ89rxtgTgFRzlhaMbU/iQ9A+T3p/2Nt
 TtvVj6Aq36DIccHdENfR420vd7ieOMCSrvtTD9lYMbLCuix78WMt9huw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] binutils: mark CVE-2025-1153 as fixed
Date: Sat,  3 May 2025 18:59:54 +0200
Message-Id: <20250503165954.680357-2-peter.marko@siemens.com>
In-Reply-To: <20250503165954.680357-1-peter.marko@siemens.com>
References: <20250503165954.680357-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 17:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215935

From: Peter Marko <peter.marko@siemens.com>

We had this CVE patched but the patch was removed with last 2.44 branch
updates as it is now included.
Since there is no new version which could be set in NVD DB, this needs
to be explicitly handled.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index b4f4a37db0..6bc65a0fea 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
+
 SRCREV ?= "96bc9e8081a5dbe8329c1d5b0c94191fd5bed840"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

