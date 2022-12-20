Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8D6C3DA7A
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:42:25 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.57990.1671561738957739388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Db7dqLLA;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id fu10so11828585qtb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpkBdPh2bSTAJW1esyxB62UUM/RcYJQ455pKHBrdXY4=;
        b=Db7dqLLAgl+Lm8SNgNNwXN8h0nWZnu+DKTymvTsrgHF7qzTJzunqE+1+V2gWVoKjJL
         baLDkQKyhAzj3RHQe6XaUmrRwtlvW0eodcgVzBjkJFQx8y7lACBWrdH+CUzfJxQlCWuy
         T9Mx1B6gMIz5CLyJUUVgc7QwtUvRccm3S2WZSnTYboYp71rkwQK302sAHLpoy2ocvZmk
         B9UZhCfvJHal3/XFCahNX78IPRFQx0AH5JKxEF0tIBx6Rva7mmpjfgHashKfmRYBF6/C
         QlteTtLJZej/iQSF6pw4Mnz+PvVJ4nsoYp8BWOVbpz4MqwWi6bSiaFcmAAkAsrsfiQyH
         kslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpkBdPh2bSTAJW1esyxB62UUM/RcYJQ455pKHBrdXY4=;
        b=vPmCsSiZepZY70pTb0+J9OUZ/fywQAhFk/rnZGojfyv9r3lK8X6CiANllR75TR/34K
         bevfhxX47rBJ3uGJexti/RbzEi4VFw989ujVbuLdRmUgShH2/xWlu/1a1UUDoTQ+NtXc
         d51bBBQcaveaCEBFD5XoRCpkjQ8po7hxiknFR/TZ1DaWBKOVe/GFJOaTYeOfgJrEpt9a
         hbKEg7X0gdmfNpjTgHOWrzduN/vdkNewMnGDH9hjd0dPrATa87cNNGfGSXbAaTB7iExP
         LkQz0b8ORmy22aeXX62et14qyYkFvRSx+b0+aRNreb358CMxEFPrYozbK5KFY5gOLr8q
         Vffw==
X-Gm-Message-State: ANoB5pmUrfEjeRsOeinoaDTDXeG45nzsvg7ylBmmopaNMaqTtS6Jey7U
	NHv9jvZjGyLMMO6hG6h3NGBqXL5mV5Q=
X-Google-Smtp-Source: AA0mqf4R/h6PVyJP4kIVW5DPjxuNEGfmLyzUZQWN3gHK4LKUbw6q5V+JLHK+Xz2vmR7YMrA9h0zIBQ==
X-Received: by 2002:a05:622a:1b14:b0:3a7:e9dc:699d with SMTP id bb20-20020a05622a1b1400b003a7e9dc699dmr64679443qtb.20.1671561737889;
        Tue, 20 Dec 2022 10:42:17 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006fc94f65417sm9229265qkg.40.2022.12.20.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:42:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-libc-headers: bump to 6.1
Date: Tue, 20 Dec 2022 13:42:06 -0500
Message-Id: <002f2fbb83f9bc269bd240e2fb1cf430f54b4a4a.1671560769.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1671560768.git.bruce.ashfield@gmail.com>
References: <cover.1671560768.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174878

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.1 is a LTS and one of the reference kernels for our next
relase. Making it a logical update point for our libc-headers.

We can drop one of our patche as the gcc-goto.sh is no longer
used, and hence we won't have race conditions like we previously
had.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...d-input-and-output-files-instead-of-.patch | 67 -------------------
 ...ders_5.19.bb => linux-libc-headers_6.1.bb} |  5 +-
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.19.bb => linux-libc-headers_6.1.bb} (70%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6f9a68a900..444dfec9eb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.39%"
 GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.36"
-LINUXLIBCVERSION ?= "5.19%"
+LINUXLIBCVERSION ?= "6.1%"
 QEMUVERSION ?= "7.1%"
 GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
deleted file mode 100644
index a5ded602e5..0000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 21 Nov 2018 15:12:43 +0800
-Subject: [PATCH] scripts: Use fixed input and output files instead of pipe for here-doc
-
-There was a bug of "as" in binutils that when it checks if the input file and
-output file are the same one, it would not check if they are on the same block
-device. The check is introduced by the following commit in v2.31.
-
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
-67f846b59b32f3d704c601669409c2584383fea9
-
-The here-doc usage in this script creates temporary file in /tmp. When we run in
-an environment where /tmp has rarely been used, the newly created temporary file
-may have a very low inode number. If the inode number was 6 which is the same as
-/dev/null, the as would wrongly think the input file and the output file are the
-same and report the following error.
-
-*** Compiler lacks asm-goto support.. Stop.
-
-One observed case happened in docker where the /tmp could be so rarely used that
-very low number inode may be allocated and triggers the error.
-
-The fix below for the bug only exists on the master branch of binutils so far
-and has not been released from upstream. As the convict is introduced since
-v2.31, only v2.31 is affected.
-
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=
-2a50366ded329bfb39d387253450c9d5302c3503
-
-When building linux-libc-headers we need to use "as" in binutils which does not
-contain the fix for the moment. To work around the error, we create a fixed
-temporary file to contain the program being tested.
-
-This patch also removes ">/dev/null 2>&1" so we will have more direct error
-information in case something else wrong happened.
-
-Upstream-Status: Inappropriate [A work around for binutils v2.31]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- scripts/gcc-goto.sh | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
-index 8b980fb22..d256a9438 100755
---- a/scripts/gcc-goto.sh
-+++ b/scripts/gcc-goto.sh
-@@ -3,7 +3,7 @@
- # Test for gcc 'asm goto' support
- # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
- 
--cat << "END" | $@ -x c - -fno-PIE -c -o /dev/null
-+cat << "END" > ./input
- int main(void)
- {
- #if defined(__arm__) || defined(__aarch64__)
-@@ -20,3 +20,6 @@ entry:
- 	return 0;
- }
- END
-+
-+$@ -x c ./input -fno-PIE -c -o ./output
-+rm ./input ./output
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb
similarity index 70%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb
index 3557526d14..0019a4f1d4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb
@@ -8,13 +8,12 @@ SRC_URI:append:libc-musl = "\
    "
 
 SRC_URI += "\
-    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch \
     file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "f91bfe133d2cb1692f705947282e123a"
-SRC_URI[sha256sum] = "ff240c579b9ee1affc318917de07394fc1c3bb49dac25ec1287370c2e15005a8"
+SRC_URI[md5sum] = "475320de08f16c9fa486fc4edfe98b30"
+SRC_URI[sha256sum] = "2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb"
 
 
-- 
2.37.3


