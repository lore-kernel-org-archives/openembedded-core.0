Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D571AC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 07:24:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.6887.1753341857457427968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 00:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RoRU4o/Q;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3220c39cffso791660a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 00:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753341856; x=1753946656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EK+g7VDJH6uVeDMa8jw4pt/IrPmaeEpv2VHbHKpCTvM=;
        b=RoRU4o/Qrxrd88BlZkdchxb7qeeZj696jSez9lhn37sr1+yzskZlBtdI+QVdeKi7R8
         pn0cbM2naugS7BJCqk5j7DX1B22R3Daqd+NK/pPs00paAiaJ1PC6eH2hFLqnC89GfRlA
         E536KEicGd0zQ+9bmQs+gO+epsl4lyGwFiqi17YWQMnESX1TZjgPLEDzyIjs8F257GlJ
         GeFAG3cH4khP+Aljd2wqoDbYDYu7tgpSXeDnk7ApC0H4v1u7OIh5KKqLWzyQ22VJj35s
         x46suwKk1LZNtn05zvOSy8Wa22XHG7akQfbViSmdSOLLlwZfZOpJumvSbAHvuPZROnPX
         5GRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341856; x=1753946656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK+g7VDJH6uVeDMa8jw4pt/IrPmaeEpv2VHbHKpCTvM=;
        b=mKCJfS6SslJ2S8Bh06XtDc2d9Qbh8y33oaZ8zzRrWat1aSPUyQtcmJd+9u37WcxjvN
         dKbeg5vqagTzSUBCulYhnC5b5DLoxEvulc29QFdvocfwExangczKFg9svmHtl+GYEnld
         XxGb9S5PyJyOcEMtoRrsES8fIl0TENlzksV0s9UlYKc3vc90j8bf01g7atRZ6SvyituR
         +b+xwgm5RqyjEZR+KEYOafmV1qKboORJ8O28tCE9BGQgURADl+DhbkDzldbMC+BSqqQZ
         jaHjQmzPXHI5K15Cgnb5KjtzImGin6ECDDGIcm2kh1IS0mZDsnGEoQyqxf7bVxVK284L
         q+Qw==
X-Gm-Message-State: AOJu0YxJovaWnHlw/BYCRJFjSt4D6NnULCQoSBVXBOPV0AH7SOMK8gol
	2F+D5ee/qthwppZUEjNakjXOceXe4oRcV1DcdkInFw0rPffCxLRY8uLNqSrUeAgADFA=
X-Gm-Gg: ASbGncu2bLYUAAb1QbwEGJOHYC8iAAGFetrycsh9Bg+MNEPuKvEF7e7DZZeAuU2rXjO
	UhflYZ006VT/nZElfvMlI0WjYf0rSG4b5Kuwp8yKp20VOIaEwOe3+Sh490K0v9eQpQuNwbXZc+n
	y7dd2/cQ3SGIIbYkNxhx6SphwLfH9KrkNQILQtBnHWvDjkAs6PxDMZMwu3ZuHLIdu29YpZe83XD
	XLq7h8mna2r+4c//lY6T1J+HBlQ9fZCa+FxyxepRNHQ9fEkqZwDOVzOXcfuZdAU0/Hx2INo8lDm
	knIvRihICVPA9TAwksp7UG9OjdFjVokecgwLD7wbs5YMWUCr+lno+s6xp394XPIttHs1Nv20Kbc
	T4bJZVYMgXBkRhA==
X-Google-Smtp-Source: AGHT+IEUohgERTodu576UcAxikS6+/zI0kP89T6ZhXE+m+ztGEQbcvxaYIvsd4E5TjBTu2bEtGPNaA==
X-Received: by 2002:a17:90b:588b:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-31e507c3f08mr10597811a91.17.1753341856219;
        Thu, 24 Jul 2025 00:24:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66250426sm668232a91.4.2025.07.24.00.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:24:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] busybox: Skip a non-posix awk ptest on musl systems
Date: Thu, 24 Jul 2025 00:24:13 -0700
Message-ID: <20250724072413.3589521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 07:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220822

The test depends on BSD extension REG_STARTEND which
is not in POSIX, glibc does implement this extention so it
works on glibc systems but musl does not and it needs to
be skipped and LIBC environment variable is used in this
test as well to run it conditionally.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Make the patch generic and use LIBC variable to decide on running the test

 meta/recipes-core/busybox/busybox.inc         |  1 +
 ...gsub-erroneous-word-start-match-test.patch | 28 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 ++
 meta/recipes-core/busybox/files/run-ptest     |  2 +-
 4 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4ebaeb92c97..c203f2f8f11 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -371,6 +371,7 @@ do_install_ptest () {
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	sort ${B}/.config > ${D}${PTEST_PATH}/.config
 	ln -s ${base_bindir}/busybox   ${D}${PTEST_PATH}/busybox
+	sed -i -e 's|LIBC="<libc>"|LIBC=${TCLIBC}|g' ${D}${PTEST_PATH}/run-ptest
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch b/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch
new file mode 100644
index 00000000000..18e57a87be4
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch
@@ -0,0 +1,28 @@
+From 7ee04187bd59acc922982fb49e76ba6c39dd8a91 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 May 2025 08:36:54 -0700
+Subject: [PATCH] busybox: Add awk gsub erroneous word start match test to know fails on musl
+
+Musl does not implement this BSD extension REG_STARTEND and the test states
+that it will fail without this extention, therefore guard it with SKIP_KNOWN_BUGS
+so it can be ignored.
+
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-July/091623.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testsuite/awk.tests | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testsuite/awk.tests b/testsuite/awk.tests
+index be25f6696..c56e217e8 100755
+--- a/testsuite/awk.tests
++++ b/testsuite/awk.tests
+@@ -612,7 +612,7 @@ b
+ # Currently we use REG_STARTEND ("This flag is a BSD extension, not present in POSIX")
+ # to implement the code to handle this correctly, but if your libc has no REG_STARTEND,
+ # the alternative code mishandles this case.
+-testing 'awk gsub erroneous word start match' \
++test x"$LIBC" != x"musl" && testing 'awk gsub erroneous word start match' \
+ 	"awk 'BEGIN { a=\"abc\"; gsub(/\<b*/,\"\",a); print a }'" \
+ 	'abc\n' \
+ 	'' ''
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 9f7ded3354d..bec25348b82 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -55,7 +55,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0003-start-stop-false.patch \
            file://0001-archival-disallow-path-traversals-CVE-2023-39810.patch \
            file://0001-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch \
+           file://0001-busybox-Add-awk-gsub-erroneous-word-start-match-test.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
+
 SRC_URI[tarball.sha256sum] = "3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4"
diff --git a/meta/recipes-core/busybox/files/run-ptest b/meta/recipes-core/busybox/files/run-ptest
index 76873c9de20..957af36099d 100644
--- a/meta/recipes-core/busybox/files/run-ptest
+++ b/meta/recipes-core/busybox/files/run-ptest
@@ -4,6 +4,6 @@ current_path=$(readlink -f $0)
 export bindir=$(dirname $current_path)
 export PATH=$bindir/bin:$PATH
 export SKIP_KNOWN_BUGS=1
-
+export LIBC="<libc>"
 cd testsuite || exit 1
 LANG=C.UTF-8 ./runtest -v | sed -r 's/^(SKIPPED|UNTESTED):/SKIP:/'

