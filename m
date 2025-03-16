Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82ACC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 18:09:23 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.34233.1742148554717797302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 11:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HvMqZe42;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202503161809112b4a03b703d4690ea8-7vv8wm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202503161809112b4a03b703d4690ea8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Mar 2025 19:09:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kOyVffqbd0ib1zcI1CZ+2nCQ7NXEmcguhaILNwajrno=;
 b=HvMqZe428lBDIgFSP2ve60VC/GRmOZs3b0ke/taAFo+lf+amUO/HTRSacYaUjL1AidnEZn
 /Fj2W0Yqa+eiT4x+9mide+5rlW4/+d629FLLoy9hedIZ8y95Uh6q0TdEo7BAcgrmWqDxAhRH
 2u5ian4p98z3eiIevS8G/02GxH/BJgN8tv2ATWSMDa1exsStBEeO7/1QKxBj1ItYQbVWIa+W
 KcwhdCOVj254U8evOr9V/GfI8g4/cMC0krsm5Y93D0n/DNEWVcHXIWg4iOJhfVwzOJ/h25ju
 GtWWUz/3anvbrwrYe6BrLNkW5t5UMjB7uxb0XNnhCKDSijPOHw7J6IFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH] xserver-xorg: mark CVEs fixed in 21.1.16 as fixed
Date: Sun, 16 Mar 2025 19:08:24 +0100
Message-Id: <20250316180824.2240047-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 18:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213053

From: Peter Marko <peter.marko@siemens.com>

These are tracked as versionless redhat CVEs in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e2754426cf..815be6a498 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -177,3 +177,7 @@ python populate_packages:prepend() {
 }
 
 CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 21.1.16"

