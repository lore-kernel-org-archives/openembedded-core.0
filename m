Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD5AE92FD0
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 18:34:54 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48892.1767033288493066135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 10:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7hbCUWF;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so6270668a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767033287; x=1767638087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Li1BbccysGuzZFXn/B3U5A0L/xWLkvMHNE3IkY/lo+w=;
        b=m7hbCUWFYBIfSDsqD/Wl5BdlajzNwtmq+JJ9DOlOcr1+Namdnz6Q64kH8v3PLABsw3
         ILQyo///IaGRM4UeLiQsLTyfQXXmKGT/MTEhaaYOfDCj0B4CnxfPoaUpUzshvE2PcOP7
         RWYv0/zIiIIPynTIgeQozYGq2XsY7nSorQpW+/soIo3MOnQC+MG7hm3Lyy4deY5FUp/t
         sP5nlHJQ3ga3ZMaUNtzKAil1m06D0MBKwLyzjArU//JP2TNw0BdVZvigOcvLCzv2DOi3
         MXefGTMdo059Kl9GQJID8BIOHbrZTcGlJvdFgY27Cg2nyUA3MID+KTW8JXgd921036My
         uDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033287; x=1767638087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li1BbccysGuzZFXn/B3U5A0L/xWLkvMHNE3IkY/lo+w=;
        b=O/G0LW/L5q3fFN3Vit23JDRNalsfbmmqCyXSW6gswrxR8LWYWCancyi77o4C8H94Wq
         wD2tJjKxIxP7XGmmy4J40s+zLTSoGgFjO/EwfN40LuDVdWVLlDaeNLXClf3mxtA8xqQu
         ztALFbVS0lsrSGj3g3srb//vThLx2JVNXz1wktwyCHXJ+pe7nktAo7OzMZ3Y7+1dRYF1
         VjfAGeoUFfM9+IsCxtByubyyxzbH12Lwno9SjuLBKT//srKnMJh7499z/HfwAQG8s49t
         JLm3dTFG4Y0dlBhVDIKL0iWAf84t3uUpiF1F7jOprq/RwIR/5RM3bBN6cHOBFXnxC3pI
         qmnA==
X-Gm-Message-State: AOJu0YwWvrVYPv6WtbF96tdx8C4GZP5vGsmfxZOsgevZdiAMLkTjvFbD
	RSyGXRFNfkUSCsvRP//2jMtxugpJ8HdhRbL+U6ud2TDrLFh1b4G7JHwQrzoWTFEE
X-Gm-Gg: AY/fxX55o4QBqLFMUEa5WxwyTt2Byem5rH2hm4LKsVou+AVKLk+e2sVSEsUEvXYvYnu
	VQaRBvhZVzX289OSxB1sBt1fLX1cyLAxYYpmXEwFVEKojsX5U5M32HZJM943Me3lWU6wLZwqYod
	8+6jdt/mJR4pL1EjBj8ZKs1XW3FRxD4+8RAfZozEN2URCgWL0glf1M+knz6sNUNiNhwfkqHx61+
	1WNN5Imua0w1Q0zfu5Hul9vX/t69R+oQVoFWzKpaND7J5k97/33cXuhgatQgCTwNX3AibZyvfqz
	UTj07PZsKTHV8ht4TuCrgP13epQVSjXjE+OajG6lewa8/G6PYhsOoOumXTF8oRsIJE5Ag/Df+wu
	uFn3s59I1t3dmYf1mqZb1+RZyuUuXFy1PIDvGf7Z+8s9R3mc7v1t5d/eSOFedRJui48WIQaYNqM
	dE5KgY9yMlqTk5wLZ1NU5+kwX7hGon9QDUVh4IImL8LqYZvnP29bRE/tCswtooclLbasJnMuPib
	y2o5thjQBdeeTOmBiIheTGrraP/Y3w=
X-Google-Smtp-Source: AGHT+IEnwoAtzGRalrKWHWdI/GGNrrVtU2cCpWqFsSq8xj4YCXFbRApMFFYWDoU9f+LBSwqLZCn7kw==
X-Received: by 2002:a05:7301:da0b:b0:2ae:5a9f:d98c with SMTP id 5a478bee46e88-2b05ec56b02mr19873091eec.33.1767033287416;
        Mon, 29 Dec 2025 10:34:47 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm78209751eec.6.2025.12.29.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:34:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta-go-toolchain: Disable for riscv32 and ppc32
Date: Mon, 29 Dec 2025 10:34:44 -0800
Message-ID: <20251229183444.1178652-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 18:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228612

Fixes 'bitbake -c fetch universe --dry-run -k'

WARNING: Nothing RPROVIDES 'go-cross-canadian-riscv32' (but /home/kraj200/yoe/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-go-cross-canadian.bb RDEPENDS on or otherwise requires it)
go-cross-canadian-riscv32 was skipped: incompatible with host x86_64-yoesdk-linux (not in COMPATIBLE_HOST)
NOTE: Runtime target 'go-cross-canadian-riscv32' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['go-cross-canadian-riscv32']
NOTE: Runtime target 'packagegroup-go-cross-canadian-qemuriscv32' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-go-cross-canadian-qemuriscv32', 'go-cross-canadian-riscv32']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/meta/meta-go-toolchain.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/meta-go-toolchain.bb b/meta/recipes-core/meta/meta-go-toolchain.bb
index c24518efe3..758963d1e5 100644
--- a/meta/recipes-core/meta/meta-go-toolchain.bb
+++ b/meta/recipes-core/meta/meta-go-toolchain.bb
@@ -10,3 +10,6 @@ TOOLCHAIN_HOST_TASK:append = " \
 TOOLCHAIN_TARGET_TASK:append = " \
     ${@multilib_pkg_extend(d, 'packagegroup-go-sdk-target')} \
 "
+# rv32/ppc32 do not support go
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:powerpc = "null"

