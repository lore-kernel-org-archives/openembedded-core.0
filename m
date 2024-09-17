Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76770CAC5A9
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 21:35:23 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1640.1726608913301289110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 14:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=F6Ass+16;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024091721351156e9dde93a700eb9fa-50_w3c@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024091721351156e9dde93a700eb9fa
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Sep 2024 23:35:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b1pF9ezKx2LkgRQ+GiTZzPLD3gMIcNl6Li9GhRo47b0=;
 b=F6Ass+16+xMMdlQbB1O2rICSnkLvYJgYJdGz/wREKKYH6OWcQOIappnFjeXDioCzGcD2fj
 8z5xYA0BOrBSJUZTznowPqnsBvFtb6cs4qnvmMNC6s79m7CVNns2xAm4QTMXhpLZxvCErG/H
 XMle+g+A5ysd5jn5gqdIdQM6o0blIIgEMxmpXboSxA3DLKFiuEfV3+ZwGDjg+k1K5klrromw
 iA0YJPogJMNZSmug5hMC/znlhkZeIPHIYccHsJVvO8M31oXX4wcgPZ0tSx02hcJmJf0TqXT7
 B9KVZ1h4GF+Yjqq+GcYbl4kJxeDmhe5kigHoOYT4r9WDT47OIFu/ad+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/3] python3: upgrade 3.12.4 -> 3.12.5
Date: Tue, 17 Sep 2024 23:34:22 +0200
Message-Id: <20240917213424.627310-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 21:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204629

From: Trevor Gamblin <tgamblin@baylibre.com>

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

(From OE-Core rev: d9e2ebd6b24b802d1d4cd38b3b910e068c308809)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.12.4.bb => python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb => python3_3.12.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 3ac83166ac..5c3b7a92f8 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
+SRC_URI[sha256sum] = "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991dcc55113876397"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


