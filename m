Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id CA5217F23B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:30 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a2so298859pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=eQE8dryHjgSwzxWwDcg3KUQbc8EEHu2/UDl0pd3yARs=;
	b=MzORpuPWtYuDUd4MvUwdfOGW+wuf+VFNuH3BRcWFRlnveHE1vD+qKkuxjTeJwhiUT3
	Jm/oO2PgrThQNNn8+uViykwGqJ9FJzqe+9zzCLH0A7VYJCcQ+sEe80I1kCRP7Ny3LPFu
	qP/2ANb+bGZtlnrEW8piK4aZPPJq/VCqBnYJ2B6NvMMSh1LQzETZxCjdMfRkD68WBTAr
	uaBxjXw7PDfU5e4CM2h8feRWmL6+2dE6vZ4aHjGm6pvmRLRcfdIyrolAy0JXvM37rrvL
	CCDJL5dBcyZtgXN3v/1kl9LjLyZNMQi/Vbq+JQRhR5YbXGb7pC5xzx0mcmWszmgWCh7x
	v0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=eQE8dryHjgSwzxWwDcg3KUQbc8EEHu2/UDl0pd3yARs=;
	b=Y6Y9bHneKtV9w+V4F96le2a0NAesOEbo4kA6/28jgCN9qpkG7jQckR8U3kltT8UEAT
	d9aZcx0jilEH2kRqIxdAM0Q4NtUMUKK5TRsYeAjQB9l0A1h9qOQwAkFHVlJq3oln0xWv
	HReSlCDxJPATLclMfCnBSTDj52MZ8ET5kdNkMfK1G9JpsbihUeK0q7gB3pU3Ia1vZ9p3
	US5XoWPgbJl3h5xRbehEw+RxKA2mUTVHsy8k+FtoCnrsH0ZR4UmCdGfcz1Dj6s+yN9FG
	RK58Ni0TCSytb624d0t4T03MelTuFGeknUtRMGlBtk0u06vaTvxurhgBB0evaDfKwXU7
	SCeA==
X-Gm-Message-State: APjAAAWE5NCY6RllFj5L/AhOCKPcYHBd+DU8wUW9fma0jXWRJl0UgC9K
	F6JpUeywHvubZ9A1ZNl5uVfXeXVWPp4=
X-Google-Smtp-Source: APXvYqwSx6KaNnQ4yC4r1YsNlRCl6fdrMFgqM1xTpQc/V070o7FUnwcJuX+H78RyEI1M/enuURIqNw==
X-Received: by 2002:a62:1888:: with SMTP id 130mr842829pfy.72.1569294811663;
	Mon, 23 Sep 2019 20:13:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:04 -0700
Message-Id: <fac2d3846dadfda256e94500bdf33f546a8d1fb4.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 08/24] qemu: add a patch fixing the native build on newer kernels
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The build fails on qemu-native if we're using kernels after commit
0768e17073dc527ccd18ed5f96ce85f9985e9115. This adds an upstream
patch that fixes the issue.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Refactoried for thud context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...error-messages-when-qemi_cpu_kick_thread-.patch |  19 +-
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 336 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   1 +
 3 files changed, 346 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
index 8a9141a..03ec2c9 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
@@ -18,11 +18,11 @@ Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
  2 files changed, 29 insertions(+)
  create mode 100644 custom_debug.h
 
-diff --git a/cpus.c b/cpus.c
-index 38eba8bff3..b84a60a4f3 100644
---- a/cpus.c
-+++ b/cpus.c
-@@ -1690,6 +1690,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
+Index: qemu-3.0.0/cpus.c
+===================================================================
+--- qemu-3.0.0.orig/cpus.c
++++ qemu-3.0.0/cpus.c
+@@ -1693,6 +1693,8 @@ static void *qemu_tcg_cpu_thread_fn(void
      return NULL;
  }
  
@@ -31,7 +31,7 @@ index 38eba8bff3..b84a60a4f3 100644
  static void qemu_cpu_kick_thread(CPUState *cpu)
  {
  #ifndef _WIN32
-@@ -1702,6 +1704,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
+@@ -1705,6 +1707,9 @@ static void qemu_cpu_kick_thread(CPUStat
      err = pthread_kill(cpu->thread->thread, SIG_IPI);
      if (err) {
          fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
@@ -41,11 +41,10 @@ index 38eba8bff3..b84a60a4f3 100644
          exit(1);
      }
  #else /* _WIN32 */
-diff --git a/custom_debug.h b/custom_debug.h
-new file mode 100644
-index 0000000000..f029e45547
+Index: qemu-3.0.0/custom_debug.h
+===================================================================
 --- /dev/null
-+++ b/custom_debug.h
++++ qemu-3.0.0/custom_debug.h
 @@ -0,0 +1,24 @@
 +#include <execinfo.h>
 +#include <stdio.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
new file mode 100644
index 0000000..31a7c94
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
@@ -0,0 +1,336 @@
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
+Index: qemu-3.0.0/linux-user/ioctls.h
+===================================================================
+--- qemu-3.0.0.orig/linux-user/ioctls.h
++++ qemu-3.0.0/linux-user/ioctls.h
+@@ -173,8 +173,25 @@
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
+Index: qemu-3.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall.c
++++ qemu-3.0.0/linux-user/syscall.c
+@@ -37,6 +37,7 @@
+ #include <sched.h>
+ #include <sys/timex.h>
+ #include <sys/socket.h>
++#include <linux/sockios.h>
+ #include <sys/un.h>
+ #include <sys/uio.h>
+ #include <poll.h>
+@@ -1391,8 +1392,9 @@ static inline abi_long copy_from_user_ti
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
+@@ -1407,8 +1409,26 @@ static inline abi_long copy_to_user_time
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
+@@ -1418,6 +1438,48 @@ static inline abi_long copy_to_user_time
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
+@@ -5733,6 +5795,54 @@ static abi_long do_ioctl_kdsigaccept(con
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
+@@ -7106,32 +7216,6 @@ static inline abi_long target_ftruncate6
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
+Index: qemu-3.0.0/linux-user/syscall_defs.h
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall_defs.h
++++ qemu-3.0.0/linux-user/syscall_defs.h
+@@ -203,16 +203,34 @@ struct target_ip_mreq_source {
+     uint32_t imr_sourceaddr;
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
+@@ -738,8 +756,16 @@ struct target_pollfd {
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
+Index: qemu-3.0.0/linux-user/syscall_types.h
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall_types.h
++++ qemu-3.0.0/linux-user/syscall_types.h
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
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index b591cc24..f02e312 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-20815_p1.patch \
            file://CVE-2018-20815_p2.patch \
            file://CVE-2019-9824.patch \
+           file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


