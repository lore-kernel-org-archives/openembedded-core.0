Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D54C87FCA
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 04:08:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.11594.1754194094060234750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 21:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CXAgMDLX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23fd91f2f8bso27834425ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754194093; x=1754798893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlsbRcKvLQsFnbOEogxYZqxL8rSRjhE6rUU7Iwq/yRY=;
        b=CXAgMDLX9X150i9X7Yru0+oth8yi+XhrsLUFFlBCLCCVRoJhZ1YjunZqREKeDxRusA
         gYFS9jZZ2hQeJsBw1Non4J2yT80bPkT9y2DH70MLIyQu5plPwcGM/qN8IsMgRlucwT9I
         Bci/JgX0+dN3Nb1wJAA2ox1tfPwlzW4oP2NFvo30JtQkD23ybN7kp4FtgE8aKPElitO1
         1Jixc7QUgR/h0OQMX09PYNrQRy9PwfR+5NuGotnIp/y7s40Ri8x6rrqREJVmyOgm8j2C
         p3m5QX7XDdx8PPjzNgcQ6Y+/wz97hr+ofI8269w60zVnO7puSO1Qd1Enl3VYfHNEdmnm
         cdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754194093; x=1754798893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlsbRcKvLQsFnbOEogxYZqxL8rSRjhE6rUU7Iwq/yRY=;
        b=KaJq/StiUVsYZjbtoa9y5K8SOjIa/H7eakokLy9nt3iE24h06HpFAltObpRRjmZTia
         rglpZ4bnrmP07ejzcNSXwV0L1H+FTfXR6SEJimjWuE7pHn7y6bXMml4rcpmzoDE1PXGz
         2oAMFTf2t7K4cqpZCL7k+idaq9IpqbupKdNEbiRwskHaPDn0dJcHY94lHRA8dYxcKUwU
         D9pCb9Cox/CgBN9scP3WmJ6qU+p7K9JEgbruh8bDeu4siDt60tZUp7kZ6LxX8aRoa3Yt
         zogI7ETXa7olOxgloKREVzgybt7btD+lQa2/QNNbR66y+b7tOpdVrZLUZYH+tUzgLy1w
         I/Cw==
X-Gm-Message-State: AOJu0YyycPT62l8mn97V+2u+eQJBFCTfmfsAF9n6Twtsxx1QzymMaYAf
	A+a3hzEiiGO7IAK/cT8vDhfZ+SkXnXiDSTDlXRQG89iAqigG1Ze+bWH82G4Ra4Qal40=
X-Gm-Gg: ASbGncuIa8LPsd+kin5Ba+xWx0Ykjd5PY5skOGBv3gJzABbp9AA6UC0ZFzU1Lzg5P/g
	h0Js83EIO0J/qcscyi0SOldPmlhyHk0Ke+TVgXKp1TtatnbSkBtTwRNiVAdAywLBElpCfIWFyr7
	/X5HzLTH6anvpOwNaW5/n7B4YlCG22Vv3v4QF0knAPUCQFK32+/h1qRFoPKM7hWdLdJe2N24w0A
	tVJ9F6qoyxMZJ4ketLY0Uiz2g2AlB/2MImID5ZytSwM3AErcR3t/VgPX+OkVMP9+7eERkAPMl0O
	PhpYS0S48QHVYNGjNzwvteDjQgPwX/T2p2JUv7lpnl/2S3TyJIRd2HNpE6zpX3SUwRZDbPc+Ju/
	A33u/4n7Z00zaDnSAmlTa6g==
X-Google-Smtp-Source: AGHT+IEeRsVixmCWgE3QCNcVkyCFPdiQdGaItqE8rSYryf2jcHhPB3JH4KBeT3DdmLA1wBV2UrPPrw==
X-Received: by 2002:a17:903:1cc:b0:240:14f9:cf13 with SMTP id d9443c01a7336-2424706041fmr63272585ad.51.1754194093085;
        Sat, 02 Aug 2025 21:08:13 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89769e9sm79055915ad.111.2025.08.02.21.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 21:08:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of trunk
Date: Sat,  2 Aug 2025 21:08:10 -0700
Message-ID: <20250803040810.2148375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 04:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221405

Brings following fixes

* 8fd5d031 aarch64: mask off SME and unknown/future hwcap bits
* 709fee55 aarch64: replace asm source file for __set_thread_area with inline asm
* bd981f33 elf.h: add AT_HWCAP3 and AT_HWCAP4
* f96e47a2 printf: fix regression in large double formatting on ld128 archs
* caae5a8b fix register name usage in aarch64 clone.s
* ab4635fb make __getauxval a public ABI symbol
* fcdff46a statx: add Linux 6.11 fields/constants
* 18289e5d ldso: fix typo in comment
* 86373b49 powerpc: update HWCAP bits for Power10
* fde29c04 stdio: skip empty iovec when buffering is disabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 51e429b093c..b016c27eeee 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "ae3a8c93a663b553e65f096498937083dad210d2"
+SRCREV = "8fd5d031876345e42ae3d11cc07b962f8625bc3b"
 
 BASEVER = "1.2.5"
 

