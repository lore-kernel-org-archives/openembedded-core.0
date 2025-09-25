Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4B5CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.12446.1758809159373027764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LXdKqtjJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025092514055527c56e13be0002070d-n56rax@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025092514055527c56e13be0002070d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:05:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ysaej63F2Exv46eYqbWMK5VzD7Lo/jRGwsi5B1tunYc=;
 b=LXdKqtjJ4ghkK3dLxYJToe430L5XfyX9ZBA26Od2Zq99u3cNe8/rrVnZdYmwSd7sSFHQ+B
 5ewQ+ucIpQoZngnB3aCg3URP0chnEVDqz+TGybVHlg6B/QN/247gvbp2kRjIpShrIN5j6r+P
 q+wX3VnPyGVOkXwI5YdjSMhaHm04SHW+Tp21TvjUMe/ahKIJ8XBJsCLHFFc3+Hec8pQvSDIO
 9dBwrKzkvEGCnTcV1y/11Pfts2ROCwcZTDYnkZ+G+mYCr02pJtC09h1m+v376DZgh6ZvfMIH
 pNkfjUC1ir+e5X8N2C0H7PjqClQR63s3YmSiKAztX7hqYc0z/IJWS98A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 01/10] gstreamer1.0: set status of 5 CVEs to patched
Date: Thu, 25 Sep 2025 16:05:05 +0200
Message-Id: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224030

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in last upgrade.
See commit message for 340b182d5fc972175f1d2a89127f807073c10255

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
index 6ed00f9aa4b..db662dfec17 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
@@ -71,4 +71,8 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORT"
+CVE_STATUS_STABLE_BACKPORT = "CVE-2025-47183 CVE-2025-47219 CVE-2025-47806 CVE-2025-47807 CVE-2025-47808"
+CVE_STATUS_STABLE_BACKPORT[status] = "cpe-stable-backport: these CVEs are patched in current version"
+
 PTEST_BUILD_HOST_FILES = ""

