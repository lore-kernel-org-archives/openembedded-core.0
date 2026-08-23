Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741BFC5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:29:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14400.1787491764683954110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QoY4JFKT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260823132922369a9ea72f000207f6-mgoe__@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260823132922369a9ea72f000207f6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:29:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=hOosAFrcSTo1zkgwfxxeR0rNQtCzQ1p4YX+5AD+/pUM=;
 b=QoY4JFKTDU8KJa2j7lXdIIoWaQ1dzbiqZPRmknuqzzxSVIPgTxr+9nB+pO/Xc6vUvPNwyP
 cdW1PmkN7tvsWn5mcqPG3GaypJ9/mqK5/fFm8h4Evg62p8QoJf2kCsQU+brXiO9LadoOfXuD
 p+0CDLgOcho/KEB9AJX5rY0CS6taC7Jbv1s0PXsK6mXgGxjvrEY2jQ08sXMoKwx5LmrCgI45
 zBc61h0Y62brsquBspawo2wzuHA0aBL+31NKQQC/YqTxLjYkhDtTQv5W0kQa4yPWZm2gNi2j
 6xCgZH3WyZkCfCtRdQpVajixJH3nHVQ1KqYa1pyP/UnOuEVJ3L8Kg+1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 4/4] libevent: set status for CVE-2026-63380
Date: Sun, 23 Aug 2026 15:27:04 +0200
Message-ID: <20260823132704.2029247-4-peter.marko@siemens.com>
In-Reply-To: <20260823132704.2029247-1-peter.marko@siemens.com>
References: <20260823132704.2029247-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244035

From: Peter Marko <peter.marko@siemens.com>

Per [1] this only affects 2.2.1-alpha.
Also [2] markes their versions as not-affected.

[1] https://github.com/libevent/libevent/security/advisories/GHSA-3rpf-frgx-xq34
[2] https://security-tracker.debian.org/tracker/CVE-2026-63380

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libevent/libevent_2.1.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.1.13.bb b/meta/recipes-support/libevent/libevent_2.1.13.bb
index b0de8637390..22894cc3bea 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -55,3 +55,5 @@ do_install_ptest() {
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
+
+CVE_STATUS[CVE-2026-63380] = "fixed-version: only affects 2.2.1-alpha"

