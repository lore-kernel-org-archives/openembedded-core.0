Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90895E63CAC
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 16:29:43 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41873.1769358577596200763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 08:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MlitnlMy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026012516293521874623300002074f-pl_xcx@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026012516293521874623300002074f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Jan 2026 17:29:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aGsYIUTYsJ55iBBrQjsa3vSQOY7GnsZwHOiRkvbWjyw=;
 b=MlitnlMyvFvp2jtuTjFzOww3gsYpcnEDjORlNYDguM2ktK6EI6zUjptMpMeJwoq+3Wf70w
 jqXDvbAriBGdkZP+vI5/LQEApWV4YmBALwauFW19J/r2wtN+ZOjxFlj4Scg+nVYOLIN+VGI3
 e6vvJh9VOlmi+wX7hLAUZN7d/wB2nOcF+na/SaO7fX4dvsDqoDEnIRiTFkH54zFVMsXX8CnK
 7/E9q1i2z0aZF1dd9JcsRYpzwfpSLRv0LgdvUPRfGtY2NZAhpcU4geNo1ulbK0PlTAc6xbZX
 gByx95QJdEcPsfqRIPFcejeedXSO6xnnZPzwL9N6JRDts1ApK+0JDFPg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] glibc: mark CVE-2025-15281, CVE-2026-0861 and CVE-2026-0915 as patched
Date: Sun, 25 Jan 2026 17:22:41 +0100
Message-Id: <20260125162241.730332-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 16:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229939

From: Peter Marko <peter.marko@siemens.com>

These were fixed with last hash update and start to appearing in CVE
reports.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc_2.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index b33d1b44ba..76ef521a1c 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = ""
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"

