Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC34C5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:24:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1787491479318010767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=c+o6EoSY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202608231324372aa2d4d68e0002076f-m1ajki@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202608231324372aa2d4d68e0002076f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:24:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BKcQm2bnBSH5Flv4jx+twT8W75J7j75jOd7Kek2ZRjk=;
 b=c+o6EoSYU1eMHgbLHFDv/3QKspPupWyAy5AMKdcskTJ5Jld38LThDuOQs73cttFr+mxG4x
 E7yu65aH8R2OGT5TWkFfCQzuCt60pIDxrSEPdNBB4kRlupCo/YD6PDwhQJN4VpEgA0PqZDj/
 pQkNiXpisCXEC0x6ByghfrZQ/bomAYN9LtVLWp/5wwrw2qkLl5GKfQUDc4WDXmpB8h0v5P5c
 wLjYFBNYrZ5XTmFeEK94a9Y3dt/1cGwZtyDmlQHywil6dbO0LY7zsXB8PT/nSXojHaKVObYt
 hjeHZ4puQokaaORgdwTUFLvAXekbn+cxDfNXap+2hPgXHTZ2RrFFkuIA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/2] libevent: set status for CVE-2026-63380
Date: Sun, 23 Aug 2026 15:24:20 +0200
Message-ID: <20260823132420.2028476-2-peter.marko@siemens.com>
In-Reply-To: <20260823132420.2028476-1-peter.marko@siemens.com>
References: <20260823132420.2028476-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:24:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244031

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
index 431018f0f3..222d4fd5b3 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -55,3 +55,5 @@ do_install_ptest() {
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
+
+CVE_STATUS[CVE-2026-63380] = "fixed-version: only affects 2.2.1-alpha"

