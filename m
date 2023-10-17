Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9BFCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:26:10 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.230814.1697567165586569797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DYntHizF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-58962bf3f89so539307a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697567165; x=1698171965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XpqR3+seUnFRxMeG62jdtV86Pj2Disl65YomNJZK1k8=;
        b=DYntHizFz9VycyxTCt2wL0IBAbokfOiQCoy4hDHcYF3rFcRqTX0jmJ3sFjjhCgz9hP
         1C2obKRwhiYvkCyyXs5Q0ubYe95ewRB+3o1a9LROLNw+uAKtEMshPq2+2/mbMWaPhZ/k
         d1CLEsdv56kJRCJr1sKKrzkL6pSaOBVuWhtW2xr5jq+C5Da2kC7VRynHClvcmnA/usx7
         2676As5J3V8u2nrFBVW3wFwWvYuDqWYDz41cSuWew9nGIKk1w580vdBNceejOWyo4oPj
         GDFSrx6QrwRfzJaIse7hKEqAbjPaW43l5WAjBBCTB5Pfw+21BRK0IsrEhRIS7rhxMt2z
         FR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567165; x=1698171965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpqR3+seUnFRxMeG62jdtV86Pj2Disl65YomNJZK1k8=;
        b=eRcXPAiy6uEKA2dXcyny/6NdAynJewUJLTHJWSWuiDW3dJMWfTgxUv6Yj7lYyDIUpX
         4A7e87a+juku/nj210WFRriRMUoGqpm/PuVF3ThbSaUGjypINeccowhn8COu9oR4gEtv
         WzCtcmgWTudY92u+0DUWPNPvjabYTwdKUbYJCmz+Dl31gPe7Dz2PjoaxG7POEqjF6NdX
         iC23amuKWDuyZoCan8yeoUdEOR1/513w5j+3nm7spwba2J1fsa0uP35GvbbeA3zYWhM6
         T/MbHrZpNg0oZPdaHlSraLMBXZmIkDNYtiJ87HONSkY9fKH7YMWOR94JNUMLrsBL4WOU
         E6ug==
X-Gm-Message-State: AOJu0Yz5Uk1vvHk2kQgNZmnn8qdfNUgMD52nffEcTsMv7lIXoUWqwV54
	w/Ji3cXiFsgwZzv0UwhqOn8x6MXme2w=
X-Google-Smtp-Source: AGHT+IFKPRm6TYGWZioZFUqvgaptB6tq7PMdxWWVxSzDtj15v7YsvbIJy5ZmGwlGpL6vHfU+J+I8Yw==
X-Received: by 2002:a17:903:5ce:b0:1ca:858d:5bef with SMTP id kf14-20020a17090305ce00b001ca858d5befmr3123581plb.4.1697567164609;
        Tue, 17 Oct 2023 11:26:04 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:eecf:1f23:22ea:7737])
        by smtp.gmail.com with ESMTPSA id jk6-20020a170903330600b001c627413e87sm1896555plb.290.2023.10.17.11.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:26:04 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rpjday@crashcourse.ca,
	alex.kanavin@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] packagegroup-core-tools-profile: Remove PROFILE_TOOLS_X
Date: Tue, 17 Oct 2023 15:25:55 -0300
Message-Id: <20231017182555.963888-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189349

Since commit d085e70eeedb ("sysprof: move recipe to meta-oe")
PROFILE_TOOLS_X is always set to an empty string.

Remove PROFILE_TOOLS_X as it is no longer needed.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb          | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 62c22a35ab..b3a24b71de 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -9,16 +9,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-PROFILE_TOOLS_X = ""
 # sysprof doesn't support aarch64 and nios2
-PROFILE_TOOLS_X:aarch64 = ""
-PROFILE_TOOLS_X:nios2 = ""
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS:${PN} = "\
     ${PERF} \
     blktrace \
-    ${PROFILE_TOOLS_X} \
     ${PROFILE_TOOLS_SYSTEMD} \
     "
 
-- 
2.34.1


