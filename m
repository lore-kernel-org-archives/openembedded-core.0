Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CDCF51412
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 06:55:38 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64164.1772780131619166538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 22:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=U9w7zsg1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026030606552927a8cd7e6100020758-kuevjr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026030606552927a8cd7e6100020758
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Mar 2026 07:55:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NgD8ey4mVqAzQSou4SbdqlLVroSHrsHvRmdoFBNMAns=;
 b=U9w7zsg1cONBw9n0PtvV68EosBZjJPK2AoKxTmedpsL/W/V0sDw2atlymz5D/3h5t3dLgf
 FoKIC5HMS/7+73W8mqbm9WJIGzEO1XhG75tiIPltftQ4RIn22jF0Gf0Jx9/+mVc96i20X4Ew
 PtQlf9wm64FssGZy+7DPrNVgbL6xo5/+FUkh8AOlS+GQBJo7/Bos7hh+ZQ0VSaM1817ZRnDf
 D2QkT3NxuEJKiocH3Us08u/YNK6r9d4QHCZE33DbyTvP4BsYGZY0QaHRYk2agfkY8l5KudNj
 jUpH3f29nUDE2xAxa0K73uZJHGdKJPS+TKTNeIetEploxlAHYHX5gLPw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH v2] libpam: set status for CVE-2024-10041
Date: Fri,  6 Mar 2026 07:55:25 +0100
Message-Id: <20260306065525.9553-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232535

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in v1.6.1 (per [1]).
NVD tracks it as version-less CVE for RedHat.

[1] https://security-tracker.debian.org/tracker/CVE-2024-10041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 8d9ea27028..e83accd881 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -170,3 +170,5 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
 CVE_PRODUCT = "linux-pam"
+
+CVE_STATUS[CVE-2024-10041] = "fixed-version: fixed since v1.6.1"

