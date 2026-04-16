Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECBEF8DFD3
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:25:54 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28093.1776378350303807159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cUF6q5Vu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260416222548e0b00e51750002070b-eel0kk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260416222548e0b00e51750002070b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 17 Apr 2026 00:25:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eUR962Ne4mBqhBrkJFL0qsZW6lvBTMlnlKl6g362ST4=;
 b=cUF6q5VuuWNvTnQ9sgmTv5xYVFK0TKGAd0B0wNDNZkV8xyxdiyUMAIte7dsgcv/oD2Wwq+
 Q/tt/7irsZTPa1lMVTS+xx4qLNvBqEPPKMgnd9SjBLx8/qAPoii7MIx1IWjX/xHUNQ2XHysH
 m8jwoDY2gVdHdxEHFqKkLTGHzPHl9Z2POHir3ENLaqkKjuslGI3kDp5C+/hNHyl6VbMoLbIr
 hpKBbgJC7PrSBw4gu3MU/gGiiD1HxpD9Hdaiiv8UWk21URmoNsTUq6BpCaOiLgmVFfEwmgk9
 m5e3o1zEeTDZt4R/rv2DDCi+vsl3xQIEMG9uZIhs75pqykwkvD33zlCg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] cve-exclusions: set status for CVE-2025-71145
Date: Fri, 17 Apr 2026 00:25:26 +0200
Message-ID: <20260416222526.1992249-2-peter.marko@siemens.com>
In-Reply-To: <20260416222526.1992249-1-peter.marko@siemens.com>
References: <20260416222526.1992249-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235428

From: Peter Marko <peter.marko@siemens.com>

cvelistV5 tracks hashes instead of versions.
Same hashes are also present in NVD links.
Checking those hashes, fix is already available in linux-yocto.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index f86c8c3e2c..d27d764479 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -188,3 +188,7 @@ CVE_STATUS[CVE-2025-38656] = "fixed-version: Fixed from 6.17"
 
 # Fix https://git.kernel.org/linus/f1fdffe0afea02ba783acfe815b6a60e7180df40
 CVE_STATUS[CVE-2025-68195] = "fixed-version: Fixed from 6.18"
+
+# Fix https://git.kernel.org/stable/c/b4b64fda4d30a83a7f00e92a0c8a1d47699609f3
+# Backport https://git.kernel.org/stable/c/75c5d9bce072abbbc09b701a49869ac23c34a906
+CVE_STATUS[CVE-2025-71145] = "cpe-stable-backport: Fixed from v6.18.3"

