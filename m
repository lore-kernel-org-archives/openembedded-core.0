Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 284537FBC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d139so2390848wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gHhWGijO6jKxvUrCYdy33AUsFmChw5mOHE3s9wrRLE=;
	b=cFzkjfUXpBYLG0rk/1WPgMvBSsp5BrzqRu8KM5fXt+RS1xH9CeKkvtmpW1Del/aUSH
	MsmeSEareFD9cgCow1Isd+FtFoLBEBRxOhLV+d2VEPZdBygx3AxOierGDunpJT20RPvd
	YDSi5/hR7JF9th+fsw6z0kHBnwNfdkcElDHxFOPZshnAltWHI6LG71Li93Z8Gs3rwC+P
	IBsJLUKbFhfu8xD40DVYUPOxEfqpoVAdq0RVhjEzY8Fcd2o8fywmxHuiDtMSj63curQ0
	XUWz1xv3MBVLlT6ylv0yIkPklsZe8xg6eg9k2G7PPISVBNjuHnXTnPNI+wov66lNhG1I
	BjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6gHhWGijO6jKxvUrCYdy33AUsFmChw5mOHE3s9wrRLE=;
	b=ncJ3rlfJmIMXrDt1CMW3BCJ27M7AEU6BhCHjfTuY50xdh9hdescWSSLEBbmoYnP8O4
	ZioaTjrMPqZp4mqYDdz7N34FzyWexxrL+0RgLmAZEF4gEbY52cGoUTEObTBdxbbPR4Q+
	Yx51udRXrt34sbfY03evZugZ7mY+nzksL7V+eRILAGYERK8ZxzdwPKW3Q3uIh171bNki
	YViRYm/jDy5qS/RH6Z5lHD85Lf15pEH1x5QLXRaFf0jakhXpfANdNbgrg2Hy/XHych1G
	udZCrVoauqcMGUhPh9oqhAEgT1aOKbND3ce+egWNEQ8tFF2OttfFi0fW1Lf+LQ17GTPz
	8g3A==
X-Gm-Message-State: APjAAAWAXueabV8c3xc5Wa/oY/ldAYvnDPZ9aJqtLzA4VNsVnGa8YkzU
	pM2D/161UNhORWTml3FG5Z6+5j8g
X-Google-Smtp-Source: APXvYqzb8ZHs4OBIThAfOKldHbuUyKPuNH5ZFZbWxf0OczQpPOLsjOwpVK0FS8nnpIUtb7WI06MX4A==
X-Received: by 2002:a05:600c:2215:: with SMTP id
	z21mr27991835wml.55.1579010419950; 
	Tue, 14 Jan 2020 06:00:19 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 14:59:55 +0100
Message-Id: <20200114140007.36622-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/20] ltp: update to 20190930
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:20 -0000

Drop a big pile of backports.

Add a patch to address absent string formatting error.

Additional fixing of builds with musl.

timers group has been merged upstream into syscalls.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py            |   2 +-
 ...me-check-for-getdents-getdents64-API.patch |  72 --------
 .../ltp/0001-Add-more-musl-exclusions.patch   |  70 ++++++++
 ...option-to-select-libc-implementation.patch |  27 ++-
 ...-17052-Avoid-unsafe-exits-in-threads.patch |  64 -------
 ...meltdown.c-Fix-kernel-symbol-finding.patch |  81 ---------
 ...y-update-for-mm-fix-false-positive-O.patch |  57 -------
 ...medwait01-Fix-wrong-sigset-length-fo.patch |  46 -----
 ...3-wait-for-defunct-tid-to-get-detach.patch |  75 --------
 ...es-fix-an-absent-format-string-issue.patch |  24 +++
 ...thon3-everywhere-to-run-python-scrip.patch | 161 ------------------
 ...x-EFAULT-in-32bit-compatibility-mode.patch |  36 ----
 ...k-for-RES_USE_INET6-during-configure.patch |  68 --------
 ...BC_PREREQ-is-defined-before-using-it.patch |  27 ++-
 ...se-hardcoded-index-0-for-SHM_STAT-te.patch |  82 ---------
 ...11-direct_io-diotest4-drop-MAP_FIXED.patch |  56 ------
 ...st-a-bit-of-code-to-compatiable-with.patch |  64 -------
 .../ltp/{ltp_20190517.bb => ltp_20190930.bb}  |  16 +-
 18 files changed, 123 insertions(+), 905 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
 rename meta/recipes-extended/ltp/{ltp_20190517.bb => ltp_20190930.bb} (84%)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 30548640bcd..b8b73004355 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
 
 class LtpTest(LtpTestBase):
 
-    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors","timers", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
+    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
 
     ltp_fs = ["fs", "fsx", "fs_bind", "fs_ext4"]
     # skip kernel cpuhotplug
diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch b/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
deleted file mode 100644
index bfceadb190d..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-Add-configure-time-check-for-getdents-getdents64-API.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 404dfeb4faef213b0450f173b60cd7080edec349 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 10:32:29 -0700
-Subject: [PATCH 1/2] Add configure time check for getdents/getdents64 APIs
-
-glibc 2.30 has added wrapper for getdents64 this will help in detecting
-right condition to use fallback
-
-Check for getdents API as well while here
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012954.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac                                  | 2 ++
- testcases/kernel/syscalls/getdents/getdents.h | 8 ++++++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -65,6 +65,8 @@ AC_CHECK_FUNCS([ \
-     fallocate \
-     fchownat \
-     fstatat \
-+    getdents \
-+    getdents64 \
-     kcmp \
-     mkdirat \
-     mknodat \
---- a/testcases/kernel/syscalls/getdents/getdents.h
-+++ b/testcases/kernel/syscalls/getdents/getdents.h
-@@ -23,7 +23,7 @@
- #include <stdint.h>
- #include "test.h"
- #include "lapi/syscalls.h"
--
-+#include "config.h"
- /*
-  * See fs/compat.c struct compat_linux_dirent
-  */
-@@ -34,12 +34,17 @@ struct linux_dirent {
- 	char            d_name[];
- };
- 
-+#if HAVE_GETDENTS
-+#include <unistd.h>
-+#else
- static inline int
- getdents(unsigned int fd, struct linux_dirent *dirp, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents, fd, dirp, size);
- }
- 
-+#endif /* HAVE_GETDENTS */
-+
- struct linux_dirent64 {
- 	uint64_t	d_ino;
- 	int64_t		d_off;
-@@ -48,10 +53,13 @@ struct linux_dirent64 {
- 	char		d_name[];
- };
- 
-+#if HAVE_GETDENTS64
-+#include <unistd.h>
-+#else
- static inline int
- getdents64(unsigned int fd, struct linux_dirent64 *dirp64, unsigned int size)
- {
- 	return ltp_syscall(__NR_getdents64, fd, dirp64, size);
- }
--
-+#endif /* HAVE_GETDENTS64 */
- #endif /* GETDENTS_H */
diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
new file mode 100644
index 00000000000..d3af31f34a2
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-more-musl-exclusions.patch
@@ -0,0 +1,70 @@
+From 788c47ceef7f115ab7f7aa17f918e58795f4e6c7 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 13:06:05 +0100
+Subject: [PATCH] Add more musl exclusions
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ testcases/kernel/syscalls/accept4/Makefile      | 4 ++++
+ testcases/kernel/syscalls/fanotify/Makefile     | 6 ++++++
+ testcases/kernel/syscalls/setxattr/Makefile     | 4 ++++
+ testcases/kernel/syscalls/timer_create/Makefile | 4 ++++
+ 4 files changed, 18 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/accept4/Makefile b/testcases/kernel/syscalls/accept4/Makefile
+index 504042e11..94db06266 100644
+--- a/testcases/kernel/syscalls/accept4/Makefile
++++ b/testcases/kernel/syscalls/accept4/Makefile
+@@ -20,4 +20,8 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := accept4_01
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/syscalls/fanotify/Makefile b/testcases/kernel/syscalls/fanotify/Makefile
+index 5d01b4825..0263a6e20 100644
+--- a/testcases/kernel/syscalls/fanotify/Makefile
++++ b/testcases/kernel/syscalls/fanotify/Makefile
+@@ -20,4 +20,10 @@ top_srcdir		?= ../../../..
+ fanotify11: CFLAGS+=-pthread
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := fanotify13 fanotify15
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
++
++
+diff --git a/testcases/kernel/syscalls/setxattr/Makefile b/testcases/kernel/syscalls/setxattr/Makefile
+index 72544c13e..7f20b2780 100644
+--- a/testcases/kernel/syscalls/setxattr/Makefile
++++ b/testcases/kernel/syscalls/setxattr/Makefile
+@@ -20,4 +20,8 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := setxattr03
++endif
++
+ include $(top_srcdir)/include/mk/generic_leaf_target.mk
+diff --git a/testcases/kernel/syscalls/timer_create/Makefile b/testcases/kernel/syscalls/timer_create/Makefile
+index 8de247075..eb240f432 100644
+--- a/testcases/kernel/syscalls/timer_create/Makefile
++++ b/testcases/kernel/syscalls/timer_create/Makefile
+@@ -20,6 +20,10 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/testcases.mk
+ 
++ifeq ($(LIBC),musl)
++FILTER_OUT_MAKE_TARGETS        := timer_create01 timer_create03
++endif
++
+ CPPFLAGS		+= -D_GNU_SOURCE -I$(abs_srcdir)/../include
+ 
+ LDLIBS			+= -lpthread -lrt
diff --git a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
index b5c25c56a57..1705abcf196 100644
--- a/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
@@ -1,4 +1,4 @@
-From ec282980e6eee96f5b74aba464141f86049263e6 Mon Sep 17 00:00:00 2001
+From 62c3481c73a2414d7a5f0a70808bfc9a06195bd9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 18:19:03 +0000
 Subject: [PATCH] build: Add option to select libc implementation
@@ -12,6 +12,7 @@ Disable tests specifically not building _yet_ on musl based systems
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile                                    | 5 +++++
  testcases/kernel/Makefile                   | 5 ++++-
@@ -24,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 35 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 768ca46..e9d679a 100644
+index 768ca4606..e9d679a71 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -41,6 +41,11 @@ vpath %.mk		$(top_srcdir)/mk:$(top_srcdir)/mk/include
@@ -40,18 +41,19 @@ index 768ca46..e9d679a 100644
  # COMMON_TARGETS:	Targets which exist in all, clean, and install.
  # INSTALL_TARGETS:	Targets which exist in clean and install (contains
 diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
-index 39d79c7..24a57d9 100644
+index 3319b3163..94ea362c8 100644
 --- a/testcases/kernel/Makefile
 +++ b/testcases/kernel/Makefile
-@@ -49,12 +49,15 @@ SUBDIRS			+= connectors \
+@@ -49,13 +49,16 @@ SUBDIRS			+= connectors \
  			   logging \
  			   mem \
  			   numa \
 -			   pty \
  			   sched \
  			   security \
- 			   timers \
+ 			   sound \
  			   tracing \
+ 			   uevents \
  
 +ifneq ($(LIBC),musl)
 +SUBDIRS			+= pty
@@ -61,7 +63,7 @@ index 39d79c7..24a57d9 100644
  SUBDIRS			+= power_management
  endif
 diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
-index 6a57d79..74bb933 100644
+index 6a57d79ee..74bb93370 100644
 --- a/testcases/kernel/sched/Makefile
 +++ b/testcases/kernel/sched/Makefile
 @@ -23,5 +23,7 @@
@@ -74,7 +76,7 @@ index 6a57d79..74bb933 100644
 +endif
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index 45a00cf..d1becd0 100644
+index 45a00cf7d..d1becd054 100644
 --- a/testcases/kernel/syscalls/Makefile
 +++ b/testcases/kernel/syscalls/Makefile
 @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
@@ -90,7 +92,7 @@ index 45a00cf..d1becd0 100644
  ifeq ($(UCLIBC),1)
  FILTER_OUT_DIRS	+= profil
 diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
-index 8c55a6b..f7cda62 100644
+index 8c55a6bbd..f7cda621d 100644
 --- a/testcases/network/nfsv4/acl/Makefile
 +++ b/testcases/network/nfsv4/acl/Makefile
 @@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
@@ -103,7 +105,7 @@ index 8c55a6b..f7cda62 100644
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
-index 66e9d56..ea8eb8a 100644
+index 66e9d5675..ea8eb8a98 100644
 --- a/testcases/network/rpc/basic_tests/Makefile
 +++ b/testcases/network/rpc/basic_tests/Makefile
 @@ -23,4 +23,9 @@
@@ -117,7 +119,7 @@ index 66e9d56..ea8eb8a 100644
 +
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
-index 68616a7..748754b 100644
+index 68616a711..748754bb4 100644
 --- a/testcases/realtime/func/pi-tests/Makefile
 +++ b/testcases/realtime/func/pi-tests/Makefile
 @@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
@@ -131,7 +133,7 @@ index 68616a7..748754b 100644
  
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
-index 1881f75..266e0b8 100644
+index 1881f7565..266e0b815 100644
 --- a/testcases/realtime/stress/pi-tests/Makefile
 +++ b/testcases/realtime/stress/pi-tests/Makefile
 @@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
@@ -144,6 +146,3 @@ index 1881f75..266e0b8 100644
 +endif
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch
deleted file mode 100644
index cc40081300c..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From e3a8502d0a4f8a44ddd02ca4b2efc097133fb9f7 Mon Sep 17 00:00:00 2001
-From: Mathias Fiedler <mathias.fiedler@aox-tech.de>
-Date: Fri, 23 Aug 2019 12:46:48 +0200
-Subject: [PATCH] cve-2017-17052: Avoid unsafe exits in threads
-
-According to manpage exit(3) calling exit is not thread-safe.
-And with glibc 2.28 (and probably also with glibc >=2.27) sometimes
-child processes created in fork_thread can get stuck on process exit in
-glibc's __run_exit_handlers trying to acquire some lock which was in
-locked state while the fork was created. This can happen when exit is
-called in mmap_thread concurrently to the fork.
-While the main process will still return with PASSED some of its
-children are left behind.
-
-Comparing the source code with the original program as described in the
-commit 2b7e8665b4ff51c034c55df3cff76518d1a9ee3a of linux kernel >=4.13
-the exits in mmap_thread and fork_thread should not be necessary to
-trigger the original bug.
-
-Therefore those exit calls are removed. The mmap_thread and fork_thread
-should still exit when their corresponding main thread in do_test_fork
-calls exit_group. The remaining exit in do_test_fork will be called in
-the main thread without any concurrent thread in the same process.
-
-Signed-off-by: Mathias Fiedler <mathias.fiedler@aox-tech.de>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/9f0b452c1af4bcb54da35711eb3fa77334a350b4]
-
-CVE: CVE-2017-17052
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/cve/cve-2017-17052.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/testcases/cve/cve-2017-17052.c b/testcases/cve/cve-2017-17052.c
-index d7da7e919..18cd2a6d7 100644
---- a/testcases/cve/cve-2017-17052.c
-+++ b/testcases/cve/cve-2017-17052.c
-@@ -58,8 +58,6 @@ static void *mmap_thread(void *arg)
- 	for (;;) {
- 		SAFE_MMAP(NULL, 0x1000000, PROT_READ,
- 				MAP_POPULATE|MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
--		if (*do_exit)
--			exit(0);
- 	}
- 
- 	return arg;
-@@ -67,9 +65,6 @@ static void *mmap_thread(void *arg)
- 
- static void *fork_thread(void *arg)
- {
--	if (*do_exit)
--		exit(0);
--
- 	usleep(rand() % 10000);
- 	SAFE_FORK();
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch b/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch
deleted file mode 100644
index 94f6f5a15a6..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From fbeda82f440a0098be42dd668cbc47212a86ab48 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Wed, 21 Aug 2019 16:27:24 +0800
-Subject: [PATCH] cve/meltdown.c: Fix kernel symbol finding
-
-meltdown case fails as below.
-safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272
-
-find_kernel_symbol is defined to try twice with each of /proc/kallsyms and
-/boot/System.map-%s. Currently if the symbol is not found in /proc/kallsyms,
-when kernel option CONFIG_KALLSYMS_ALL is disabled, it would stop the case
-immediately due to SAFE_FILE_LINES_SCANF.
-
-This patch turns to use FILE_LINES_SCANF to give find_kernel_symbol second
-chance.
-
-[jstancek] Fix also condition introduced in 7709d2ae92ea, even if
-           /proc/kallsyms is disabled, we still want to try System.map.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/c2049b5c874bc071f8185bffb5fd7dcb042d9ec8]
-
-Remove the hunk for upstream 7709d2ae92ea ("cve/meltdown.c: abort the test if kallsyms was not enabled")
-that has been covered by this patch.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/cve/meltdown.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
-index a53ea9b..22651a6 100644
---- a/testcases/cve/meltdown.c
-+++ b/testcases/cve/meltdown.c
-@@ -267,9 +267,15 @@ find_symbol_in_file(const char *filename, const char *symname)
- 	int ret, read;
- 	char fmt[strlen(symname) + 64];
- 
-+	tst_res(TINFO, "Looking for %s in %s", symname, filename);
-+	if (access(filename, F_OK) == -1) {
-+		tst_res(TINFO, "%s not available", filename);
-+		return 0;
-+	}
-+
- 	sprintf(fmt, "%%lx %%c %s%%c", symname);
- 
--	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
-+	ret = FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
- 	if (ret)
- 		return 0;
- 
-@@ -287,13 +293,11 @@ find_kernel_symbol(const char *name)
- 	if (addr)
- 		return addr;
- 
--	tst_res(TINFO, "not found '%s' in /proc/kallsyms", name);
- 	if (uname(&utsname) < 0)
- 		tst_brk(TBROK | TERRNO, "uname");
- 
- 	sprintf(systemmap, "/boot/System.map-%s", utsname.release);
- 
--	tst_res(TINFO, "looking in '%s'\n", systemmap);
- 	addr = find_symbol_in_file(systemmap, name);
- 	return addr;
- }
-@@ -308,6 +312,9 @@ static void setup(void)
- 	saved_cmdline_addr = find_kernel_symbol("saved_command_line");
- 	tst_res(TINFO, "&saved_command_line == 0x%lx", saved_cmdline_addr);
- 
-+	if (!saved_cmdline_addr)
-+		tst_brk(TCONF, "saved_command_line not found");
-+
- 	spec_fd = SAFE_OPEN("/proc/cmdline", O_RDONLY);
- 
- 	memset(target_array, 1, sizeof(target_array));
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
deleted file mode 100644
index bed84712a15..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d656a447893dccc310c975a239f482278550c3e0 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Tue, 21 May 2019 10:10:44 +0200
-Subject: [PATCH] overcommit_memory: update for "mm: fix false-positive
- OVERCOMMIT_GUESS failures"
-
-commit 8c7829b04c52 ("mm: fix false-positive OVERCOMMIT_GUESS failures")
-changes logic of __vm_enough_memory(), simplifying it to:
-    When in GUESS mode, catch wild allocations by comparing their request
-    size to total amount of ram and swap in the system.
-
-Testcase currently allocates mem_total + swap_total, which doesn't trigger
-new condition. Make it more extreme, but assuming free_total / 2 will PASS,
-and 2*sum_total will FAIL.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/d656a447893dccc310c975a239f482278550c3e0]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/mem/tunable/overcommit_memory.c | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
-index 555298f..345764d 100644
---- a/testcases/kernel/mem/tunable/overcommit_memory.c
-+++ b/testcases/kernel/mem/tunable/overcommit_memory.c
-@@ -36,11 +36,10 @@
-  *
-  * The program is designed to test the two tunables:
-  *
-- * When overcommit_memory = 0, allocatable memory can't overextends
-- * the amount of free memory. I choose the three cases:
-+ * When overcommit_memory = 0, allocatable memory can't overextend
-+ * the amount of total memory:
-  * a. less than free_total:    free_total / 2, alloc should pass.
-- * b. greater than free_total: free_total * 2, alloc should fail.
-- * c. equal to sum_total:      sum_tatal,      alloc should fail
-+ * b. greater than sum_total:   sum_total * 2, alloc should fail.
-  *
-  * When overcommit_memory = 1, it can alloc enough much memory, I
-  * choose the three cases:
-@@ -164,9 +163,7 @@ static void overcommit_memory_test(void)
- 
- 	update_mem();
- 	alloc_and_check(free_total / 2, EXPECT_PASS);
--	update_mem();
--	alloc_and_check(free_total * 2, EXPECT_FAIL);
--	alloc_and_check(sum_total, EXPECT_FAIL);
-+	alloc_and_check(sum_total * 2, EXPECT_FAIL);
- 
- 	/* start to test overcommit_memory=1 */
- 	set_sys_tune("overcommit_memory", 1, 1);
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch b/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch
deleted file mode 100644
index 0e56c08255e..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a5046625eaeed2d3fba456c3ba84c6c141c2ad7c Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Thu, 29 Aug 2019 21:09:46 +0800
-Subject: [PATCH] syscall/rt_sigtimedwait01: Fix wrong sigset length for MIPS
-
-rt_sigtimedwait01 fails as follow on MIPS arches
-rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
-(.../sigwaitinfo01.c: 148): Unexpected failure:
-TEST_ERRNO=EINVAL(22): Invalid argument
-
-As this case purposely bypasses glibc, it should align with the size of kernel
-definition of sigset_t which is different from other arches.
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15
-
-This patch turns to use _NSIG which is always right for all arches.
-
-Upstream-Status: Backport [a5046625eaeed2d3fba456c3ba84c6c141c2ad7c]
-
-Suggested-by: Jan Stancek <jstancek@redhat.com>
-Acked-by: Jan Stancek <jstancek@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
----
- testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-index 5a32ce1..6a30c27 100644
---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-@@ -128,9 +128,8 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
- static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
- 			      struct timespec *timeout)
- {
--
--	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64 and 8, resp. */
--	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
-+	/* _NSIG is always the right number of bits of signal map for all arches */
-+	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
- }
- #endif
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch
deleted file mode 100644
index 6ea26150fbf..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From e747d0456adc080a1d31fb653bda9dc491795c80 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Sun, 16 Jun 2019 11:14:16 +0200
-Subject: [PATCH] syscalls/tgkill03: wait for defunct tid to get detached
-
-Case where defunct tid is used has been observed to sporadically fail:
-  tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
-
-glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clear tid,
-and then resumes. Kernel clears it (glibc pd->tid) at:
-  do_exit
-    exit_mm
-      mm_release
-        put_user(0, tsk->clear_child_tid);
-
-but kernel tid is still valid, presumably until:
-  release_task
-    __exit_signal
-      __unhash_process
-        detach_pid
-
-To avoid race wait until /proc/<pid>/task/<tid> disappears.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Reviewed-by: Li Wang <liwang@redhat.com>
-Acked-by: Sumit Garg <sumit.garg@linaro.org>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/e747d0456adc080a1d31fb653bda9dc491795c80]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/kernel/syscalls/tgkill/tgkill03.c
-index f5bbdc5..593a217 100644
---- a/testcases/kernel/syscalls/tgkill/tgkill03.c
-+++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
-@@ -7,6 +7,7 @@
- 
- #include <pthread.h>
- #include <pwd.h>
-+#include <stdio.h>
- #include <sys/types.h>
- 
- #include "tst_safe_pthread.h"
-@@ -42,6 +43,7 @@ static void setup(void)
- {
- 	sigset_t sigusr1;
- 	pthread_t defunct_thread;
-+	char defunct_tid_path[PATH_MAX];
- 
- 	sigemptyset(&sigusr1);
- 	sigaddset(&sigusr1, SIGUSR1);
-@@ -55,8 +57,9 @@ static void setup(void)
- 	TST_CHECKPOINT_WAIT(0);
- 
- 	SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func, NULL);
--
- 	SAFE_PTHREAD_JOIN(defunct_thread, NULL);
-+	sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(), defunct_tid);
-+	TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1, 15);
- }
- 
- static void cleanup(void)
-@@ -108,4 +111,5 @@ static struct tst_test test = {
- 	.setup = setup,
- 	.cleanup = cleanup,
- 	.test = run,
-+	.timeout = 20,
- };
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
new file mode 100644
index 00000000000..93308445098
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-testcases-fix-an-absent-format-string-issue.patch
@@ -0,0 +1,24 @@
+From 476ce907fa18042cdde0a244ba9a46cd895ce76c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 12 Dec 2019 17:56:02 +0100
+Subject: [PATCH] testcases: fix an absent format string issue
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c     | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
+index 27dbc6626..19d943d06 100644
+--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
++++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
+@@ -59,7 +59,7 @@ static void verify_pidfd_send_signal(void)
+ 
+ 		/* Manipulate PID for next process */
+ 		sprintf(pid_str, "%d", pid - 1);
+-		SAFE_FILE_PRINTF(last_pid_file, pid_str);
++		SAFE_FILE_PRINTF(last_pid_file, "%s", pid_str);
+ 
+ 		new_pid = SAFE_FORK();
+ 		if (new_pid == 0) {
diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
deleted file mode 100644
index f4f87f38ab7..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-testcases-use-python3-everywhere-to-run-python-scrip.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 0463d793566772a606255957915f99d166d5740c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Aug 2019 18:30:23 +0200
-Subject: [PATCH] testcases: use python3 everywhere to run python scripts
-
-The scripts themselves have #!/usr/bin/python3 in them,
-so I trust they are already py3-compatible.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- testcases/kernel/power_management/runpwtests05.sh  |  2 +-
- .../power_management/runpwtests_exclusive01.sh     |  2 +-
- .../power_management/runpwtests_exclusive02.sh     |  2 +-
- .../power_management/runpwtests_exclusive03.sh     |  2 +-
- .../power_management/runpwtests_exclusive04.sh     |  2 +-
- .../power_management/runpwtests_exclusive05.sh     |  2 +-
- testcases/network/nfsv4/acl/runtest                | 14 +++++++-------
- testcases/realtime/func/pi-tests/run_auto.sh       |  6 +++---
- 8 files changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/testcases/kernel/power_management/runpwtests05.sh b/testcases/kernel/power_management/runpwtests05.sh
-index 8a7d0f6e0..43e234d01 100755
---- a/testcases/kernel/power_management/runpwtests05.sh
-+++ b/testcases/kernel/power_management/runpwtests05.sh
-@@ -35,7 +35,7 @@ else
- 	max_sched_smt=1
- fi
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- if ! grep sched_debug -qw /proc/cmdline ; then
- 	tst_brkm TCONF "Kernel cmdline parameter 'sched_debug' needed," \
-diff --git a/testcases/kernel/power_management/runpwtests_exclusive01.sh b/testcases/kernel/power_management/runpwtests_exclusive01.sh
-index ec78319e2..9fefcbf6e 100755
---- a/testcases/kernel/power_management/runpwtests_exclusive01.sh
-+++ b/testcases/kernel/power_management/runpwtests_exclusive01.sh
-@@ -35,7 +35,7 @@ else
- 	max_sched_smt=1
- fi
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- hyper_threaded=$(is_hyper_threaded)
- multi_socket=$(is_multi_socket)
-diff --git a/testcases/kernel/power_management/runpwtests_exclusive02.sh b/testcases/kernel/power_management/runpwtests_exclusive02.sh
-index e107fce35..2cd0ecb05 100755
---- a/testcases/kernel/power_management/runpwtests_exclusive02.sh
-+++ b/testcases/kernel/power_management/runpwtests_exclusive02.sh
-@@ -33,7 +33,7 @@ else
- 	max_sched_smt=1
- fi
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- hyper_threaded=$(is_hyper_threaded)
- multi_socket=$(is_multi_socket)
-diff --git a/testcases/kernel/power_management/runpwtests_exclusive03.sh b/testcases/kernel/power_management/runpwtests_exclusive03.sh
-index 490344bb3..ab3a5d11d 100755
---- a/testcases/kernel/power_management/runpwtests_exclusive03.sh
-+++ b/testcases/kernel/power_management/runpwtests_exclusive03.sh
-@@ -35,7 +35,7 @@ else
- 	max_sched_smt=1
- fi
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- hyper_threaded=$(is_hyper_threaded)
- multi_socket=$(is_multi_socket)
-diff --git a/testcases/kernel/power_management/runpwtests_exclusive04.sh b/testcases/kernel/power_management/runpwtests_exclusive04.sh
-index 978ca02ae..438ef603f 100755
---- a/testcases/kernel/power_management/runpwtests_exclusive04.sh
-+++ b/testcases/kernel/power_management/runpwtests_exclusive04.sh
-@@ -27,7 +27,7 @@ export TST_TOTAL=2
- # Checking test environment
- check_kervel_arch
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- hyper_threaded=$(is_hyper_threaded)
- multi_socket=$(is_multi_socket)
-diff --git a/testcases/kernel/power_management/runpwtests_exclusive05.sh b/testcases/kernel/power_management/runpwtests_exclusive05.sh
-index a0dad5834..3a9afdbf2 100755
---- a/testcases/kernel/power_management/runpwtests_exclusive05.sh
-+++ b/testcases/kernel/power_management/runpwtests_exclusive05.sh
-@@ -35,7 +35,7 @@ else
- 	max_sched_smt=1
- fi
- 
--tst_test_cmds python
-+tst_test_cmds python3
- 
- hyper_threaded=$(is_hyper_threaded)
- multi_socket=$(is_multi_socket)
-diff --git a/testcases/network/nfsv4/acl/runtest b/testcases/network/nfsv4/acl/runtest
-index d2e1b4c49..a859e85bc 100755
---- a/testcases/network/nfsv4/acl/runtest
-+++ b/testcases/network/nfsv4/acl/runtest
-@@ -22,7 +22,7 @@ do
- done
- 
- #  creation of users on the remote machine (removed only at the end of the tests)
--rsh -n $REMOTEHOST python $PWD/create_users.py -u 50 -g 50
-+rsh -n $REMOTEHOST python3 $PWD/create_users.py -u 50 -g 50
- 
- echo "Starting ACL testing"
- 
-@@ -51,19 +51,19 @@ echo "Basic tests finished"
- 
- echo "LONG ACL TEST"
- echo "creating necessary users and groups"
--python create_users.py -u 50 -g 50
-+python3 create_users.py -u 50 -g 50
- echo "creating necessary users and groups on the remote host"
- mkdir $NFSMNTDIR/lacl-testdir
--python test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
-+python3 test_long_acl.py -l $MAXLENGTH -p $NFSMNTDIR/lacl-testdir
- rm -rf $NFSMNTDIR/lacl-testdir
- echo "Long ACL test OK with $MAXLENGTH entries"
- echo "ACL STRESSING TEST"
--python setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
-+python3 setacl_stress.py -n 100 -u $USER_NB -g $GRP_NB -f $FILE_NB -p $NFSMNTDIR
- 
- # remove local an remote users
--python cleanusers.py
--python cleangroups.py
--rsh -n $REMOTEHOST python $PWD/cleanusers.py
-+python3 cleanusers.py
-+python3 cleangroups.py
-+rsh -n $REMOTEHOST python3 $PWD/cleanusers.py
- 
- echo "Test OK"
- 
-diff --git a/testcases/realtime/func/pi-tests/run_auto.sh b/testcases/realtime/func/pi-tests/run_auto.sh
-index d13026049..277988568 100755
---- a/testcases/realtime/func/pi-tests/run_auto.sh
-+++ b/testcases/realtime/func/pi-tests/run_auto.sh
-@@ -15,15 +15,15 @@ $SCRIPTS_DIR/run_c_files.sh $profile testpi-0
- 
- export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-1.log"
- $SCRIPTS_DIR/run_c_files.sh $profile testpi-1
--PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
-+PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
- 
- export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-2.log"
- $SCRIPTS_DIR/run_c_files.sh $profile testpi-2
--PYTHONPATH=../../  python parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
-+PYTHONPATH=../../  python3 parse-testpi2.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
- 
- export LOG_FILE="$LOG_DIR/$LOG_FORMAT-testpi-4.log"
- $SCRIPTS_DIR/run_c_files.sh $profile testpi-4
--PYTHONPATH=../../  python parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
-+PYTHONPATH=../../  python3 parse-testpi1.py $LOG_FILE 2>&1 | tee -a $LOG_FILE
- 
- 
- export LOG_FILE=""
diff --git a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch b/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch
deleted file mode 100644
index c936b788fe1..00000000000
--- a/meta/recipes-extended/ltp/ltp/0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 156776a3e29491b363fdc9811912e1298655d060 Mon Sep 17 00:00:00 2001
-From: Steven Price <steven.price@arm.com>
-Date: Fri, 19 Jul 2019 13:48:17 +0100
-Subject: [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
-
-The size of dev_t is larger than 32 bits which causes the dev argument
-to be passed incorrectly. On Arm this means that the EFAULT test case
-actually returns EINVAL because the device number isn't recognised.
-
-Signed-off-by: Steven Price <steven.price@arm.com>
-Acked-by: Li Wang <liwang@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/156776a3e29491b363fdc9811912e1298655d060]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
-index 9bbe4f3..1a0e9e0 100644
---- a/testcases/kernel/syscalls/ustat/ustat02.c
-+++ b/testcases/kernel/syscalls/ustat/ustat02.c
-@@ -36,7 +36,7 @@ int TST_TOTAL = ARRAY_SIZE(tc);
- 
- void run(unsigned int test)
- {
--	TEST(tst_syscall(__NR_ustat, *tc[test].dev, tc[test].buf));
-+	TEST(tst_syscall(__NR_ustat, (unsigned int)*tc[test].dev, tc[test].buf));
- 
- 	if ((TST_RET == -1) && (TST_ERR == tc[test].exp_errno))
- 		tst_res(TPASS | TTERRNO, "ustat(2) expected failure");
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch b/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
deleted file mode 100644
index 12e47eb2b61..00000000000
--- a/meta/recipes-extended/ltp/ltp/0002-check-for-RES_USE_INET6-during-configure.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 7bc134545b7beb09717a60541530c20a1a5740d3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 26 Jul 2019 10:55:28 -0700
-Subject: [PATCH 2/2] check for RES_USE_INET6 during configure
-
-glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
-since 2.26 release, this check ensures that we detect it before using it
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-July/012955.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac                                        | 13 +++++++++++++
- testcases/network/multicast/mc_gethost/mc_gethost.c |  6 ++++++
- 2 files changed, 19 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 2255b5c181..ed7acccb01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -91,6 +91,19 @@ AC_CHECK_FUNCS([ \
-     vmsplice \
- ])
- 
-+#check defines
-+AC_MSG_CHECKING([for RES_USE_INET6])
-+AC_COMPILE_IFELSE( [AC_LANG_PROGRAM([[#include <resolv.h>]],
-+  [[char dummy[RES_USE_INET6];]])],
-+  [
-+    AC_MSG_RESULT([yes])
-+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 1, [Define to 1 if you have the RES_USE_INET6 macro.])
-+  ],
-+  [
-+    AC_MSG_RESULT([no])
-+    AC_DEFINE_UNQUOTED([HAVE_RES_USE_INET6], 0, [Define to 1 if you have the RES_USE_INET6 macro.])
-+  ]
-+)
- # Tools knobs
- 
- # Expect
-diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
-index 9cc15d086b..d1cae5441a 100644
---- a/testcases/network/multicast/mc_gethost/mc_gethost.c
-+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
-@@ -17,6 +17,8 @@
- #include <string.h>
- #include <stdlib.h>
- 
-+#include "config.h"
-+
- #ifndef LOG_PERROR
- #define LOG_PERROR 0
- #endif
-@@ -50,8 +52,12 @@ usage:
- 		argv++, argc--;
- 	}
- 	if (argc >= 1 && !strcmp(*argv, "-6")) {
-+#if HAVE_RES_USE_INET6
- 		af = AF_INET6, size = IN6ADDRSZ;
- 		_res.options |= RES_USE_INET6;
-+#else
-+		af = AF_INET, size = INADDRSZ;
-+#endif
- 		argv++, argc--;
- 	}
- 	if (argc >= 1 && !strcmp(*argv, "-f")) {
--- 
-2.22.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index c0f69ecf5fc..df3e8831f54 100644
--- a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -1,4 +1,4 @@
-From 29ce9fdab3bd34e69d73b5b890795559c06553f7 Mon Sep 17 00:00:00 2001
+From 1ce47a6ed811fd78ed04ea2f82e6321c6bca57b6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 19:40:08 +0000
 Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
@@ -10,16 +10,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
 diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
-index dd289cf..76aa969 100644
+index 29e18f27d..07444a46f 100644
 --- a/testcases/kernel/syscalls/accept4/accept4_01.c
 +++ b/testcases/kernel/syscalls/accept4/accept4_01.c
 @@ -38,6 +38,7 @@
- static struct sockaddr_in conn_addr;
+ static struct sockaddr_in *conn_addr, *accept_addr;
  static int listening_fd;
  
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
@@ -34,25 +35,21 @@ index dd289cf..76aa969 100644
  
  static int create_listening_socket(void)
  {
-@@ -115,6 +117,7 @@ static void verify_accept4(unsigned int nr)
- 	SAFE_CONNECT(connfd, (struct sockaddr *)&conn_addr, sizeof(conn_addr));
- 	addrlen = sizeof(claddr);
+@@ -114,12 +116,17 @@ static void verify_accept4(unsigned int nr)
+ 	SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr, sizeof(*conn_addr));
+ 	addrlen = sizeof(*accept_addr);
  
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if !(__GLIBC_PREREQ(2, 10))
- 	TEST(accept4_01(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+ 	TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
  				tcase->cloexec | tcase->nonblock));
-@@ -122,6 +125,10 @@ static void verify_accept4(unsigned int nr)
- 	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+ #else
+ 	TEST(accept4(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
  				tcase->cloexec | tcase->nonblock));
- #endif
++#endif
 +#else
 +	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
 +				tcase->cloexec | tcase->nonblock));
-+#endif
+ #endif
  	if (TST_RET == -1) {
  		if (TST_ERR == ENOSYS)
- 			tst_brk(TCONF, "syscall __NR_accept4 not supported");
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch b/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
deleted file mode 100644
index 8704e5ffe8a..00000000000
--- a/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 794933b38354a2612cf2c471f11798b306f35315 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Mon, 20 May 2019 20:47:20 +0200
-Subject: [PATCH] shmctl01: don't use hardcoded index == 0 for SHM_STAT test
-
-Test fails on SHM_STAT testcase:
-   shmctl01    5  TFAIL  :  shmctl01.c:173: shmctl01 call failed
-                            errno = 22 : Invalid argument
-   shmctl(0, SHM_STAT, 0x601060)           = -EINVAL
-
-since following commit:
-   commit 99db46ea292780cd978d56932d9445b1e8bdafe8
-   Author: Manfred Spraul <manfred@colorfullife.com>
-   Date:   Tue May 14 15:46:36 2019 -0700
-     ipc: do cyclic id allocation for the ipc object.
-
-Don't rely on index 0 being always available, but instead
-use (maximum) index returned by SHM_INFO.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/db0a43d9388be2c347a8306751bbe6bec086d062]
-
-Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
-index 1b46977..52bf23a 100644
---- a/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
-+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl01.c
-@@ -79,6 +79,7 @@ static void func_info(int ret);
- 
- /* Check routine for SHM_STAT */
- static void func_sstat(int ret);
-+static void func_sstat_setup(void);
- 
- /* Check routine for SHM_LOCK */
- static void func_lock(int ret);
-@@ -110,7 +111,7 @@ static struct test_case_t {
- #endif
- 	{&shm_id_1, IPC_SET, &buf, func_set, set_setup},
- 	{&shm_id_1, IPC_INFO, (struct shmid_ds *) &info, func_info, NULL},
--	{&shm_index, SHM_STAT, &buf, func_sstat, NULL},
-+	{&shm_index, SHM_STAT, &buf, func_sstat, func_sstat_setup},
- 	{&shm_id_1, SHM_LOCK, NULL, func_lock, NULL},
- 	{&shm_id_1, SHM_UNLOCK, NULL, func_unlock, NULL},
- 	{&shm_id_1, IPC_RMID, NULL, func_rmid, NULL},
-@@ -407,9 +408,23 @@ static void func_info(int ret)
- static void func_sstat(int ret)
- {
- 	if (ret >= 0)
--		tst_resm(TPASS, "get correct shared memory id");
-+		tst_resm(TPASS, "get correct shared memory id for index: %d",
-+			shm_index);
- 	else
--		tst_resm(TFAIL, "shared memory id is incorrect");
-+		tst_resm(TFAIL, "shared memory id is incorrect, index: %d",
-+			shm_index);
-+}
-+
-+static void func_sstat_setup(void)
-+{
-+	struct shm_info tmp;
-+	int ret;
-+
-+	ret = shmctl(shm_id_1, SHM_INFO, (void *)&tmp);
-+	if (ret < 0)
-+		tst_resm(TFAIL|TERRNO, "shmctl(SHM_INFO)");
-+	else
-+		shm_index = ret;
- }
- 
- static void func_lock(int ret)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch b/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
deleted file mode 100644
index 9cd188f6567..00000000000
--- a/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f210d7e19b721041f31b7f258a169f89dc850303 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Thu, 4 Jul 2019 16:45:23 +0200
-Subject: [PATCH] direct_io/diotest4: drop MAP_FIXED
-
-Hongzhi reports that this test is failing on mips64 with 5.1+:
-  diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
-  diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
-I could reproduce it on emulated 5kc-malta, running 5.2.0-rc7.
-
-Test is trying to map into area immediately following heap as MAP_SHARED,
-but it used wrong alignment (fixed by 'lapi/mmap.h: include config.h').
-
-Usage of MAP_FIXED seems unnecessary, so drop that too and let the kernel
-pick an address.
-
-Reported-by: Hongzhi.Song <hongzhi.song@windriver.com>
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/f5444eeeabf252b8884b9465d277b6af853819e3]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/kernel/io/direct_io/diotest4.c | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
-index e4616e4..bf200cd 100644
---- a/testcases/kernel/io/direct_io/diotest4.c
-+++ b/testcases/kernel/io/direct_io/diotest4.c
-@@ -352,18 +352,14 @@ int main(int argc, char *argv[])
- 	total++;
- 
- 	/* Test-10: read, write to a mmaped file */
--	shm_base = (char *)(((long)sbrk(0) + (shmsz - 1)) & ~(shmsz - 1));
--	if (shm_base == NULL) {
--		tst_brkm(TBROK, cleanup, "sbrk failed: %s", strerror(errno));
--	}
- 	offset = 4096;
- 	count = bufsize;
- 	if ((fd = open(filename, O_DIRECT | O_RDWR)) < 0) {
- 		tst_brkm(TBROK, cleanup, "can't open %s: %s",
- 			 filename, strerror(errno));
- 	}
--	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
--			MAP_SHARED | MAP_FIXED, fd, 0);
-+	shm_base = mmap(0, 0x100000, PROT_READ | PROT_WRITE,
-+			MAP_SHARED, fd, 0);
- 	if (shm_base == (caddr_t) - 1) {
- 		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
- 			 strerror(errno));
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch b/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
deleted file mode 100644
index aecbc80e9b5..00000000000
--- a/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 4ac747c1f7ff8e2ec2567d6672822e95a9b56e55 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Mon, 15 Jul 2019 03:39:06 -0400
-Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
-
-Error info:
-getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
-ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
-
-According to kernel code: [arch/mips/include/uapi/asm/resource.h]
-RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
-
- /*
- * SuS says limits have to be unsigned.
- * Which makes a ton more sense anyway,
- * but we keep the old value on MIPS32,
- * for compatibility:
- */
- #ifndef __mips64
- # define RLIM_INFINITY      0x7fffffffUL
- #endif
-
-Adding conditional statement about mips to fix this.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/7a3bca63cd7f059d490b6274f0fdf3247be93fde]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
-index e4d56c4..319bc49 100644
---- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
-+++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
-@@ -26,6 +26,7 @@
- 
- #include "tst_test.h"
- #include "lapi/syscalls.h"
-+#include "lapi/abisize.h"
- 
- /**
-  * Linux provides an "old" getrlimit syscall handler that uses signed long,
-@@ -61,7 +62,12 @@ struct rlimit_ulong {
- 	unsigned long rlim_cur;
- 	unsigned long rlim_max;
- };
--const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
-+
-+#if defined(__mips__) && defined(TST_ABI32)
-+	const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
-+#else
-+	const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
-+#endif
- 
- static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
- {
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190930.bb
similarity index 84%
rename from meta/recipes-extended/ltp/ltp_20190517.bb
rename to meta/recipes-extended/ltp/ltp_20190930.bb
index 60f749b4c01..e56bb575d29 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190930.bb
@@ -27,7 +27,7 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "ac33ef87f0b9dc56533026435be3ea8c67ce86d2"
+SRCREV = "c9707b465a08397569920b676345474f44327200"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-build-Add-option-to-select-libc-implementation.patch \
@@ -38,19 +38,9 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0007-Fix-test_proc_kill-hanging.patch \
            file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
-           file://0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
-           file://0011-direct_io-diotest4-drop-MAP_FIXED.patch \
-           file://0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
-           file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
-           file://0002-check-for-RES_USE_INET6-during-configure.patch \
-           file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
-           file://0001-ustat02-Fix-EFAULT-in-32bit-compatibility-mode.patch \
-           file://0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch \
-           file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
-           file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
-           file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
-           file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch \
            file://0001-mkswap01.sh-Add-udevadm-trigger-before-swap-verifica.patch \
+           file://0001-testcases-fix-an-absent-format-string-issue.patch \
+           file://0001-Add-more-musl-exclusions.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


