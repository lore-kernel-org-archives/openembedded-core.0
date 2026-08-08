Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6615C5AD2B
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:53:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3561.1786186372085302705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iRCfKjZy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260808105250eeccc4e4f7000207e0-08hsgy@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260808105250eeccc4e4f7000207e0
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=I2ZXNgJyn++dcT83JGBFjMDQcWAkNTyCR0mKhHr2x4M=;
 b=iRCfKjZyyPyYdKiGdVq8H9mJMy6JRzFbtbXQSUzwf53/a3GEKQUKte5nDerVoGy5QJ8AK7
 6y0KcJJezdD496TOkiv+MrT4faml31MPzD0VjtdhKU2Xeal9xgK2lpHbb89N0nExGJ60dff3
 KfXizznEUWQ7R/3uydeMAmyGv8wtlCnawD9WgPJzOrbJ1Wva7GwiDfhZGGnRIv/4X2DcXPrx
 oJQWmWmIUxb+in9/mqtIxGTEKNJM+gAsFrsqlWBU8UIFhOWNy1rUEN+2vWefOqyZKSeA8/GH
 NJrdotriU7RPGhawRjCbfjfUQeQIZUBBY1sFKMLkkRE50PpwIJIHZfFg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 08/11] sbom-cve-check-update-nvd-native: -> 2026.07.23-000007
Date: Sat,  8 Aug 2026 12:51:44 +0200
Message-ID: <20260808105147.42294-9-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243045

From: Tim Orling <ticotimo@gmail.com>

The diff is quite large, but a partial comparison can be seen:
https://github.com/fkie-cad/nvd-json-data-feeds/compare/v2026.06.24-000003..v2026.07.23-000007

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9d89b3b802bab144afa30e03b0411ae58232ef11)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.24-000003.bb => sbom-cve-check-update-nvd-native_2026.07.23-000007.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
index 73d9e77692..cf35b16923 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
+SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

