Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F1FF885D
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 09:37:40 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2889.1777109850619833963
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 02:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZHhguX92;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260425093727d6ea9af91b000207a1-qdyskp@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260425093727d6ea9af91b000207a1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 Apr 2026 11:37:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1XnUCLWpEg42jbSSJmRn3gvgVyVGBzDSHmi5IohUP7U=;
 b=ZHhguX925eA6D9rAdHID6Cvo6htSfddoSc8sh8qJMr5o0nKzbeSGAh/XwVDieT/jAkeQgM
 1qTsQnHrvMzSPlqaRXGU8mQP9RLS1b36vVJfj0aSkl0p/ufr0k2ItUvCt8D4Imd96zmlMx2s
 vzgvx/xQnjD/FGDzSoMFKCT6kK6IzIGP7RuTNtagpJtaF5/31S0tTK6yKRNvBVSg8bJCpanX
 X1JWD9PacLe6dJAqF1YLwfMd6hLP6P9c8S7I7/BqLYLcfcS7GhCL8ILelqYbvMIb+HlJP755
 o8dEZXszHoTfukaRJAYqwaglqgG1qb8+Aa56EoSlBKgl/JASJ+IxQ17g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] expat: upgrade 2.7.5 -> 2.8.0
Date: Sat, 25 Apr 2026 11:37:05 +0200
Message-ID: <20260425093705.2935681-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 09:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235943

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1]

Handles CVE-2026-41080

[1] https://github.com/libexpat/libexpat/blob/R_2_8_0/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.7.5.bb => expat_2.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.5.bb => expat_2.8.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.8.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.5.bb
rename to meta/recipes-core/expat/expat_2.8.0.bb
index 4f2578292d..53c141c200 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.8.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "386a423d40580f1e392e8b512b7635cac5083fe0631961e74e036b0a7a830d77"
+SRC_URI[sha256sum] = "586494499ac3ad46d87f3beda7b1f770c1c8026a9b60e151593f8b29089a52ca"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

