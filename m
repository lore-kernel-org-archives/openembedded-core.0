Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8BFCDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:38:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33116.1782473893477083295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QhfjG9nk;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso6170235e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782473891; x=1783078691; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/OQpPs9J5LrR7y1wpP2CStzwfH8sWE8N7/+n0Ww6kE=;
        b=QhfjG9nkFvjtp9v3Tgzjk36j/NL5HSvaV4QS9HvROD0I5sRuOrIHCeuXGpX2Y9xWBj
         vhKh1UqIwYnxdL6ifYKl1wQMtWCBGVR65jJi7nxeNhqyh3sFEo9PyqSRa382T/9chcU5
         UG1ROPNvQ12rlLQdVlOnnFrTcBmh/AP2zlCQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473891; x=1783078691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m/OQpPs9J5LrR7y1wpP2CStzwfH8sWE8N7/+n0Ww6kE=;
        b=ColyBmMZOWvB5jDl7Y95x9VL+2AW2vDzInBU2aRsKOVcbCH95NZIXgDwTahBapSPWq
         qpCc5Nc20k6Bx0Wfkd0HLTOxOE4dfVqdrCkeYXNC5yaSmnNcbfrKWFgGxuwOoj3+32Y4
         dzzy69pcYWijfHRtiYXjzCQl77lmf6QsjD9ag4lzr9czKjpsYdXJmjPZsV0iyA2LPU3h
         xXygMofB72E4Va/e0+IYiyPzo9Z7zRZbrPZBPZgw0F8IvRim+rO0nDtcqeK0K9qzYSqB
         86uiAIS4n8DbNWK2i98fuNx4fDL7F1JZa2IU2mF6JG6lcxF+I3v5sHOEkS+xcFXlRnql
         ArhA==
X-Gm-Message-State: AOJu0YzrxfOBrckCXADSSJY/bkBJfjAH9Bg2gNhJ8LoCpZgaOAQmAChM
	Lydl4UKAl+6urBetDdWrEZb2uD4Prn++RuK8M+vFDpqRAahR2YaTRdji5wYLpM0oC78=
X-Gm-Gg: AfdE7ckHPR+tlTWoMDkhe8y+DLCyPJJMqzsK6sUaVNV/aOg73GNQgtqVCSYJjcCT/Wm
	zHhc9/4++76qxDqyZxC+KSBBJP/D1mctjJfyV0RQ6MHADob3v+BqV7Q1MbfyvRgfFLGuXBfEAzb
	rxLWndvpO9XXfcrGGnNLCuNlXFMj0azaNzoIGFwZi0a6kBPCmvuAL6IxTeuDJERFGHQ5iWtuWiw
	PXZil854njRQS92JYjR2dNm5Flyo1w4DEbHpmK3wMXZSzuMsZU3LiT/2XxVXoYmH6prd79mUs0i
	daaCh1OoleZue83rz+/SRW5zng8DoRr0QUlIh0lwKWnPulxU5hgUfcdbNJxGdXq11l8lwTtMFuT
	yatjnshVA5zh5g2GHqR83Y9ZGLiBWoICoilXDASox+K0k5qLTqej04q+qlyoq03xXD7vEIaePus
	5cqPqCwfezJmPvgN45bjV43oteUChJennfZ/82RlFZpFZNrwveRuRvZR2Sakhhw+n4nZ051JVyH
	eS/54LlOg==
X-Received: by 2002:a05:600c:3b13:b0:492:450c:57cf with SMTP id 5b1f17b1804b1-492668ad60fmr101021365e9.31.1782473891549;
        Fri, 26 Jun 2026 04:38:11 -0700 (PDT)
Received: from [10.1.75.39] (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49270208b29sm421345e9.10.2026.06.26.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 04:38:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 26 Jun 2026 13:37:54 +0200
Subject: [PATCH RFC 1/3] rust: Enable dynamic linking with llvm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-ycongal-scarthgap-rust-segfault-v1-1-97df64b7b298@smile.fr>
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
In-Reply-To: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, ccasciato@21sw.us, paul@pbarker.dev, 
 randy.macleod@windriver.com, ross.burton@arm.com, 
 sundeep.kokkonda@windriver.com, SunilKumar.Dora@windriver.com, 
 Yoann Congal <yoann.congal@smile.fr>, 
 Sunil Dora <sunilkumar.dora@windriver.com>, 
 Alexander Kanavin <alex@linutronix.de>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782473890; l=1917;
 i=yoann.congal@smile.fr; s=20260527; h=from:subject:message-id;
 bh=riv1tCvDYCYHV1fYxFEdE8Vf9sgre8gaLZCGL4DfYAo=;
 b=lF/IAJEjYsFonlxdprspEpQUBhRUf9BBYTy+uxeIQXe5GvRLZLCJOKjmcVhWdTMQqbFvP+ez8
 FzGE928RAsUApgL1L0ac7jUOgqEk0VTw4jkObl9J1zpHIFbbIKrhhYM
X-Developer-Key: i=yoann.congal@smile.fr; a=ed25519;
 pk=AccXM/XSn9zzv1zYXEM/MdcAaQ7cluqUBg1xzwrqNts=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 11:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239627

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [Yocto #16058]

A segmentation fault occurs in rustc (e.g. in
llvm::X86ReadAdvanceTable) when reusing sstate artifacts built with
different host toolchain versions.

Issue sequence:
1. llvm-native is built with a newer toolchain
   (e.g. GCC 15/Binutils 2.45).
2. rust-native is later built with an older linker.
   (e.g. GCC 12/Binutils 2.40).
3. The older linker statically links parts of llvm-native into
   librustc_driver.
4. The resulting binary crashes at runtime inside the statically
   linked LLVM code.

The corruption happens at link time when mixing static native objects
produced by different toolchain generations.

Enable dynamic LLVM linking (link-shared = true) for rust-native so rustc
links against libLLVM.so instead of static archives, avoiding host linker
incompatibilities when reusing sstate artifacts.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Suggested-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74ba238ff1ba1e9b612aece1989b828f3a8f8770)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index b9348bf05071016cf27880258e27babb3f2eec90..f037bb33715dc4ba7cbb489ab1599ac6c8c875a4 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -128,6 +128,8 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    if d.getVar('PN') == "rust-native":
+        config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
         config.set("llvm", "use-libcxx", e(True))

-- 
2.47.3


