Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D68C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 16:51:35 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.594.1744131087411957723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 09:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WFTsxJwe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250408165125e80bda60dddaf62d44-e5nyox@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250408165125e80bda60dddaf62d44
        for <openembedded-core@lists.openembedded.org>;
        Tue, 08 Apr 2025 18:51:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iqs2Rk1OHwDiflklQzjW/MmpiYGd+a+2seM/Z1B6Ke0=;
 b=WFTsxJwe0k7vLYmAb5cSwqnGSm+pxtxA121gBO9fDC+f2cHqR1Yd2nlUxl08D0G4MrFlMO
 byN5/J7yxzt86RJFKAd0bI5BwiNaRg86Y7AdXMJ0yP+Bdyj23lOCDLJL6j9mqf7YUMQe3x4t
 MwumSSRHpg2s+aw8UrJlahdGPU6REoRKLWmW+6vDb3iuxs6vher4TvgMOuc6w60/4E5QP6DM
 EjPz/p4HVbx3qdFLYQbHTejEf+5hm/1SPQ+1mOLEJ99wel2nZ1g+NHTyvmygoDoe+6VEU37l
 870CzRB9tYcLX4flsWmxmuMJ5XcxMZ1jrpkSQrs++JIxe02piGhlGHLQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Madhu Marri <madmarri@cisco.com>,
	Steve Sakoman <steve@sakoman.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] qemu: ignore CVE-2023-1386
Date: Tue,  8 Apr 2025 18:50:33 +0200
Message-Id: <20250408165033.57908-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 16:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214550

From: Madhu Marri <madmarri@cisco.com>

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details:  https://nvd.nist.gov/vuln/detail/CVE-2023-1386
Type: Security Advisory
CVE: CVE-2023-1386
Score: 3.3

Analysis:
- According to redhat[1] this CVE has closed as not a bug.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=2223985

(From OE-Core rev: 6a5d9e3821246c39ec57fa483802e1bb74fca724)

Signed-off-by: Madhu Marri <madmarri@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b38cac7481..1fb387e9b5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -51,6 +51,8 @@ CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 # NVD DB has this CVE as version-less (with "-")
 CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
+CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

