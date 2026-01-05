Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556EDC2A099
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:49:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61658.1767610174459651957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qghW/+pv;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32B3443C40;
	Mon,  5 Jan 2026 10:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5DDCC116D0;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767610173;
	bh=+l/tRxmwbtoo98zVW/ytoexTqQHN1XFw/Xaz7htfby8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qghW/+pvCR5hxu1b6E5MMqc5u8TeuwWS7pf0BCtTtn9kZ4kQj8kMnWaPBD5qYGF22
	 iyXZFTkiciRgqXNHcOtTiSpQ7nyMN+BivIOLDwQ6ewYCB2scMk6svbb1qEUj62M1dO
	 NrHM3LmssrUuc3OANJYkZnQ2nrbrQW7VSxgCU2jfQbge6iDPtSV3zNS5Qj7Xu3YBer
	 9CHB0udur/3mmF3Mfw6mzmhGFJK0SnZI3vnNtK1PkcBvGmtrZvgwOvWZWva7lyJhor
	 UVMNrtw+XWyc8BuGYO8HYdcEyRwngofEIVDFwsoNjey6oWLq7ITlnKSFMAUX1IhDLv
	 Rkmd0u5VGLykg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC1BC2A097;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Mon, 05 Jan 2026 11:49:29 +0100
Subject: [PATCH 4/4] oeqa/utils: fitimage: rsa4096 signatures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-fitimage-v1-4-e319258c4c4f@non.se.com>
References: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
In-Reply-To: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, adrian.freihofer@siemens.com, 
 pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767610172; l=762;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=mbO0Ur/XUEX74SWYk4SC5N44kMyTAjUd4Mp5Ss51pTs=;
 b=ej1A3jnH37E5Ur86nr/asv1hDm9CyXF4FNeajJg+OsWJ+pa4UjEKqToBtr7GuuWUuIlN4iKgp
 aekO0yP58UBAMXqbFbBxsY809uG6BxqsvYEv6oghqJkrPAsAvbf8j34
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519;
 pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
X-Endpoint-Received: by B4 Relay for louis.rannou@non.se.com/20250630 with
 auth_id=446
X-Original-From: Louis Rannou <louis.rannou@non.se.com>
Reply-To: louis.rannou@non.se.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jan 2026 10:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228862

From: Louis Rannou <louis.rannou@non.se.com>

Accept rsa4096 signatures whith length 1024.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/lib/oeqa/utils/fitimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/fitimage.py b/meta/lib/oeqa/utils/fitimage.py
index bfe594c968..117206b39b 100644
--- a/meta/lib/oeqa/utils/fitimage.py
+++ b/meta/lib/oeqa/utils/fitimage.py
@@ -22,7 +22,7 @@ class FitImageUtils():
     """Kernel FIT image base library"""
 
     MKIMAGE_HASH_LENGTHS = { 'sha256': 64, 'sha384': 96, 'sha512': 128 }
-    MKIMAGE_SIGNATURE_LENGTHS = { 'rsa2048': 512 }
+    MKIMAGE_SIGNATURE_LENGTHS = { 'rsa2048': 512 , 'rsa4096': 1024}
 
     def __init__(self, logger):
         self.logger = logger

-- 
2.43.0



