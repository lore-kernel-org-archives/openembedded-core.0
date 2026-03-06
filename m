Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6647F51411
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 06:55:28 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64364.1772780124311655055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RwC4uhx6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026030606552174565daae20002074b-5b1rny@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026030606552174565daae20002074b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Mar 2026 07:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wSCOHjsifZi3qhsRoHC6yGe70cBmI+7fE455Gg5I4YQ=;
 b=RwC4uhx6TOg5C8atKh/K1SGH4iVJKLUUvPXwY8M3x4h+VMWZx+dIkDp4NsIJKhAbLgMrHy
 NpjTtV/o3k7MNRCLK4jUAQSksmmpkvp5Ug6Tg9g8eE9LZ8uRyi2jWUIL8kmfS+45Q7oRiN4i
 4t4v8AaqoaDPvqxmT2oqfYEGDXeRaXKta4YbCR8GdcKnlnvd/23gZWseyOXAIA8cQlBgj01U
 QlfA4+sQhXSh5sRcNtXi8cBtwcqax6ClQj+rlaFe4+9FfK85XaQnlfVh5Q0UMoc4ilV79FM8
 iALJ4LVdHWZm/v9BIQ+3IK3OmzUgM9zgQTOLhMDw9tNFygAzjWzDVVTA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] libpam: set status for CVE-2024-10041
Date: Fri,  6 Mar 2026 07:55:14 +0100
Message-Id: <20260306065514.9529-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232534

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.6.1 (per [1]).
NVD tracks it as version-less CVE for RedHat.

[1] https://security-tracker.debian.org/tracker/CVE-2024-10041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8fb67983ee..470aea80f6 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
+
+CVE_STATUS[CVE-2024-10041] = "fixed-version: fixed since v1.6.1"

