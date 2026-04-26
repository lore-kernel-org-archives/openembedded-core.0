Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FCBFF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24921.1777229460259866558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HCdp24n0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260426185102a2ff9fa4c900020737-hjszeg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260426185102a2ff9fa4c900020737
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:51:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EKJm1kspt3skBbQdxxxhamghCBOi+bgdzH9hhPg4FW8=;
 b=HCdp24n0t8Z4P/qihTW+onF6HDqqrJ5zT1ugpEY/6Wmf2FcuSmz32L0wdfzu1q2dI17EX8
 IW6AFAMgP33dGlX7F/AQnqNk1STSpnS88DXuyZXEitrTta70Q3hkdkCTbyWhGN/pRZew11W7
 BAfbrQwmhOFJgbThKWYkD7H8YNbmnzQlUOEyJbr2UnS5H5bkMEuz3bQytuGgx8Qf5Iw7d5VK
 I1dY6K4zxEdMB31MwIwHBj+OfO7UQMzH8D+XsYkyBgKhzDckB7XEPWombfMVZq96WdJbl5qI
 SsSPWwieSgg4d6xNUYXWNgrRp0uYagY0TREC7qNkppcyoWj0Nag/YtYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/6] cargo: set CVE_PRODUCT
Date: Sun, 26 Apr 2026 20:50:22 +0200
Message-ID: <20260426185025.13217-3-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
References: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235963

From: Peter Marko <peter.marko@siemens.com>

This removes mediawiki:cargo CVEs from CVE metrics.
* CVE-2026-39837, CVE-2026-39839, CVE-2026-39840, CVE-2026-39841

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/cargo_1.94.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
index 36ec346113..f16688fc76 100644
--- a/meta/recipes-devtools/rust/cargo_1.94.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.94.1.bb
@@ -17,6 +17,8 @@ require rust-snapshot.inc
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
+CVE_PRODUCT = "rust-lang:cargo"
+
 inherit cargo pkgconfig
 
 DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"

