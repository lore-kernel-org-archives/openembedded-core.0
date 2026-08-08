Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77CCC5AD2C
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3558.1786186367402154285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Hx1YQXiH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260808105245755828bc8700020784-abhrqy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260808105245755828bc8700020784
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AXPof1TBBys/6mCx2GEdIyyYyV804MwxgSH+cJLE7fk=;
 b=Hx1YQXiH3l8zCKPV7rdCRThnuxl4rj455Nh1+65vY+JA048CiEtoq/uq2V2jJ6B1Pg5TxI
 4o5aBN468J6u/E/rZW+LD/gAHepnQQOMkkQkBgN9LTzN7iNCapON8PVpF/5XIDHWQnvRep2/
 87PRWSK7IOQ9a5YayI+Oedi2BQ7jHhjTiq0TqTH6vBMpd7CHjrO6UZ99iG0H/tpKPWs3Trlj
 mN8U/C4fF0VfoFsnOVPB9SmR5WAV1ef6OB04N1XK580pyI+L0VZmEJLG+0wzq0olBAK2hCeF
 bevXqZEIWuQ/lmZggEclUtABwmko0iDi6YgJrt0B4/hI/9mxDfPnxxaA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 07/11] sbom-cve-check-update-cvelist-native: -> 2026-07-23
Date: Sat,  8 Aug 2026 12:51:43 +0200
Message-ID: <20260808105147.42294-8-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243044

From: Tim Orling <ticotimo@gmail.com>

The diff is quite large, but a partial comparison can be seen:
https://github.com/CVEProject/cvelistV5/compare/2026-06-24_baseline..2026-07-23_baseline

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1323691ceab2a338c4d5b9c15624b8d22c472e7f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-06-24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
index ca192bc9cf..0e664d89e0 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
+SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

