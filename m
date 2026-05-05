Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BA8CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 20:52:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3860.1778014350152062707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 13:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IAAWQ55K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260505205227829bfffda7000207a2-46vy1v@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260505205227829bfffda7000207a2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 05 May 2026 22:52:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Q9ULJioNuoNWyFESCjb7n2lrjcEE5JBMfG4IYaSU//g=;
 b=IAAWQ55KqLJgxpNzNqERH83KGFNpFJqNQD54rua2skH70sDR9w4P76hgd3ns5pR7Uli+LR
 pNi7eXMUEqxGs4t9zwcrZBA5Al46NtmwJ5tTAogIeRGDJO+fTp3MK6so1r1G3uqFrxeGwFSA
 2+YdbyajZ3Z2i4+MJv96r0arA43KdWFoksub/MyIHllcXdt0hmXDTeIn0CFMPdSI9zDPqOJZ
 ejm4C497x4uC3hydz+DcfYJx9p1cH5IwxZp7X+YajbXSozD+XRtEj8tYJwiCfGA+kfVHN2rs
 M+oBJC0vbcacbxPcRkGd0gI01bm0uTQv27CW2df50DW/5xGTx3724lFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] coreutils: set CVE_PRODUCT
Date: Tue,  5 May 2026 22:52:01 +0200
Message-ID: <20260505205201.2139424-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 20:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236527

From: Peter Marko <peter.marko@siemens.com>

This removes rust uutils coreutils CVEs from reports.
Comparing sbom-cve-check shows that only
CVE-2026-35338..CVE-2026-35381 are removed and all of them contained
reference to uutils.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 5c39687f62e5864ea783cbed497c2eb5387dcf96)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/coreutils/coreutils_9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index caed1f8c499..a9618c8ab84 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -23,6 +23,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
 
+CVE_PRODUCT = "gnu:coreutils"
+
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."

