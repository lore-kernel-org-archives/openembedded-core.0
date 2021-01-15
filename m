Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.421.1610737760371536039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 11:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XqsyuOLg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id q4so5179439plr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 11:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIhE36Zl3KTNprfVvzKhPqBC4db5RQMA++/8csikdVU=;
        b=XqsyuOLgPqvxWIwaiwqfgL7HEkTW61PvMlxPQr7ZKLdRWsOnVfRHJVGxe4QeECbmW5
         ZCBsuWecN3UmZQ1AdFNTCIqdZ8LEvFoBh2ondQjXMcoKfzjnhZgwrJYyjcQmxMbR/4h+
         7cebuk6iYhFJ2RMF/DbSajmOp49xVScTXSZgdGGNmmMGsmNQR2kLO+mcxjF7L0vtjqZC
         vTPqJvMsZhqIm1kKRwiapas/RUov+dohCJRBWCvcxosNEgzZHFBrXRE4wSGoaBjDS4wm
         Ne93zeNxIZbFwqFySoo8EdNhqgZnw1SxzzR9AwTY47pYUscq6Qu9xtnAtk/yU0kD5Qo0
         uBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIhE36Zl3KTNprfVvzKhPqBC4db5RQMA++/8csikdVU=;
        b=krlJZ1qWi4OaGsdtmo1E2b0l+oM5Qn8IgqCe+ZQLFT2O+Yfkbp9lylTfhjTqx851H0
         wSeaWNwQeeqY5/yyH5muco8URHYchO6OEbdySA1+N30rtKC+C3h8CkNw6qcgBPLBVVzl
         z382Vg/CCRK7ndqbUwZnhSCdNITzsFRZd51NayMXGx7gOwkN2eo7cv709I/qqy8aN7zo
         WuE1njAmtMDG+Ek49Q9mOHtYS7S/SLQ3ZXx0IpuwDtoXiAbpoXO1MkLVeQ1HKlxyUgp4
         wiRLCcr2uPR2BLTShKipobMamcriE01es8cb4rTa27Qda82SAoT9Q7/FbekexLoU2bxa
         10MQ==
X-Gm-Message-State: AOAM532pqjAH8vgpfYtoxK+D2MqvS0zWhRWRTjwUSgDFzn/5Bqrg4kX7
	h08fAxvLLB2+0Rsz43sIfJtEMMsZxR+TCQ==
X-Google-Smtp-Source: ABdhPJw653+JHXuYfplgvUHOO6yFlIR55i5ju3J7UFCqC305GLBrl1C2xDE5cadXfRt9fP5QxeoEzQ==
X-Received: by 2002:a17:90b:e88:: with SMTP id fv8mr12037162pjb.126.1610737759556;
        Fri, 15 Jan 2021 11:09:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f3c9])
        by smtp.gmail.com with ESMTPSA id p9sm8764009pfq.109.2021.01.15.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 11:09:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl/glibc: Document assembly file directive fix
Date: Fri, 15 Jan 2021 11:09:16 -0800
Message-Id: <20210115190916.292320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been fixed in binutils so we want to drop it with binutils 2.36
upgrade when it happens

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/glibc/0026-inject-file-assembly-directives.patch  | 6 +++++-
 .../musl/musl/0001-crt-Add-.file-directive.patch            | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
index 89eef82e1b..5137fedb7b 100644
--- a/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
@@ -21,7 +21,11 @@ which use .S files.
 RP
 2018/10/3
 
-Upstream-Status: Pending
+fixed in binutils 2.36 [1]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=26822
+
+Upstream-Status: OE-Specific [ Drop when upgrading binutils 2.36+ ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
index 35c8b65740..1cd08cdcd4 100644
--- a/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
+++ b/meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
@@ -10,7 +10,11 @@ source files and they are missing .file directive
 if we add .file <filename>.s in them then debug info encodes this
 value instead of absolute path in debug_line section
 
-Upstream-Status: Pending
+fixed in binutils 2.36 [1]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=26822
+
+Upstream-Status: OE-Specific [ Drop when upgrading binutils 2.36+ ]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  crt/aarch64/crti.s    | 1 +
-- 
2.30.0

