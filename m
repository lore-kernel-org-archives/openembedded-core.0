Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E28FC79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:23:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9188.1788510192635955917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aeI8Mw3q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E10884E41507
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4DEA6057F
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2026 08:23:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC2BA11C7AB30;
	Fri,  4 Sep 2026 10:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788510190; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JQ+Cn6imyeJcUbYUVS7utgNBxud7ifX7ubNSDHOrlTc=;
	b=aeI8Mw3qC8dIbiAaDMsurWgCnwFsiZ/w8yXBRIvsvWXzRwoEHCxrjzcLKOHtEu2iEtgsI7
	sSuHd78lPId5PQ3VDXLc9mYDgP6j56VztZ+Ou3Ix2YZIAivY2hLfLEr577JlVbrWadFmaH
	PR3mwOfPaEc5yflFtveUCHoX/P+YTrjxuC9/L7vJTcpylAFhd1Tm7Gf2DmaM1LqU16cew1
	2tv71bw5ixweK8w2YzEDz8R6+TEKanjZ+5tNeycvQSMpR4k3CexS78ixwX7w48woFTTYoX
	YhmZFfdWbGv8muqKmRDDVhTATiR1BEHQvfcd4+Z8xGOs7iWLppzGkNZKBavUZg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 04 Sep 2026 10:23:00 +0200
Subject: [PATCH 3/4] scripts/oe-depends-dot: fix Fonud -> Found typo in
 warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-oe-depends-dot-cleanups-v1-3-b56bf05fc5fd@bootlin.com>
References: <20260904-oe-depends-dot-cleanups-v1-0-b56bf05fc5fd@bootlin.com>
In-Reply-To: <20260904-oe-depends-dot-cleanups-v1-0-b56bf05fc5fd@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=779;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TLoJvibF6qPuoTSwKMMjcBo+Jgj1aWb+GS3EHLDs5BI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqmn/mKay22vn5YcCuJFsDg3zz3ZWvoREUXGJbL
 tSCShh+46+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCapp/5gAKCRDRgEFAKaOo
 NhmwD/99WVXSJtBSqwlC44hQhavP2pdqLqc1xiIvYCblXQQARMPkxyPVDtVQkc3mgEAFshFXO6b
 bmfGmgHvaSApLyIrGL93TzV9Py8+4wUuAtoNzekukVKXusyqGiSL5t92pNLKWdLi4XhnfA5j0E7
 IwaymwU0xZn8y9S4lVOwJCwFA4hhWX+pYUd0hzwnPnwFfUHRNbFgZyNwHtHRq7uK8iZzJK2NHgv
 vaNG/XqgO/kkkNMEQ9Z93Bc1Ka3hG1gIAIVLjuvyDPKRV2joGY/a/5Lc3UYlBPtIRm+5Q8OQyFa
 /QLnvawMAQJF1kOdcn6X3N2k/RqEREeJ/ikHrfyyOPSWTv1cvva4fmfzwHGFIonLqRhR9YhpgVZ
 VWh5wfRIZTA58UkWsFm14eKuCvvGx1yIDz3f/WzXw8VLnspOT6+sU11LUQBrXPev8OjciG0GPqV
 NxiQwqD2A1Pxmh1wt1tc8QFBn/PsFjo89toxD/8J2KMmZzmyG9utp6yl1rpMe//bnqREvRhTZaB
 gh0K+n0SDAwg4HPQvnRukpIFGX4zpunvMmMxJzSOPN5w3a/qjzgs4jJZTqrtHGi6sgeaokXQa+9
 y6vDffsQ4uTATFzC8Qp6O2m4MfLDeONKI0YGu1aHXTV6zpAwL5AVv/PMopR3SnrGXzEsNyINfUz
 EhhV675SMe+E5GQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245068

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/oe-depends-dot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index c505a196f9..560d2fd2bb 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -119,7 +119,7 @@ Reduce the .dot file packages only, no tasks:
                     if not key in depends[key]:
                         depends[key].add(dep)
                     else:
-                        print('WARNING: Fonud duplicated line: %s' % line)
+                        print('WARNING: Found duplicated line: %s' % line)
                 else:
                     depends[key] = set()
                     depends[key].add(dep)

-- 
2.55.0


