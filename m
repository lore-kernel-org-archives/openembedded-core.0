Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5064.1794173675239073798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 13:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JCpslawz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261108213433d17b50ca0d00020732-rnhksb@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261108213433d17b50ca0d00020732
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 22:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hvtJkTeAJTMLGVI1LB0Ksr6vExIQckeZ1pPHPuTN9WQ=;
 b=JCpslawzxqXzLwzk1ZlBU/DsX9expm9C0GunA7SYh6a14slLPa97r9AbNYkYQgA4XtBC1y
 pok5IoT1d5I+CcT1m+z1Ok6G+ULcQW+reZtlHurUsqbMo2rrat5rkgQdw+bVGuARZG+JeAVJ
 JlzxEfJ59JUqoOI8wW1Bgn7s+bs4QpARuokDCydA6ARFZ149GraiPpLlqiWiy6wrodMFTxgP
 GkEiQqI4OHK5pCpW/NQOiUe6aKvgfBUZXuLRBbJTp7jvpP+E7cBOnYEPg2xryvm2OWwRk248
 zuslZ/zYs4jCHnje6GK8tregiDE9SdcoUlBr2m9f2G5D4kxujWJnFhIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] python3: set status of CVE-2026-19672
Date: Sun,  8 Nov 2026 22:33:59 +0100
Message-ID: <20261108213359.2976731-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249774
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

CVE DB has this CVE as fixed in 3.16, backports to older releases is not
recognized.
Exact commits and their tags can be found in [1].
For 3.14 branch it's v3.14.8.

[1] https://security-tracker.debian.org/tracker/CVE-2026-19672

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index 3dd0962ad9..a67bf666e0 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -41,6 +41,8 @@ inherit upstream-stable-release-point
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
+CVE_STATUS[CVE-2026-19672] = "cpe-stable-backport: Fixed from version 3.14.8"
+
 PYTHON_MAJMIN = "3.14"
 
 S = "${UNPACKDIR}/Python-${PV}"
