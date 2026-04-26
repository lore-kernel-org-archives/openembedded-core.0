Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DDDFF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:04:02 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17281.1777205036475709960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=M/nfJsXI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026042612035413818e3eff000207ba-j1fecn@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026042612035413818e3eff000207ba
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=np0677kp/PREKlIN37nBkP4rvHaAhCnmPQwiao005xE=;
 b=M/nfJsXIsSetYlVc/fqRf21MNFC3V0siOnjaGY39Mhw1fXS63jzlzWIvWsVFLLXfng6My5
 lCb3ogXHWY24jGH6XpcPsTDv6BLiUeq9wH1EAkd1Aq6eZwJUiJ3anYViYh3ce3rszHG4Iu+e
 nm+PQZBwosZYkrV9EtnIMstrVoE2H+/pe3poYQNyBmVKCPBUC0kTihwY4yHM19Fk+9Ku/MyB
 MULsRikMXFeo5yx+9Q4khJuVCmY6dOra/FL/WXuxsONYkoz0fLd2Nhxlb/V1MGld83nkTbrg
 Vtq3IeXmkBcKSYHiZb4d+mE+20OLziq+o4viIeYzHyVBaEguScGfak1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 8/8] python3-requests: set status for CVE-2024-47081
Date: Sun, 26 Apr 2026 14:02:53 +0200
Message-ID: <20260426120253.825060-8-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235959

From: Peter Marko <peter.marko@siemens.com>

NVD [1] does not have CPE set.
Debian [2] shows comit from v2.32.4 as fix.

cvelistV5 [3] also says "< 2.32.4" however for cpe psf:requests.
Not sure why this is shown in CVE metrics.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-47081
[2] https://security-tracker.debian.org/tracker/CVE-2024-47081
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/47xxx/CVE-2024-47081.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-requests_2.32.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index afcf1a99b3..3477a5d83e 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -34,3 +34,4 @@ CVE_PRODUCT = "requests"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-35195] = "fixed-version: fixed since 2.32.0"
+CVE_STATUS[CVE-2024-47081] = "fixed-version: fixed since 2.32.4"

