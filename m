Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CA3C5AC67
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:52:40 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3511.1786186352635124929
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iYjlcBZs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260808105230086ce5bbc70002078e-22nery@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260808105230086ce5bbc70002078e
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:52:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8LFYYHV7vSnHx9SlA4EwBB1t3zsXESBHqUgh5VkPiWY=;
 b=iYjlcBZsdhtD+4OV/sxiW0mSTd7wqPx9/uMFHRQtrls9HGjTsD5PE+h1apGXPT1oCb9/bW
 AzXj9xeK9/n1s/AVpgxrHDOCVjuxwchrHTF4didaX/yXPE4UQ19gsUfwzZs0DC5JBdmdnm2c
 S4lP7xnuBzgw3+Nr7Q2olPlSTAjOmEho3itLyryByZlDMNktjNTWF/VKImibB+4IK3kjE+00
 Ex4da1Z7kjt7AGbtzSTJxhFxCreJFW0NUpyAxnV9ietXPVlfyJzPehfH4ejwG9XJgrUn/PXf
 PQAz7h3wM/FNZlxRYSURoj7GdSSGKJssKSd7Nx2sPYEYbJAU5LF9tk8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 04/11] python3-sbom-cve-check: update to version 1.3.2
Date: Sat,  8 Aug 2026 12:51:40 +0200
Message-ID: <20260808105147.42294-5-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243041

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cd6313d94ac221dc37c30ffec8c83b6c8d1deeff)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
index 8120848a66..f14901e300 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
+SRC_URI[sha256sum] = "0a7f07a0c6ce45d40adc6d311ddc25c4466f59bafcbce149b6fb3663791a5d89"
 
 inherit pypi python_hatchling
 

