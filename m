Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0E4EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13078.1692801412886512694
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1zHu3rDA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bf57366ccdso28505425ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801412; x=1693406212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=1zHu3rDAiiL3eSo/oaNaOygUi4Qf9p+wpbisdjMtIfFgaAYB+UEgpUnVPNazshDyts
         ZJDHrTWT2/J/eP2Uf0xHQYMF77EfUj6yaF3db9fuaRp6dgTIKw7zaGVXd1ffyGi3ybRo
         t4DkUpBkvr3ghovaUtggPhBDjHYEBUeZyBuL5rmrLVgMc2dbClyZrNbPgWBveyPMIN0z
         TRx4WETR/l5fun0ctxeX42gbjEiU1z2ZS6CCXK9evGtQF2rQlqyehmLqWTICRpqhYAcV
         1q5yQd6jf/1W0L/ndYFEMGCHUN/QT1QP9kNFucOjkgULB2tL0xaQlu95VzqPTbmK2Wcr
         dd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801412; x=1693406212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=VkR/MpnhzwUs+eCv3hja7nmBQdiaDtzI8zTACeAzRY1X2wvJiGHV5ikPsvHuqdeRz2
         hnKEdvcl/daA9ouL+wyN5I3SuQOWWCiHZbORWLEcVVpayORrdUpPXWE4dvHCc89+3qf8
         3k0lzkjRYLwGQXMDonHKxXlm8bEuQvoKy9WFmrJYrfszWElpMUDGe8FtMwjsfXemKxDm
         vMnFMWe1P9UfRV1XYnM18n9lHnj6L7V8BxXrZVN6iu01CUUv3Cbs6BOVTYCEnhVyTf1E
         o0T4tO9KB+x6ayIXcWuwvuvo1r30e71t80RfQWWeP6QQ1xD7LsoXcFdiUFQzGnmvdd1j
         MnVw==
X-Gm-Message-State: AOJu0YyNT0My3i8AWIiSmTDLSsVZQncifW1UIOrvYip2pKlW7dedqbVt
	YxVXkFijbDxlf3jA+MVOtFr09VyKHn5/PYryOCI=
X-Google-Smtp-Source: AGHT+IGfehtpoOa6Cwm9/pbRqr73S8AtbbNOL5UBr067bdKS1leXCO9fjGff02ulKmMfPsok026z6Q==
X-Received: by 2002:a17:903:22c2:b0:1c0:8a05:f32e with SMTP id y2-20020a17090322c200b001c08a05f32emr8751316plg.23.1692801411987;
        Wed, 23 Aug 2023 07:36:51 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/36] yocto-uninative: Update hashes for uninative 4.1
Date: Wed, 23 Aug 2023 04:35:45 -1000
Message-Id: <410c2be543d031dc54a37439c8069807c395fc36.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186596

From: Michael Halstead <mhalstead@linuxfoundation.org>

This version includes fixes to patchelf.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c5c8ff97ba0a7f9adc592d702b865b3d166a24b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad4816a1f3..b3bd7794fb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.0"
+UNINATIVE_VERSION = "4.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
-UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
-UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
+UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
+UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
+UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
-- 
2.34.1


