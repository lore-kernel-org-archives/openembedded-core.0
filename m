Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2BAF531D5
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:28 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3543.1776114978132225658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LrFrQeHD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202604132116186569657ae3000207f2-3fvg0b@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202604132116186569657ae3000207f2
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Yzq69h9gDZJQ2c1k7ZvYXw6gYAJFL69ams78kIAAJFM=;
 b=LrFrQeHDPexmot5KgKHF6xBaZFhFJSqIktGY4wd+YwcyV9DjXVY9Dqo2nXjPajbrLMEKjz
 KYSB1TISMFVpbJigD6gwrwAtFg/dxVZeK19GrXUWrBi7afa3lt3SKhFRDaLtAn7v3ugKKURu
 kQLtKd3hrLSASoo8fey1ZsE5pRe4avs9V0I+5JNIx5pCGexO+5Mbt/WU2gLN0d1kLyzZIfMn
 Gqey584vKzRatlJQBkUdFHIC+dRYZa3XYepcy6OZkr1T5HOpcq6iJIOwt98/YEFEa/xXRLwr
 xQ14Ay7MzSRnKRBVry8mHtF6c+7eC8p5dKtfgxj6Tf7Gms16kJAc+fXA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 5/6] ovmf: set status for CVE-2024-1298
Date: Mon, 13 Apr 2026 23:14:46 +0200
Message-ID: <20260413211447.564257-5-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-1-peter.marko@siemens.com>
References: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235127

From: Peter Marko <peter.marko@siemens.com>

cvelistV5 uses full tag name (edk2-stable202405) while NVD uses only
version (202405).
Since NVD CPE is not yet available, cvelistV5 marks it at not patched
yet because the string sorts after the version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index ec6c3b516c..150e2d47e0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -45,6 +45,7 @@ CVE_STATUS[CVE-2019-14563] = "fixed-version: The CPE in the NVD database doesn't
 CVE_STATUS[CVE-2019-14575] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14586] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 CVE_STATUS[CVE-2019-14587] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2024-1298] = "fixed-version: fixed since edk2-stable202405"
 
 inherit deploy
 

