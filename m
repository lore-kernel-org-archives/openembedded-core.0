Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by mx.groups.io with SMTP id smtpd.web11.11353.1613062352715891771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 08:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=JBV1mR3E;
 spf=pass (domain: wdc.com, ip: 216.71.154.45, mailfrom: prvs=6690c33ee=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1613062353; x=1644598353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rbRQdl1tCMd2s81JYDappiM9XM1LLtdqjjfWDuhSZzc=;
  b=JBV1mR3EoGkJ4PUzOnyV9c4izBTubwoUVbIk1nK9g9YLGvVCvpm4APnx
   CzqSfxXaHw16GOsSxHcbb0d416euy9Ga7jnj9ol5kGpmmLDawYVRXQ83M
   C27nQh/xlzccimTPtgMWt8qlekxu3AqLXKWp2El6VhXXxWxPZgiCJoPd2
   2Pzvz4FN7WPyPq0zQL+Z4RBSDWFoI+4IjbTARHWdIfIxvfPXHSLxF41Nf
   UoXYWpR+2+A/XtuAQs67FcC5S18gnw0OjE+Zby91NDgt6L6dfaeTckZ9S
   VFuoYnSf3O2wFroVrnsq+mjpYuUWoBMPOTJW4sjlFT93DU2/FzKTDbEUp
   g==;
IronPort-SDR: Tb3fZVvdREsHH+FwY4vlVfZR4Y9DfGwpDvXgbF8MWQ4LU6lJPexyv1uw2AUEEc33AAiyzABep3
 5OjMUjKQuCWEdCodJXb7ktXLyfMqbcKwE/hqBOwoMdUzJuIOcgCYJwdPR8A98h5+A0eN22+nEu
 S3paSppyEiO/tUNN6TzkolFZ4d6IPg3GECpT39V57TBvNaFVtzwDecSxPWbmmf/b3mxu1badZ7
 z+VCQc2R0cVwqtGiH5T4SnrRqGJr7D4CTKxrLkJ8WDo1bEd7gDlXEjrOND/BbaicIXuuCIsgAA
 HSk=
X-IronPort-AV: E=Sophos;i="5.81,170,1610380800"; 
   d="scan'208";a="160940728"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2021 00:52:32 +0800
IronPort-SDR: jE2ahQdgeI/6JHVJ8Cqe/RlLyEpwPd5d7eOdUXqzKb9xrchGkRouxcj9YRWcLMjDd0WsyoJWi7
 6OSoZFfR8OTyu4FqyPFoDk/dkkCOhH9I1DNehITQBL26dwNSVOn2sqObrhopFmFHXEv3dtssJF
 HjUjVBlxfb2DYgE5wU5KXlL4xC4O3xr12thOynI4l7zQVTvwIyt3LLxPkCC11PQ6nz8+O7WJPs
 D4cxEEG/S38dXnLYx+V+mDSPXwrI+bYK/7jT1g8m0BEIvkmFWjclTrv2rfg8PcvoxhCGjkXYBn
 JakPeG8CJrgYF7BkKvkPiPkt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 08:34:22 -0800
IronPort-SDR: SYhVAY43gKx9NTPNBJZpdlJwHi+kB/WNPxs/ozqh3kQNPWWFLgoSGZjX6p0tQK+j38egBD9shv
 1rnX6TBLWOxZcWxNVarSlMy37vqxXSrlKXSZLkYJtIf/9J/C0NRfS4miu5UHgBVssekNkUm+S6
 YQp85geNphf5J9HqOmgiPC77bCGrH1zJj4kWa7eHdAMsOe4H/PxQU8B5GLF3nWjOIakCsQz/kp
 pndtXtM2SsMRpnCqqH69OCLCymi9B93GEVIHVO/hk2tI/nNX2T7iTEGrYguu+I+CaxxH/KGwrH
 jx4=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip01.wdc.com with ESMTP; 11 Feb 2021 08:52:31 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] openssl: Enable building for RISC-V 32-bit
Date: Thu, 11 Feb 2021 08:52:29 -0800
Message-Id: <20210211165229.741761-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...ort-for-io_pgetevents_time64-syscall.patch | 58 +++++++++++++++++++
 .../openssl/openssl_1.1.1i.bb                 |  4 ++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
new file mode 100644
index 0000000000..591354fbb9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
@@ -0,0 +1,58 @@
+From d1a1b797d961301fd58513e50ac5de9ad5b8bc08 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9819]
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
+2.23.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 86950f7544..599d78abea 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -23,6 +23,10 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
+SRC_URI_append_riscv32 = " \
+           file://0003-Add-support-for-io_pgetevents_time64-syscall.patch \
+	   "
+
 SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
 
 inherit lib_package multilib_header multilib_script ptest
-- 
2.30.0

