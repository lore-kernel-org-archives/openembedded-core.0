Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF36C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 18:32:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.2830.1706725970177638455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 10:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGLfKGXm;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a359e6fde44so1953366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 10:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706725968; x=1707330768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzqnfl0d5mRvQVTVt7CXXVmUexxZOa8xW/3e8ma/tQk=;
        b=WGLfKGXmGARTpdAyPDFrHTge9dftjWoJHfaVrL4ubcjTv6fluSzww0JvXy0aL97ydg
         2Ujpogcyfj2GlAkMllcAzh88W3Qdwrgeb1HIIj/YVgOGOXaySbvZFQanFGE9OAGr8Y3F
         jVrKBrH6qemYYoFBDtg6TTyS8QykR8peDMr7VMzqixGhUwQR2ZCMJ52N0k2artXB5Bzx
         d+thyYD3GHfRq6OhaHDgCzhbWhSBjfb4xhsAp431bvOa/fibLwlaoxgBXTMrLT2PHUZu
         YiyLzLihn7OUpochw4TczDDz7V0RB2eJNnNHcjTAWkUuPIJL3QaS6SZdAQE5hXftR+Ha
         TFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725968; x=1707330768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzqnfl0d5mRvQVTVt7CXXVmUexxZOa8xW/3e8ma/tQk=;
        b=fSE6AmwhfUw6jKccNzPX2UG+R+jy+I1EERROZYUQR/5mNX955kgTjI63oO1eyKL5j9
         edVw3aidNhtWM9l9jkY8Ne6qlWrcfYnqJysPCuDl3loClRu3w0mek4p+cLcc3wLll+tL
         w53982O1Ljy02DitI0EKJi02PWDVLk30rVHB7HG0bAeoUNO8RHK5MBIJpJeybkiYzA88
         qOj+s1vZFyU/WMGk2sKY6daZL7sKN+xHIDJ6bbhBGwYUwPglSkO/aVDCI3aPFGFCNOEC
         M+DSy6GkpjJyuSZZlt6tQJFbYlKHxTJPNimtAM9AUxihC5WL3FBsFbAj7Z2knCEOh2kJ
         HpkQ==
X-Gm-Message-State: AOJu0YwTR5+5U2EIEnz2F9rMhJpKEpSj4/vW9KXMUMDRyiolhMoAkWpE
	zUrQNuNjcalR1zJ3YjUXhm3GQoazxKqMcMvmIF+KpjrOa3gBFtMA7wkOkshg
X-Google-Smtp-Source: AGHT+IElyOvMHQoDMzOkbrhIDPo0ONKgDINBzVSUOxrBquefmpeTYHnEELBA+5MKG9palAXTqoJ0xg==
X-Received: by 2002:a17:906:40d8:b0:a36:8434:c1bb with SMTP id a24-20020a17090640d800b00a368434c1bbmr1626834ejk.15.1706725968472;
        Wed, 31 Jan 2024 10:32:48 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id vt9-20020a170907a60900b00a35d545b721sm3133368ejc.116.2024.01.31.10.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:32:48 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/1] ltp: Update to 20240129
Date: Wed, 31 Jan 2024 19:32:43 +0100
Message-ID: <20240131183243.30223-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 18:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194532

Removed patch accepted upstream as
8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE")

Rebase runtest/mm patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi Richard, Daniel, Khem,

could anybody please test this update if build (it should).

Also, it'd be good nice to rerun proc01 -m 128 and report me with the
details, maybe we can fix it. If still problematic, it'd be nice to turn
disable_hanging_tests.patch into proper git patch (makes rebasing patch
on new LTP version easier).

Kind regards,
Petr

 ...001-Remove-OOM-tests-from-runtest-mm.patch |  6 ++--
 ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 -------------------
 .../ltp/{ltp_20230929.bb => ltp_20240129.bb}  |  3 +-
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
 rename meta/recipes-extended/ltp/{ltp_20230929.bb => ltp_20240129.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 6d945700be..cc98079651 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 6537666a9..e5a091a5a 100644
+index d859b331c..3c2962f44 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
+@@ -74,12 +74,6 @@ ksm07 ksm07
  
  cpuset01 cpuset01
  
@@ -31,5 +31,5 @@ index 6537666a9..e5a091a5a 100644
  
  thp01 thp01 -I 120
 -- 
-2.33.0
+2.43.0
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
deleted file mode 100644
index dbe63f2170..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 13 Jun 2023 15:10:33 +0200
-Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
-
-This is required for off64_t to be available on musl systems.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- testcases/kernel/syscalls/fcntl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
-index df663a50a..aac774111 100644
---- a/testcases/kernel/syscalls/fcntl/Makefile
-+++ b/testcases/kernel/syscalls/fcntl/Makefile
-@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
- 
- %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
- 
--CPPFLAGS		+= -D_GNU_SOURCE
-+CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.30.2
-
diff --git a/meta/recipes-extended/ltp/ltp_20230929.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20230929.bb
rename to meta/recipes-extended/ltp/ltp_20240129.bb
index 5c43346883..5cd33bb6a3 100644
--- a/meta/recipes-extended/ltp/ltp_20230929.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
+SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
-           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


