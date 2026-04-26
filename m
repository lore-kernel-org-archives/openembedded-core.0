Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB9AFF8860
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 12:03:32 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17272.1777205007397147367
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 05:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=d0Moe8Mh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260426120325e63d5fae1f00020741-istuvw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260426120325e63d5fae1f00020741
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 14:03:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pZfl8XmrfOjBHI5ZvBZ7RQQ1kyo4wUWgL4oWh5wjzYg=;
 b=d0Moe8MhGjzL0HWiBOlL5Afe8jwtOUKcg8Xo6EpTQ7X6zPve3LWeF7dM+mNimhy2pY1K9b
 Ci4XCQwYHp9jP1JKkt5KR0nMP4u/H7MCEbqyOP+y/cmhCQpmnHMdRl0R5ER5XbEYLicRZnr4
 UvqqQg8M5VsI++s/oRSzFwLx9hn2/2nShGBJ+6VjIV5vevgVAvpvPyF3aiWR+aqmbIWppBxX
 eDXtb6MiZxdi9l0oiGdjMZsCxfrlXrsAzaGKS8qp/v1mnPD+XWuEqAbe2s31pEoIBKeWmc+i
 iBALX4yEhglKTHpk23Eljk1pdmpSYB8HHGm/zhufsBcLo6yWjEhK5Z+Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/8] gnutls: set status for CVE-2026-1584
Date: Sun, 26 Apr 2026 14:02:47 +0200
Message-ID: <20260426120253.825060-2-peter.marko@siemens.com>
In-Reply-To: <20260426120253.825060-1-peter.marko@siemens.com>
References: <20260426120253.825060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 12:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235953

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
Per Debian security tracker [1] this is fixed in 3.8.12.

[1] https://security-tracker.debian.org/tracker/CVE-2026-1584

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 7218428012..8554ab943d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -107,3 +107,4 @@ pkg_postinst_ontarget:${PN}-fips () {
 
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
+CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"

