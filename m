Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 040F67ED56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:52 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id z12so349874pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=jp7DYYPmrDjW1ABb4EqzjTDdzeLU2Gq8g6aA5jp+d+M=;
	b=DCpLoXEUQBXiEXXL+4S6wUr+sXI1pQC7V3PBNyhd9b2KCWp5k9hP/z+zf8kTczdmPy
	NR7Tdpk/qvwEZ9ad0otS3KrJDZThN4+ht7x4CFQtU5jt/b6SHNC+BZbV2ATq/ZF7Hgaz
	OhLXjIWQmipHuTkmvftcL8C3G4nuxjC7pZ4QfZkSaIjZWQs3M7HEGmrbtQDXqcn7ja2i
	EDZjevpdnFqg7M7PThlGg+2TynpxG4r3tfYdHeREHZaTWqOFRrj462BN1QJkQlSfZMEp
	g1fETJSbJJuW19C+CCssGRN3dekt/Q6D8wFShXCpkAyMsEfO6VBVYtRml9LY2GMIeNFh
	xLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=jp7DYYPmrDjW1ABb4EqzjTDdzeLU2Gq8g6aA5jp+d+M=;
	b=tGOrOgeJd1/F2JafANeDnAWrWjk91ybPsrG1MITTZ/ucrURApdzy4DsObpbKC/za/x
	4SEI0XsnSMJ47PUmuK7OY3q2dHBZy6qvTAZPy3NYkIfDHVmX3U2wjPJooT/xpKNrFSOQ
	UBmgnFM2iYiKJS0N9JVu7KMxVGgz2pxC6L3dKA7n/3cKtf06+ZLx0vhGueBMRcoic5OU
	Z4UnXqJpuHNF+p3gGzAvCaNbzI4/4lMzGqhOlpefftjR2Gj7CwgP7W115aZW75FP7EWs
	rpYvYu1gBIaPelYMoBQQ3UMD3R5vPF9nNS49Ey2gm0ExaH97an4X7d/lGnfzWLiGxknS
	2Qcg==
X-Gm-Message-State: APjAAAXGKYhyPWo8mVLgnQ1mtCgQ7ks/LofMgGFCwyu9rbaBGVKPVnAp
	ni+RQ1U6p7WEWGwPq+Slkbt9ppJrs14=
X-Google-Smtp-Source: APXvYqxiIgKILGhWlq+H3hirXLCRan1PXfg/tg+E8GQbb3O7Rpr0HHHyOu+BFIY+B8UEcjKeeE2bDQ==
X-Received: by 2002:a63:dd05:: with SMTP id t5mr805591pgg.16.1569293393837;
	Mon, 23 Sep 2019 19:49:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:00 -0700
Message-Id: <3f4e42f31292659945f07f7312d8fd62864297fa.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 20/50] qemu: add a patch fixing the native build on newer kernels
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The build fails on qemu-native if we're using kernels after commit
0768e17073dc527ccd18ed5f96ce85f9985e9115. This adds an upstream
patch that fixes the issue.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 339 +++++++++++++++++++++
 2 files changed, 340 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e503aa8..ecf13dc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0018-fix-CVE-2018-20191.patch \
            file://0019-fix-CVE-2018-20216.patch \
            file://CVE-2019-3812.patch \
+           file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
new file mode 100644
index 0000000..f7939b8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
@@ -0,0 +1,339 @@
+From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00 2001
+From: Daniel P. Berrangé <berrange@redhat.com>
+Date: Tue, 23 Jul 2019 17:50:00 +0200
+Subject: [PATCH] linux-user: fix to handle variably sized SIOCGSTAMP with new
+ kernels
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The SIOCGSTAMP symbol was previously defined in the
+asm-generic/sockios.h header file. QEMU sees that header
+indirectly via sys/socket.h
+
+In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
+the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
+Instead it provides only SIOCGSTAMP_OLD, which only uses a
+32-bit time_t on 32-bit architectures.
+
+The linux/sockios.h header then defines SIOCGSTAMP using
+either SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. If
+SIOCGSTAMP_NEW is used, then the tv_sec field is 64-bit even
+on 32-bit architectures
+
+To cope with this we must now convert the old and new type from
+the target to the host one.
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+Reviewed-by: Arnd Bergmann <arnd@arndb.de>
+Message-Id: <20190718130641.15294-1-laurent@vivier.eu>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+Uptream-status: Backport (upstream commit: 6d5d5dde9adb5acb32e6b8e3dfbf47fff0f308d2)
+
+ linux-user/ioctls.h        |  21 +++++-
+ linux-user/syscall.c       | 140 +++++++++++++++++++++++++++++--------
+ linux-user/syscall_defs.h  |  30 +++++++-
+ linux-user/syscall_types.h |   6 --
+ 4 files changed, 159 insertions(+), 38 deletions(-)
+
+diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
+index ae8951625f..e6a27ad9d6 100644
+--- a/linux-user/ioctls.h
++++ b/linux-user/ioctls.h
+@@ -219,8 +219,25 @@
+   IOCTL(SIOCGRARP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_arpreq)))
+   IOCTL(SIOCGIWNAME, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_char_ifreq)))
+   IOCTL(SIOCGPGRP, IOC_R, MK_PTR(TYPE_INT)) /* pid_t */
+-  IOCTL(SIOCGSTAMP, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timeval)))
+-  IOCTL(SIOCGSTAMPNS, IOC_R, MK_PTR(MK_STRUCT(STRUCT_timespec)))
++
++  /*
++   * We can't use IOCTL_SPECIAL() because it will set
++   * host_cmd to XXX_OLD and XXX_NEW and these macros
++   * are not defined with kernel prior to 5.2.
++   * We must set host_cmd to the same value as in target_cmd
++   * otherwise the consistency check in syscall_init()
++   * will trigger an error.
++   * host_cmd is ignored by the do_ioctl_XXX() helpers.
++   * FIXME: create a macro to define this kind of entry
++   */
++  { TARGET_SIOCGSTAMP_OLD, TARGET_SIOCGSTAMP_OLD,
++    "SIOCGSTAMP_OLD", IOC_R, do_ioctl_SIOCGSTAMP },
++  { TARGET_SIOCGSTAMPNS_OLD, TARGET_SIOCGSTAMPNS_OLD,
++    "SIOCGSTAMPNS_OLD", IOC_R, do_ioctl_SIOCGSTAMPNS },
++  { TARGET_SIOCGSTAMP_NEW, TARGET_SIOCGSTAMP_NEW,
++    "SIOCGSTAMP_NEW", IOC_R, do_ioctl_SIOCGSTAMP },
++  { TARGET_SIOCGSTAMPNS_NEW, TARGET_SIOCGSTAMPNS_NEW,
++    "SIOCGSTAMPNS_NEW", IOC_R, do_ioctl_SIOCGSTAMPNS },
+ 
+   IOCTL(RNDGETENTCNT, IOC_R, MK_PTR(TYPE_INT))
+   IOCTL(RNDADDTOENTCNT, IOC_W, MK_PTR(TYPE_INT))
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 96cd4bf86d..6df480e13d 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -37,6 +37,7 @@
+ #include <sched.h>
+ #include <sys/timex.h>
+ #include <sys/socket.h>
++#include <linux/sockios.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+ #include <poll.h>
+@@ -1139,8 +1140,9 @@ static inline abi_long copy_from_user_timeval(struct timeval *tv,
+ {
+     struct target_timeval *target_tv;
+ 
+-    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1))
++    if (!lock_user_struct(VERIFY_READ, target_tv, target_tv_addr, 1)) {
+         return -TARGET_EFAULT;
++    }
+ 
+     __get_user(tv->tv_sec, &target_tv->tv_sec);
+     __get_user(tv->tv_usec, &target_tv->tv_usec);
+@@ -1155,8 +1157,26 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
+ {
+     struct target_timeval *target_tv;
+ 
+-    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0))
++    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++
++    __put_user(tv->tv_sec, &target_tv->tv_sec);
++    __put_user(tv->tv_usec, &target_tv->tv_usec);
++
++    unlock_user_struct(target_tv, target_tv_addr, 1);
++
++    return 0;
++}
++
++static inline abi_long copy_to_user_timeval64(abi_ulong target_tv_addr,
++                                             const struct timeval *tv)
++{
++    struct target__kernel_sock_timeval *target_tv;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_tv, target_tv_addr, 0)) {
+         return -TARGET_EFAULT;
++    }
+ 
+     __put_user(tv->tv_sec, &target_tv->tv_sec);
+     __put_user(tv->tv_usec, &target_tv->tv_usec);
+@@ -1166,6 +1186,48 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
+     return 0;
+ }
+ 
++static inline abi_long target_to_host_timespec(struct timespec *host_ts,
++                                               abi_ulong target_addr)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1)) {
++        return -TARGET_EFAULT;
++    }
++    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 0);
++    return 0;
++}
++
++static inline abi_long host_to_target_timespec(abi_ulong target_addr,
++                                               struct timespec *host_ts)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 1);
++    return 0;
++}
++
++static inline abi_long host_to_target_timespec64(abi_ulong target_addr,
++                                                 struct timespec *host_ts)
++{
++    struct target__kernel_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0)) {
++        return -TARGET_EFAULT;
++    }
++    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
++    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
++    unlock_user_struct(target_ts, target_addr, 1);
++    return 0;
++}
++
+ static inline abi_long copy_from_user_timezone(struct timezone *tz,
+                                                abi_ulong target_tz_addr)
+ {
+@@ -4790,6 +4852,54 @@ static abi_long do_ioctl_kdsigaccept(const IOCTLEntry *ie, uint8_t *buf_temp,
+     return get_errno(safe_ioctl(fd, ie->host_cmd, sig));
+ }
+ 
++static abi_long do_ioctl_SIOCGSTAMP(const IOCTLEntry *ie, uint8_t *buf_temp,
++                                    int fd, int cmd, abi_long arg)
++{
++    struct timeval tv;
++    abi_long ret;
++
++    ret = get_errno(safe_ioctl(fd, SIOCGSTAMP, &tv));
++    if (is_error(ret)) {
++        return ret;
++    }
++
++    if (cmd == (int)TARGET_SIOCGSTAMP_OLD) {
++        if (copy_to_user_timeval(arg, &tv)) {
++            return -TARGET_EFAULT;
++        }
++    } else {
++        if (copy_to_user_timeval64(arg, &tv)) {
++            return -TARGET_EFAULT;
++        }
++    }
++
++    return ret;
++}
++
++static abi_long do_ioctl_SIOCGSTAMPNS(const IOCTLEntry *ie, uint8_t *buf_temp,
++                                      int fd, int cmd, abi_long arg)
++{
++    struct timespec ts;
++    abi_long ret;
++
++    ret = get_errno(safe_ioctl(fd, SIOCGSTAMPNS, &ts));
++    if (is_error(ret)) {
++        return ret;
++    }
++
++    if (cmd == (int)TARGET_SIOCGSTAMPNS_OLD) {
++        if (host_to_target_timespec(arg, &ts)) {
++            return -TARGET_EFAULT;
++        }
++    } else{
++        if (host_to_target_timespec64(arg, &ts)) {
++            return -TARGET_EFAULT;
++        }
++    }
++
++    return ret;
++}
++
+ #ifdef TIOCGPTPEER
+ static abi_long do_ioctl_tiocgptpeer(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                      int fd, int cmd, abi_long arg)
+@@ -6160,32 +6270,6 @@ static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
+ }
+ #endif
+ 
+-static inline abi_long target_to_host_timespec(struct timespec *host_ts,
+-                                               abi_ulong target_addr)
+-{
+-    struct target_timespec *target_ts;
+-
+-    if (!lock_user_struct(VERIFY_READ, target_ts, target_addr, 1))
+-        return -TARGET_EFAULT;
+-    __get_user(host_ts->tv_sec, &target_ts->tv_sec);
+-    __get_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+-    unlock_user_struct(target_ts, target_addr, 0);
+-    return 0;
+-}
+-
+-static inline abi_long host_to_target_timespec(abi_ulong target_addr,
+-                                               struct timespec *host_ts)
+-{
+-    struct target_timespec *target_ts;
+-
+-    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_addr, 0))
+-        return -TARGET_EFAULT;
+-    __put_user(host_ts->tv_sec, &target_ts->tv_sec);
+-    __put_user(host_ts->tv_nsec, &target_ts->tv_nsec);
+-    unlock_user_struct(target_ts, target_addr, 1);
+-    return 0;
+-}
+-
+ static inline abi_long target_to_host_itimerspec(struct itimerspec *host_itspec,
+                                                  abi_ulong target_addr)
+ {
+diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
+index 12c8407144..c918419306 100644
+--- a/linux-user/syscall_defs.h
++++ b/linux-user/syscall_defs.h
+@@ -208,16 +208,34 @@ struct target_linger {
+     abi_int l_linger;       /* How long to linger for       */
+ };
+ 
++#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
++struct target_timeval {
++    abi_long tv_sec;
++    abi_int tv_usec;
++};
++#define target__kernel_sock_timeval target_timeval
++#else
+ struct target_timeval {
+     abi_long tv_sec;
+     abi_long tv_usec;
+ };
+ 
++struct target__kernel_sock_timeval {
++    abi_llong tv_sec;
++    abi_llong tv_usec;
++};
++#endif
++
+ struct target_timespec {
+     abi_long tv_sec;
+     abi_long tv_nsec;
+ };
+ 
++struct target__kernel_timespec {
++    abi_llong tv_sec;
++    abi_llong tv_nsec;
++};
++
+ struct target_timezone {
+     abi_int tz_minuteswest;
+     abi_int tz_dsttime;
+@@ -743,8 +761,16 @@ struct target_pollfd {
+ #define TARGET_SIOCATMARK      0x8905
+ #define TARGET_SIOCGPGRP       0x8904
+ #endif
+-#define TARGET_SIOCGSTAMP      0x8906          /* Get stamp (timeval) */
+-#define TARGET_SIOCGSTAMPNS    0x8907          /* Get stamp (timespec) */
++#if defined(TARGET_SH4)
++#define TARGET_SIOCGSTAMP_OLD   TARGET_IOR('s', 100, struct target_timeval)
++#define TARGET_SIOCGSTAMPNS_OLD TARGET_IOR('s', 101, struct target_timespec)
++#else
++#define TARGET_SIOCGSTAMP_OLD   0x8906
++#define TARGET_SIOCGSTAMPNS_OLD 0x8907
++#endif
++
++#define TARGET_SIOCGSTAMP_NEW   TARGET_IOR(0x89, 0x06, abi_llong[2])
++#define TARGET_SIOCGSTAMPNS_NEW TARGET_IOR(0x89, 0x07, abi_llong[2])
+ 
+ /* Networking ioctls */
+ #define TARGET_SIOCADDRT       0x890B          /* add routing table entry */
+diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
+index b98a23b0f1..4e36983826 100644
+--- a/linux-user/syscall_types.h
++++ b/linux-user/syscall_types.h
+@@ -14,12 +14,6 @@ STRUCT(serial_icounter_struct,
+ STRUCT(sockaddr,
+        TYPE_SHORT, MK_ARRAY(TYPE_CHAR, 14))
+ 
+-STRUCT(timeval,
+-       MK_ARRAY(TYPE_LONG, 2))
+-
+-STRUCT(timespec,
+-       MK_ARRAY(TYPE_LONG, 2))
+-
+ STRUCT(rtentry,
+        TYPE_ULONG, MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr), MK_STRUCT(STRUCT_sockaddr),
+        TYPE_SHORT, TYPE_SHORT, TYPE_ULONG, TYPE_PTRVOID, TYPE_SHORT, TYPE_PTRVOID,
+-- 
+2.21.0
+
-- 
2.7.4


