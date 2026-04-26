Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD981FF8860
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:05 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24918.1777229456997327591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Pys8NDsy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202604261850538b3e2448f90002078b-vapn3r@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202604261850538b3e2448f90002078b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:50:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9SIcR24yWguqK+sTjA2cmCY/EJCcEsJLWr48ZKBIBu0=;
 b=Pys8NDsyn1xtdymYP7ow4CyQDmMRD0CyhKIrUZ2OOnz2uo7oonZrz14eAYYP/GuowQFjxZ
 UTLryabNNGFZ+/SMNBQWOilCytJPo5rZBJl/IQoA7yo6EEzMlIHkktCDSHe60tQMoCrgUEW4
 A9nnp2y2fEgOkDwwrUEIt7GLIrIgPuWDPNuV3Sdz9jvnWNuGnuwCcP8K8Gv3D+c/v0BAq91i
 zmnBmbz72rxRRTSMXCQOy+qRN1PRnNQcgtXCfd6kQkBZFUsIixHRQWr/SyQ1zLJJOBBo73z6
 FS/DUkFIDoM2n5bFB1GjeN71x5RMBusdnK7H6JKT6b/VksrINSQTZ+zA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Date: Sun, 26 Apr 2026 20:50:20 +0200
Message-ID: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235961

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for sudo-rs, not sudo.
It can be easily deducted from first word in NVD descripotion.
Also cvelistV5 product is "sudo-re".

It looks line that new version of sbom-cve-check matches product with
startsWith instead of equals?

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index d6ee881f8c..12f81c5d4a 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -60,3 +60,6 @@ RDEPENDS:${PN} += "${SUDO_PACKAGES}"
 
 FILES:${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
 FILES:${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir} ${nonarch_libdir}"
+
+CVE_STATUS[CVE-2025-64170] = "cpe-incorrect: this CVE is for sudo-rs"
+CVE_STATUS[CVE-2025-64517] = "cpe-incorrect: this CVE is for sudo-rs"

