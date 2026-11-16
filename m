Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5828.1794869416641376481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PhP1hc4H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261116225013fdfc34a10900020759-5k6u2e@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261116225013fdfc34a10900020759
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Nov 2026 23:50:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zq1mN3E26w1tM8Egp7qC8X+2/3B24TLrLHUh/bKI5kc=;
 b=PhP1hc4HTv7UBGCAoswVb9Yh9/8q/RDTnQaOX3BQMLPhvLWdabiyTpJi5CJFUCoD+FOUJK
 2W82fcpgZhjQIj5hny87LgEYExNc1wpOsmQKJlON4MEd0cBOotfi18JHuHaiOpc41Px+9nV1
 FJZ/dH6+MOWgC9KA6Uie1oonaKYgXPKEVK1VPiTAr5CAl12aay0siZ1TnXEkvBo13RQFXTgi
 0zu6qJDrPtclYmND1ojoTalfmwlvQBWEXcLC8J4wPysWuPiCaQgTmOHGRQlyBikQYABIRtoE
 z2q0EiMu+AHr8/x5hZADLok77YKYU0l600AxCffBNFaN5FgZShuO2I0A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] grub: update upstream-check
Date: Mon, 16 Nov 2026 23:49:58 +0100
Message-ID: <20261116224959.197150-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250396
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Repository has moved, see [1].
Old location does not contain new releases anymore.

[1] https://www.phoronix.com/news/GNU-GRUB-To-FreeDesktop

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 466c772e5bf..d0f737164f7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
 
+UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/gnu-grub/grub/-/tags"
+UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)"
+
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
