Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39B2FF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:51 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17137.1777205026838585745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=gnAf2jE2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260426120349a97f094d4d000207d5-w0x9by@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260426120349a97f094d4d000207d5
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+A4XGh8wcDYhRAPrn77Sbu514+vOVmfEMoe06HEfx5o=;
 b=gnAf2jE2ZU1vwyykyszUUt1BnZvQgCPLnlkcEgYMqfrINFgTLLFMOKZL/u5lW0mqbR9MZr
 KxGn+F/wBod1/GTK8SPaKgj/AxY7AwWuTMAF/WeYFMfvUYMn0dVq5Goo8759NRc3HZCJXPQZ
 4d/ni+LXKhslygDqe02be5SKqQpvnDsl4p6fdqXfsQlQXAKUYyVfRpBzP9H6og51NVesNz8M
 JGYCY63EF0DHMtQJLDvaloAdq3mOdqbYb6I7cRK95CC1jI7mXhgGgwWHwEOqDkXvwziBMUT9
 UxtWcCvx3+1UXbeXUYGh9EfBG+pwaoj7t9OH8JyyD6YRf4F3bl9GDr7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 7/8] python3-requests: set status for CVE-2024-35195
Date: Sun, 26 Apr 2026 14:02:52 +0200
Message-ID: <20260426120253.825060-7-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235958

From: Peter Marko <peter.marko@siemens.com>

NVD [1] does not have CPE set.
Debian [2] shows comit from v2.32.0 as fix.

cvelistV5 [3] also says "< 2.32.0", posibly "defaultStatus": "unknown"
is causing it to appear in CVE metrics...

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-35195
[2] https://security-tracker.debian.org/tracker/CVE-2024-35195
[3] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/35xxx/CVE-2024-35195.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-requests_2.32.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 0eb9765b63..afcf1a99b3 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -32,3 +32,5 @@ FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/pyth
 CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-35195] = "fixed-version: fixed since 2.32.0"

