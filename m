Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E97C55822
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 11:02:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36097.1771585327546770862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 03:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NAAikxtx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EFA4EC16545;
	Fri, 20 Feb 2026 11:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154125FA8F;
	Fri, 20 Feb 2026 11:02:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC40010368CBC;
	Fri, 20 Feb 2026 12:02:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771585324; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3jxjG1/UYsVYB8EPgHDeOSoY39pcBSpTqUNFnzBKuFM=;
	b=NAAikxtxsJ8/wBuXmWnQq0gcN8MVxFwowqlkzAanTVa3ifvEJUbgnc0+eHQhptit4WdHUI
	R6UjQELZIw5BlYXzRWRRWhBk1tqSA9/FzGX7yFCllEgJ8Es9kyU9/gZIxE4C2zrcfgeOKO
	7u4IeOTYTqtPrKCM9pg/4NRJRYN6WcxXkouakoxIfBDLvHg6mZ3YScZYf4/ydDbOYKCbQo
	ltZV0DvvzQoq3hDaiTcPC+LR0V+4f7ewc+mHP29LoHV7cXJ7G6cGTObsMsY53N0lpK5InL
	oBUSeOZkDCXEFDL14mkevMRrD+/nQrKTKqwukgrTbsK13rZSJMK9eOmIOq21ig==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/2] meta: remove reference in patches to rejected CVE
Date: Fri, 20 Feb 2026 12:01:55 +0100
Message-Id: <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NOw7CMBBF0a1EUzOSP4iCrSAKZ/yChyJYtkkiR
 d47FuVp7j2poigq3aeTCjat+lkH7GUiSWF9gTUOkzPuZpwz/M0xNHAOTRLv2hIXvCENkWUDWy/
 R+nn2uC40Irlg0eM/eDx7/wEMaykVcAAAAA==
X-Change-ID: 20260220-update-patch-with-rejected-cve-13cd13bb3e4f
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, thomas.petazzoni@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
 jpewhacker@gmail.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Peter Marko <peter.marko@siemens.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231509

Remove the reference of 2 CVE identifiers in patch files, since the
CVEs are rejected. Remove reference to CVE-2025-62813 and to
CVE-2021-3502.

These 2 issues were found by using sbom-cve-check on the whole layer.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (2):
      meta: update avahi patch to remove ref to rejected CVE
      meta: in lz4 remove reference to rejected CVE-2025-62813

 meta/recipes-connectivity/avahi/files/local-ping.patch                  | 1 -
 .../lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch}     | 1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb                                  | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)
---
base-commit: 74ba238ff1ba1e9b612aece1989b828f3a8f8770
change-id: 20260220-update-patch-with-rejected-cve-13cd13bb3e4f

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


