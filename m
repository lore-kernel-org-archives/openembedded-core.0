Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD43FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 17:33:23 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.14196.1753810396205665015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 10:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mYxkTQ98;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3f741a77f7so4200412a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753810395; x=1754415195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/Av9/h8iZ0BczNl529RjGy/R3E29b+nZRDG4zey10k=;
        b=mYxkTQ98tCeeYw1TeD8zS7xCMii+oWg1gsAKSp5TlmACr8zfHAK3TctzrTSAUcP0Hl
         hJLfInyt4e/DCfRH7VkmZ1U1jw5f1H7XryIo2axNii2vqVnns7ht0oyDvSIvekVNtoJn
         n0Am5B7dtnmhFpFqSqXV+cYx0UiOBo/p10MDjVE9mefxUY5DczPDCX0FZYGUsQCwMmT6
         MryelGnLe/KLWKHB2jw48uhPYk0w50wyOCwBt+1tpzW3ErWAwj6cNRH/ztPVd3GxK/4k
         iiti5eQ/sIDL4xamKtX9oSpW1dyyvSRzYmhuRRNShXpxjUMX1kkK4zfy5/2yuX6mHh7Y
         neoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810395; x=1754415195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/Av9/h8iZ0BczNl529RjGy/R3E29b+nZRDG4zey10k=;
        b=HiIR8czWNc5T7pcFxkP3hOSgm7qLgRLMOJBmEkDVh569ItYW4zn730+IKJ7lgGq5TL
         pSOxOnLNlkl/Y3mdXRon0UaOrgemsZZgHJyxkfTnr154OF6wLKfHfu4i5ed6d6vMXflW
         HBnBNmEw9z8qN0Ng9lLNDWKyDqCWzXmcEdBZW+OnmAMWvjXJPr72q1GKIDrSXPwXMFPC
         sI2Z96UVLC/ko0XTQ7NNbJ4WTSQXEpt+Ekiaz+RjEUHl3UD6odG4wVIDihA1lDdCy2KJ
         jWIC/kuUJQ4yice9hzijw3DTX7/Eyd5f4msoPW4gFrYOVn2m6JrCsuvUfybdKagFCu6i
         BxwA==
X-Gm-Message-State: AOJu0Ywb+VkLSyPhh/QnXkrVsLR07Jhu0J8mYsCjSxx2r5a7jloTxChb
	RbZs7PMOdM5gak/g6cOMMqF88BL0cQgQX7qiiq8NVyhJsJlBCiwKMSbbPlufOlDYyX0=
X-Gm-Gg: ASbGnctLPstUcgQxB6AA0AMw1zM4t/APrNTHaw4mfLn0vqbx8LNUXfEwXKf+wHHS8yo
	HeHL853M4uBrQy33Y9cF9/kyL2HWYvTdeRW/Fzq3JrM+pcY5tQT60miOpYY6Es4k38GUGn+M6mr
	+Ke7TvpTpK/eE6STx74WIoQtqwHSwbelIc/xC7AnT6JHWPezSUrp4Pb81qgeRG7fbTMf5KD8Kt0
	rRbsS6YGFlSXkXsy4Zdo7byn7lx5/i3gGHWn3zLMnpp23D8fMtlHdFpsNQZNeTqkDjCjJ8/S85e
	yChY+gEV4xSeluyB7nDL+paGsb4eg4XOQATaLaT/g7GTuydeAIOjnpoN0YU2AZy3K99nIBQwAZr
	0lFlc0KoKpsF+ENzfpAMZu58j
X-Google-Smtp-Source: AGHT+IGCGzx2018jAPdcRpAKpvwZndn9HfxJ7FZOJYGDDlBMz+AnRit+yhfZRnyCfBR9Xekbxk9+Tg==
X-Received: by 2002:a17:90b:1e0c:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-31f5ea6a1abmr379946a91.31.1753810394780;
        Tue, 29 Jul 2025 10:33:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6ae8bcsm7531057a12.46.2025.07.29.10.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 10:33:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Drop CVE_STATUS for CVE-2025-1153
Date: Tue, 29 Jul 2025 10:33:11 -0700
Message-ID: <20250729173311.1240203-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 17:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221085

binutils 2.45 has all the needed fixes for this CVE [1]

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=8d97c1a53f3dc9fd8e1ccdb039b8a33d50133150

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 0a9b93f432b..00bb181172c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -18,8 +18,6 @@ SRCBRANCH ?= "binutils-2_45-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
-
 SRCREV ?= "2bc7af1ff7732451b6a7b09462a815c3284f9613"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

