Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99A2FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:51:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7212.1777326690521047065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=QHH/lMK+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260427215127772e8b1bc300020706-tzxrzn@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260427215127772e8b1bc300020706
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Apr 2026 23:51:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HANnLk3pKqW23Mgi1qbCtQgqUCV4g34Wll+QJKr5hyY=;
 b=QHH/lMK+7+hq3fjdq40bcy8LbSRmbiwwZG/w8/NIa7iKM0ssvdyUdmEuTT9zgaGi1PJD27
 /hcV5UcpRZdk7RCtANSSeHYm1EvpJxdz/f+23FduBVN6ds15+OkVJM7Q9RPzljjL1GLapj5P
 hAqmYbUFaNmBMOxqWrEN4/hD8oLGHDeGEae4iqqylXOBbnN1M1kpUabwmLgpcmptGGU4VbuI
 OdfNnbKq2mYZWloyPnhr5dwl8cKq4bALQVw9jqZyodU8mrgMzRPqEljHJkLFQtq+FrZ+XSU1
 kW/Hg/PL5oGpm8+/sDN1fofkezY/9JzxjaVrVVLubcBrGUCgOOEukfyQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/4] coreutils: set CVE_PRODUCT
Date: Mon, 27 Apr 2026 23:51:17 +0200
Message-ID: <20260427215120.199335-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236031

From: Peter Marko <peter.marko@siemens.com>

This removes rust uutils coreutils CVEs from reports.
Comparing sbom-cve-check shows that only
CVE-2026-35338..CVE-2026-35381 are removed and all of them contained
reference to uutils.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/coreutils/coreutils_9.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
index 984c5b5292..8109244f44 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] = "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25"
 
+CVE_PRODUCT = "gnu:coreutils"
+
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
 CVE_STATUS[CVE-2016-2781] = "disputed: runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue."

