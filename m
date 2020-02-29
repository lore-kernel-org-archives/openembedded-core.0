Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 775B461A56
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:00:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g12so406271plo.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=slfcYO/KbMuOiQ5vs7Bty0yDfcRUK3wjkBSmf3usEHQ=;
	b=mvsyME+PZ7GRgcxQX7NZQT9dsdnTpTTZ74+zgKNk31MZk0lkUnFTbTZxFQEJC9Rrol
	hDyWEHJUMR+a/pcJzSLM1AK+lHHXv3+dWtt2zu4dp6vQya2O7UbBRiaUpUQ9o52YGLxZ
	+jYwMGPOWFp40PTD9a4+t26yNDWzodSE2e7pO0rWOfNMRir3gN+vC9GIPIYoQLs6v8Os
	tlA7ev3sP98b/wjfi00q4l7J7zAJgx4KD7Oez+E3Rsb4wRFGjv+7lykY0KQfE2ezB65f
	oJb3U+OIe0UEB0tKhy0BtrKicjfahRnC4swUtHlgccLTB2baiA+M6oiML2FmMU2g6XIu
	ZNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=slfcYO/KbMuOiQ5vs7Bty0yDfcRUK3wjkBSmf3usEHQ=;
	b=JjVL9HYWflL5TZRF/b3Z5v95DeYTc7YMv+fvsvhclM5d+KmyalUl5/+cJN8N35sLzk
	KQE0xML/2fsyiGpExOFvmwRuGhpmr2rUKlIxZ33kKFxDWzQpyGHwHHk0WO+YkRkBfpr6
	K6krFVbFsOo3b7/R1vTNRmRRmc6OEdsGwDE0Myt3l1+i+taZaZQVq+IzwxZTRD2ry0nV
	RSJZYk/Y00eeHH51PfXs7Iw8XZ5j54/pkxy7xJWrHA65qp2DovpQR+fH/i/Xlhtg9qrr
	KyLkvIiQCc2FMgvTwjLkXBwhx/Bu/ya3JmfGu6sV5apc+iaUuWF2e/ardVPztmdPZEhW
	28zQ==
X-Gm-Message-State: APjAAAWz4GbP8dwWYDbETUicraFQsTa3KeFT7Us5Y9r0UY0GG6sYI7Aq
	3oWjfi//6tcQv//iAz9yVcSFo1p2/+A=
X-Google-Smtp-Source: APXvYqzXKyhnHc6pAwojlMSkvsnQaApFDkKFbUHUD1Dj5AW9oc2fiRJA1jg7SHvBRZ2hGzPJwsd6sQ==
X-Received: by 2002:a17:902:ab95:: with SMTP id
	f21mr8467695plr.188.1582988425233; 
	Sat, 29 Feb 2020 07:00:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	r198sm16250942pfr.54.2020.02.29.07.00.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 07:00:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 07:00:35 -0800
Message-Id: <20200229150036.1900777-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v6 1/2] ltp: Update to 20200120
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Feb 2020 15:00:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Vorel <petr.vorel@gmail.com>

Removed ffsb copying file and associated runtest file fs_ext4
(both removed in this release).

Added LIBS=-lfts for MUSL.

Removed patches (accepted upstream)
* 0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
* 0001-testcases-fix-an-absent-format-string-issue.patch
* 0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch

Merged patches
* 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
(into 0001-build-Add-option-to-select-libc-implementation.patch as they
touch the same files)

Refreshed patches (some tests have been fixed for musl)
* 0001-Add-more-musl-exclusions.patch
* 0001-build-Add-option-to-select-libc-implementation.patch
* 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
IMHO this one shouldn't be needed not, but CI still fails without it

Updated status
* 0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
* 0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes v5->v6:
* LIBS is specified for configure instead of make

 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 .../ltp/0001-Add-more-musl-exclusions.patch   |  37 +------
 ...option-to-select-libc-implementation.patch | 103 +++++-------------
 ...udevadm-trigger-before-swap-verifica.patch |  35 ------
 ...ix-zeros-of-the-addresses-output-by-.patch |  43 --------
 ...or-time64-unsafe-syscalls-before-usi.patch |  41 +++++--
 ...es-fix-an-absent-format-string-issue.patch |  24 ----
 ...rs-Link-with-libfts-explicitly-on-mu.patch |  20 ++--
 ..._tgsigqueueinfo-disable-test-on-musl.patch |  35 ------
 ...k-nfsv4-acl-acl1.c-Security-fix-on-s.patch |  27 ++---
 .../ltp/{ltp_20190930.bb => ltp_20200120.bb}  |   9 +-
 11 files changed, 95 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
 rename meta/recipes-extended/ltp/{ltp_20190930.bb => ltp_20200120.bb} (90%)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index b8b7300435..6dc5ef22ad 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -59,7 +59,7 @@ class LtpTest(LtpTestBase):
 
     ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
 
-    ltp_fs = ["fs", "fsx", "fs_bind", "fs_ext4"]
+    ltp_fs = ["fs", "fsx", "fs_bind"]
     # skip kernel cpuhotplug
     ltp_kernel = ["power_management_tests", "hyperthreading ", "kernel_misc", "hugetlb"]
     ltp_groups += ltp_fs
diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
index d3af31f34a..773844d442 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
@@ -5,12 +5,12 @@ Subject: [PATCH] Add more musl exclusions
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+[ pvorel: rebase for 20200120: enable fanotify13, fanotify15, setxattr03 ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  testcases/kernel/syscalls/accept4/Makefile      | 4 ++++
- testcases/kernel/syscalls/fanotify/Makefile     | 6 ++++++
- testcases/kernel/syscalls/setxattr/Makefile     | 4 ++++
  testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
- 4 files changed, 18 insertions(+)
+ 2 files changed, 8 insertions(+)
 
 diff --git a/testcases/kernel/syscalls/accept4/Makefile b/testcases/kernel/syscalls/accept4/Makefile
 index 504042e11..94db06266 100644
@@ -23,34 +23,6 @@ index 504042e11..94db06266 100644
 +ifeq ($(LIBC),musl)
 +FILTER_OUT_MAKE_TARGETS        := accept4_01
 +endif
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/syscalls/fanotify/Makefile b/testcases/kernel/syscalls/fanotify/Makefile
-index 5d01b4825..0263a6e20 100644
---- a/testcases/kernel/syscalls/fanotify/Makefile
-+++ b/testcases/kernel/syscalls/fanotify/Makefile
-@@ -20,4 +20,10 @@ top_srcdir		?= ../../../..
- fanotify11: CFLAGS+=-pthread
- include $(top_srcdir)/include/mk/testcases.mk
- 
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS        := fanotify13 fanotify15
-+endif
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-+
-+
-diff --git a/testcases/kernel/syscalls/setxattr/Makefile b/testcases/kernel/syscalls/setxattr/Makefile
-index 72544c13e..7f20b2780 100644
---- a/testcases/kernel/syscalls/setxattr/Makefile
-+++ b/testcases/kernel/syscalls/setxattr/Makefile
-@@ -20,4 +20,8 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS        := setxattr03
-+endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases/kernel/syscalls/timer_create/Makefile
@@ -68,3 +40,6 @@ index 8de247075..eb240f432 100644
  CPPFLAGS		+= -D_GNU_SOURCE -I$(abs_srcdir)/../include
  
  LDLIBS			+= -lpthread -lrt
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
index 1705abcf19..0598046b28 100644
--- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
@@ -1,7 +1,7 @@
-From 62c3481c73a2414d7a5f0a70808bfc9a06195bd9 Mon Sep 17 00:00:00 2001
+From be453d1be826b862d47e08663fd69eea9dd62730 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 18:19:03 +0000
-Subject: [PATCH] build: Add option to select libc implementation
+Subject: [PATCH 1/6] build: Add option to select libc implementation
 
 There are more than glibc for C library implementation available on
 linux now a days, uclibc cloaked like glibc but musl e.g. is very
@@ -11,18 +11,26 @@ Disable tests specifically not building _yet_ on musl based systems
 
 Upstream-Status: Pending
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+rt_tgsigqueueinfo fails with:
+rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
+rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
+   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
+      |                      ^~~~~~~~~
+      |                      __si_fields
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[ pvorel: rebase for 20200120: enable mallopt, profil, rpc016,
+rt_sigsuspend, sbrk_mutex, setdomainname, sethostname, sigsuspend,
+testpi-3, testpi-5, testpi-6, ustat; move rt_tgsigqueueinfo
+from 0006-rt_tgsigqueueinfo-disable-test-on-musl.patch ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
 ---
- Makefile                                    | 5 +++++
- testcases/kernel/Makefile                   | 5 ++++-
- testcases/kernel/sched/Makefile             | 4 +++-
- testcases/kernel/syscalls/Makefile          | 5 +++++
- testcases/network/nfsv4/acl/Makefile        | 4 ++++
- testcases/network/rpc/basic_tests/Makefile  | 5 +++++
- testcases/realtime/func/pi-tests/Makefile   | 4 ++++
- testcases/realtime/stress/pi-tests/Makefile | 5 +++++
- 8 files changed, 35 insertions(+), 2 deletions(-)
+ Makefile                           | 5 +++++
+ testcases/kernel/Makefile          | 5 ++++-
+ testcases/kernel/sched/Makefile    | 4 +++-
+ testcases/kernel/syscalls/Makefile | 4 ++++
+ 4 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
 index 768ca4606..e9d679a71 100644
@@ -76,73 +84,20 @@ index 6a57d79ee..74bb93370 100644
 +endif
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index 45a00cf7d..d1becd054 100644
+index 45a00cf7d..af5a591a0 100644
 --- a/testcases/kernel/syscalls/Makefile
 +++ b/testcases/kernel/syscalls/Makefile
-@@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
- FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
+@@ -29,6 +29,10 @@ FILTER_OUT_DIRS	+= capget capset chmod chown clone fork getcontext llseek \
  		   mincore mprotect nftw profil remap_file_pages sbrk
  endif
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS	+= confstr fmtmsg getcontext ioctl mallopt profil \
-+		   rt_sigsuspend setdomainname sethostname sigsuspend \
-+		   ustat
-+endif
- 
- ifeq ($(UCLIBC),1)
- FILTER_OUT_DIRS	+= profil
-diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
-index 8c55a6bbd..f7cda621d 100644
---- a/testcases/network/nfsv4/acl/Makefile
-+++ b/testcases/network/nfsv4/acl/Makefile
-@@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
- 
- LDLIBS			+= $(ACL_LIBS)
- 
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS	:= acl1
-+endif
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
-index 66e9d5675..ea8eb8a98 100644
---- a/testcases/network/rpc/basic_tests/Makefile
-+++ b/testcases/network/rpc/basic_tests/Makefile
-@@ -23,4 +23,9 @@
- top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
-+
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_DIRS += rpc01
-+endif
-+
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
-index 68616a711..748754bb4 100644
---- a/testcases/realtime/func/pi-tests/Makefile
-+++ b/testcases/realtime/func/pi-tests/Makefile
-@@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
- include $(abs_srcdir)/../../config.mk
  
- MAKE_TARGETS		:= testpi-0 testpi-1 testpi-2 testpi-4 testpi-5 testpi-6 testpi-7 sbrk_mutex
 +ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS	:= testpi-5 testpi-6 sbrk_mutex
++FILTER_OUT_DIRS	+= confstr fmtmsg getcontext ioctl rt_tgsigqueueinfo
 +endif
 +
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
-index 1881f7565..266e0b815 100644
---- a/testcases/realtime/stress/pi-tests/Makefile
-+++ b/testcases/realtime/stress/pi-tests/Makefile
-@@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/env_pre.mk
- include $(abs_srcdir)/../../config.mk
-+
-+ifeq ($(LIBC),musl)
-+FILTER_OUT_MAKE_TARGETS	:= testpi-3
-+endif
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
+ ifeq ($(UCLIBC),1)
+ FILTER_OUT_DIRS	+= profil
+ endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch b/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
deleted file mode 100644
index 1b433d3ad3..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fae8852a63d9fa6e56fb8b24eaf10560bd13757f Mon Sep 17 00:00:00 2001
-From: Yongxin Liu <yongxin.liu@windriver.com>
-Date: Tue, 12 Nov 2019 11:33:50 +0800
-Subject: [PATCH] mkswap01.sh: Add "udevadm trigger" before swap verification
-
-Fix: https://github.com/linux-test-project/ltp/issues/458
-
-Sometimes the swap device cannot show up in /dev/disk/by-uuid/
-or /dev/disk/by-lable/ due to the issue #458. When this issue
-happens, "blkid -c /dev/null" and "ls /dev/disk/by-uuid/" show
-different UUID of the device.
-
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1193414]
-
-Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
----
- testcases/commands/mkswap/mkswap01.sh | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/testcases/commands/mkswap/mkswap01.sh b/testcases/commands/mkswap/mkswap01.sh
-index 3a348c6e6..9437c4a4e 100755
---- a/testcases/commands/mkswap/mkswap01.sh
-+++ b/testcases/commands/mkswap/mkswap01.sh
-@@ -129,6 +129,8 @@ mkswap_test()
- 		return
- 	fi
- 
-+	udevadm trigger --name-match=$TST_DEVICE
-+
- 	if [ -n "$device" ]; then
- 		mkswap_verify "$mkswap_op" "$op_arg" "$device" "$size" "$dev_file"
- 		if [ $? -ne 0 ]; then
--- 
-2.14.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch b/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
deleted file mode 100644
index fe5e7314e0..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 59cb0dd9f8e65b2d398fcaf4d163cbc8e1d0ae45 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Tue, 31 Dec 2019 15:02:48 +0800
-Subject: [PATCH] nm01: Remove prefix zeros of the addresses output by nm
- before comparing
-
-The latest nm v2.33.1 outputs symbols addresses without prefix zeros
-for "nm -f posix", which causes the following error.
-nm01 5 TFAIL: Got wrong format with -f bsd
-
-Let's remove the prefix zeros before comparing.
-
-Upstream-Status: Backport [59cb0dd9f8e65b2d398fcaf4d163cbc8e1d0ae45]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Reviewed-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Tested-by: Petr Vorel <pvorel@suse.cz>
----
- testcases/commands/nm/nm01.sh | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/commands/nm/nm01.sh b/testcases/commands/nm/nm01.sh
-index 30c41bd..fd9d3d9 100755
---- a/testcases/commands/nm/nm01.sh
-+++ b/testcases/commands/nm/nm01.sh
-@@ -84,8 +84,11 @@ test5()
- 	EXPECT_PASS $NM -f bsd $TST_DATAROOT/f1 \> nm_bsd.out
- 	EXPECT_PASS $NM -f posix $TST_DATAROOT/f1 \> nm_posix.out
- 
--	ROD awk '{print $3 $2 $1}' nm_bsd.out \> nm1.out
--	ROD awk '{print $1 $2 $3}' nm_posix.out \> nm2.out
-+	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_bsd.out \> trimmed_nm_bsd.out
-+	ROD awk '{print gensub(/\y(0+)([0-9a-fA-F]+)\y/, "\\2", "g")}' nm_posix.out \> trimmed_nm_posix.out
-+
-+	ROD awk '{print $3 $2 $1}' trimmed_nm_bsd.out \> nm1.out
-+	ROD awk '{print $1 $2 $3}' trimmed_nm_posix.out \> nm2.out
- 
- 	if diff nm1.out nm2.out > /dev/null; then
- 		tst_res TPASS "Got BSD format with -f bsd"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
index c431669716..ecc6660f93 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch
@@ -1,28 +1,40 @@
-From b66905b094e08a84c30bc135003c3611f65d53ec Mon Sep 17 00:00:00 2001
+From 89c5841bd148a7ae70c65f4a1ca5996b7f0cddfa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Feb 2020 22:22:17 -0800
+Date: Wed, 19 Feb 2020 22:52:04 -0800
 Subject: [PATCH] syscalls: Check for time64 unsafe syscalls before using them
 
 musl is using 64bit time_t now on 32bit architectures and these syscalls
 no longer exist, therefore its better to check for them being available
 before using them
 
-Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1241258/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream-Status: accepted as 5b57ae2913e2d2d167cbd3822784b4c4ba336812
 ---
- lib/tst_clocks.c                                        | 9 +++++----
- testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 6 ++----
- testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 8 +++-----
- 3 files changed, 10 insertions(+), 13 deletions(-)
+ lib/tst_clocks.c                                 | 16 ++++++----------
+ .../syscalls/gettimeofday/gettimeofday01.c       |  6 ++----
+ .../syscalls/gettimeofday/gettimeofday02.c       |  8 +++-----
+ 3 files changed, 11 insertions(+), 19 deletions(-)
 
+diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
+index 5195da38f..fa2f1cb84 100644
 --- a/lib/tst_clocks.c
 +++ b/lib/tst_clocks.c
-@@ -22,21 +22,22 @@
- #define _GNU_SOURCE
- #include <unistd.h>
+@@ -3,28 +3,24 @@
+  * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+  */
+ 
+-/*
+- * clock_gettime() and clock_getres() functions
+- */
+-
+-#define _GNU_SOURCE
+-#include <unistd.h>
  #include <time.h>
 -#include <sys/syscall.h>
--
+ 
 +#define TST_NO_DEFAULT_MAIN
 +#include "tst_test.h"
  #include "tst_clocks.h"
@@ -45,6 +57,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -	return syscall(SYS_clock_settime, clk_id, ts);
 +	return tst_syscall(__NR_clock_settime, clk_id, ts);
  }
+diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
+index 583d8f7b9..08ea1673a 100644
 --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
 +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
 @@ -38,10 +38,8 @@
@@ -68,6 +82,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  		/* gettimeofday returns an int, so we need to turn the long
  		 * TEST_RETURN into an int to test with */
+diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
+index 1d60f448e..5170ad2f7 100644
 --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
 +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
 @@ -16,14 +16,12 @@
@@ -102,3 +118,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			tst_res(TBROK | TERRNO, "gettimeofday() failed");
  			return;
  		}
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
deleted file mode 100644
index 9330844509..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 476ce907fa18042cdde0a244ba9a46cd895ce76c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 12 Dec 2019 17:56:02 +0100
-Subject: [PATCH] testcases: fix an absent format string issue
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c     | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
-index 27dbc6626..19d943d06 100644
---- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
-+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
-@@ -59,7 +59,7 @@ static void verify_pidfd_send_signal(void)
- 
- 		/* Manipulate PID for next process */
- 		sprintf(pid_str, "%d", pid - 1);
--		SAFE_FILE_PRINTF(last_pid_file, pid_str);
-+		SAFE_FILE_PRINTF(last_pid_file, "%s", pid_str);
- 
- 		new_pid = SAFE_FORK();
- 		if (new_pid == 0) {
diff --git a/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch b/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
index eff9ed0741..412025017b 100644
--- a/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
@@ -1,21 +1,27 @@
-From 81e5bd5442337a4a648a0dbbff47eaac0d351287 Mon Sep 17 00:00:00 2001
+From 2f6f356a49e28eb597df063e31770632e69a93aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 18:22:38 +0000
+Date: Fri, 28 Feb 2020 14:55:26 +0100
 Subject: [PATCH] kernel/controllers: Link with libfts explicitly on musl
 
 musl does not implement fts like glibc and therefore it depends on
 external implementation for all fts APIs
 
-Upstream-Status: Pending
+Upstream-Status: not acceptible
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[ pvorel: rebased for 20200120
+IMHO this patch should not be needed as commits
+22f510de8 ("Fix static linking with musl-fts") and
+b24f3d32c ("cpuset: Detect missing fts.h") should handle it
+but CI still report failures ]
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 ---
  testcases/kernel/controllers/Makefile.inc        | 3 +++
  testcases/kernel/controllers/cpuset/Makefile.inc | 3 +++
  2 files changed, 6 insertions(+)
 
 diff --git a/testcases/kernel/controllers/Makefile.inc b/testcases/kernel/controllers/Makefile.inc
-index 4ca0b5a..1d85e4d 100644
+index 4ca0b5ac3..1d85e4d86 100644
 --- a/testcases/kernel/controllers/Makefile.inc
 +++ b/testcases/kernel/controllers/Makefile.inc
 @@ -36,6 +36,9 @@ MAKE_DEPS		:= $(LIB)
@@ -29,13 +35,13 @@ index 4ca0b5a..1d85e4d 100644
  INSTALL_TARGETS		?= *.sh
  
 diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
-index db6a843..86dd2a8 100644
+index c03dd77d7..6dd4ee619 100644
 --- a/testcases/kernel/controllers/cpuset/Makefile.inc
 +++ b/testcases/kernel/controllers/cpuset/Makefile.inc
 @@ -42,6 +42,9 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
  LDFLAGS			+= -L$(abs_builddir)/$(LIBCPUSET_DIR) -L$(abs_builddir)/$(LIBCONTROLLERS_DIR)
  
- LDLIBS			+= -lcpu_set -lcontrollers -lltp
+ LDLIBS			:= -lcpu_set -lcontrollers -lltp $(LDLIBS)
 +ifeq ($(LIBC),musl)
 +LDLIBS			+= -lfts
 +endif
@@ -43,5 +49,5 @@ index db6a843..86dd2a8 100644
  INSTALL_TARGETS		?= *.sh
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch b/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
deleted file mode 100644
index 804edfa1b4..0000000000
--- a/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 60054686e2c1a4bedf1d507af97ebbb7ff491e77 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 18 Jul 2019 15:23:15 +0800
-Subject: [PATCH] rt_tgsigqueueinfo: disable test on musl
-
-Fix build error with musl:
-rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
-rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
-   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
-      |                      ^~~~~~~~~
-      |                      __si_fields
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/kernel/syscalls/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index d1becd0..1f3ff34 100644
---- a/testcases/kernel/syscalls/Makefile
-+++ b/testcases/kernel/syscalls/Makefile
-@@ -31,7 +31,7 @@ endif
- ifeq ($(LIBC),musl)
- FILTER_OUT_DIRS	+= confstr fmtmsg getcontext ioctl mallopt profil \
- 		   rt_sigsuspend setdomainname sethostname sigsuspend \
--		   ustat
-+		   ustat rt_tgsigqueueinfo
- endif
- 
- ifeq ($(UCLIBC),1)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
index b46325eaf3..350091a70c 100644
--- a/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
@@ -1,33 +1,34 @@
-From aa7a9185a037ad59012bd46713ac340458e95209 Mon Sep 17 00:00:00 2001
+From 4b7db094d6fc5659001ae8dc17078bb65d46b9c9 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Fri, 13 May 2016 11:11:28 -0500
-Subject: [PATCH] testcases/network/nfsv4/acl/acl1.c: Security fix on
- string printf
+Subject: [PATCH] acl: Security fix on string printf
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Fixes:
+Fixes build error when compiled with -Werror=format-security:
 
-acl1.c: In function 'test_acl_default':
-acl1.c:317:2: error: format not a string literal and no format arguments
-[-Werror=format-security]
-  printf(cmd);
+acl1.c: In function ‘test_acl_default’:
+acl1.c:305:2: error: format not a string literal and no format arguments [-Werror=format-security]
+  305 |  printf(cmd);
 
-[YOCTO #9548]
+Patch taken from openembedded-core,
+original bug report: https://bugzilla.yoctoproject.org/9548
 
-Upstream-Status: Pending
+[YOCTO #9548]
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream-Status: accepted in 4b7db094d6fc5659001ae8dc17078bb65d46b9c9
 ---
  testcases/network/nfsv4/acl/acl1.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
-index bdf0180..898b7ca 100644
+index aae9484e5..ad778cd33 100644
 --- a/testcases/network/nfsv4/acl/acl1.c
 +++ b/testcases/network/nfsv4/acl/acl1.c
-@@ -303,7 +303,7 @@ void test_acl_default(char *dir, acl_t acl)
+@@ -302,7 +302,7 @@ void test_acl_default(char *dir, acl_t acl)
  	char *cmd = malloc(256);
  
  	strcpy(cmd, "chmod 7777 ");
@@ -37,5 +38,5 @@ index bdf0180..898b7ca 100644
  	system(cmd);
  	acl2 = acl_get_file(path, ACL_TYPE_ACCESS);
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-extended/ltp/ltp_20190930.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
similarity index 90%
rename from meta/recipes-extended/ltp/ltp_20190930.bb
rename to meta/recipes-extended/ltp/ltp_20200120.bb
index 19bd7bc9c6..3cc10afa0c 100644
--- a/meta/recipes-extended/ltp/ltp_20190930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200120.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "\
     file://testcases/open_posix_testsuite/COPYING;md5=48b1c5ec633e3e30ec2cf884ae699947 \
     file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-    file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
 DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
+EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
 
 # since ltp contains x86-64 assembler which uses the frame-pointer register,
 # set -fomit-frame-pointer x86-64 to handle cases where optimisation
@@ -27,21 +27,16 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "c9707b465a08397569920b676345474f44327200"
+SRCREV = "4079aaf264d0e9ead042b59d1c5f4e643620d0d5"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
-           file://0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
            file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0004-guard-mallocopt-with-__GLIBC__.patch \
-           file://0006-rt_tgsigqueueinfo-disable-test-on-musl.patch \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
-           file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
-           file://0001-testcases-fix-an-absent-format-string-issue.patch \
            file://0001-Add-more-musl-exclusions.patch \
-           file://0001-nm01-Remove-prefix-zeros-of-the-addresses-output-by-.patch \
            file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch \
            "
 
-- 
2.25.1


