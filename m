Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.180993.1598214068394832280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUz9dhEh;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id m22so9265303eje.10
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dy9KJRd6zwLFc25z1i7bVlWqmyIOc90k9/ZQM6Q2bpI=;
        b=cUz9dhEhju1p1/gdyW/kQfy/6svUZkW6iL66oTd1AnuuU+fJN1ZFCrOHCeatMv0I9p
         lv+5HfJa86JsEObecoqMPnlB28HjT2FoxLVphRuMzekO5a9XOTwPKZ5oehpfBRK6q/9b
         VjnXY1lawk/eCEQHdkOhhlqt689sh4XD3CJA+qhTvENadfM05eSyVGDuyjeTebuHxEEf
         /a3bN1TLPdKTj3UfRv8LzYLk29kQWgNHPqQ6c87aVGqVMbizxMbTk1rSXMouEna+fe7o
         vqyIZTmjtkL59HEIpdnqaksnjVdmgzGk891iVWo8mLdgrxPoaMnIwNXIIiolq9x3Crxz
         Irtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dy9KJRd6zwLFc25z1i7bVlWqmyIOc90k9/ZQM6Q2bpI=;
        b=m0sVmayQo7YR+dqHXUUsiem3MsLkEFiuF72HSwoDpqvrVBg8s/hUFZufY3G9/1lcLl
         n2BUwdB14Nut5D4fLYE8nDvMcdT0WpowpLaGiCmBKPIbvmPeLTgfGPYMc73DTpCMX4Gl
         9UkjPWnwtMjalT6ABZreP0R56Gydqn+9wQwmnVZTfvRQNU2xWbj9mDxbBvXNUEHIn7fP
         V1i4/ZgxIAMspfRrMAVthjcmRMsBALzpAeumlOlU0iv7kfYyjFhetCqG4j4Sj2tqiU4R
         sYyn/Ripebaz04jLpAdEOOWcDUD2zDuFzd0nncZIbvZKcd+YSA8Sljyt0ocNfJqLy7Vk
         GpZQ==
X-Gm-Message-State: AOAM5333zJvvKJxIXERdvE73PmQ79D80uq9HWkHhk6EQiBHK3YL06reK
	SspAV6XlBjs7bCjRUrQd85MTjKHlIKQ=
X-Google-Smtp-Source: ABdhPJxoa9baBRotdTs+hJjCWkaiC7d0Dz7lDA5i1AVjeYuzkb0PWN+noJMdFhPfBkRcnDwyhwCPMQ==
X-Received: by 2002:a17:906:f1d4:: with SMTP id gx20mr2696811ejb.132.1598214066646;
        Sun, 23 Aug 2020 13:21:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/37] util-linux: upgrade 2.35.2 -> 2.36
Date: Sun, 23 Aug 2020 22:19:56 +0200
Message-Id: <20200823202031.24686-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-include-cleanup-pidfd-inckudes.patch | 42 -------------------
 .../util-linux/util-linux_2.35.2.bb           | 13 ------
 .../util-linux/util-linux_2.36.bb             | 12 ++++++
 3 files changed, 12 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux_2.35.2.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux_2.36.bb

diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch b/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
deleted file mode 100644
index 0ef6fb4ec7..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 10 Mar 2020 11:43:16 +0100
-Subject: [PATCH] include: cleanup pidfd inckudes
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/0a4035ff2e4fd5b5ae0cf8f8665696c2aff53b75]
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Benjamin Fair <benjaminfair@google.com>
----
- include/pidfd-utils.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
-index 0baedd2c9..4a6c3a604 100644
---- a/include/pidfd-utils.h
-+++ b/include/pidfd-utils.h
-@@ -3,10 +3,10 @@
- 
- #if defined(__linux__)
- # include <sys/syscall.h>
--# if defined(SYS_pidfd_send_signal)
-+# if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
- #  include <sys/types.h>
- 
--#  ifndef HAVE_PIDFD_OPEN
-+#  ifndef HAVE_PIDFD_SEND_SIGNAL
- static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- 				    unsigned int flags)
- {
-@@ -14,7 +14,7 @@ static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
- }
- #  endif
- 
--#  ifndef HAVE_PIDFD_SEND_SIGNAL
-+#  ifndef HAVE_PIDFD_OPEN
- static inline int pidfd_open(pid_t pid, unsigned int flags)
- {
- 	return syscall(SYS_pidfd_open, pid, flags);
--- 
-2.26.1.301.g55bc3eb7cb9-goog
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.2.bb b/meta/recipes-core/util-linux/util-linux_2.35.2.bb
deleted file mode 100644
index 752a6fa214..0000000000
--- a/meta/recipes-core/util-linux/util-linux_2.35.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require util-linux.inc
-
-SRC_URI += "file://configure-sbindir.patch \
-            file://runuser.pamd \
-            file://runuser-l.pamd \
-            file://ptest.patch \
-            file://run-ptest \
-            file://display_testname_for_subtest.patch \
-            file://avoid_parallel_tests.patch \
-            file://0001-include-cleanup-pidfd-inckudes.patch \
-"
-SRC_URI[md5sum] = "248a4d0810c9193e0e9a4bb3f26b93d8"
-SRC_URI[sha256sum] = "21b7431e82f6bcd9441a01beeec3d57ed33ee948f8a5b41da577073c372eb58a"
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.bb
new file mode 100644
index 0000000000..9feb717f00
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_2.36.bb
@@ -0,0 +1,12 @@
+require util-linux.inc
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
+           file://configure-sbindir.patch \
+           file://runuser.pamd \
+           file://runuser-l.pamd \
+           file://ptest.patch \
+           file://run-ptest \
+           file://display_testname_for_subtest.patch \
+           file://avoid_parallel_tests.patch \
+           "
+SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
-- 
2.28.0

