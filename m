Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70471C25B7C
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.60340.1716212028635424867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1Fto6UzB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f2ecea41deso66243045ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212028; x=1716816828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Zd7GTWQtydy+CfzzZnKIuF50ttqPQkJbBu0abGYxbY=;
        b=1Fto6UzBDj6kFf3OIOvm/EMZbiZIogvDIVtFNZICza18ZadwYgRTjJZ3Ue4RGHOnxB
         5OafirxxotD1SuyMmTXy6xH0UgekbQT3HwDJ9GURw50bJTMXgSedYnF/0JrgOc6+GS8p
         bJKpSvNsAfT0/pt1Slv2e/0j/HnpHetUo4hrRodY+0wqj9vR8ZUFygiorsDHYgqSI++4
         ij6+wLVqLWetX3KtV0aDamP57pA3GOwrb8TZZXccgFGbmRtT4HaMaX7GSBVXTRUoYNEX
         G+t7Mez50TwiJN9sojbpapZ0706WEivkPU2oKkWn0d4WTdtk9kZKmjsjJs7ffO+FpayS
         lkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212028; x=1716816828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zd7GTWQtydy+CfzzZnKIuF50ttqPQkJbBu0abGYxbY=;
        b=hqRfEjOCSsWXp/ir9cJMApCMKlKzY2g/krWUy+EemE/7z6Prr87qHA+J17pa5uPIPh
         293NzIJNd9MM17DG9OCy+BaqJkptjNsDVDqidoeI/GYkFnN8fRcbQ41KY4gXInFpgghp
         7JGGgWLU54nhOZ4AAowYnwA1/N6yE+CFpFMJdykXNaT5Lwscx5hck3mrxlu5g+z3DP0I
         Z+MERzc5upnBqSC159roGvi28XyNC5hJC4r64K89bsc23jdYcGv4i9h/RBAgfFUnNRM5
         pbKL0kdXOR89qK3cghYRJ27I1Xp0Tf7QM6fH2GO/AJx+Kqk5n1CTDTs8JV2ijPQQo1Wx
         Yvkg==
X-Gm-Message-State: AOJu0YyalZgZggTO3kzuKydnxqLRknqgxSONYzPjiJTUbJAZaYN8rIXO
	73U8yFcwnlLTSAKUNLOal0atkKUXFPOac9uT0DnpExOi/ywfwwykT4gZ5ISr8Y1plb+UnIiSeVX
	Q
X-Google-Smtp-Source: AGHT+IFZxRCWUPkkJZrike867Zs9rV8gyC4fOHWXJOiSB8JfKLMGcYfZCx+E9XZ/ba3gYc+q3Pxs2Q==
X-Received: by 2002:a05:6a20:2d21:b0:1b0:180b:218a with SMTP id adf61e73a8af0-1b0180b22a9mr21256321637.13.1716212027772;
        Mon, 20 May 2024 06:33:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/21] glibc: correct license
Date: Mon, 20 May 2024 06:33:18 -0700
Message-Id: <939140fa7201ae0e7d365648c2ff5629e4c25ff9.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199578

From: Peter Marko <peter.marko@siemens.com>

The license per [1] is LGPL-2.1-or-later and
[2] converted last LGPL-2.1-only references.

License-Update: corrected from LGPL-2.1-only to LGPL-2.1-or-later based on [1] and [2]

[1] https://www.gnu.org/software/libc/
[2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=273a835fe7c685cc54266bb8b502787bad5e9bae

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b7ad15a59d048ca7561a03cb0fc8e2c24680ce5c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index b9516e77f0..91a3f5bcd5 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -2,7 +2,7 @@ SUMMARY = "GLIBC (GNU C Library)"
 DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
 HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=f77e878d320e99e94ae9a4aea7f491d1 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-- 
2.34.1


