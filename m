Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F61C5AD2C
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:53:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3564.1786186376997860754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i0hP1T06;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202608081052585dc2a53acf000207c1-rqktdk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202608081052585dc2a53acf000207c1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6AgxFYG2xBjL19ULedwm3cvmVbs/Jr8K04BarnXkn8I=;
 b=i0hP1T067Euzu1HusJ6M7Swg5eG3zHGTbZ/KbNcbCIhdCZvafBwncNLhgkfYUNcNt5eRex
 3sU5drh8e+moChiDmgax2A3zI0fgDZSzGUxePJMfXwj/9B5EPOu2Exg1g5JkwG47DnHdawo4
 /em0GLT3mAsEhoJgcnITdKqMvisCFi9o5XJTU/zQakwWXt/18PeHP4IMnUmM0+z39QnowLdU
 iUhho4IwsP6juAPzoO+YCdFPYpz2qzzlgz46cGK7NPxyUoenkGkPVbfDo0K4adS4p9vfHhAG
 rNrN6DaMMr3R5jfWrxO9Ogldncgf5Gl3fbP417a9eULqNeMj8uJKD2fw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 10/11] sbom-cve-check-update-cvelist-native: update to version 2026-08-03
Date: Sat,  8 Aug 2026 12:51:46 +0200
Message-ID: <20260808105147.42294-11-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243047

From: Benjamin Robin <benjamin.robin@bootlin.com>

Update cvelistV5 to the CVE database from 2026-08-03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 25e68deb8178f7021605a39fa85acea04a375372)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-07-23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
index 0e664d89e0..aa21b06953 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
+SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

