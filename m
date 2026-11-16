Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4803.1794866624991442332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:03:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SQ9PiynB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202611162203411748e3078d0002070a-ms3dkn@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202611162203411748e3078d0002070a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Nov 2026 23:03:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=G6vepYycrux8Fa1eMkbnGxKqEkmR1iOMjR7mgDiSG1g=;
 b=SQ9PiynBs4De5zqj4UsLBnZfdi5Ym/AbGj8YzTIHLcuPl3990/lJeAoPEgMFM2AHVr4YIF
 KyYNVNygizflCD/Sw8DH2RY/wkG02IpeKqvum09jaG1xKPl+PdYUY6cAAkBiJiNRj5B/uToW
 q5ttBPm6MH0NyqZS/LDZ2o+asp5s7GMv55x6b1rpu36uCvpgQ7zn5bogfbPqG7az8afoaSnK
 Fue4Gi0rCFYMGAmVbcNbec2dfGdmdEqbEq3nw2U5srPDod5yKuUXE7nAkt5Ch4RrE6hFvLeD
 ZFDsitLfQQItIKE508C/Nv6tIyLPtdZhEWwii4XZNCZRk/SlJMoMM/nA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] gstreamer1.0: set status for CVE-2026-111183
Date: Mon, 16 Nov 2026 23:03:24 +0100
Message-ID: <20261116220324.58834-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250393
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
index 3a97ee009e..0bff1e17ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb
@@ -74,5 +74,6 @@ CVE_PRODUCT = "gstreamer"
 CVE_STATUS[CVE-2026-5056] = "cpe-stable-backport: Fixed since 1.28.2"
 CVE_STATUS[CVE-2026-12891] = "cpe-stable-backport: Fixed since 1.28.5"
 CVE_STATUS[CVE-2026-12892] = "cpe-stable-backport: Fixed since 1.28.5"
+CVE_STATUS[CVE-2026-111183] = "cpe-stable-backport: Fixed since 1.28.8"
 
 PTEST_BUILD_HOST_FILES = ""
