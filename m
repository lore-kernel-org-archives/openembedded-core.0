Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6417FFF8847
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31983.1777064220651363430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ipI705n2;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso53509605e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064219; x=1777669019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN0v5r5aMfbgSdYY0oJJjAaJ4tYZ8O+c09fBcIeD8xs=;
        b=ipI705n2kXn4QdYeAfkYNp+670twMYL1SepShx9H2CNTCaUyKvvlIibYVZNnc0xHIC
         C2Htv88qkQWszd+37O+egDwHeuYnL9NCvuVUOuJXcIZ2QtIUvD+puJVvIsATo27l73AW
         MSrDhH7WCqcT80bF7G7jC2xdHiEyJrgutX4QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064219; x=1777669019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN0v5r5aMfbgSdYY0oJJjAaJ4tYZ8O+c09fBcIeD8xs=;
        b=RIBh+Ho9KgRPq/p7csEj1J1zVVN/QGtXfijh332FkDiMDrRm1UWqK1Ejr2FNRbGfCe
         UEJnhj5+rT+fQgWkZ98TwZuAtUb1KLDN3F++3/LyjOWHdXaeEuylpPA663kZJb7dJYji
         r+SLkw8ZwalcpUnpaZ+OWZnzBJKL+BZZ7Mx411XhNdDd7gi1tJPsqrTcr+Tl+4pq08lV
         6rQ3Cwnuin3WfPXLv9iGS07uDLSYYyZ1/XstVs//dCuT6BzXr0z7fmThkoM7bn4TfMyA
         7oxBx4QEfSVQ56AWoO3C1NyuG36GBARN3FIphHjMEu5HnyNEHfbFq6lw/6uKBWaSdcIx
         AKpA==
X-Gm-Message-State: AOJu0Yypag8vt7uTshQx37BErG6PPwMXbcK4yErC1Qk/odTmHtBgEYP6
	SBWIydj5w4OM1265ShdEREBd6aNccCMs7FHNTerQB5s+xJ2cgtUTcSOFMeS+6Xa8WSMDgMRWTP5
	UgExk+5qouo4O
X-Gm-Gg: AeBDies+e/zhHbxoK2zJtcs1VIxdko/dPRdQA3EvTKuXy+qfGUYhlaRSLwF7nfinWXQ
	fNTi3mef3+1EJSLY4nhuA5B7rAihukmgyIwPz/TL9UIcscCNK+Cjwr86Kl2qh7GJnNxSJxlXl8c
	jbnp+6Afp+HsIeQT4KVt6MAin5A/ASPsoJFocUXM9GY5P8ACHOZeYB8WOA566Liprz9Ofl5x6q/
	2H/+yk2e+gXDRmjz5YL2nx9iSF58VpeoTJ5cB1ZMQyCVSa+/6Tf7ImpyHZEcr4k4woTMASQoLIL
	Ghm3lfOtvA8z5GI92QukRNEMyoNHM6coMp1BDTjShLqPgAnzEp7X7yFM1CiTSxylKWdqtRKUfQg
	QBlPjNGAnswv3hpWTVGX1ColmTC4oqjZPuWv8wR9p62A4ZqDNmB6O4EZdd8ma5dcW3UD0cb7Rfz
	8z5pW1wyLcWkN75E5PboAmnSM1j97QyfCh6LC4hMEvBz0hmE/Un0nSpiDFuyYpgd0RLvTvO1nqq
	EcdwSo+FXcx+J2XwfCeTgicSXzlKOmX/Mv0Xg==
X-Received: by 2002:a05:600c:a404:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-488fb73b2a3mr396409625e9.5.1777064218746;
        Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 39/66] kernel-devsrc: make tools/Build optional
Date: Fri, 24 Apr 2026 22:55:38 +0200
Message-ID: <005b57b805228f2793265d6d1d1a2f52342935b3.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235912

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel-devsrc fails to copy files for v6.12+ as the
following upstream commit has removed the file tools/build/Build:

   commit ea974028a049f2cea4bb6be963ee3e3844a03f6d
   Author: Brian Norris <briannorris@chromium.org>
   Date:   Mon Jul 15 13:32:43 2024 -0700

       tools build: Avoid circular .fixdep-in.o.cmd issues

We make the failed copy of this file non-fatal to support
all kernel versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13e16e5be25f379211c7329fa1462464174c0f2d)
Suggested-by: Calvin Owens <calvin@wbinvd.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 77249671513..1500aff2e25 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -156,7 +156,7 @@ do_install() {
             # these are a few files associated with objtool, since we'll need to
             # rebuild it
             cp -a --parents tools/build/Build.include $kerneldir/build/
-            cp -a --parents tools/build/Build $kerneldir/build/
+            cp -a --parents tools/build/Build $kerneldir/build/ 2>/dev/null || :
             cp -a --parents tools/build/fixdep.c $kerneldir/build/
             cp -a --parents tools/scripts/utilities.mak $kerneldir/build/
 

