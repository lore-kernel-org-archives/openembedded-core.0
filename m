Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80DDC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 15:58:48 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.249.1753372725258796588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 08:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lKZI2HlU;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7180bb37846so10481267b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 08:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372724; x=1753977524; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjhYP3th1D3907Hg+aE8OScqufUj7LRrdRDHUyg/AyQ=;
        b=lKZI2HlU+oLw4ugFmH2TWQiXIHdoqDt008+5zt47mSEqBpkOdl6FTDf/mZb84j/U5X
         8Pefki5lYpjpoiJhBW2g5wtOqaivbOhfsZkK+UoTKqx6XYtXcyuqpyZYfb7KzngOZxzs
         UzJq5jAX1Sz9RV5IP4zs6vljN70PZJ+TE7bXiI/yVG2O5VREkc4jsJU4v3/CkSoz2M94
         EMwRVgG1PxixzWXKkvcl7fK2z+Hm5U32uRoph+xEbR/lLk03n5AKnxmMcr5UJJ9f5r4O
         DhceWOuW1jY59Ft81HxRCuy6F6T2N7/4MhabaocWWoEF7CI0t/JIW9zlyaA63RtMBkkk
         Rk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372724; x=1753977524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjhYP3th1D3907Hg+aE8OScqufUj7LRrdRDHUyg/AyQ=;
        b=DJX31W38c4/sOiiRASJ3V6wEHGrb9MjFXsXveAs+0c8EAKaHBW3EV2XJRyb8ybq+aL
         Cbt1AsI5woZWcDpDpc3St95S9ez8x/3zNJxZ7O56mFoyJW5UdZfENmfaQKoniUrbOX9L
         aP162SnPfuzibYewkxWvRWHX9r+N2FSNm00i6mULnfIks5fFN5qi1BZgmx5BYnHobheq
         HlZfc8tuq/zb3pqeJeqMyNwZuuMgUIiPgiV0+bG83O4m24mI5e+8q9bo43w1TxJf6MBv
         b5vIlp5mlBg4Pg5I1UBSw6vfvtBMMZJvFIHqbEFdwUP8tJ7FoA36bpWmMTe6PX3b1tX1
         mGMQ==
X-Gm-Message-State: AOJu0Yzseutn5QR+4/jW35tzusQKftNesSNVQ9XlB4U1AbQJsGfKca6f
	sDbLL+r0T/3hg/dcyNFhXNgznbPYZY3OtjokXQU5xr6OXO6T79ufYCOUQWx2jx+YrdC/5dEJn0H
	TfuPWa66x080pDeUbcLMN/+CnJboHvXFOLPtYX9Y=
X-Gm-Gg: ASbGnctXxb/QXp7Ah4+3Chc5HUTdVAdncJhDIOm+lKwEzceQgvXIvebhz0lwqksXqZ3
	Nwtbygb5ZfSjbx8SpIVZbTx2jl81n32xeVm3pwJ+5CXdAcoBHOXGiMdacRwqIm9GBVT28yEPMMm
	qxkjdcnzMQb2eqyN3TolG4KsnWhyqRTZsnA96I0ivpBP9fLQMPCtRCnw08NO2QDnbXog8fsGIky
	rA3ipdr28nVa55gsW9UGBw6Y2+w80PfAIvrHsNJ
X-Google-Smtp-Source: AGHT+IECePONiu4dG7qcO/R3DRDec5afXxhclEmMEpNBK+W6I5ANPHZhVaHa9pd7KrsgYrx1GFZwuZ+mgO4HFo6P2V0=
X-Received: by 2002:a05:690c:4c0f:b0:719:924d:f6aa with SMTP id
 00721157ae682-719b427d32dmr98223957b3.41.1753372724147; Thu, 24 Jul 2025
 08:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250724075627.2132259-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250724075627.2132259-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 08:58:18 -0700
X-Gm-Features: Ac12FXzSRw157iDYJeSTDWUFbG7WZz0__1qE6UiMgFf1yaBlva4Wv1XkU26i9Vo
Message-ID: <CAMKF1soFTbfHAEV0pn_9EkCyA+haUPiqdFVSoyGTbuQ6sYUpzw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 15:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220840

On Thu, Jul 24, 2025 at 12:56=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Below commits on glibc-2.35 stable branch are updated.
>
> git log --oneline d2febe7c407665c18cfea1930c65f41899ab3aa3..80401002011f4=
70d9c6eb604bf734715e9b3a8c2
> 8040100201 Fix error reporting (false negatives) in SGID tests
> c6ec750be5 support: Pick group in support_capture_subprogram_self_sgid if=
 UID =3D=3D 0
> c9e44b6467 support: Don't fail on fchown when spawning sgid processes
> 621c65ccf1 elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for s=
tatic
> c7ff2bc297 Revert "elf: Ignore LD_LIBRARY_PATH and debug env var for setu=
id for static"
> 8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 3=
2987)
> ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)
> 08aea7712d support: Add support_record_failure_barrier
> 901e24b128 support: Use const char * argument in support_capture_subprogr=
am_self_sgid
> bff3b0f16c elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for s=
tatic
>
> Dropped :
> 0025-CVE-2025-4802.patch
> ed10034f00 elf: Test case for bug 32976 (CVE-2025-4802)
>
> Test results:
>
>              Before    after    diff
> PASS          4833      4839      +6
> XPASS            6         6       0
> FAIL           133       130      -3
> XFAIL           16        16       0
> UNSUPPORTED    200       197      -3
>
> Following commits improved test results:
>
> 8040100201 Fix error reporting (false negatives) in SGID tests
> Improved SGID test handling by unifying error reporting and using secure =
temporary directories.
> Replaced non-standard exit codes and fixed premature exits to avoid maski=
ng failures.
> These changes reduced false negatives, increasing overall test pass rates=
.
>
> 8624f6431b elf: Fix subprocess status handling for tst-dlopen-sgid (bug 3=
2987)
> Fixed tst-dlopen-sgid false positives by correctly handling subprocess ex=
it status (bug 32987).
> Ensured test fails on abnormal or non-zero child exits.
> This commit restores reliability in SGID testing and is the first step to=
ward centralized SGID test error handling.

LGTM

>
> UNSUPPORTED tests changes
> -UNSUPPORTED: elf/tst-env-setuid
> -UNSUPPORTED: elf/tst-env-setuid-tunables
> -UNSUPPORTED: stdlib/tst-secure-getenv
>
> FAILed tests changes
> -FAIL: elf/tst-dlopen-sgid
> -FAIL: misc/tst-error1
> -FAIL: resolv/tst-resolv-aliases
>
> PASSed tests changes
> +PASS: elf/tst-env-setuid
> +PASS: elf/tst-env-setuid-tunables
> +PASS: stdlib/tst-secure-getenv
> +PASS: elf/tst-dlopen-sgid
> +PASS: misc/tst-error1
> +PASS: resolv/tst-resolv-aliases
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc              | 2 +-
>  meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch | 3 ++-
>  meta/recipes-core/glibc/glibc_2.35.bb                  | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 34b199c02b..b269518af4 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.35/master"
>  PV =3D "2.35"
> -SRCREV_glibc ?=3D "d2febe7c407665c18cfea1930c65f41899ab3aa3"
> +SRCREV_glibc ?=3D "80401002011f470d9c6eb604bf734715e9b3a8c2"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/met=
a/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
> index 0298f5a865..a1197c0318 100644
> --- a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
> +++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
> @@ -81,7 +81,7 @@ index 09079c12..c2baed69 100644
>  -                NULL, NULL);
>  -
>  -  /* Remember the last search directory added at startup.  */
> --  _dl_init_all_dirs =3D GL(dl_all_dirs);
> +_dl_verbose =3D *(getenv ("LD_WARN") ?: "") =3D=3D '\0' ? 0 : 1;-  _dl_i=
nit_all_dirs =3D GL(dl_all_dirs);
>  -
>  -  _dl_lazy =3D *(getenv ("LD_BIND_NOW") ?: "") =3D=3D '\0';
>  -
> @@ -97,6 +97,7 @@ index 09079c12..c2baed69 100644
>     if (__libc_enable_secure)
>       {
>         static const char unsecure_envvars[] =3D
> + setup_vdso_pointers ();
>  @@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
>   #endif
>       }
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
> index 3023e9c1ed..df5f14984a 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -27,6 +27,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-4527"
>  CVE_CHECK_IGNORE +=3D " \
>      CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-515=
6 \
>      CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-=
33602 \
> +    CVE-2025-4802 \
>  "
>
>  DEPENDS +=3D "gperf-native bison-native"
> @@ -61,7 +62,6 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-=
onl.patch \
>             file://0023-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
>             file://0024-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
> -           file://0025-CVE-2025-4802.patch \
>             file://0026-PR25847-1.patch \
>             file://0026-PR25847-2.patch \
>             file://0026-PR25847-3.patch \
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220823): https://lists.openembedded.org/g/openembedde=
d-core/message/220823
> Mute This Topic: https://lists.openembedded.org/mt/114317449/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

