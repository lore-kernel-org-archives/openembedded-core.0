Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5212.1794173684735770295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 13:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Zy7bDmls;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261108213442edeb2c5aea00020799-hfpcnb@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261108213442edeb2c5aea00020799
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 22:34:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IGPoiNvJ9pdtT3YTMwmaiH3/rRj10TkfAWIZpXT+DQI=;
 b=Zy7bDmlsxPj/r9EVqY+UBFL1UQYNCnKotV8AfNwxwhf0NpMtPbMIIkRzKiKl9fLz68r8Jv
 99dXXJLz7yt61rfPc3KUe4pka+zthH6KeJsYpxzt60izINNJqGsn6UKpiLtHVYKaAeo1/siX
 yiI2yjU6C8h0kyRW8arIkmlJRxbXAnkPL7B4FYNqtTLGdNQYu+Yw6L9y4jcf/IxmMVytRWgY
 VkJCyhVyilRs7BQEPKnbU5K+vRSvLsPh5QhDL9QMPIchfXQSawDYMDgLKEgLhDGJsPoT1LkJ
 DPNs3TUdUnY1ghRx0t8pksfLu8/39GhosC2tJAQ+EyxHcpYhuQPm5AjA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] python3: set status of CVE-2026-19672
Date: Sun,  8 Nov 2026 22:34:06 +0100
Message-ID: <20261108213406.2976758-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249775
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

CVE DB has this CVE as fixed in 3.16, backports to older releases is not
recognized.
Exact commits and their tags can be found in [1].
For 3.15 branch it's v3.14.8.

[1] https://security-tracker.debian.org/tracker/CVE-2026-19672

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index 73d6e89854..af6dbd9738 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -51,6 +51,8 @@ inherit upstream-stable-release-point
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
+CVE_STATUS[CVE-2026-19672] = "cpe-stable-backport: Fixed from version 3.14.8"
+
 PYTHON_MAJMIN = "3.14"
 
 S = "${UNPACKDIR}/Python-${PV}"
