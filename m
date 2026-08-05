Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C92EC561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:26 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2522.1785955157278620487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 11:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JwsYBPni;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260805183915b7b7ef0cad00020746-bfz_tl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260805183915b7b7ef0cad00020746
        for <openembedded-core@lists.openembedded.org>;
        Wed, 05 Aug 2026 20:39:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=e/x+R1Kej1UlwTreby4+ZmIj9kqK/ZHmwtkaUlVZdyk=;
 b=JwsYBPniHzHrnOWrSryr22EpveNrdcHJpRbNFQUoIrKMvfV63SoL+rhW6Nu0feGr2I5U5T
 L6T308xKLp0vPdBgHlthVbGR4q7DlOTs7xvnFWNbbc5W+xLY/0zyKkq8XiXanCfRWkiLEzqN
 trq8up+5N98h8fZ6gO3M8It3WKmGDZFoo3Ea4G6a/DThMxH8LskeJHzOZrtlJ+52d8O6l0VP
 tVSJMOSSgvlpDoWmbE76SlXTnvajFDni3he7hyOGRHc6oM8FnvUXOqskPUOLmobsdoVcY8u3
 94TbkBxjWEuKpKg+A0Gwge6zbNlUXvWb8ATHhl+ekbumiqloKCNcUrKQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/3] gnitls: set status for CVE-2026-42010 and CVE-2026-42010
Date: Wed,  5 Aug 2026 20:38:44 +0200
Message-ID: <20260805183845.205950-2-peter.marko@siemens.com>
In-Reply-To: <20260805183845.205950-1-peter.marko@siemens.com>
References: <20260805183845.205950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 18:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242889

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

These are RedHat CVEs listing version-less or distro versions.

These CVEs are listed in commit upgrading to 3.8.13.
Also Debian CVE reports link commit in this release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.13.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
index f48ded3bcc..9c8c994bdc 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.13.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -106,3 +106,5 @@ CVE_STATUS[CVE-2023-0361] = "fixed-version: fixed in version 3.8.0"
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"
+CVE_STATUS[CVE-2026-42009] = "fixed-version: fixed in version 3.8.13"
+CVE_STATUS[CVE-2026-42010] = "fixed-version: fixed in version 3.8.13"

