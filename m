Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83316E95A77
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 10:56:40 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62203.1767092191519884580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 02:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LLFiwava;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20251230105628aa84af4eea00020750-mplvyk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251230105628aa84af4eea00020750
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 11:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vcxT5qJkb5UlFe0miffFMKoxBLWlzQ9M8239g61F8fE=;
 b=LLFiwavaNHgCuhK1+LJvJy6jFhGk5Z7D6pcvRGGdnfCED9Ywv7Nipy76JOJjHRp3v8Uj4n
 VKQUjiasUEJY/ZY4F/KOUhHL+9i5GMRv/ZVeew2nHC61XvhRu/3E0jPH7AEsCXZBVXbqsuen
 poOtGa3NHxTpXJpR5X1qGf/ZFeL8GMa7x2z31UEATiNpnqX0LOZoX8Z1QBR3AvOMU3OtWFYP
 a4eG1oyDKs0saXg/SB9xn5PLsr6pDxCTdeeHg24gZGEE4JQdddiO2EG7hAH4ZoRzjIcNIAUi
 UBtnCHiqE5AHkdoEUvrbfbk0+NGkPT/dmOPXkf9LbLKZfmPnuSRMYtxA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 3/4] oe-selftest: case.py: remove unused imports
Date: Tue, 30 Dec 2025 11:52:58 +0100
Message-ID: <20251230105607.2615849-4-adrian.freihofer@siemens.com>
In-Reply-To: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
References: <20251230105607.2615849-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228655

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/case.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 96898411c3..1d7ba0861b 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -4,9 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-import sys
 import os
-import glob
 import errno
 import shutil
 from unittest.util import safe_repr
-- 
2.52.0


