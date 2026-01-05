Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A712C2A096
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:49:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61562.1767610174461036923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=PAxjTCHL;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+louis.rannou.non.se.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC5BB43A58;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CF8BC19421;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767610173;
	bh=7fpUDhH0+im6I8AZsSXmhPC9H7nhAfbtGkVBUFDTP/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PAxjTCHLXzS5OkMDWRN0C+G2Vh3uOa9ZDZYf09ChtvMX1Q+ikv60qD5icjl9YZwHz
	 RbNPfYcqMQs5OHn9P2U30a0brr23DvQaHVoiTf5uCkHBvom+Ffd8UpMLqHFCbyD3F2
	 4TL2gv/YE1pCKvotF28EJVjLFHt4lP4eO04pwqH+mKJFwBt7MHx5NuimdhGT7wJ42W
	 vhG9IOqGEHFarwWl3MW+mQjB8MaKU80LN8M8uhrdKFy57gmRSk7FoRapKYNQdUTlXn
	 Kws2CW+df9A4KdusJm6/f7BciIzHW86c1fB6f6Ac0PilKCUpkwgmkRCIO5TesJ88oG
	 U92yr20OfuXRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F01DC2A096;
	Mon,  5 Jan 2026 10:49:33 +0000 (UTC)
From: Louis Rannou via B4 Relay <devnull+louis.rannou.non.se.com@kernel.org>
Date: Mon, 05 Jan 2026 11:49:26 +0100
Subject: [PATCH 1/4] oeqa/selftests: fitimage: fix missing spaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-fitimage-v1-1-e319258c4c4f@non.se.com>
References: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
In-Reply-To: <20260105-fitimage-v1-0-e319258c4c4f@non.se.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>, adrian.freihofer@siemens.com, 
 pascal.eberhard@se.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767610172; l=794;
 i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id;
 bh=rQ1nbHMPOK4AhgGS7auVgedREqGsY8ykUKHeGJ0VQSU=;
 b=4AZYV5+0A9nXX7Rdm4FYKxt2Tj2/U3hNKmps8EiSGEIM1dYZAziZR2a85TzRGJUekOPvuAfvd
 YSgQMQrHTErD6aHnluJSW5RRZCiBS4zflgLZYbP6lIXObgTX/1SBwpf
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228863

From: Louis Rannou <louis.rannou@non.se.com>

Spaces missing around '='

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 8df5e92a34..008687f9d1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1722,7 +1722,7 @@ UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
 UBOOT_SIGN_IMG_KEYNAME = "the-kernel-image-key"
-UBOOT_MKIMAGE_DTCOPTS="-I dts -O dtb -p 2000"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
 FIT_SIGN_INDIVIDUAL = "1"
 """
         self.write_config(config)

-- 
2.43.0



