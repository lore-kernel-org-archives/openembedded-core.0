Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C65EC142E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 11:04:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15719.1772535838118489922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 03:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GtN4FZzG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F8F41A2346
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 11:03:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44C325FF29
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 11:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C80F10369694;
	Tue,  3 Mar 2026 12:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772535835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=v/uk67ihqEVFNDNeVDcNOWDqb82sEoW8igZZeVuQWLQ=;
	b=GtN4FZzG6eCUMBCDkiyh7OUM5wNSNDTzcBgkmUm83Ps7seJNpSwFy3w3nX2iKDw+3GLMee
	RoAOS61bYdegqjAiCGVRcfJvXGqtN4I4gCg3xquy375AdQMGIbgHqpeHRxk1PBvMFdLQTn
	C9FQbJqn1PzUuUVe7ocGZi6AYz/4uxBJ/cLxkI4LtR3PM83naVDbx1Vt4O6Vi604c7Fbg2
	rvZJM34GRFt0AsMK3PbuLfYbUqvED0AIr4asBQ/zd/MT9Xbm/C5dg1hHXG2wn79gT6bOAq
	Ud3oZmK8tOna9mGkMbKoEHvOwltOtrPzDADwH3iGHaAdx++NoP0wCJqUooajiA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 03 Mar 2026 12:02:27 +0100
Subject: [PATCH] templates: site.conf.sample: remove CVS proxy instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-remove-cvs-note-v1-1-7dca762603d2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrBuYZMBFryIu0mRsp2BSMjYI4
 t2Nunvf4v0bKBdhhWe3QeEqKjk12EcH4ePTm43EZnDoeiQkU3jOlU2oalJe2kDqHRFaHy2016/
 wJOtVHMbb+n99OSxnBvb9ABXk1Y9zAAAA
X-Change-ID: 20260303-remove-cvs-note-c03623301ad1
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rIIDEKQyPCOewjT6xHukgTUHuY3y/BUj9Fyz2pBklkM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBppsAb+KtKV+sBfHktjcRVwykdIjGAiXNXx+Y7v
 PwwTntD8kuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaabAGwAKCRDRgEFAKaOo
 NmqkD/9vWBMRSE4qLxdvuHJ3P56jx5lsTOE7z9j0mCqUphXwP7X2IweQa6PESyuKf/KDWvh4hOX
 nuexeZOJw5CRFvrWiJfrEAL3oDXbeOpya252uqKbH9E3cDsA7/zimHrnJ5FhXi4oP7DK+yUydoA
 0VinyEk/zJ4ni2RZmrPuqvN0wJe77JzPpTFPLU/Lu9UB6eSa2RXRSY3L+eF6lkdzcQZwzfDiH2I
 k2InqDg951IzSKSV9KiQ1EHyh6+TutwlDBwD+ufK63GDejgK/IV5OcZFUhaX8h/68LC2P2jXqn5
 Uu2dejnEbVnnKO6+M5FvpAwdP/oTXdhcoR7CzraBJIl4xgrAGD3az9Vzmlxc+7xR3pjDLnbSva/
 1l/8fZMI5xJWF52MiXzXUGnguBTFwVcNSREYvNqHchVjJA1wyhsd7aP6lHAbbS0vZB/M6EGgYya
 5cE9WMZp+vzlLEdApO3CrTARtLDKanO1Uk5vtZFKxtUkg2a/UidYq6tpeIX9aVKTKBgoZ+z72bR
 BZSA1SBztVe+HNiGIso+A3t5qKoQhSoQqGc6TXYR+6DnSdi25HfbXZBMo+dodXXKXk54TqjijRZ
 JarX8VSnX7tXxW5jsrQvFrXocVtfV43OCL1YAfLzYzx64wmIiTXIneDrTWS65XgP5S881yvCDRs
 ceSRSCd0z4j9saw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 11:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232306

The CVS fetcher was disabled with 5427500e4f23 ("fetch: Drop CVS fetcher
module") in BitBake. Remove the CVS instructions from this file.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/conf/templates/default/site.conf.sample | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/templates/default/site.conf.sample b/meta/conf/templates/default/site.conf.sample
index 5164fedf630..fd8712f315c 100644
--- a/meta/conf/templates/default/site.conf.sample
+++ b/meta/conf/templates/default/site.conf.sample
@@ -6,10 +6,6 @@
 # changes incompatibly
 SCONF_VERSION = "1"
 
-# Uncomment to cause CVS to use the proxy host specified
-#CVS_PROXY_HOST = "proxy.example.com"
-#CVS_PROXY_PORT = "81"
-
 # For svn, you need to create ~/.subversion/servers containing:
 #[global]
 #http-proxy-host = proxy.example.com

---
base-commit: d3e757f21403554e7064c5fa2b353080d14d2ce7
change-id: 20260303-remove-cvs-note-c03623301ad1


