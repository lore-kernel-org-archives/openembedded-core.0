Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74C6C28B30
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 18:10:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.34362.1742148599350548949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 11:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kh24B07L;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250316180957568099c5d8cd86cdab-ieqm_x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250316180957568099c5d8cd86cdab
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Mar 2025 19:09:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kOyVffqbd0ib1zcI1CZ+2nCQ7NXEmcguhaILNwajrno=;
 b=kh24B07LuNLPGKnHKO04lsW0pms8wBQqd6QQ9rSWSYYi3aSxs6f0mG/tGmVHTDGgaiJtvg
 SNxrBhQ4ZHRxcbI4ivO2FnED+T5C3s8tbX0pNtenoae65DF43pLYhmGHP/7x8O48t54E+ex7
 y3+WbOlDXTJ99kOyxr/1iM+x9VCQuJ2uQNbZ5K2Rwzey9Da89P04Zw7QFIeVkMX26ah+VmO+
 ZCCzall1Weo+jTVRwvOxPdo3j/ECl0apKgNy15couHW3X0vBhApin6IF9VPWVlvuCVzwI4si
 FeCgI03lOXypIpdv5MUfjcTb2ZKiD6CcxZERiLt+fey0gkmnJX6OuZGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] xserver-xorg: mark CVEs fixed in 21.1.16 as fixed
Date: Sun, 16 Mar 2025 19:09:11 +0100
Message-Id: <20250316180911.2240099-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 18:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213054

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

