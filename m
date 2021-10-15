Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA4EC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 16:38:27 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.326.1634315906130950281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 09:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=aGx+OMFH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id h20so4554776qko.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8vZFwTfmXmWV/4veqvhbO/yKs1TXhCd+UGnP/TiopU=;
        b=aGx+OMFHBdXbC0SXOg3p3KnKPuXoAxnDNt5bAvC/Ch+LHq5vM17sV1B8v6NyQ4iV+u
         2WMi5w0nFAGD1AyN1HxNXs2VZ7mf36Xi1Q0NERu2JZXDmjMUcHYPWSvJoaH2Qeh5otJt
         Vi6u90O3ykqo4YPcan3Rdafw4wjqzl9cwh83t1l9bBVpHNdZbE/oudjINliwN8+IU353
         8tFt4BTFaCnPI1GZeBh+lVvFVJqqDzxKqKhMHg8oILQRE++qAzefLtYaNU01KIySkYRw
         HyIqexo0BP5DlZLCsHoDIfjla05cFOOxGhURZz5GO/m1k0ptl0ii+v45QL+OnaJJNbVD
         WT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8vZFwTfmXmWV/4veqvhbO/yKs1TXhCd+UGnP/TiopU=;
        b=QIXMAG/vlwSRmY0LTp1laeFJkLG3yBn4pS988YPLVZMXeZPMr2+s+qwkXei/HYXqBb
         gEO2SdLWEBJH0JstlUfxRoygFCImIa/H0LNsnyNfjLDTmsJgvbDSVY4YG3lFTSI+uQxH
         PAUFMkBAZdSb9V4AQqJe1INA7AJ2300oUeszf43T0uKaIoQywTD6bf1srhIhep9LjBU9
         TqDUCwKZzWd0rCi1P+qHu8+Ck2TBh+WWZPEwhYuvmq6A+4KK7zVN3D8EHoUYJtEyekl/
         s2aDtG5xmtHi4ProkN9Sbs6gZpyu1gqi4xH2RkestseF2JiNwptQXC/pfd/SZcTQ43/o
         oaWw==
X-Gm-Message-State: AOAM531fIpM0JHbmjd86qTINEcCWfYe/0GQKdIR3fOJee+1RyYk9adeb
	Af32cmlQ+Eo4tddkQ9+3Nt4xBCOrjJVmKnWOLpsxqYVaUf53Og==
X-Google-Smtp-Source: 
 ABdhPJwwVtNLFJm+YiRxeMtGpC1fLbuU6qp/2g69T8ptySNwvLAysvRM8GBKu6ptKw2Ylw1kLgBgnm5RZmGWLrv7QB0=
X-Received: by 2002:a37:b7c2:: with SMTP id
 h185mr10949065qkf.311.1634315905074;
 Fri, 15 Oct 2021 09:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211015124949.979837-1-raj.khem@gmail.com>
In-Reply-To: <20211015124949.979837-1-raj.khem@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 15 Oct 2021 12:38:12 -0400
Message-ID: 
 <CAPoiz9yfgngbjS3oqtwGjnS7x=oeE3HYPUL13Z=LOs_0ftiFOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Drop riscv32 upstreamed patches
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 16:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157003

On Fri, Oct 15, 2021 at 8:49 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> These patches are already available in 3.0

Yes!  Please remove these ASAP.  I'm seeing these patches cause a
break in my builds of the poky master branch.
https://gitlab.com/jonmason00/poky/-/jobs/1684096385

Thanks,
Jon

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ort-for-io_pgetevents_time64-syscall.patch | 62 ------------
>  ...ort-for-io_pgetevents_time64-syscall.patch | 99 -------------------
>  .../openssl/openssl_3.0.0.bb                  |  5 -
>  3 files changed, 166 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> deleted file mode 100644
> index d62b9344c1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Thu, 29 Aug 2019 13:56:21 -0700
> -Subject: [PATCH] Add support for io_pgetevents_time64 syscall
> -
> -32-bit architectures that are y2038 safe don't include syscalls that use
> -32-bit time_t. Instead these architectures have suffixed syscalls that
> -always use a 64-bit time_t. In the case of the io_getevents syscall the
> -syscall has been replaced with the io_pgetevents_time64 syscall instead.
> -
> -This patch changes the io_getevents() function to use the correct
> -syscall based on the avaliable syscalls and the time_t size. We will
> -only use the new 64-bit time_t syscall if the architecture is using a
> -64-bit time_t. This is to avoid having to deal with 32/64-bit
> -conversions and relying on a 64-bit timespec struct on 32-bit time_t
> -platforms. As of Linux 5.3 there are no 32-bit time_t architectures
> -without __NR_io_getevents. In the future if a 32-bit time_t architecture
> -wants to use the 64-bit syscalls we can handle the conversion.
> -
> -This fixes build failures on 32-bit RISC-V.
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -
> -Reviewed-by: Richard Levitte <levitte@openssl.org>
> -Reviewed-by: Paul Dale <paul.dale@oracle.com>
> -(Merged from https://github.com/openssl/openssl/pull/9819)
> -Upstream-Status: Accepted
> ----
> - engines/e_afalg.c | 16 ++++++++++++++++
> - 1 file changed, 16 insertions(+)
> -
> -diff --git a/engines/e_afalg.c b/engines/e_afalg.c
> -index dacbe358cb..99516cb1bb 100644
> ---- a/engines/e_afalg.c
> -+++ b/engines/e_afalg.c
> -@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
> -                                struct io_event *events,
> -                                struct timespec *timeout)
> - {
> -+#if defined(__NR_io_getevents)
> -     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> -+#elif defined(__NR_io_pgetevents_time64)
> -+    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
> -+     * This simplifies the code for us as we don't need to use a 64-bit
> -+     * version of timespec with a 32-bit time_t and handle converting
> -+     * between 64-bit and 32-bit times and check for overflows.
> -+     */
> -+    if (sizeof(timeout->tv_sec) == 8)
> -+        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
> -+    else {
> -+        errno = ENOSYS;
> -+        return -1;
> -+    }
> -+#else
> -+# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
> -+#endif
> - }
> -
> - static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
> ---
> -2.30.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch
> deleted file mode 100644
> index c8bc6f5c68..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/0004-Fixup-support-for-io_pgetevents_time64-syscall.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From e5499a3cac1e823c3e0697e8667e952317b70cc8 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Thu, 4 Mar 2021 12:10:11 -0500
> -Subject: [PATCH] Fixup support for io_pgetevents_time64 syscall
> -
> -This is a fixup for the original commit 5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
> -"Add support for io_pgetevents_time64 syscall" that didn't correctly
> -work for 32-bit architecutres with a 64-bit time_t that aren't RISC-V.
> -
> -For a full discussion of the issue see:
> -https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -Reviewed-by: Paul Dale <pauli@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/14432)
> -Upstream-Status: Accepted
> ----
> - engines/e_afalg.c | 55 ++++++++++++++++++++++++++++++++++++-----------
> - 1 file changed, 42 insertions(+), 13 deletions(-)
> -
> -diff --git a/engines/e_afalg.c b/engines/e_afalg.c
> -index 9480d7c24b..4e9d67db2d 100644
> ---- a/engines/e_afalg.c
> -+++ b/engines/e_afalg.c
> -@@ -124,27 +124,56 @@ static ossl_inline int io_read(aio_context_t ctx, long n, struct iocb **iocb)
> -     return syscall(__NR_io_submit, ctx, n, iocb);
> - }
> -
> -+/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
> -+struct __timespec32
> -+{
> -+  __kernel_long_t tv_sec;
> -+  __kernel_long_t tv_nsec;
> -+};
> -+
> - static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
> -                                struct io_event *events,
> -                                struct timespec *timeout)
> - {
> -+#if defined(__NR_io_pgetevents_time64)
> -+    /* Check if we are a 32-bit architecture with a 64-bit time_t */
> -+    if (sizeof(*timeout) != sizeof(struct __timespec32)) {
> -+        int ret = syscall(__NR_io_pgetevents_time64, ctx, min, max, events,
> -+                          timeout, NULL);
> -+        if (ret == 0 || errno != ENOSYS)
> -+            return ret;
> -+    }
> -+#endif
> -+
> - #if defined(__NR_io_getevents)
> --    return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> --#elif defined(__NR_io_pgetevents_time64)
> --    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
> --     * This simplifies the code for us as we don't need to use a 64-bit
> --     * version of timespec with a 32-bit time_t and handle converting
> --     * between 64-bit and 32-bit times and check for overflows.
> --     */
> --    if (sizeof(timeout->tv_sec) == 8)
> --        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
> -+    if (sizeof(*timeout) == sizeof(struct __timespec32))
> -+        /*
> -+         * time_t matches our architecture length, we can just use
> -+         * __NR_io_getevents
> -+         */
> -+        return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> -     else {
> --        errno = ENOSYS;
> --        return -1;
> -+        /*
> -+         * We don't have __NR_io_pgetevents_time64, but we are using a
> -+         * 64-bit time_t on a 32-bit architecture. If we can fit the
> -+         * timeout value in a 32-bit time_t, then let's do that
> -+         * and then use the __NR_io_getevents syscall.
> -+         */
> -+        if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
> -+            struct __timespec32 ts32;
> -+
> -+            ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
> -+            ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
> -+
> -+            return syscall(__NR_io_getevents, ctx, min, max, events, ts32);
> -+        } else {
> -+            return syscall(__NR_io_getevents, ctx, min, max, events, NULL);
> -+        }
> -     }
> --#else
> --# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
> - #endif
> -+
> -+    errno = ENOSYS;
> -+    return -1;
> - }
> -
> - static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
> ---
> -2.30.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
> index d8c50a8011..67343bedcc 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
> @@ -18,11 +18,6 @@ SRC_URI:append:class-nativesdk = " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI:append:riscv32 = " \
> -           file://0003-Add-support-for-io_pgetevents_time64-syscall.patch \
> -           file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
> -           "
> -
>  SRC_URI[sha256sum] = "59eedfcb46c25214c9bd37ed6078297b4df01d012267fe9e9eee31f61bc70536"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156992): https://lists.openembedded.org/g/openembedded-core/message/156992
> Mute This Topic: https://lists.openembedded.org/mt/86337862/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

