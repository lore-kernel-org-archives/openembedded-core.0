Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0213EC55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:29:15 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1101.1785950950616168678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=C0R0ixPm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026080517290738656f53e700020782-9rtcly@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026080517290738656f53e700020782
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 19:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Udqjs1fADYrCM4MaNws+KYMCT3uNxCyyDuOPCiVmrn0=;
 b=C0R0ixPmLMuRXjuL4/cEnZoRXV8s/wfPdGFDOUup6yNXZ9ERG9EIcHJNWWuy0rvz/LydcK
 FjCyZlV7IqFNMM6Ksb9dHBj/n/YN6H55JfgxqSQa2YaHbFomVNT/nqnTfRx8m6aYUncOhrZs
 N7kBc0ivckM76NQcDXEIqVcBgdklHl284KBj72KOgqu0KCX67KtrSKeTMyGB/8Rp339WhJKf
 FF8Drl8EL1e7pGe2Qw2zPyeKIoWqQHFqCBtQY3wxIM8bbgXbmtGthQynsHhjYx8ivSttL5jw
 WPJOiRfjgX+hE2SUfxclJjMxR5hAUTfe7VtPyYKtHxPLVLoD87kn6KUw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/7] gnutls: set status for CVE-2023-0361
Date: Wed,  5 Aug 2026 19:28:34 +0200
Message-ID: <20260805172840.202825-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 17:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242880

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this CVE was fixed in v3.8.0.

[1] https://security-tracker.debian.org/tracker/CVE-2023-0361

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index e360db6fff..f48ded3bcc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -102,6 +102,7 @@ pkg_postinst_ontarget:${PN}-fips () {
     fi
 }
 
+CVE_STATUS[CVE-2023-0361] = "fixed-version: fixed in version 3.8.0"
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"

