Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1ACC3ABB6
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 17:00:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.14614.1746291644189167949
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 10:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fY/DSmi9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250503170041e74c5b4815e6ea1998-r2mzk1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250503170041e74c5b4815e6ea1998
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 May 2025 19:00:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=eX+g6cMiDrwOL+E4ailBNbGNufKl4XsIGHNiNVJ/zOc=;
 b=fY/DSmi9Arq3eIYHSO/eaAbKb/M09ml3cJslkWixfvDooy/tiPerBy6bI87UXjXT7dELzf
 PyBEw32Ye/CGVv+ja2jvKyugNim/ha+J9q3lWIqBzI8Sk4AWQ1ih+6xHqnswkp1MRU2HLj7p
 Care1MetoVasoUZAFYpR+d185jVn/+sGj20VG/pndHRPixKbG98k4cU3u+Z9znBUiF03Rls2
 hBYFwcshOrmsnrXI7bI/00VD8qyeJvKtOJ1aCb8z4pL/Cza18yyImMAwNSaQdcKc27hKtRtH
 vI223IxI51I4VBqUqSkmE0TqOYtJE4JKf2yXARjMho/bF1H8kVnrTO3A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] binutils: drop obsolete CVE_STATUS
Date: Sat,  3 May 2025 18:59:53 +0200
Message-Id: <20250503165954.680357-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 17:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215934

From: Peter Marko <peter.marko@siemens.com>

NVD has CVE-2023-25584 listed as < 2.40, so we don't need to ignore it
for version 2.44 anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.44.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 4680248f83..b4f4a37db0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -18,8 +18,6 @@ SRCBRANCH ?= "binutils-2_44-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
-
 SRCREV ?= "96bc9e8081a5dbe8329c1d5b0c94191fd5bed840"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

