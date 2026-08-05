Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C96BC56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:26 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2520.1785955153892223504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 11:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DGbzxb2N;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026080518390962c120935a000207c2-ihmidr@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026080518390962c120935a000207c2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 20:39:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=43NZKh7iR+x1sHvEeqRJrPDzM8DOthn9WYI+i3mA8vQ=;
 b=DGbzxb2Nf9EKemQeexWm2xksDDO0Hm7avqrppvfQsSYGo84ETZLyK8wcB76uE4XPe9SI6L
 94WuH6FSUomYX10awwSoYTjGVqYg7kqPC/BcXJSK9MkwdLdNYqEY7SXFQgiGdDIApglKIAkW
 evwrJgDSHUlOGMUYl2J12kALBRFA43LbdajeC1Q81Ac5ULqwDTGAj5zMOvXCzvz+4LmQjwEv
 fZKRqsBE+t9+YDpvH+yT11G3d4cta4NBcr8MpmSL8U2WJIt5MVFitQIUcPq5vlybLjgly4dp
 Xhx9QiA6gCywD/jLFa//F0TZkSYHFwdqj8lUINMztJWi5mcae8BNLZjQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/3] tiff: set status for CVE-2026-4775
Date: Wed,  5 Aug 2026 20:38:43 +0200
Message-ID: <20260805183845.205950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 18:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242888

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE was fixed in commit included in v4.8.2.
NVD tracks this as RedHat version-less CVE.

[1] https://security-tracker.debian.org/tracker/CVE-2026-4775

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
index 47f1b3f4dc..8bc3a48657 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb
@@ -21,6 +21,7 @@ CVE_STATUS[CVE-2023-52356] = "fixed-version: Fixed since 4.7.0, NVD tracks this
 CVE_STATUS[CVE-2023-6228] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
+CVE_STATUS[CVE-2026-4775] = "fixed-version: Fixed since 4.7.2, NVD tracks this as version-less vulnerability"
 
 inherit autotools multilib_header
 

