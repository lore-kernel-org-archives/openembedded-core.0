Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DF9C5AD2C
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3556.1786186357655113862
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YDsLGH+r;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202608081052352272e26164000207e8-6gr_ci@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202608081052352272e26164000207e8
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TEYQK8pLDLa+qL6iVoNntljLT7kaimhEqUEzjC39L7g=;
 b=YDsLGH+rkNanZaYhAkBr5+DQxCT+x8omTRLy+yst+HVkSvaEBC92VXFq210Jytz6LvwTdc
 pe2pqQtSx1g+KqTyk69yf0lrM+on7N7RKRC0jNHhSKci940gplxD68s5OQY3ndDZ+UAbEpGU
 TXfMcA5hHvo9LZt7rVNB79s86jwJdsROqYbCg1bxA62ASbyMlvsCFd8gSfXlBZJ5jYic5FYC
 biikaHP3Og3CfCgOw8elEOLD1MmqAzAbX3XIx8STb6GiBK8zbp3cvY+d/I5K3CXBCN4VmQW+
 3SDqlaKihgrj039C3eVC2OV8MFdNOpdukNaLYSKYgeeReIIs6x4dCcdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 05/11] sbom-cve-check-update-cvelist-native: update to version 2026-06-24
Date: Sat,  8 Aug 2026 12:51:41 +0200
Message-ID: <20260808105147.42294-6-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243042

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

Update cvelistV5 to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f7a706321eb783ad43d8d9666ea3536024cb5be8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...07.bb => sbom-cve-check-update-cvelist-native_2026-06-24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-06-24.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
index 7670172c40..ca192bc9cf 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

