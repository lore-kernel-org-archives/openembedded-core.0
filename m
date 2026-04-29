Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69895FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4496.1777491451377406366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UpNFbAL0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202604291937293c1fec037e00020778-drj_u1@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202604291937293c1fec037e00020778
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aeGPg691dgTI3s9hx2iYhbhFXUo0uRthjZojJb1eGPE=;
 b=UpNFbAL0SrvIsy1vgaN3WLtQAP7JQPV8gOJF3IjL0Dj7B74SggW1m+5Or/KVvmVZPJ0URi
 bn3DkDsRJUaoxrRqLDBPeDnk2Vc6zXDBl+QN282QwrXuZLs29GWQJIOT4kkXE2epz3EePzCR
 Ljh0iG8LDSnp6nkBJY7Esff1TOaM9RvqUCaGgZ9HETxx1byR+HWsNvPui0W0f4Q8N5rPHeWJ
 mImphApMIVcNkCPKrqAaT1aGUHArGLXLru/ff4Za992Vyac9y5iV+BrEG9jq+LDabp8h0as5
 nFjr1Czt5As5l5llEtSOHr103cdTb0ebnYA0egKrF4MiBmHDFd8OqGOg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 7/7] libarchive: set status for CVE-2026-4426
Date: Wed, 29 Apr 2026 21:36:47 +0200
Message-ID: <20260429193647.3090502-7-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236137

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE so needs explicit status.
Fix reference: PR/commit listed in [1] backported as [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-4426
[2] https://github.com/libarchive/libarchive/commit/ec1bc43156b84e12ff363f39005533e6f7067297

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index a65afb7b22..577362ef8b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -89,4 +89,5 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"

