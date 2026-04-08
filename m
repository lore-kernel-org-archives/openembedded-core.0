Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEAA105D98C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 00:09:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95482.1775606983824696675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 17:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=plnfji7t;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35c238f1063so3440972a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 17:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775606983; x=1776211783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pai6hr0dcV2Aoaq8vLwMaYgOj07huXJwHG3XAb0mAZM=;
        b=plnfji7tq4TNyR4wIMsVKagh0D6TCPR0qftz8dCmzZXSbTceJAeInaFFq7n2lOFF8N
         iLM9gVT1rcaOxD7m7YE9uQw5SFKzpVwRmKIlCIiLASVwHIq1jF1ckIU9VxBEX2LFfOdt
         mIJxmXGmdsD0SxHytOW2Ov8HQA7AMk9+MiqeSFm0tx7PkN5HKviLRNucfQqd9GaANw9X
         cnoBXqnbaCETGK8fbd3jX8WrvbJzZWAxl+AuzopZJEpXiMyKHY3f3Ew/kobtEehTudKP
         XmvoMf/bV2MvnQfp8DHEU86POpQYdMYwnqsFAYecFQL9IsDLLK6esiSj/9WIPSM0GtYB
         rfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775606983; x=1776211783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pai6hr0dcV2Aoaq8vLwMaYgOj07huXJwHG3XAb0mAZM=;
        b=QSJQedsQGOQHv0EGMaDLz1XNKlskM4z3p8zWIfo/kdJ+GtQ/PQ4aCIeni7T4saI6RR
         sdeBKinknO8a/gsAdjio/GhRH2VBjfhrK8HAiQc+hieLnbMIXZlETm9yRElMKVXkZNQL
         7NWC3SRYCt1drNdp1REeeZQzHWUUTbHrSO35qG/K/OGLodLaOxP9kmgsi8PCXxUg6FDJ
         47iAE3tFw/UHDqEQ2JmMXVNirIRxLF7PtrxOfHSS1jwPOUL4AW3zbOSvtYNr4It+Z2SA
         DrtRfCYJDkbuRNvDGrO/3yhZl7MI4UfFazE9MnhLX/D5E4YU5QqtBrTvnwcBt8VLU3KZ
         Z+uw==
X-Gm-Message-State: AOJu0YxeIt4hm9QCp+7ldbQExzh+vIMGcjdg18WUZCP2w4uqqro6O/B6
	i/mBkkVElb8UgQUzrhDgNwRe7RoJ1KBAl8CKZ4z5p2WHhc55VJSSzBubfoUl4xER
X-Gm-Gg: AeBDiet1eYCAOUVE5ug5zoC7MNf+svRW5ohWH8hZeFsqBtQ2xRDn5kjPqyselZq6VBm
	0BhpgAL+s+0RhamUtXCC0QB+j/+QLTKBMicX5E4NEVBqOp1g/3VHbad5/v9V0DD7kQwNcU6zGRY
	jVZq8BYRyhGxwg7s+IZAtsrLfiQ4nKWBe5Ky41GMdFvn4kRAwSVFLc7Fs9CPI2C96yEtlTMysmv
	F9i8F7iTL+m8JJU14ChTKPgVrJ70ADLNiCsrTsaapLJAlYOLDewYXiX2/CJ8SHk6CDa13gm2hCA
	kqP6HKfo84LUA3K9f3EfhwnUwistMJMNTv1w+7ZVw7hDaTQ4MgjZXugkVg1iZMdozNOUGQeye9R
	q0xv4QGnkHoJ4OHXl2X3hr8c6tt8hIG29KPCyKyuw0D1hn3yzZ3+jK+vOF1pANy98hdC2EJIOeU
	MrR+xpzKGoUBjYWg3pWJ6ibtThfW03YuxKopI=
X-Received: by 2002:a17:90a:e70f:b0:35b:e52a:6fe5 with SMTP id 98e67ed59e1d1-35de683b19amr18494662a91.5.1775606982836;
        Tue, 07 Apr 2026 17:09:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e27af011csm307959a91.0.2026.04.07.17.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:09:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH] barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3
Date: Wed,  8 Apr 2026 12:09:32 +1200
Message-ID: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 00:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234788

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

2025.09.3
---------
Fixed FIT image vulnerability
https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3

2025.09.2
---------
Changelog:
https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2

2025.09.1
---------
This stable release is specifically targeted at whinlatter which is
currently at v2025.09.0
https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd..91865b4d44 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.09.3"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1125ea1c73c1fb49a87"

