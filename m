Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6427.1794000695489012491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 13:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SGSR8hNa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261106213132196e63d1a1000207d8-9q7vdj@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261106213132196e63d1a1000207d8
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Nov 2026 22:31:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z5OqdaWwRPO5298jqI7OoRhnrm5x0rW+uX28a0aSeDQ=;
 b=SGSR8hNaQKSM7PjBFhG1GA8RQnkrYFMlLck3gMEwy4i/9Swl7EbvGu0EJD9Q1JBLmp0ZnU
 kX6DVl/3DE0ahL7zxh4wtOXiCWdlG6p1l9398SWmnuP4s6ioLncwa05WgyMtQyn4HZdxBGXD
 9o7KySvSEXyD37yOxPQsE06+64j0x9RplHnY7y+CpOrH93H6iD9leo1FdchbeVB6XoWjPgWO
 3lsBrVF2dBkUaNarJmdUMSyQ+UN3oX7HbFmxvrE6uiUdskKaR4/Frbhmnuqi8dKlfSARVRY9
 kPxo8hIFoS0oMMEJpMmmkEE0ilWMaW45wd7QemdAm4ESjap01nghqx4w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	"Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [blacksail][PATCH] python3-sbom-cve-check: update to version 1.4.0
Date: Fri,  6 Nov 2026 22:31:11 +0100
Message-ID: <20261106213111.444121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 21:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249718
Content-Type: text/plain; charset="utf-8"

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.4.0

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 959f011adb075841228b3b5becb2a7193155b259)
Resolved conflict with removed PYPI_PACKAGE assignment.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
index 83d420835d..4905465597 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
+SRC_URI[sha256sum] = "b0dfd6a60c715d7b4694897fdde5dddac0524e9bb25bc6736160712ce1d91e86"
 
 inherit pypi python_hatchling
 
