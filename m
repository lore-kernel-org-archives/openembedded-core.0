Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602DEC47090
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.3082.1649360807431412570
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K3SUMjuK;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id j21so9109486qta.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=skGCzzVcG+s5lpVOPTwUR3S77ssxUKoX6ZghXMJ57P4=;
        b=K3SUMjuKTKWYnEel36U3MiT1T25b2zNCR03FAsRQ1rqFlxt//WZh0aTMeaHOiJQFDE
         z7bCi8H1tDzGkQrflifSNLM9MXxNBcGVXKTC3XMhhgEmncceQFFuhYuzKgQoD8IFQdVd
         /zwirQkQHkOuV4tabrozpQnhVVjoBL9cK0IRylYlGwkRFro/5UGr0FU5YpjIx2Vxg+Ne
         n+wwozZU9iOXnA+N5PrCcgwUbG8GfsYBuHYK4Wr6OHQbRh1kbMyUk27i5caR9nMl2aaq
         ft3jbfPOSTyfphX9yMW+vSCS+8gsVlJgSM4+wFN66AHCj+OwFZNVkATGcnlWQ3OsNwxp
         Q4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skGCzzVcG+s5lpVOPTwUR3S77ssxUKoX6ZghXMJ57P4=;
        b=8SMYh5oJShiX1SQDYx1hQAmiPa5HYFkVUm6DVc1aiEi4S0ZdXMP3GtRkI7wiCZne6B
         bF8MCVL/IuJcvxAsoppUQFqiBVdwntiZ3M9Kb+r8St82CrDEZHxUlcwQeA8KXNxjWHwP
         3eUx1pHi3NRO9n7q5KpQ8PjeqV2YJRdDFjRseZRPmuqxEcJ3B8aoRRoTLO9zf26wtPi7
         bvBMBOxlLhvkcjldwTZ56FqvDTKJ2e8cdNaOpWRAxW9wme254JfZWgfsPwAnBJrrol4o
         Anf5NVTH/Mz6tF5SFw2yZsd4eYsHyeQfhhxG5mgZHZx/Gyjmn3epYJFdTYsefOD6xqi4
         H/cA==
X-Gm-Message-State: AOAM533tx2mpEIxD4sPEcvkyrfF0XSnwN7avhjn047ji9qcd+0HIetCF
	qXr3Q8gUllRN8TsCTMQArbZW2aFbFsNkQyI3uto=
X-Google-Smtp-Source: 
 ABdhPJxdKubVq3pVvqi61q++3KGr/slxltvZlR1xxQSHTgNXU+I72lL4sFjDrDn/Iwzuoz0ILvLmC0zpMx8PpuWJXs4=
X-Received: by 2002:ac8:7dd1:0:b0:2e1:c708:12fa with SMTP id
 c17-20020ac87dd1000000b002e1c70812famr12906978qte.532.1649360806465; Thu, 07
 Apr 2022 12:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-15-alex@linutronix.de>
In-Reply-To: <20220407170029.3500874-15-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 15:46:20 -0400
Message-ID: 
 <CAMKF1sokAXdALgcSES3XFPcMchgOPVD75ZgFY-fXd3zmVFXoWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/17] libgcrypt: upgrade 1.9.4 -> 1.10.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164137

On Thu, Apr 7, 2022 at 1:01 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> License-Update: formatting
>
> Add another chunk to pthread fixing patch.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...0001-Makefile.am-add-a-missing-space.patch | 41 -------------------
>  ...m-fix-undefined-reference-to-pthread.patch | 19 ++++++---
>  ...libgcrypt_1.9.4.bb => libgcrypt_1.10.1.bb} |  5 +--
>  3 files changed, 16 insertions(+), 49 deletions(-)
>  delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
>  rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.4.bb => libgcrypt_1.10.1.bb} (90%)
>
> diff --git a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch b/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
> deleted file mode 100644
> index 62b7484e45..0000000000
> --- a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From b8192ff67ed46ea2cc4282fa1856ce2868223737 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 24 Feb 2021 19:43:07 +0000
> -Subject: [PATCH] Makefile.am: add a missing space
> -
> -Upstream-Status: Submitted [by email to gniibe@fsij.org,gcrypt-devel@gnupg.org]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - cipher/Makefile.am | 2 +-
> - doc/Makefile.am    | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> -index 1cf5072..b3ca225 100644
> ---- a/cipher/Makefile.am
> -+++ b/cipher/Makefile.am
> -@@ -143,7 +143,7 @@ gost-sb.h: gost-s-box
> -
> - gost-s-box: gost-s-box.c
> -       $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) \
> --          $(CPPFLAGS_FOR_BUILD)-o $@ $(srcdir)/gost-s-box.c
> -+          $(CPPFLAGS_FOR_BUILD) -o $@ $(srcdir)/gost-s-box.c
> -
> -
> - if ENABLE_O_FLAG_MUNGING
> -diff --git a/doc/Makefile.am b/doc/Makefile.am
> -index fd7aac2..1703bd9 100644
> ---- a/doc/Makefile.am
> -+++ b/doc/Makefile.am
> -@@ -43,7 +43,7 @@ man_MANS = $(myman_pages)
> -
> - yat2m: yat2m.c
> -       $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) \
> --          $(CPPFLAGS_FOR_BUILD)-o $@ $(srcdir)/yat2m.c
> -+          $(CPPFLAGS_FOR_BUILD) -o $@ $(srcdir)/yat2m.c
> -
> - .fig.png:
> -       fig2dev -L png `test -f '$<' || echo '$(srcdir)/'`$< $@
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> index 5bf0c7f8a3..4233fa7877 100644
> --- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> +++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
> @@ -1,4 +1,4 @@
> -From cb06d218ee36e303a64f27c690f30040d5d87960 Mon Sep 17 00:00:00 2001
> +From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Sun, 12 Jun 2016 04:44:29 -0400
>  Subject: [PATCH] tests/Makefile.am: fix undefined reference to
> @@ -11,14 +11,14 @@ Upstream-Status: Pending
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
>  ---
> - tests/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + tests/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index ab201f0..1cf82d0 100644
> +index e6953fd..f47e1d3 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -75,7 +75,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
> +@@ -76,7 +76,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
>   t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
>   testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
>   t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
> @@ -27,3 +27,12 @@ index ab201f0..1cf82d0 100644
>   testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
>
>   # Build a version of the test driver for the build platform.
> +@@ -95,7 +95,7 @@ else
> + xtestsuite_libs = ../src/.libs/libgcrypt.so*
> + xtestsuite_driver = testdrv
> + t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
> +-t_kdf_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
> ++t_kdf_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread

Using -pthread is preferred,to let compiler driver decide the order
and other dependencies( if any) to be added
dependending upon platform etc.

> + endif
> +
> + # xcheck uses our new testdrv instead of the automake test runner.
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
> similarity index 90%
> rename from meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
> rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
> index 866f3932f6..251e0d0348 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
> @@ -14,7 +14,7 @@ LICENSE:dumpsexp-dev = "GPL-3.0-or-later"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
> -                    file://LICENSES;md5=42fa35a25e138166cc40588387f9159d \
> +                    file://LICENSES;md5=ef545b6cc717747072616519a1256d69 \
>                      "
>
>  DEPENDS = "libgpg-error"
> @@ -25,9 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
>             file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
>             file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
>             file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
> -           file://0001-Makefile.am-add-a-missing-space.patch \
>             "
> -SRC_URI[sha256sum] = "ea849c83a72454e3ed4267697e8ca03390aee972ab421e7df69dfe42b65caaf7"
> +SRC_URI[sha256sum] = "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de"
>
>  # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
>  CVE_CHECK_IGNORE += "CVE-2018-12433 CVE-2018-12438"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164131): https://lists.openembedded.org/g/openembedded-core/message/164131
> Mute This Topic: https://lists.openembedded.org/mt/90317736/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

