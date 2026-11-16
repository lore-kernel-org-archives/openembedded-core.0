Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4803.1794866624991442332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HxDog9mk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261116220346290d7c788700020705-npgorr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261116220346290d7c788700020705
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Nov 2026 23:03:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pfnCoQ7Ln+5LO+L7FEBySy0cATGJF1XriM7qR4DBAs0=;
 b=HxDog9mkY04OcwfKRjAj+RNrNMmxOZGnJVjWdSgv2OdKt60KlrCyc6pu9XE0HzXSnfjBfX
 5OPBnCXzRORIYzVxDdk0akTXm2XdyOcbq3Y9meJJisLDEGmc4tC3PRyJwfcTluHCo8MHnS1x
 lCOndr/LMCGoggiCXwsgXYq45OQjAAiKFB0ecXCovghgs4Q1OdDUVg9Cz1rIhwlx7hYvJq1v
 AUaRixXXTQdr1YyY772L7uHI/Nj0PbAAJJB476YbmrIU4GxByeyllLWSaSx4s82xOD9cwvAc
 XMfK8B28rcVHZPFTaIjZZUZEllQ/oBPAeElXkXA++Et3NQeGzEHGeAOg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] gstreamer1.0: set status for CVE-2026-111183
Date: Mon, 16 Nov 2026 23:03:09 +0100
Message-ID: <20261116220309.58743-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250394
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Fixed release is mentioned in [1].
CVE data is still incorrect more than a month after release.

[1] https://gstreamer.freedesktop.org/security/sa-2026-0088.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
index 3a97ee009ec..0bff1e17ad8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -74,5 +74,6 @@ CVE_PRODUCT = "gstreamer"
 CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
 CVE_STATUS[CVE-2026-12891] = "cpe-stable-backport: Fixed since 1.28.5"
 CVE_STATUS[CVE-2026-12892] = "cpe-stable-backport: Fixed since 1.28.5"
+CVE_STATUS[CVE-2026-111183] = "cpe-stable-backport: Fixed since 1.28.8"
 
 PTEST_BUILD_HOST_FILES = ""
