Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB34CCFB442
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 01:55:29 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.44001.1728266119745681279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 18:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q50NI7S1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e1c91fe739so2764247a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 18:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728266119; x=1728870919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDUY1r94ec2SUYqpRJy69B7+8xmD9DGRd8NGAUWXfFk=;
        b=Q50NI7S1HqUvLdau8WqsmyW3X4zJbw/bqsk1Mier5sHEZbNau3iqa3FvSRYPKZmpF1
         /Z/u8TCrGWAajgl+GSdHYLjsCBES+thu4ZdecAVDBMHrYMNskFrTYiK5/Q9rg1yjT6mt
         iZ1bsL2Y5qnQTiErjP7tTxIlJMV+orKwtpcXzq49v1bHkLX+uUKHR3+YVacGS+6nunN2
         XC7hU1oeEY32lgVZ7+7lKhFI73HGjeyw2qINdP6rOgrRP8tBhJycEjQSIbERMwnmdYt5
         TC5tptK/FheyotKeXm3pT+/JBhp80NnIJnCtDwcHhVJnpl6Z2dV1keJFFpDFIz4xO9Ui
         lYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728266119; x=1728870919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDUY1r94ec2SUYqpRJy69B7+8xmD9DGRd8NGAUWXfFk=;
        b=MpRBsB9jEmmW9sDji+BEdjWpZEUnQiqD/usCgJmASZLF2z9tKmVhYcuhrm4eK3T7/A
         /CwZn6IbHyOt8/fN+ZxYFHUb7J0+wd6psF7yXiHBnzpzof43HvWL7I80mq/DScdYq8RY
         zwrM9k+GqYr9g/cAAbYtir6R1VjQOI51tdmm5oUs8OXZZSkiQx8XSC9RDBBgn2LsOu2t
         S2YPYyryz0bkL9JlLK1AMB78/fPYMAwxYjr7kArZYn3w1bTWgTszC8wi/T48OJ6PaH73
         PWYssirkzF4eJazO0AeW8+/pCkpg9adp+aN0GWNwgchBog56fRMZ5j/S+EItoi4jkrWX
         sPfg==
X-Gm-Message-State: AOJu0YxsGSLQjV/XdOyyE2rCGxvGa6ZTLERZ47JjKklJRsd5Z5DYFhw2
	TZoM36UCP7/ujdwfOaFlxbbHZIUOmCa+uqoC3jeiX0lBKkkCibEQNYk+/Mt3j87zoGKfDnHbvGF
	FJc0=
X-Google-Smtp-Source: AGHT+IFrj96KegXXj6sevYdXGcG55AEYNpdo8mawfpnzw87AlFBJ6imFttyq/rKKVf/ETHUYZWOBiw==
X-Received: by 2002:a17:90a:fd87:b0:2e0:80c5:bdea with SMTP id 98e67ed59e1d1-2e1e621e7d8mr11324189a91.11.1728266118983;
        Sun, 06 Oct 2024 18:55:18 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb70asm4074938a91.19.2024.10.06.18.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 18:55:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] glibc: stable 2.39 branch updates.
Date: Sun,  6 Oct 2024 18:54:59 -0700
Message-Id: <d652964e2bd860473b2d39f57b92e51d646672bf.1728266000.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
References: <cover.1728266000.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 01:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205254

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
84f6bfce2c libio: Attempt wide backup free only for non-legacy code
4e382ce01c debug: Fix read error handling in pcprofiledump
7f5027995f elf: Fix tst-dlopen-tlsreinit1.out test dependency
27a0c6b490 elf: Avoid re-initializing already allocated TLS in dlopen (bug 31717)
e3d5d2d350 elf: Clarify and invert second argument of _dl_allocate_tls_init
28c4f32f71 elf: Support recursive use of dynamic TLS in interposed malloc
5ff30b2f75 nptl: Use <support/check.h> facilities in tst-setuid3
cae418638e posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
a500b48bd2 ungetc: Fix backup buffer leak on program exit [BZ #27821]
70939528c6 ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
f0c308ab23 Make tst-ungetc use libsupport
3c5f493d87 stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
98de2f2bae support: Add FAIL test failure helper
e73fd06b7f string: strerror, strsignal cannot use buffer after dlmopen (bug 32026)
37c2aa4eaa Define __libc_initial for the static libc
49953727d1 x86: Fix bug in strchrnul-evex512 [BZ #32078]
81631a0dd1 Adjust check-local-headers test for libaudit 4.0
9fbbe86f7c x32/cet: Support shadow stack during startup for Linux 6.10
eeff407b19 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
1ab7faf86d support: Add options list terminator to the test driver
6eebc92cb2 manual/stdio: Further clarify putc, putwc, getc, and getwc
afc15c2044 Fix name space violation in fortify wrappers (bug 32052)
5a5eb72d8e resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
7f5ccdd8af Add mremap tests
a8c230c881 mremap: Update manual entry
9f349d02c6 linux: Update the mremap C implementation [BZ #31968]
127ef30c46 Enhanced test coverage for strncmp, wcsncmp
3b25c7fa87 Enhance test coverage for strnlen, wcsnlen
4bdcc1963b manual: make setrlimit() description less ambiguous
b71a51189d manual/stdio: Clarify putc and putwc
946006d37c malloc: add multi-threaded tests for aligned_alloc/calloc/malloc
f11b7178a1 malloc: avoid global locks in tst-aligned_alloc-lib.c
51db012c94 resolv: Track single-request fallback via _res._flags (bug 31476)
8c9fbc6651 resolv: Do not wait for non-existing second DNS response after error (bug 30081)
fc1dc39984 resolv: Allow short error responses to match any query (bug 31890)
cb19cef087 elf: Fix localplt.awk for DT_RELR-enabled builds (BZ 31978)
f6a75fddf4 Fix usage of _STACK_GROWS_DOWN and _STACK_GROWS_UP defines [BZ 31989]

Results before updates as below:

No. of passes                     4581
No. of expected passes            2
No. of expected failures          16
No. of unexpected failures        214
No. of unsupported tests          45

Results after updates as below:

No. of passes                     4605
No. of expected passes            2
No. of expected failures          16
No. of unexpected failures        212
No. of unsupported tests          46

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 955b22bc38..dc162b2946 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
+SRCREV_glibc ?= "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.34.1


