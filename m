Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18782C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 07:19:15 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.7939.1751008747122973696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 00:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOaePj4Z;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74264d1832eso2491904b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 00:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751008746; x=1751613546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPQd3MPFW/cWWdPu/Wx7iQ0Nw4mToCKb/fU1CWmHo+s=;
        b=AOaePj4Z64frpP64xbsSOt4uakOKD4VYtgxgV+Q9Quxv8fOCNTtHkN82f1fbv1VOWc
         peJqVd4D7GjZkkO0d39HZ+Eg6J+C1yq1b7RpZbu1Iakd5cf8mmZUz7uuZ5gh5IJqDISC
         0G0KgAtdrWerQKYoid1L5eXEBV5WvICNjfweg6QcQTPFivtL3WKdcyjbvgIDsKcr0Hch
         rc64S98MSynk6zNuuHKrkmNO5asIubDEeUim8olEOS3VMaHzS/cy5dBqZlGPCER6Bskc
         u+dkLOJP6yZI1prS4cwFMtkWus0R5plrp1NXbSBoyxs/3y1UMFkvARSu/746PvbpUVlg
         Zyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751008746; x=1751613546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPQd3MPFW/cWWdPu/Wx7iQ0Nw4mToCKb/fU1CWmHo+s=;
        b=myiXGSJS05xX/zPRQyhFCzlaNZl/dhwvGpyD1sjkBy8LREPGW3v4ozlzV62fJBNeLy
         DclUmUVxDPwGJGxpm4f8dhfs9hh6P9ztcf1K/nM/2uX4KnySv+t3HSujT2XjLPzxTX7n
         KoUGRspwcRNEXBklrYR/Ia1NjM7u6fgyt40h7+sNKoCY7Z3jKFBHenQrbvFNLv8GTnOH
         s11dNXgb0UqY1heZfrQYsj5dNu575oIczzrvtHqcViTzix+UdZGvf5GIbY71O/rB12yF
         XWPG61+h8rBnXYl0ajs4RIa+lB/E3XWT0l6pfQjJZlEL0tt9xX7qV37rxLP89PEiPuiA
         H3lA==
X-Gm-Message-State: AOJu0YwxuYVvR1w7KWZZPv9auRmbM1w5Z6FlyOYTPN4Ex6wb8EY2yNBX
	8vSRVe0abYcqWtMZuz1zEyuvik3qRQA9NpGYHNyOZ9PKc/zc0+Bvw+o31f6dPER+
X-Gm-Gg: ASbGncuvlZ9xK938fC4SU6b6WZWJMf1dRr4rMRbacKVmzMmNxLFUFyxT+Etx+H2aWnj
	ZOPZz73THD/v+6ZcGf/8gzrePosJL5BHNBdNZHpjQxn+sRboqr4uISDRwmSdkCkGgg7tK4VQWCJ
	a5uLJXpf1tWXcZzG8ahlvD3wyTC03MgLfUuayYORPx1pCbWojjuvWRVQaUku2t5+uuPr48E4oLT
	crV2RRKCDdJrcx8aF4kCuR1fVzy7tShY7Ljvhar1OKbKxJ4Y+4IS3Y6jm78K4HiCdDWEnSp/Bg/
	XX0kGq8UpwgqOjXzQkRMU2ogZtmsH1pLbxbNhmqc0mC4d3Xuc6SZTA==
X-Google-Smtp-Source: AGHT+IEEz7eNTlPvobSnEDML6yURTBOTs8eYngIYC955UVXje6sX4uuWN1j7QqG4aPEl45EWveyRug==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr3075089b3a.19.1751008746125;
        Fri, 27 Jun 2025 00:19:06 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300ab8dsm937552a12.8.2025.06.27.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:19:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Refresh patch to remove patch fuzz on musl
Date: Fri, 27 Jun 2025 00:19:03 -0700
Message-ID: <20250627071903.1943193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219384

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g_syscall.h-Define-MIPS-ABI-defines-for-musl.patch | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index f0aa3a0bd8b..1443c5082b2 100644
--- a/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0015-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -15,8 +15,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/base-filesystem.c | 1 +
  2 files changed, 7 insertions(+)
 
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index e2cd8b4e35..f2fe489de7 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -32,8 +30,6 @@ index e2cd8b4e35..f2fe489de7 100644
  #include "macro.h"
  #include "missing_keyctl.h"
  #include "missing_sched.h"
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 389c77eee0..e3627c4603 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
 @@ -20,6 +20,7 @@
@@ -42,8 +38,5 @@ index 389c77eee0..e3627c4603 100644
  #include "user-util.h"
 +#include "missing_syscall.h"
  
- typedef struct BaseFilesystem {
-         const char *dir;      /* directory or symlink to create */
--- 
-2.34.1
-
+ typedef enum BaseFilesystemFlags {
+         BASE_FILESYSTEM_IGNORE_ON_FAILURE = 1 << 0,

