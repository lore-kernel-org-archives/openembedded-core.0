Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFE8C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:16:04 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.48766.1693836956859011395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=h7Dfazh6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68c3b9f83f4so735375b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693836956; x=1694441756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmNkKyva8GT3AMxrIh664d/7D844Vvs2SJDDml/fRVs=;
        b=h7Dfazh6Mk9VqXXsk0vJNag+S8M4oN2NzRC2NfJ1nCh8P/CncVtPQEny5pXer1n6nU
         kU8zwwoODeKFpzC2vP+Hhh35Wf18/85235wFMmGKKS6aFGSda3at8nwYWLv00TfWIpiL
         AKkE4CxrHeqtkwA+SanYPEsIdP2ThOnlvqaLgMJuidMbdbdC+cnyTLLfSTdL0QRMUWh8
         ds0AdnaktvZUPdYhYsz1HDLf6YARXhpjVmJRV+zuURAssObXvGtxW+To0Inqne92BVxF
         1d+Xg2dQufAutFp5OvTu/K1ug0AxA9nb/8KSs9Z8T5pSYJ2g+zOcClArsZKNVVrPc353
         8dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693836956; x=1694441756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmNkKyva8GT3AMxrIh664d/7D844Vvs2SJDDml/fRVs=;
        b=Xwi/s8isijNJ14Bds2+zjsD/3FTE+GiycD1STzzpyCwfnVForcX3n/GAVAuT3t/BXq
         cYup6KdSE2CMwWFcFR4FnnBFA8nNkGmoxM+WC6naZVHLDGfCWNkuafESgPM1t833yBGq
         IIvtuut4hYo7wZZxXM5H2+xcZihwvQGTuEevIzgxb25twhBWi4vo/18QFJiu3Z9D1+jk
         u/R0hRUneq1oqtYjeA9xFX9u+fSjZIrUZ+/1ZTo/k7GUmUpiaBwH7m46y78nxS444mCs
         MAZTEOGCyK3FDkGN4bpCY0UTkbubZ1hS6kp6qX6dptAvTXWpkv9kFi2CSBu9ZTC1kLd9
         Tj5Q==
X-Gm-Message-State: AOJu0YzrL067LY7BpULlN9CPowt43fChzCTJj+Ukp0CWzwSE/qubT6qX
	CdcnxM4E3MlO/Pls6F0WwCehIIfPwORdvA==
X-Google-Smtp-Source: AGHT+IEH4e2AXR2Ns5dQ1gcwM6g0OP77gulWaAYkZPPuxB5KnKTEXLWSG5/4BpU6ukNKBdLlqZ0VMw==
X-Received: by 2002:a05:6a20:f398:b0:148:1185:8802 with SMTP id qr24-20020a056a20f39800b0014811858802mr7722382pzb.30.1693836956065;
        Mon, 04 Sep 2023 07:15:56 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.211])
        by smtp.gmail.com with ESMTPSA id w11-20020a63b74b000000b00564b313d526sm6959242pgt.54.2023.09.04.07.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:15:55 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] pixman: Remove 'PD' from 'LICENSE'
Date: Mon,  4 Sep 2023 19:45:47 +0530
Message-Id: <20230904141547.112613-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187180

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Remove 'PD' from 'LICENSE' for pixman recipe as it is not part of package.

PD license comes as a part of the generic do_populate_license task
and not as a part of the actual package. It is nowhere in the source
code pixman - Pixman: The pixel-manipulation library for X and cairo.
(mirrored from https://gitlab.freedesktop.org/pixman/pixman)
(cgit.freedesktop.org)

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index 63fd6d2978..32714ab366 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.25.1


