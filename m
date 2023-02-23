Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429A4C677F1
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:25:24 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.420.1677183913968573373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SAewNhNT;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id h16so12147974qta.8
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPnFuhp70vZERklN+eiWWw7uOxM5leXgTN2m3I+c5Yg=;
        b=SAewNhNTqc8G3ol+RB2pn0i5/vu2RsgZtNjYn1u8GdbDAFezioTP9F+eqQpcM/xgAE
         wAEQQKTnB6tAnD/9H5PFh5cXlZKrm0DIxTLk6Dnz/5NlpDT9UO9IUpmTwu42+P0Boal1
         1LeWYRMxyoFx7e5Pu69PTeSTw+b2Wj8Lzw1bklRk7jDqnGHhb68ji/cu4hNZyenfIwsc
         RwDli+JQRZBUcv8Aj5divlKSofYpcHfaFC1VGTMCt/y+ZUHyc5LmEHcQlTzwTGY50EwV
         Yrt+Owvqd1T2fNuGU8eTbqviSpMZVZ3mWhmn31hf3T66/iQK5k5mH6WYMBgTBLhgJSj3
         IBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPnFuhp70vZERklN+eiWWw7uOxM5leXgTN2m3I+c5Yg=;
        b=NQXsF4TKPPtg7feKkoQDq9JBtb1RSrdyxeVGlVTSQnc2UjOz/M1Jwyqd8cUnHQlMGV
         8DsZbVSUiPq+/nGULHnTaVieV440+/3UAx8YeZ0EPkYgIgm4YCW/7x00/cz1zKeLTXzu
         UJZ6aS1iY2PYUliR5hnvFwC33XhbFTIncUzT+dnaAd4nEEotJm67tMTSWFAWmTvmIQfj
         KkXZ/9S8IfpgSFaZpX3sKwzXHNDIv3C6SYBq72agtX+RenX9HW3DKg1UzWlAegLEKLOB
         jYSBTB70HIWdXzS0zxWahe/VNL+Y31+cxaM3fyrP8bQ1hd3y47jwF8l1iDXMHtlo+QkV
         xevg==
X-Gm-Message-State: AO0yUKV3y7xZO5Nj2OM/BGDWYijUOQLcqTR5/Szq30GbyGpxMWfi2wDM
	gK1vnvRrN/CJ3bYYhLIHoETFIUmp8kw=
X-Google-Smtp-Source: AK7set+iFKutTpQsaAHdAVUzjaAYOt3LvFFdnbMLPYJB7t44KfST985ioRFHdmy1+YeQ9Zet3J626g==
X-Received: by 2002:ac8:5f52:0:b0:3bf:b6cf:25c5 with SMTP id y18-20020ac85f52000000b003bfb6cf25c5mr2486402qta.14.1677183912591;
        Thu, 23 Feb 2023 12:25:12 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id j14-20020ac8404e000000b003b646123691sm4658210qtl.31.2023.02.23.12.25.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 12:25:12 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dtc: update license checks
Date: Thu, 23 Feb 2023 15:25:08 -0500
Message-Id: <20230223202509.32432-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 20:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177628

The dtc project is dual licensed, and includes the text of both licenses as
part of its sources as well as a README documenting its license situation.
Use these sources to verify the licensing, and to monitor if it changes,
rather than a copyright line in a source file.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/dtc/dtc_1.7.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 0fc3eca00218..7d064ed127c1 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -5,7 +5,8 @@ SECTION = "bootloader"
 LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
+                    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
+                    file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main" 
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
-- 
2.36.0.rc2.17.g4027e30c53


