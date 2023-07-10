Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D77AC001E0
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.32107.1688959231905845678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UxXGYC4X;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-635dd1b52a2so23705896d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959231; x=1691551231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hFZkmp17TXRSC+HbL0CKITGTkvPzJqoYNZt+hQXZNU=;
        b=UxXGYC4XwLMj4bRvvzOiaC+ebglwr6kw0JnDrDt87D0fkGeleO/Wsfjm+i6+7oNRhM
         TqKfap+VuiAtb9TnNmFK5qmnK+udbjNDJmJrPukmBSoir8Y5Qm4a5gbPNnHrwXJcFr4H
         0d8TwRaKjd51aLjzdKSZw6xC7Gj1ghYvRKpR0t9sv3WfKOLiKG03PcmAlSORngQwyDPK
         lmzg2J1ejUYg9p2i+liUzV0IIlIGDZiBFk7xEjkuiV+HH7B2cb+1i79/qa2OpEDdFRR/
         EOczW9rYbs3jhgUGcnI7Uab4wCPABaz5xfDydKglq/r5nTmuX5quw1VtvJ0EGwr/cilM
         wSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959231; x=1691551231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hFZkmp17TXRSC+HbL0CKITGTkvPzJqoYNZt+hQXZNU=;
        b=gbfn0iwCOBKZUn/kFhe3U/9BiVsFm3I0eSqkVO7eIpEks6sWaZC/KTpwmvD33X6AB/
         NH53/ABgVdOELymxT3bvkqcGu5XfBYoy+mfXpo35CB5roVhZNO/FutXMv48ZJFgvfswW
         NCSw8ZsCiAvuHfk8/rBQJoudVhrKkT1ub+UZghPMvvJ5NcHdAspAGQ+pMvpf/pnKeJpj
         wXeOe+TPf8xUw2JkIrIfc0SAc/cHlYFHFiUKHWeAbA/70Z06zq3CvgXGIYRXHIWqMENA
         1b+mZIOdD8M3d5HNDpKZyeVFLOUTMOsZqVQpH4iaDw4RAkf+Ob63Qd+93AM5Naxs+Ioj
         I/ig==
X-Gm-Message-State: ABy/qLaNXEPMEU7swBwEnY33CY3k850GyUskgNrelyIUZRlhI2vycN6v
	SC8Xz6j/0PRwBit3F52Odk2ytSVbUXo=
X-Google-Smtp-Source: APBJJlFfj4S8cidr2dfo6hAzUPUUxgNfCLK5sDkEKcbnx8X4HMy1qOezdOHhD/rjuK63z9H5SlJ5MA==
X-Received: by 2002:a0c:cb8e:0:b0:635:dcd3:5d60 with SMTP id p14-20020a0ccb8e000000b00635dcd35d60mr9478939qvk.3.1688959230908;
        Sun, 09 Jul 2023 20:20:30 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/15] linux-libc-headers: bump to 6.4
Date: Sun,  9 Jul 2023 23:20:14 -0400
Message-Id: <b2d1f439ea90ad19e9684a6066dafbfbaa4c5555.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184045

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel version 6.4 is the reference kernel for the fall
release.

This brings libc-headers up to date with that tested
reference

For musl, we drop one patch that has been merged upstream.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...linux-stddef.h-in-swab.h-uapi-header.patch | 42 -------------------
 ...aders_6.1.bb => linux-libc-headers_6.4.bb} |  3 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.1.bb => linux-libc-headers_6.4.bb} (74%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 0b33e61924..18daf446e5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.40%"
 GDBVERSION ?= "13.%"
 GLIBCVERSION ?= "2.37"
-LINUXLIBCVERSION ?= "6.1%"
+LINUXLIBCVERSION ?= "6.4%"
 QEMUVERSION ?= "8.0%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "16.%"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
deleted file mode 100644
index 5b7c1b6e21..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-include-linux-stddef.h-in-swab.h-uapi-header.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dc221138c809125dc1bbff8506c70cb7bd846368 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Sep 2018 17:08:58 -0700
-Subject: [PATCH] include linux/stddef.h in swab.h uapi header
-
-swab.h uses __always_inline without including the header where it is
-defined, this is exposed by musl based distributions where this macro is
-not defined by system C library headers unlike glibc where it is defined
-in sys/cdefs.h and that header gets pulled in indirectly via
-
-features.h -> sys/cdefs.h
-
-and features.h gets pulled in a lot of headers. Therefore it may work in
-cases where features.h is includes but not otherwise.
-
-Adding linux/stddef.h here ensures that __always_inline is always
-defined independent of which C library is used in userspace
-
-Upstream-Status: Submitted [https://lkml.org/lkml/2018/9/13/78]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Philippe Ombredanne <pombredanne@nexb.com>
-Cc: Kate Stewart <kstewart@linuxfoundation.org>
-Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-Cc: Thomas Gleixner <tglx@linutronix.de>
-
----
- include/uapi/linux/swab.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
-index 7272f85d6..2912fe463 100644
---- a/include/uapi/linux/swab.h
-+++ b/include/uapi/linux/swab.h
-@@ -3,6 +3,7 @@
- #define _UAPI_LINUX_SWAB_H
- 
- #include <linux/types.h>
-+#include <linux/stddef.h>
- #include <linux/compiler.h>
- #include <asm/bitsperlong.h>
- #include <asm/swab.h>
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb
similarity index 74%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb
index cbdebdc1e8..c52315499e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb
@@ -4,7 +4,6 @@ SRC_URI:append:libc-musl = "\
     file://0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch \
     file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
     file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
-    file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch \
    "
 
 SRC_URI += "\
@@ -13,6 +12,6 @@ SRC_URI += "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb"
+SRC_URI[sha256sum] = "8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3"
 
 
-- 
2.34.1


