Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.14482.1613289918991364362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 00:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lfgiv2n1;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id lw17so1688550pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 00:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHaZQv6sQkM20AbZigemu3/+iqTLYWqXmVyjOWRPnIc=;
        b=Lfgiv2n1pBhEaTF1UXWKXIbmgxKlVJB274TzdQNiJaRIhD2hzrhplBcK1AGhcyEzKg
         X0apelp8Zf8lbrkB+XV0U7Xv1zY0M/9aQtedVJGCLSZE7EGoEuu9VOcE2LWow8beOQOi
         ZbXVVyHG7c4tPXVlDSM1VdHKoGZTmOdyRjFPZjwqyLyPMcx7dl6sQNIVwSb0e5jbf4Dy
         2U2wAQUzrB+AItg1w+F8Ho9G/hW1DYER+ddda4qrRyzR55mIQJl1TqIx+XqA7tQfkb7L
         C56Rc0oXlpUZD0QWQHogdiESB7JR0ZpJm09wPa7xM077JHFgHHEhNvpx7o8oSje8m85v
         yKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHaZQv6sQkM20AbZigemu3/+iqTLYWqXmVyjOWRPnIc=;
        b=WZOSEV0/sv+grOAU4IGTyH4X8CjC6yleo9q1EqbdPOo02en/tKo/igYsZWZJ8O3kCd
         fFgbmciwtbSl/p6EnSL2isXi9QTEDB7W7awmD+y6NfNhbjHkB16Rz9vrer/7ne8ko04N
         bT4r6BeuxFneKPMzat9pMc8cK+LxEoRy8mDlaxhB5JhWHd3aavUOBh0ULAWwjoDbspgA
         wQ/znNvOPiQMiLk+EurY2oAoVtRWPNR/lnTgmuuf2/iPlmc4LfqHW3hWd3bvRQmhtTdZ
         +yjFmgXUhDc5kRZF837gHMAUsAA/GsNWXT0fkk0q93JdWqkMr167Uw2STQQ7/lmqgz8C
         DgWg==
X-Gm-Message-State: AOAM533Yn0GPpeOZ/6Hu47iM42BoltgjWm/XukhOFdaU7mtUR2puznQb
	DxpqVOILcbnh2u9nGZinOkIUzKXFHEqRvQ==
X-Google-Smtp-Source: ABdhPJz+Rk+GlPqvyfd9OhlSWc4/qG35LBF4kGZSMdcUL7wzB9a8X81o6I3gKrAV5xqefHnRpqEqTw==
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr10125030pjb.153.1613289918276;
        Sun, 14 Feb 2021 00:05:18 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3857])
        by smtp.gmail.com with ESMTPSA id h11sm12338199pjg.46.2021.02.14.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 00:05:17 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Sun, 14 Feb 2021 00:05:15 -0800
Message-Id: <20210214080515.2286276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brings in following changes

* e5d28236 riscv64: define ELF_NFPREG
* 964104f9 math: fix expm1f overflow threshold
* c4c38e63 math: fix acoshf for negative inputs
* 074932c8 fix possible fd leak via missing O_CLOEXEC in pthread_setname_np
* 9b77aaca oldmalloc: preserve errno across free
* 98b9df99 fix build regression in oldmalloc
* 2010df0d preserve errno across free
* 9afed99c fix inconsistent signature of __libc_start_main
* dd5b6384 fail posix_spawn file_actions operations with negative fds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 249ce53521..562e80ae43 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "85e0e3519655220688e757b9d5bfd314923548bd"
+SRCREV = "e5d2823631bbfebacf48e1a34ed28f28d7cb2570"
 
 BASEVER = "1.2.2"
 
-- 
2.30.1

