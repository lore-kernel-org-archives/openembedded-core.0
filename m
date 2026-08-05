Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA82CC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:24 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1099.1785950959601981966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=QufzYe9T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026080517292175da8b0ffa000207cb-dgk7_r@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026080517292175da8b0ffa000207cb
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gIHytUycH0c6Wglal5+e1eKW1qpilc7+ARtuoxiOuGk=;
 b=QufzYe9T4DZWKdwwQNNu/pz9CLHC0xkd8VgQ5Qk4nvvw8K3Y7N0rPJX+JJebWSpwyHukQv
 rZI9GmqCTaE+rHVeBo4C3QL16RavhHG8E337G5k06OI1eyzxhW0oeA8RhlCPqtq7nJRVI+oO
 +9TYyKjvCg9p0QpcvqhrbWRLBL1LvUO9k8dY1jOS+nb2wS2yKF6raRlY1pYjrpfV4aO/xMN1
 f0Udy+jJ5iPirPZ+Dz1Sg/TQsCNvk/eDMvkLVYCryc2phHNkDycvIY0BCgkpaFvKSFXQUJVN
 p+/dZ/UBlHT5A3TxYTAI2LJNMnn3NF3ihc1bpz4HtVg9QjL8yJ/mmQ7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/7] nfs-utils: set status for CVE-2025-12801
Date: Wed,  5 Aug 2026 19:28:38 +0200
Message-ID: <20260805172840.202825-5-peter.marko@siemens.com>
In-Reply-To: <20260805172840.202825-1-peter.marko@siemens.com>
References: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242884

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

This is RedHat version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 06e4fcb6e0..bae63d4f2f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -148,3 +148,5 @@ do_install:append () {
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
 }
+
+CVE_STATUS[CVE-2025-12801] = "fixed-version: Fixed since v2.8.6"

