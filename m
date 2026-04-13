Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB06F531D4
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3546.1776114974254523384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HYiPsDwS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202604132116129a610b8d7400020769-uxzccq@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202604132116129a610b8d7400020769
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EltZknP0wGUFRz2WVl+sEpjDP+kXaNv8fsq+5LEyp+A=;
 b=HYiPsDwSRd4E6GZ1AqhUVkKlfAgLahwi9AcL45lch9s0O04bXvvHBT0DURRdZYixVxFYR7
 4H9EVdaxHeO2YIoxtVvooHjceg415HHTT+o9oMhoUMS6ZZiz9/Swb0KG7KTOugladqBRFunJ
 wxdW3L48vhfn6rMIowyE5R9An2juXwdDnqhzsbPQkDpOpPR96FDOMTliOol8OZ2xLBAfJw9h
 JFtqBZbicqxSEipd92J/ZjWkC6d06w3DPOj/RJp2sPgS5u2EClg2isa+J2WWaHGesaaGbv1i
 A3otCpW0V2FRC8ea6BZgeVHkvzuSGzx4C5edzQxi7fnjyxNRi501qcAQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/6] tar: set status for CVE-2025-45582
Date: Mon, 13 Apr 2026 23:14:44 +0200
Message-ID: <20260413211447.564257-3-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-1-peter.marko@siemens.com>
References: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235125

From: Peter Marko <peter.marko@siemens.com>

This CVE is disputed by tar maintainers as documented in [1].
The same link is present in NVD and cvelistV5.
Also Debian says "disputed" in [2].

[1] https://lists.gnu.org/archive/html/bug-tar/2025-08/msg00012.html
[2] https://security-tracker.debian.org/tracker/CVE-2025-45582

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/tar/tar_1.35.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index d463eff97d..042baa035c 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -95,6 +95,8 @@ BBCLASSEXTEND = "native nativesdk"
 # For example CVE-2021-{32803,32804,37701,37712,37713}
 CVE_PRODUCT = "gnu:tar"
 
+CVE_STATUS[CVE-2025-45582] = "disputed"
+
 # A test uses cmp to compare two 8GB files. Busybox's cmp does the job usually, but it is much slower than
 # diffutils' cmp, and the test times out when there is a high load on the host machine.
 RDEPENDS:${PN}-ptest += "diffutils"

