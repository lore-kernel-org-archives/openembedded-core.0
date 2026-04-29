Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F51ECCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:32 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4557.1777491446585937523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RgTy+jHI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202604291937255c4d205f8300020745-tz1_6w@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202604291937255c4d205f8300020745
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=L2hva+XzARHN9BVDrwBVZsEpk0O+dLRNJPyTCpIJ1w8=;
 b=RgTy+jHICHXlLSO7+RXazXRdZGt4XRJcQsAX+3+pmy4n8vjWpcI4E6AiFP8klC351ka+hZ
 U+E9EdqEgxu68Qq8oMiGcIWtebjuJHERwaWdJPDIgIxNBmAYGD9PySS/fklBhk/9zjBaXOKF
 QPk/e4chkHjCIpfYev8bd7LNtyETDBNVcFcdpVnNIYBvG8xyhlLEUnwnJysqi8XF+pliZFxF
 QYYNmNlN1Z4GnStS181xyXG312dmpAIulGZ04TkFtFoCNFnNPyYmDvkjbSfpA1uORg11rZPw
 ukn6E8ApuLvY55tl7nBBmmjJBmwr2VRCpQ4juCziHF/ob8Ygd/b4Kt0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 6/7] libcap: set status for CVE-2026-4878
Date: Wed, 29 Apr 2026 21:36:46 +0200
Message-ID: <20260429193647.3090502-6-peter.marko@siemens.com>
In-Reply-To: <20260429193647.3090502-1-peter.marko@siemens.com>
References: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236136

From: Peter Marko <peter.marko@siemens.com>

This is version-less RedHat CVE, so needs explicit status.
Fix reference: [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-4878

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libcap/libcap_2.78.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libcap/libcap_2.78.bb b/meta/recipes-support/libcap/libcap_2.78.bb
index 449260f7dc..782ad02665 100644
--- a/meta/recipes-support/libcap/libcap_2.78.bb
+++ b/meta/recipes-support/libcap/libcap_2.78.bb
@@ -70,3 +70,5 @@ LICENSE:${PN} = "(BSD-3-Clause | GPL-2.0-only)${@bb.utils.contains('PACKAGECONFI
 LICENSE:${PN}-dev = "(BSD-3-Clause | GPL-2.0-only)"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-4878] = "fixed-version: fixed since 2.78"

