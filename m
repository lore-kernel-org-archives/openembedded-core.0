Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D44106ACE4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 20:05:01 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1886.1773345895656109992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 13:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SDuWsJ24;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260312200452b4aa52e25700020734-oecalq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260312200452b4aa52e25700020734
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Mar 2026 21:04:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D1v3VYLoD2Ww4INHwYGHYPmv5J4JS3/yXod5RNwXiLk=;
 b=SDuWsJ24YhMrMkQchshHke3x0FhTret5tnV5HXnaWNX+RpzZP8DD0+KSyfccf4DaK7W5X3
 /TxUkLmnfXb0b52t5a4kVAxdcmW7X4xoc2PKlkZPRtY+ZpvcgaaTnenMZTSXqw6AwqfXx9sj
 0svW7H8nxM9+xJE/Nxpqye64mFRKuHpXwSxD192RJz+yF+oPHJvkcYvVEId6wBhDD5MbYPr1
 d56jw5JvTuKJDlwkzGCxtx38Ucv/v+A0dbDma4QpKH5aCk73RwRPED3TzwGBucq3LFjoH/Z6
 WyaBnsUYVFf39OLntGJVz/Wr8DsTegcF+uZNqyvsVHbOuj6o78s4nLSg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] nfs-utils: upgrade 2.8.5 -> 2.8.6
Date: Thu, 12 Mar 2026 21:04:48 +0100
Message-Id: <20260312200448.2019165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 20:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233003

From: Peter Marko <peter.marko@siemens.com>

Fixes CVE-2025-12801 per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-12801

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.6.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.6.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.6.bb
index 119e49e2a2..7c2b0078d0 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb"
+SRC_URI[sha256sum] = "2bd7b34e809a7eff2f4bc5fc5fd96ebcd66a5458b471a270cbd2dc169b011550"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.

