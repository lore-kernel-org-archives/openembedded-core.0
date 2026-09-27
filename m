Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301DCC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 09:00:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33376.1790499605733257858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 02:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hbZ7T3hq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026092709000866ff6163f600020775-3dk3gb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026092709000866ff6163f600020775
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 11:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wexw94u8Zk5YtdWzeqKPPFTr0Gr5lbdjj0wfzl5mmkI=;
 b=hbZ7T3hqvXr08w/GPou2vBwpQfXhWtTVZSNgJwjBKAmGwd0AwFYDq+MljSXvDzXwFYag66
 /uVh8nIyTTBx+EIP5M1ReKVGILAJHxcyfSI5IgFzWpE2kpDP1Z0QB9FAoPARMi0c7aG+dSXp
 zqgKtOvRGNrx5csQHsNs2KxwZr9vyVFKdYG89IdoX5hUMeJjQEkADs5iU619DSlAinfVWZ33
 1KLHqsKzcBltWNBehR2/+/jue5AdHdQorGMYkygy/Bybw0OTn+YmBYOg+edOTeoYz/jAeIZ+
 +xnnZgiwv9rquleuLC7Orode7lTHGkdeRgmcCBsf2dD+cleGWudv4qOg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 4/8] nfs-utils: set status for CVE-2025-12801
Date: Sun, 27 Sep 2026 10:59:32 +0200
Message-ID: <20260927085936.114900-4-peter.marko@siemens.com>
In-Reply-To: <20260927085936.114900-1-peter.marko@siemens.com>
References: <20260927085936.114900-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246682

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

This is RedHat version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 2bb062e403c7093734de6467c49503a7d8970d9e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
index 7693a88682..a5ebf7043e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
@@ -147,3 +147,5 @@ do_install:append () {
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
 }
+
+CVE_STATUS[CVE-2025-12801] = "fixed-version: Fixed since v2.8.6"

