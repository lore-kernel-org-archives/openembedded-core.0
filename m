Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5062.1794173668129568967
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 13:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DbgS/zGg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026110821342474108a7aaf000207cb-afykpv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026110821342474108a7aaf000207cb
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Nov 2026 22:34:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=u4EdeKbpA5+5jwNTTxC8ER6oI137bVRgtKADtRifu7Q=;
 b=DbgS/zGgPz/VQjVWlVQhnaKtWXVJAxo1AK7X+GEbAwrUtFXGkmYC1oIJSVOtc159IlyeoI
 xphmm/GLYRg/c25Te7Pcydk/PL0bvTQz5lHXkliTLwnHvmmU20f/zWLxyiI/MkHlgDlROFHR
 nZqdxKlEA2LOUiDFtF7DqeHipzE8CaizUt5k2yumIhreb1ATj8mJfejPkao9FfHqP3Acisg+
 tBH8fle1+j55rj2WEVzpYScnTOXRTX+uIxfAfErc3raYSZTHss/eqvO95wlGOKOnT0tLhcyQ
 eFy15KkqPQiqbzspjZEsNyeeZ6C6KPSlfZj0Yof8rR4Tq9qyvkCNoqWg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] python3: set status of CVE-2026-19672
Date: Sun,  8 Nov 2026 22:33:49 +0100
Message-ID: <20261108213349.2976686-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249773
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

CVE DB has this CVE as fixed in 3.16, backports to older releases is not
recognized.
Exact commits and their tags can be found in [1].
For 3.15 branch it's v3.15.0rc2.

[1] https://security-tracker.debian.org/tracker/CVE-2026-19672

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.15.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipes-devtools/python/python3_3.15.2.bb
index 43630bb48e..e14019dd23 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -39,6 +39,8 @@ inherit upstream-stable-release-point
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
+CVE_STATUS[CVE-2026-19672] = "fixed-version: Fixed from version 3.15.0"
+
 PYTHON_MAJMIN = "3.15"
 
 S = "${UNPACKDIR}/Python-${PV}"
