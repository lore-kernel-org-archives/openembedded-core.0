Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web09.11299.1615306213740675164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=lc33XRdW;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=695091433=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615306213; x=1646842213;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2tpO7+nJyv6udk/pTO/HrccWknc0OI6dyHtCTot/q7I=;
  b=lc33XRdWckXubQsTI/MAIYVHXUNX2C74jbKfzKn3Orlwyi8aquVcPT1N
   /p7iw9PvFw11pfbyU2m3TIKOuXYGMmKxRpnQk80nRLXN+P/zs9I5UVsY8
   mjKNkPLOrwDDmqkrokfpeHglK6nFvfNc/Qg9UcLQqA1+cgI08JFx6i2t8
   oYh7CAEkHI42MfRYBU90MPNa8KYaXPsGSEH/Po+2dsNBd/blxaFsH0aZA
   QL2QE5DdHvoqQCqgocgndvRSqXeCOpi4vjaU7Y5XpRPzDQID7qiwYXdpe
   +ARyk4V8OElVaqoKYQHPE/79cIlud55JiG8b8YQn3TxD+EsGfRlV4SuwO
   g==;
IronPort-SDR: n1VyiOOYlEWOzMiQkx00iklh9MX1M6TI2J8QH/pHZuxoXJzlFNleZN27gAvXzMH7MFaaUZng0Q
 wcQqlbEio09WsrCkZ7mncp8elxvo6Vgi41mZoZ1cmCt95pK+CMsPnE5sHI57dMIQLje+R6+x8J
 XXAFjue/DqbFmnIgU75e6bvXjyAHHvvf3GkyBcCtKkmCvPGNJfQRysmcat9jpHrleq3eQtkKsr
 N/PR7imrrqbEnsf7EHz016+LdyKrKLOyQwYeygjQtjxs/D8suIOWbCInXfjpFmkKwGhMnAHNih
 R34=
X-IronPort-AV: E=Sophos;i="5.81,234,1610380800"; 
   d="scan'208";a="161720432"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 10 Mar 2021 00:10:11 +0800
IronPort-SDR: 26F5C/68Wy1jTuwBMxwUnorUtPXT76zPhIsHeU3Lzq/3/whV8M63jfZggM+fqwEcrmz14pyk7p
 ir19OetnjCxsu98kYnwWbdiQ5UownSmG0cC/lOjuI0xrgG7DBcxlusiJl3Q/87TIKvF1mJd+ol
 EVuwDd1I8xcz2Vj6vNgmKvKYjX7JQP1+x6eqSjeorlUhrU4ErBRzvw967MJzVMUuyjJkqgKH6Y
 EDJcw8s5Aq2da8aSBV7MQG8btxqRgePr1oZJyvhCkMdJFLbogryBM20xLcHXk+siWuN4D+ho75
 IFdTsW6KYvgo7trZwvhS3eIH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 07:52:51 -0800
IronPort-SDR: gCsJgUPKPt2zCl++5c/lWqYOqyHXHARA8ysAsuSH3/1oy/xvNrkFt/2wmIOnDehzWIXdrveOkI
 TNB6qmmSRa+3FIU9gfBcZbStWiB2wvad8yi+djx/4qLBKPX/FoGaVm27x6Mqg0u4OByWHHEqtu
 G0RhynUlWJFjnNxXluJRUSV0JOHi/3zf8cbIm0Bmk8eNKccdKNYAFhONb+EUmMwfDlzh85vk0U
 MEqNZVnDCjjigPof+/PLUcWQIA5QFomlFYUNGXg6MI68AGH7VYFkD4mfa1owMtfRrADIrqTOoR
 Ryg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Mar 2021 08:10:08 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/3] openssl: Enable building for RISC-V 32-bit
Date: Tue,  9 Mar 2021 08:10:03 -0800
Message-Id: <20210309161005.27422-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...ort-for-io_pgetevents_time64-syscall.patch | 62 ++++++++++++
 ...ort-for-io_pgetevents_time64-syscall.patch | 99 +++++++++++++++++++
 .../openssl/openssl_1.1.1j.bb                 |  5 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..d62b9344c1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,62 @@
+From 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 29 Aug 2019 13:56:21 -0700
+Subject: [PATCH] Add support for io_pgetevents_time64 syscall
+
+32-bit architectures that are y2038 safe don't include syscalls that use
+32-bit time_t. Instead these architectures have suffixed syscalls that
+always use a 64-bit time_t. In the case of the io_getevents syscall the
+syscall has been replaced with the io_pgetevents_time64 syscall instead.
+
+This patch changes the io_getevents() function to use the correct
+syscall based on the avaliable syscalls and the time_t size. We will
+only use the new 64-bit time_t syscall if the architecture is using a
+64-bit time_t. This is to avoid having to deal with 32/64-bit
+conversions and relying on a 64-bit timespec struct on 32-bit time_t
+platforms. As of Linux 5.3 there are no 32-bit time_t architectures
+without __NR_io_getevents. In the future if a 32-bit time_t architecture
+wants to use the 64-bit syscalls we can handle the conversion.
+
+This fixes build failures on 32-bit RISC-V.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+(Merged from https://github.com/openssl/openssl/pull/9819)
+Upstream-Status: Accepted
+---
+ engines/e_afalg.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/engines/e_afalg.c b/engines/e_afalg.c
+index dacbe358cb..99516cb1bb 100644
+--- a/engines/e_afalg.c
++++ b/engines/e_afalg.c
+@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
+                                struct io_event *events,
+                                struct timespec *timeout)
+ {
++#if defined(__NR_io_getevents)
+     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
++#elif defined(__NR_io_pgetevents_time64)
++    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
++     * This simplifies the code for us as we don't need to use a 64-bit
++     * version of timespec with a 32-bit time_t and handle converting
++     * between 64-bit and 32-bit times and check for overflows.
++     */
++    if (sizeof(timeout->tv_sec) == 8)
++        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
++    else {
++        errno = ENOSYS;
++        return -1;
++    }
++#else
++# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
++#endif
+ }
+ 
+ static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
+-- 
+2.30.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..c8bc6f5c68
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,99 @@
+From e5499a3cac1e823c3e0697e8667e952317b70cc8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 4 Mar 2021 12:10:11 -0500
+Subject: [PATCH] Fixup support for io_pgetevents_time64 syscall
+
+This is a fixup for the original commit 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
+"Add support for io_pgetevents_time64 syscall" that didn't correctly
+work for 32-bit architecutres with a 64-bit time_t that aren't RISC-V.
+
+For a full discussion of the issue see:
+https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/14432)
+Upstream-Status: Accepted
+---
+ engines/e_afalg.c | 55 ++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 42 insertions(+), 13 deletions(-)
+
+diff --git a/engines/e_afalg.c b/engines/e_afalg.c
+index 9480d7c24b..4e9d67db2d 100644
+--- a/engines/e_afalg.c
++++ b/engines/e_afalg.c
+@@ -124,27 +124,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
+     return syscall(__NR_io_submit, ctx, n, iocb);
+ }
+ 
++/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
++struct __timespec32
++{
++  __kernel_long_t tv_sec;
++  __kernel_long_t tv_nsec;
++};
++
+ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
+                                struct io_event *events,
+                                struct timespec *timeout)
+ {
++#if defined(__NR_io_pgetevents_time64)
++    /* Check if we are a 32-bit architecture with a 64-bit time_t */
++    if (sizeof(*timeout) != sizeof(struct __timespec32)) {
++        int ret = syscall(__NR_io_pgetevents_time64, ctx, min, max, events,
++                          timeout, NULL);
++        if (ret == 0 || errno != ENOSYS)
++            return ret;
++    }
++#endif
++
+ #if defined(__NR_io_getevents)
+-    return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
+-#elif defined(__NR_io_pgetevents_time64)
+-    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
+-     * This simplifies the code for us as we don't need to use a 64-bit
+-     * version of timespec with a 32-bit time_t and handle converting
+-     * between 64-bit and 32-bit times and check for overflows.
+-     */
+-    if (sizeof(timeout->tv_sec) == 8)
+-        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
++    if (sizeof(*timeout) == sizeof(struct __timespec32))
++        /*
++         * time_t matches our architecture length, we can just use
++         * __NR_io_getevents
++         */
++        return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
+     else {
+-        errno = ENOSYS;
+-        return -1;
++        /*
++         * We don't have __NR_io_pgetevents_time64, but we are using a
++         * 64-bit time_t on a 32-bit architecture. If we can fit the
++         * timeout value in a 32-bit time_t, then let's do that
++         * and then use the __NR_io_getevents syscall.
++         */
++        if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
++            struct __timespec32 ts32;
++
++            ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
++            ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
++
++            return syscall(__NR_io_getevents, ctx, min, max, events, ts32);
++        } else {
++            return syscall(__NR_io_getevents, ctx, min, max, events, NULL);
++        }
+     }
+-#else
+-# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
+ #endif
++
++    errno = ENOSYS;
++    return -1;
+ }
+ 
+ static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
+-- 
+2.30.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
index 181790e6ab..ed6d7e0cd4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
@@ -23,6 +23,11 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
+SRC_URI_append_riscv32 = " \
+           file://0003-Add-support-for-io_pgetevents_time64-syscall.patch \
+           file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
+           "
+
 SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
 
 inherit lib_package multilib_header multilib_script ptest
-- 
2.30.1

