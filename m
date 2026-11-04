Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14206.1793811911223452479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 09:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=URq0UOG5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202611041705090ba4f5c6c80002078a-ra52cu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202611041705090ba4f5c6c80002078a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 04 Nov 2026 18:05:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Pylm+dnPMHPbOJs6SCcMrLunRL/SJ9v2vWRxkFVFp6I=;
 b=URq0UOG5fb/82owgy7GYrIM2CFfYZBtMVprs5VjDqSIKCbY7crX3psygCAfA9yeKMhI12V
 16kM1jHd2jk4sMPtmeeX1jmuwRh9vlBLr6f0Jtnac4Cyh+gffXlnaqK1IFCYNitZyNSSezfN
 7w7KPi3iKDiqpRZWhNHTKhG0deiWPrcy4bZExFMG0fQ2OkcOT+XD8xY5sNrINtPwBUdG/8k7
 q+dZyfBQmJamHiWsmDd5P1H4tX9HyZiQy2SkUMd9UTHNyPtiSq2gG6KWf2TM66DBLPHQ+5Ft
 3EGNshdTKPBcpy6oKmzolpwuCuBn6VjRzl2YNXAwaAx0ZhnJNZj26ZeQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] popt: correct CVE-2026-18739.patch metadata
Date: Wed,  4 Nov 2026 18:04:25 +0100
Message-ID: <20261104170425.23083-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 17:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249407
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

There was a typo in CVE tag in this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/popt/popt/CVE-2026-18739.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
index 0a1e8f3590..94366f6343 100644
--- a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -14,7 +14,7 @@ Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
 
 Fixes: CVE-2026-18739
 
-CVE: CVE-2026-18743
+CVE: CVE-2026-18739
 Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
