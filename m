Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39592C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 10:05:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5173.1686045891742015284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 03:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I7R0zSVR;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-65292f79456so2597850b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686045891; x=1688637891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoj0vwTMWALxNBRiOKEoAKNZt+juP06AWS9Shi6kKBY=;
        b=I7R0zSVRJzJgxB8z+jiMfUhEPh88tlPI6ECmay8gr9GOMZJG5WHCiN5AkbkGAiACJD
         xR7q6juXDCVLp3tFNmGClRmsAE4SBZaLTYvw3NeDEyfAijXYqDC+qK2PCFDplTIJ6m1m
         SMEfcvLHp4gFdBtbO8O8BitCxyZN/j5aw+vdJTSX/zfWaW/p7Cy6zNQPp7GIHTXZ4/ms
         YUBxWPCMNgAmYSDlVgxv6mw/CngWSjk7LpEHbJvu7yZp0ZEO5xZWsxxKRQTO6EVkesDL
         vVwkuWHg4YTPVrFqJyWpamYdiDBOZRJkdw2Gm9V2EksLWzBIODyqJYGgLdxJcULtAM3o
         xioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686045891; x=1688637891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoj0vwTMWALxNBRiOKEoAKNZt+juP06AWS9Shi6kKBY=;
        b=M38E/yhbTTFCOR5g0HfyGWjr9kC5vn35P+6CKZOPEhXRHLh/8dZShuopFLwclc0yyD
         iQY5iCWIRC+3x+Ka0HIV+v1YhjV7aLNdHH/jC5PqhuoaRmRCIM7AnAYpk8v23trWPovo
         HypFU2GZA1l8f7uPPTJ9kWfHhNBY7fcoVn4a0G7evYCzPqsdHGSLSYLlRknYv6vgfQr3
         aeA0XyBMRdaaNRcsMaEiJCPm39iRPMp1qRIO7n1yeweyhfNG1/16O5AAhfwPWiCP751f
         0tMIrE/F2OQJIfmMr//Jyo/O+O0USFj9k5aWX0j33FANnT+LOOAHlAJuam5s/6vmEKNw
         G36g==
X-Gm-Message-State: AC+VfDy3v/Vvq9jW2s5bGtqWoL0Bk7OVY4KSF38l13k4O73Pq6E1jDHF
	oYhE2v73uJbOx0kumIUEuq0o2teti0B/6Q==
X-Google-Smtp-Source: ACHHUZ6qKn3vOgtOsu3Gt2fkccaZJnu1iJmPUhc8WX3Pi3BXXKuVn57NKm7X/FV8VD5lzjMuBkv5Ew==
X-Received: by 2002:a05:6a20:258b:b0:111:997d:d203 with SMTP id k11-20020a056a20258b00b00111997dd203mr612276pzd.37.1686045890989;
        Tue, 06 Jun 2023 03:04:50 -0700 (PDT)
Received: from localhost.localdomain ([103.97.240.70])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b001a69dfd918dsm8157284plh.187.2023.06.06.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 03:04:50 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkarpatil10.93@gmail.com>
Subject: [OE-core][master][mickledore][PATCH] git: upgrade 2.39.2 -> 2.39.3
Date: Tue,  6 Jun 2023 15:34:21 +0530
Message-Id: <20230606100421.154878-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 10:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182420

From: Omkar Patil <omkar.patil@kpit.com>

git version upgrade from 2.39.2 to 2.39.3

Fix the following CVE's:
CVE-2023-25652
CVE-2023-29007

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtools/git/git_2.39.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.39.2.bb
rename to meta/recipes-devtools/git/git_2.39.3.bb
index 222e545f60..54a863acd2 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.3.bb
@@ -168,4 +168,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fb6807d1eb4094bb2349ab97d203fe1e6c3eb28af73ea391decfbd3a03c02e85"
+SRC_URI[tarball.sha256sum] = "2f9aa93c548941cc5aff641cedc24add15b912ad8c9b36ff5a41b1a9dcad783e"
-- 
2.25.1


