Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9754FC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:36:30 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43451.1790537782950787514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZSNEMTcU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260927193619fa8246bbcc00020778-fc_kox@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260927193619fa8246bbcc00020778
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:36:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4t5O3+HR32pN4VoOeE6uSRATcOixduNEnzo6i0bOxNI=;
 b=ZSNEMTcUcrYeIYggYdLuXOEZKha0QK4gVrvz4B0sTUKcJBQMbkGYLtjU6Qq+/IADzfPQxi
 jpn38Unc1Wbsl66DTPZZCt5seA/JZ8C9LotmBaBI7cpE+9ZOFBvnwwudpSe1zSlOr4FcKM6V
 xOBvhnfBP0rKNW4PUsAj843lSVbG7ostEyBH3d1eyDmsvJwEDIzp++EyX/O5KNjMQnsGGpZx
 iG8o/Cic/D8K8bwtdSVWZA/823feCwH+Tod/bhBU7PFG0CzzDXuyKfUfAuKJqTjAsah7R291
 ABq37pDS7Ktpmpa1skA4oAoJHs2g+p9w4dCydE1a0jYVu3yQoTURSbpw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/9] binutils: set status for CVE-2026-3441 and CVE-2026-3442
Date: Sun, 27 Sep 2026 21:36:01 +0200
Message-ID: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246707

From: Peter Marko <peter.marko@siemens.com>

These are version-less RedHat CVEs.

These CVEs are fixed with [1] included in tag binutils-2_47.
This is uquivalent commit to those which were picked in Wrynose and
Scarthgap branches to fix these CVEs.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=c2bf7de1eb77a91d7a3c86d56408bf57de540faf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.47.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipes-devtools/binutils/binutils-2.47.inc
index 485da4a13c..b66d9110fd 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?= "binutils-2_47-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2026-3441] = "fixed-version: fixed-version: Fixed from version 2.47"
+CVE_STATUS[CVE-2026-3442] = "fixed-version: fixed-version: Fixed from version 2.47"
 CVE_STATUS[CVE-2026-4647] = "fixed-version: fixed-version: Fixed from version 2.47"
 
 GIT_TAG = "binutils-${@d.getVar('PV').replace('.', '_')}"

