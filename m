Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F40C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 18:08:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.34311.1742148507980750073
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 11:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KJWCnR8F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250316180824d46213b556b3a5b74f-vdqios@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250316180824d46213b556b3a5b74f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Mar 2025 19:08:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cnpFOALxV8zERmerEqsaG5T1TIYZbSKJEJm+LCgbNU8=;
 b=KJWCnR8FxA+XwCNGWr22QxLMPGCQIVXYiKq44YQPxYYb+aiSIJFzHs4hhxpdjbG2pXLiMk
 UiElivXYHCPMCHFkMl9Lxvj/FMDjpCol8ZVkzmn4WFqAZlKRtMX4tpdWmYY+I6r34wArfyJf
 2FyZSltd+Y8QW5NAvfvgfWw/5buLkK85tWj25gXj752ImN8ntcmMFwOlxEfZrJLTpN0dJWBi
 x3me8rE9oN1BodG4/vE3NGa/PQO8Kh9d+L5qjx/UKXqzcjCI9oSF8nCZOTlmtA7yUeVkUVQF
 3jEw237FiB/aQCOW5cNNh31nkvl6qVOh3qTUbggpuA1IJlqrv94MRA1w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] xserver-xorg: mark CVEs fixed in 21.1.16 as fixed
Date: Sun, 16 Mar 2025 19:07:34 +0100
Message-Id: <20250316180734.2239993-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 18:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213052

From: Peter Marko <peter.marko@siemens.com>

These are tracked as versionless redhat CVEs in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 3eb0de7b35..94d55072fe 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -157,3 +157,7 @@ python add_xorg_abi_depends() {
 PACKAGEFUNCS =+ "add_xorg_abi_provides add_xorg_abi_depends"
 
 CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 21.1.16"

