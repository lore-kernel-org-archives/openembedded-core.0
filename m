Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67375CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 17:29:12 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2889.1791394148915857469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 10:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ScCJ0y+N;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261007172905f84af76e0a00020700-w3ftbo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261007172905f84af76e0a00020700
        for <openembedded-core@lists.openembedded.org>;
        Wed, 07 Oct 2026 19:29:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z1vvZEugFrEfhXe1gqsa+gjTjJlXoAdyUJfJOIBKsww=;
 b=ScCJ0y+NgPBv0CPXndDVMjKee2fyWPNGr8L7fec1JILaHp9avyY/6+o10kOJoCXJNrBDdF
 5M3THc8lzpeTvhYqZG+qFJiRk1/f4CcVkTJ02taNkfn8qnCJ2M2G9lXcG5QEzpk6+4E3QZPA
 7dA4DDl7AM1J60CZ4OcXAZ0PiZIbHFse0XpIEnmvSy+IKKteCXkc8bgP2EDt1Gp4tpalVljq
 NTd55Hin1A8ZdJ2br2/p5lyjSjD4/M+wxUeMMszZszck1s47YIrCBX6NU+6Y6BbkFfF9jew7
 /DoqXmLy/B6XSU7w2HpH24O6pBx0/pgwp4aHZWeMwZvpdyErOa9QgUTA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] glibc: set status for CVE-2026-86805 and CVE-2026-95818
Date: Wed,  7 Oct 2026 19:28:52 +0200
Message-ID: <20261007172852.2770936-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 17:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247401

From: Peter Marko <peter.marko@siemens.com>

These CVEs are fixed in current hash with commit [1].
It is commit equivalent to [2] mentioned in [3] and [4].

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=533e1c955c7bb9b761749751ec743b46c6bd2238
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed0c137b97eb940b4b64981e84ed806d3276edd9
[3] https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0022
[4] https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0023

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 3d642e6738..c962171cf3 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -24,7 +24,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-4046 \
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
-    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 \
+    CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 CVE-2026-86805 CVE-2026-95818 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 

