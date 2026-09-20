Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD27C982D8
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 19:16:24 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34763.1789931775659225772
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 12:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=c1BFNQ2L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202609201916133025eacfdc00020735-zoutez@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609201916133025eacfdc00020735
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 21:16:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=y9At5QHnYJRSNkCTs/4meOl0kZ2x9stu1QeRrrtTWZM=;
 b=c1BFNQ2LNyG9s1KnNf2Qi7eXupAdj3wM3dMyaNWbtYhT7ot07oZU/SM+B11+iO9aXlaldQ
 FWHcWsuitBRiUPQ4Lg/q6voUxEHp9t4arOYJu5yrrd+aohgXqTfDjmaLx0vb2CodFbZVOOUM
 1cVKi7qFClkxi90Jtphqv1u8VARO2syGFpRwBc8/anwGgK91RWYKQ3j+Ujo3yhRUwqM+XgKd
 dWjx9YeCEWCDYgDW3J+ba7W0jWxHGEtoGQfny8lfm0mS8bACXcufe1Cw7PeQafwPvaLhlzRw
 Zv0/9U6tn1CLDZrReKe+Hod2NrZPhFuDcO8b8DWQpYGLm+5uw2EpsDxA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 3/5] python3-sbom-cve-check: update to version 1.3.4
Date: Sun, 20 Sep 2026 21:15:29 +0200
Message-ID: <20260920191531.113024-3-peter.marko@siemens.com>
In-Reply-To: <20260920191531.113024-1-peter.marko@siemens.com>
References: <20260920191531.113024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 19:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246265

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.4

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9fcb4b9b16594710b8be34b228042c426b48ee0e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.3.bb => python3-sbom-cve-check_1.3.4.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
index 2aca100569..c26ce6e6b3 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.3.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "8b766be1ae92b4eceaa2f694dd4724e310886c6436f44267a6bbc6a7b81ab8b9"
+SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
 
 inherit pypi python_hatchling
 

