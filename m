Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15223.1794778866787143516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=I5wg4n3V;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261115214103d5d6c1ff76000207b1-sw_wk7@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261115214103d5d6c1ff76000207b1
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:41:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uDJpJqSRNZBnMQFQWggtQm+2Xa5JvwGYPndstCFKj94=;
 b=I5wg4n3VIpIgpMcS5wPvL4jJFjc3AKU2kVyILCefiBCfmlVU4oA/m1y3k5X1AypTPBAQEK
 wFWuAF3we/X/BLNdlGi5geV2QFT+4yDIwV5xMbXDzF8YYJYGizWQIwLsZHsbQzZ/rz/EgFf6
 BOU5xJ/UH+9W5C44HvdiRbGDCtaF+iP3rq5u06X9Hk1OWtrGsMZnt1gv6nqtIwYpW2Vb9gI+
 TPzKitDeog/RRwW4NbMTxM+v+uxnp6eYtuP0HVWb5WGuOpstQYC5HxiesjyOv90rzCc8lEu0
 /pEOm2jPTt24cFAA2cwU3zKePGp5NQ0NARlYSZxIc7zhu8D8aeA60d2w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/7] apt: upgrade 3.0.3 -> 3.0.4
Date: Sun, 15 Nov 2026 22:39:26 +0100
Message-ID: <20261115213932.1652076-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250283
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.4_changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 203c161188764e57677758e4d0cc7951428a208a)
Fixes CVE-2026-109518.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} (98%)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.4.bb
similarity index 98%
rename from meta/recipes-devtools/apt/apt_3.0.3.bb
rename to meta/recipes-devtools/apt/apt_3.0.4.bb
index 393008f05e5..c56819f0990 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
+SRC_URI[sha256sum] = "e853aec49afbe520ebcd4dbcbc98e1c55262c6bf1c119cf43e6aec69752443c6"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
