Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62604C5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:23:19 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14067.1787491392287644071
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PDe9E4ix;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260823132309e16b8954d50002076d-h0vpio@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260823132309e16b8954d50002076d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:23:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Q5G2ll3/TA049E4JEbyBtb6ATr8qtvmmLXopDL1z6Kc=;
 b=PDe9E4ix/YpAgJ49ny0gpJ/YGZ7tpnl78lr8ypewJDw0mAEZ1VIi8WlQVxQ+hIkXp49SrJ
 xKNtPSI/8dH4jZJzJk16AcgMsKn52vEGG5xvw929yF7rFnwu4X1/FiyfUfcbtLSHqEwIeIRj
 DeeZXnuSAsEg5q3p1LMLRuL/9ZjYvH/CTzfMIq3DkqlfjAHJFAG2eOVRHOnKxAuv6Lboy5DC
 Ov0TP0hMd/CFt9eKL7r0KUlnP+fYVwtt39jJSi0Q+/mkOD30aanevwIwYJ95nV9K6cmawyGm
 7jWIZ8d5gnhMGr5/7K/an31+7BQ6Z7W7VZWLiabsYhJjRcVmR1WtZTVA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libevent: set status for CVE-2026-63380
Date: Sun, 23 Aug 2026 15:23:05 +0200
Message-ID: <20260823132305.2028257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244029

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
index 6566e73bbd..3e037587d2 100644
--- a/meta/recipes-support/libevent/libevent_2.1.13.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.13.bb
@@ -55,3 +55,5 @@ do_install_ptest() {
         # handle multilib
         sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
+
+CVE_STATUS[CVE-2026-63380] = "fixed-version: only affects 2.2.1-alpha"

