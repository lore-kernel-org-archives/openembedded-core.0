Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807CCF47CB8
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:11:47 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52266.1772737903416480870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a9ihnvDQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202603051911398db8a628800002072e-os6xto@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202603051911398db8a628800002072e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Mar 2026 20:11:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ivSGNFn6p7+4SrrbBpAofftQ4VZOPJruIhDUu1LEDMw=;
 b=a9ihnvDQ3RlWxnaHvbPyY0sf9yWptWb/0EOGxQJSl8UEnWXMnXgBE7nT+Lo6E+qhmxjr8j
 lc/A7eUh+VupdrdRKXWNhBytlyr1ipq7Gml8yDJLTS/3+kU/A4dhYqQdy/dMcMmhMC2/TXMg
 T847hEmix3hhJ532CxiATIYkoidLZyHYoArVDLGyhTT4SnebdmHy2hjZOE97EWKfrshRDw+7
 JvugcFqIS9isC0dIoUgn62yqM996nEYmq0FsLMkf8kiaQsPf7/ymMit/OuobjzzHkx2g0dYv
 QX8wL8lMaXP8r8TzGxVt9HtLylV4N0vCHrUxxzdvTqn4pkBkG9VzB7Ag==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libpam: set status for CVE-2024-10041
Date: Thu,  5 Mar 2026 20:11:36 +0100
Message-Id: <20260305191136.1520512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 19:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232512

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.6.1 (per [1]).
NVD tracks it as version-less CVE for RedHat.

[1] https://security-tracker.debian.org/tracker/CVE-2024-10041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8fb67983ee..713163fdba 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
+
+CVE_STATUS[CVE-2024-10041] = "fixed-version: finxes since v1.6.1"

