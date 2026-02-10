Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CD1EA8130
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:38:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22512.1770737889063083195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uWN2tyRj;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806bf39419so42136815e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770737887; x=1771342687; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIoiNMwG15oofmuQp7nt6FAU2sHoFJcJ147vgTJOGzQ=;
        b=uWN2tyRjPT15ARYS3iswN97YERB2rO9BjrdjOE+Hs9Hfoi1MgxCTeLASLx5Xz83B5V
         IeGutoKzoQpBgva9NCAFhN+GzQ6mj937o6HmNd4r7rEpZfFSOb5lbWyY+ZHu/42CCnmv
         EwzhUmBavwNsqkxTP8voCV9eEvxp04QiABjI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737887; x=1771342687;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIoiNMwG15oofmuQp7nt6FAU2sHoFJcJ147vgTJOGzQ=;
        b=dqoCxLNpJECGv/7+TIJTpF2lIw96hAG/7hHl5rtYT3RaMwZo6A0Uw3bKe+rGauFBAj
         LokJukiv/WUeScegtyRee7pi2tvuTuv8IjKlwWUtgz74UCKB5YeiDNQI01QxhbK4bfUL
         B+x3BidCjk4XCZaMctF0xGRzndfgXjjnWVM2uYoB0dz9QXq3r7nB9RBpv1+Ec9Ui7s3V
         nNO7aThqpH8qjYQJUwFq42k3lCjCYx186CTpULUPeGoSod+O4FFX+/YJvsl8Dkap6otE
         cwzQVi3C8Z+cfDaN6Js3lLGVdo+SWkkd09K68sxkwOB2zkB/BrnrUwQz8L556K3Skh8l
         6/MA==
X-Forwarded-Encrypted: i=1; AJvYcCUts6SergG05mGFQmguu6po1rieyzysdTqIrLuETGsttHAdbM6YNZIT7BskQxDHbpACySflHGFwpWkspv2ZsZP4Fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywq9TEVwlV+jjaXWuQk9YBfrQC4LEVDoLPfNOglpbC+PTY9j7L0
	sRGmWsDWrWUCkciDVcI5yYmpj7/o06pQMW/hSPFdC9HnrTbvMvsdP52P320OH8ET5ps=
X-Gm-Gg: AZuq6aJUnyaP7tl35qQUIwRbphh2Mf1HX7dkExtlsXWha61zGHZxy5pDKLXoSv9Jajs
	bMtw5FjuWT/oQIViBjhIyQdCrOLVq9plGFLn2nw0rffEh0xC18V9XUzyNPoVJnIppm4ymIsAeu0
	o1QLX+mb3F3ckhJHBsJ8bA6bklBvJJGf760nrYTVof2zpoIPOvScy66pPRh2XmQ0LEEtiV3EYbd
	otUXeZIq+ndDzjyp/v1KXOtLWrDzeDPRLHwEn7pdJcsX8LzrtbeM2U0nb5Xc0u/l2ufCKkQiQE1
	HGsDKhENcd7H7OE03snUoA/cCX5EosScIH3eg/dmQZZ2gzAdiaQMNLMTdiFSemVfOQDh76ykgud
	WWLn9Y4U8T5TLEhXYdXnLafzuBDjDp1e7peR4lDSyTDxJku8G4FuHMG5DympEOLaQA6cKjgLksx
	czvQeaOVIRoJ1Q5cvui455oCKwMTwV1THE2wp8j9+cTkB4un5xg+C16LhcTx5gCwaRJ56X1/Gsa
	2ny2jc/y9yAw56l
X-Received: by 2002:a05:600c:450f:b0:47e:e97e:11aa with SMTP id 5b1f17b1804b1-4834f6c154fmr41910685e9.4.1770737887346;
        Tue, 10 Feb 2026 07:38:07 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8963ac2ab29sm69540446d6.3.2026.02.10.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 07:38:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:38:05 +0100
Message-Id: <DGBE6YE5WNOM.39S9I6XBXTAO5@smile.fr>
Subject: Re: [OE-core][scarthgap 19/25] glibc: stable 2.39 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1770626074.git.yoann.congal@smile.fr>
 <3f86db0e4faf9519fcfcb981e57f673daeb20269.1770626074.git.yoann.congal@smile.fr>
In-Reply-To: <3f86db0e4faf9519fcfcb981e57f673daeb20269.1770626074.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230912

On Mon Feb 9, 2026 at 10:29 AM CET, Yoann Congal wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> git log --oneline 58cbbd43fe82910cf8ae9008351b0b0665104500..ce65d944e38a2=
0cb70af2a48a4b8aa5d8fabe1cc
> ce65d944e3 (HEAD -> release/2.39/master, origin/release/2.39/master) posi=
x: Reset wordexp_t fields with WRDE_REUSE (CVE-2025-15281 / BZ 33814)
> 831f63b94c resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
> fb22fd3f5b memalign: reinstate alignment overflow check (CVE-2026-0861)
> 10c0bcb3d3 support: Exit on consistency check failure in resolv_response_=
add_name
> f47dd22366 support: Fix FILE * leak in check_for_unshare_hints in test-co=
ntainer
> 4a53354eaf sprof: fix -Wformat warnings on 32-bit hosts
> beb8267909 sprof: check pread size and offset for overflow
> c07002038f getaddrinfo.c: Avoid uninitialized pointer access [BZ #32465]
> ae5fb93559 nptl: Optimize trylock for high cache contention workloads (BZ=
 #33704)
> efff7cb659 ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
> f6becd8ae8 ppc64le: Restore optimized strncmp for power10
> 0daa4e46b8 ppc64le: Restore optimized strcmp for power10
> 28c1de6580 AArch64: Fix instability in AdvSIMD tan
> 03d0393343 AArch64: Optimise SVE scalar callbacks
> 0d05a895f1 aarch64: fix includes in SME tests
> c1dc4412f8 aarch64: fix cfi directives around __libc_arm_za_disable
> d60f15dc89 aarch64: tests for SME
> d1d0d09e9e aarch64: clear ZA state of SME before clone and clone3 syscall=
s
> dbe1904b7c aarch64: define macro for calling __libc_arm_za_disable
> 58cf4aa421 aarch64: update tests for SME
> 1b3bd9a9a6 aarch64: Disable ZA state of SME in setjmp and sigsetjmp
> 38942a336b linux: Also check pkey_get for ENOSYS on tst-pkey (BZ 31996)
> c74d59a656 aarch64: Do not link conform tests with -Wl,-z,force-bti (bug =
33601)
> 323ad087a1 x86: fix wmemset ifunc stray '!' (bug 33542)
>
> Testing Results:
>              Before    After    Diff
> PASS         4926      4921     -5
> XPASS        4         4         0
> FAIL         223       229      +6
> XFAIL        16        16        0
> UNSUPPORTED  224       224       0
>
> Changes in failed testcases:
>
> testcase-name                                before  after
> elf/tst-audit21                              PASS    FAIL
> malloc/tst-malloc-too-large                  PASS    FAIL
> malloc/tst-malloc-too-large-malloc-check     PASS    FAIL
> malloc/tst-malloc-too-large-malloc-hugetlb1  PASS    FAIL
> malloc/tst-malloc-too-large-malloc-hugetlb2  PASS    FAIL
> malloc/tst-malloc-too-large-mcheck           PASS    FAIL
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.39.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Hello,

When run on the autobuilder, all those new FAIL tests are PASS:
https://valkyrie.yocto.io/pub/non-release/20260209-10/testresults/qemux86-6=
4-tc/testresults.json
I will add this info in the commit message then proceed with merge.

Regards,

>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 2ca15711587..03a8e5d01e3 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "58cbbd43fe82910cf8ae9008351b0b0665104500"
> +SRCREV_glibc ?=3D "ce65d944e38a20cb70af2a48a4b8aa5d8fabe1cc"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> =20
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index ff6c8f3b437..7958d64eed1 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -18,7 +18,7 @@ easier access for another. 'ASLR bypass itself is not a=
 vulnerability.'"
> =20
>  CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
>  CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2024-2961 CVE-2024-33599 CVE-2024-3=
3600 CVE-2024-33601 CVE-2024-33602 CVE-2025-0395 \
> -    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058"
> +    CVE-2025-4802 CVE-2025-5702 CVE-2025-8058 CVE-2025-15281 CVE-2026-08=
61 CVE-2026-0915"
>  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix availa=
ble in used git hash"
> =20
>  DEPENDS +=3D "gperf-native bison-native"


--=20
Yoann Congal
Smile ECS


