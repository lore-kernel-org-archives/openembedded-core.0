Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BD8EE57FA
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.35241.1726097043379999274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X+zwajbf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718d962ad64so266965b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097043; x=1726701843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrT1NSXNjPaQiFhtOt0FYk5WVEhD+Nf+/Q04rCz5Gmg=;
        b=X+zwajbfpzss/BSbT3stL1oc6P8UEvkpS6zV9143iH9wp+36uRzl6dtnOZ2m1yJApw
         YvTfaw5lAusof7HGVLNhT0kRz3sLB0NY8KOabqqgN10mEiyrDoHk9n2CEG1DQjVz5Fy6
         Xtn9xFdKf3grH8idOFoavIGZBvlLOIK8WYQsZQSXN64hoNC1sNRsPReLzld/PCVuPWSx
         fciKsYnThxkgsuRmOtzHkFXlLVKtamyEQJeazdQaNkbSAWi4qJwavdcxPFKWd63kmam7
         8sUdV/Afah7X8iGmx72RB2G+vgPZaWbhh9sTPR4tBgV+T8irLU0Q71LYZB/Ll5OgP3NB
         nUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097043; x=1726701843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrT1NSXNjPaQiFhtOt0FYk5WVEhD+Nf+/Q04rCz5Gmg=;
        b=BMk/2TDHHIUjoIihSP8KFYoaouVgx2bZXfq9+jXmJBaplhQ9GBVSaih4EhXRLj4O4c
         Hgu4+IOMX/YtENP3DUeTU3muVVL66xXotjtKJraeW/hRwZuyyjAkXS8K5RDI2jyiUR5x
         0AeAwXjbuuLJBsdhRHCUoADjinFYy/JO6RQ4JnpWZuFmjtQ1PoJfMOSv+NlkapIS56mc
         L63XxQYKzsmEUdI/AI9R8iP9TETLmcMu4gdm8CHgESJH/TmRXnbSiCqfjhUlIkE8GNfa
         +8hzNdE9dqJ7Xg3fw35eHPnkIrc6nqgYPe9r9ALkj5bRgV8klJLOyCAVCKYcV2z2u1uR
         1PtA==
X-Gm-Message-State: AOJu0YzM0CSUpRq3qUgQRNWHNm5tQhUCbc9v54AusmPKe4AxA/RS80kV
	ELlbQ6bkpWHR1XXxGRscE55RAXyVqvKgKcRUXe568tJpwJDtP8WXP2tNxYTNpbdE1Kq/BbjRhnq
	/
X-Google-Smtp-Source: AGHT+IHcTrwQVIGHT6BIv8u6npwhrutAKWychrcvHIFsuE7p6Svbcrw+BPWCCNBhpjx22NNXTX5CqA==
X-Received: by 2002:a05:6a00:2e11:b0:717:86e9:cc34 with SMTP id d2e1a72fcca58-719260812cfmr1544162b3a.8.1726097042615;
        Wed, 11 Sep 2024 16:24:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.24.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:24:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/22] tiff: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:16 -0700
Message-Id: <226286f0971f3dbb5fb49e70ad37ef0ba0335a62.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204413

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the LICENSE.md file included in the current source
code package match those of libtiff license, which seems to have been
the case since 1999 commit
https://gitlab.com/libtiff/libtiff/-/commit/0ef31e1f62aa7a8b1c488a59c4930775ee0046e4
where it was added with filename COPYRIGHT and was then changed to
LICENSE.md in 2022 commit
https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5bee969d424b

(From OE-Core rev: 71d8e8b03349ab18dca558055c2b3a3687785ddf)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 209b38b8f2..27bb306e94 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Library provides support for the Tag Image File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE = "http://www.libtiff.org/"
-LICENSE = "BSD-2-Clause"
+LICENSE = "libtiff"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 
 CVE_PRODUCT = "libtiff"
-- 
2.34.1


