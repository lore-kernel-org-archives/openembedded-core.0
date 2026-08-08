Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA22C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:53:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3564.1786186376997860754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Jh4iLRcD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260808105254ab70f38ae30002077d-hilfzi@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260808105254ab70f38ae30002077d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qFGuPa9w4L1Jk/x8ne53Gkhv2Q3nUGGJJHcVFTVAHLM=;
 b=Jh4iLRcDpgjGaUEUAkyhuTmDazj4lSfGKV8tvE/nARGxhADFvR3OWYuPLqksXqLAmdxeRn
 gOXw+Y8qqvS4iINJuM6tJsJbYZgGWg8e5vlWg+Y4RVeP5mXsU78WFXQrwtr3HlBvsugbSOBV
 vvIKbeGO1fMvmhoFhorhqfGcSiYFTEsvwoxOeILgONb23RFTbL16nk9epbU+dnsN8j0R8iYq
 33gBYXuo4xejO03DVUx1ODEK/QIOJL0wnOkHEPHpXPKzKmyTt27RjDCbmDvJrgh9343lrZKQ
 rLfOv7fUuEDoHJ+KLqkmlcJKqhCWovFMXkqJKIzYaLWX0onpjNHpXExw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 09/11] python3-sbom-cve-check: update to version 1.3.3
Date: Sat,  8 Aug 2026 12:51:45 +0200
Message-ID: <20260808105147.42294-10-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243046

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 7feb4e30ba17a4b0eb37a1c6dde671d4491bd35d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.2.bb => python3-sbom-cve-check_1.3.3.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
index f14901e300..2aca100569 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
+SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
 
 inherit pypi python_hatchling
 

