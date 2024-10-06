Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1760FCFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 14:45:26 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.32274.1728225916677461213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 07:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=O7293/Hl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202410061445144c36a2d1c08fa0c788-oks9tu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202410061445144c36a2d1c08fa0c788
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Oct 2024 16:45:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fmunz2BH7vn2O6LdEorY49FhtxdH22I/Ry+4sfhm5vE=;
 b=O7293/HlSsE9/kJpoRaO2HTdQC+CWK33X71FQVyNo/P8Wxt0HEatYBcFsWC9+gl1NuCFoc
 c89WcsbVio2tcNLZFLv6TffSrKp5Vxf6l5AfoCznZdw+8A8eq0cgxvu9Z+Bd70Q7hmEU23OZ
 6jNVZen9CcDsZBe3zjOY3liCJkm3veQt7+NyGv+rFMnljHtUf2b4WZ4dO5vRRUNUx8jK0xY9
 bDl6dxcn3E2aUkdRP/NkD7G0Ow/6WR7cBaDqAiD2SZSkPD9teAqQavA1a+5rBIDymFs8p1n2
 GslqkSznk2mWAj3dO7F3t0zUmWBevuwcciuwMwvJk6TJ6+voJebO+Gtg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] rust: ignore CVE-2024-43402
Date: Sun,  6 Oct 2024 16:44:26 +0200
Message-Id: <20241006144426.1331056-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 14:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205247

From: Peter Marko <peter.marko@siemens.com>

This CVE iwas created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index c377a680a7..fc22b9990c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,5 +6,5 @@ RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
-#CVE-2024-24576 is specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2024-24576"
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-24576 CVE-2024-43402"
-- 
2.30.2


