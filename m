Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13090C46467
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.177176.1672213055248940389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fm7C6a8v;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id y8so14198391wrl.13
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpx409TXQj3z2MyJv0Z2fEGpT+NAh7dEZ/A6PE89pR8=;
        b=Fm7C6a8vIwTbbcIkOB8DT3hieNzq8AaSGCoaHhRZVtWIy+XutnV1/5soP2w0Bp0Z/u
         D2E4tI1khQHWGH34mDPIHo5BOgp26KEW1F3aJkQgP0IPDjB6kbxyrWnzVGJ7tYBrR3CU
         NKHQphYoDWo4Kp1p4IW7p25+JDDHAzj6F5DI9PDsZcM4NRITFAbi4DFS+gKfY+cdarB3
         YHEnSKRXXrnxOF/0Wl5PldOAXQCSShB1kyV5265zXcry2DmZi6OT1V77HWz9TVovrDya
         rpMAdXRyt7dYMv8E4f+S5q41KnTxMmzu0IJlvu40mkVUuoaXlqZRQ5lz+NI5JxdW71ZO
         y9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tpx409TXQj3z2MyJv0Z2fEGpT+NAh7dEZ/A6PE89pR8=;
        b=ZCLcTMuuuRox8KXv5AZYgypeJ2RbkLaq6Jl7ZFcO5OUvTq4Qt6lpYsw5VZ1KOp+Aud
         bVQKefem/syvhDxwh64SQzdZu/niDP0vscijCeCs2jPoh5SZ8LGK3ue3ISMle90+9HMC
         oQpM+ZTW98rsC6lXJczAA38oLx5tgqtmcYm4QRk8LGaVvgCigHb8ATLMAc/72KLOHifO
         4ckY6rzRs8pN78r2zzLxccypmuhPzGgcG08lX25e01/Lpuf55oOg2nE5iROWiwzbczNs
         2KD/TzBVKoQSN+D62EHx0C5G3sNnEOC/bZzpyNvWq31o9ZqkH+i3HBS5LIRHpLLRjOjm
         lr7g==
X-Gm-Message-State: AFqh2koaBF3UEbiAwAX6D0h+u8An4e2XQ8NKigv8Qe0BNK/VsC9TtyL/
	mn+xNfekqrMaaLEeU2D2SbmWFfYgjr4=
X-Google-Smtp-Source: AMrXdXtYeaH0UuB+7f9z/aaCry5hNTDn6XPcKbG5irDG+B3AtbijqZE7j5wEGypI3YFXpWa4FhyWKg==
X-Received: by 2002:adf:db12:0:b0:242:203c:9ed4 with SMTP id s18-20020adfdb12000000b00242203c9ed4mr17312459wri.55.1672213063100;
        Tue, 27 Dec 2022 23:37:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/25] libmodule-build-perl: update 0.4231 -> 0.4232
Date: Wed, 28 Dec 2022 08:37:16 +0100
Message-Id: <20221228073721.3454255-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175058

License-Update: formatting, position of the license statement moved in the README

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-build-perl_0.4231.bb => libmodule-build-perl_0.4232.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4231.bb => libmodule-build-perl_0.4232.bb} (94%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
similarity index 94%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
index 881d5e672e..748412b414 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
@@ -11,13 +11,12 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/release/Module-Build"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d70cf9edc29fcae1b"
+LIC_FILES_CHKSUM = "file://README;beginline=881;endline=886;md5=3027f56c664545e54678c26b7f1ac19c"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[md5sum] = "066b193e461d7dfe1eca17a139353001"
-SRC_URI[sha256sum] = "7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717"
+SRC_URI[sha256sum] = "67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b"
 
 S = "${WORKDIR}/Module-Build-${PV}"
 
-- 
2.30.2


