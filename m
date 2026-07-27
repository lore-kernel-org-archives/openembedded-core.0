Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FDCC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 09:06:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27300.1785143203306350594
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 02:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UTvjBhv3;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197eaaab00so389508566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 02:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785143201; x=1785748001; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33mo6/1Dw/i2AIUUB4HNZI9j/QJNqiOcR1WJPZXMo0M=;
        b=UTvjBhv31nABZFeNoUTALwBUEfKGmgiZ2+y7EjnW7w+yEZTEbY8jVhQ/l96AfdTO9C
         3IZhSK0iEflibw/2wabN87GupAUrDAOwyBChkP1NLjZqta/qxzTMpzWoIdlXwD1kumtO
         XY2zoNtPIUDIOqnmNDF+7YLKUK6C1X57vXbF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143201; x=1785748001;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33mo6/1Dw/i2AIUUB4HNZI9j/QJNqiOcR1WJPZXMo0M=;
        b=HUjlaQS7mYb70BX3JxeSmieUla6qwcVFekEP0VaGThJ2u9WbLMOeD5hvR3u7eWcG6w
         ll5H4w7UkHvwQKghQqjBNwonsJi4ZNCNJqLlxTpG2mKkHLZhSv/l0+m/pOQAp3En+i96
         wjqb1v2jHQGInR0OZ1gRYzDzWZOG93cfmQ0OK/zLl2T2yHEDjiQLU/dghthNh9Oda78q
         LqCOQDG7hutIkpdiQsrKwhVhRx+0+9NQCm8HLHD0Wrt4Cdoi81/mw3YIy99Y63/hUEVY
         G6JNfw0oycLhSTQ2b+67MFGaXDbnKTzfpDbV7BMz+oQ5vJw3ms6BIzlLY6xMFF3f811I
         t0fw==
X-Forwarded-Encrypted: i=1; AHgh+RoeMs+GlfbfmHjDems8xf8hixT1qJn6T0KJKOEIF534819IIzVcyqc7rkmgaYMWCIJ6XEAd9E+O+3jAjrmehANK+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSGN/ZGNr8WM+aEG91HTuq2CNKFkXVRPb1ck2cFoR+F2K0u5ZE
	Yt6y+A5mJRGoBB1yKNQjqdNeIh5WtR2RVnCRZbFa/WseJD1gd7VcBnx3jB+DFeFOvLA=
X-Gm-Gg: AR+sD10cOLc7Q7v9H4JhrvkMBLpI29ebjM9v2TPd5FyJJf/BSNkutLZtGRVHyPMyO2R
	nHlMZ4/3dMWKzUkpfl98eTG7WbqiE/bBD3l+sBsZ8g6pKHVaCFCEXxw0LO0w/RFBb3IWj2aWTVu
	nWcZuCdk+9g3UwvsfN2lKdXJdVWNdnViT8Mh/7QY+t8Azu2xddP/HCW5dtkLukop/xwvS7VYVtY
	MvF2fLl9Hix+fIeVdhabgsOSps0LFbv+xQ2kT84t0dmv0SS9EUT5QAfrGWAFA5jx3zFtvoGryyx
	PugUUsoWwySb3Ouv2UBzf44mwgW8a6lluL9/a3CdaZZtduIwu7HxApO1N7r5Y9KNtNdMR/+4iGT
	+bYzIRWi9hNivaeOPeqqt23hq7Sm67e+8QZLp2fDQrNaYa79wcTLcNELme6bo9PQjPuV5g0cxxP
	lgtOQ4K1kgwtY0205qn9JWm7rf8ASvaWXCYUWBq7Cv5SNxp5OEPMHSdUMy1LE2Tg==
X-Received: by 2002:a17:907:a01:b0:c12:40c2:9d09 with SMTP id a640c23a62f3a-c1f1ed4ac34mr285234966b.12.1785143201180;
        Mon, 27 Jul 2026 02:06:41 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac7eacsm613888266b.17.2026.07.27.02.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 02:06:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 11:06:40 +0200
Message-Id: <DK98G8WF8V76.3D478P4216I9Y@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722135216.1276081-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260722135216.1276081-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 09:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242072

On Wed Jul 22, 2026 at 3:52 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Update SRCREV to pull the latest fixes from the upstream
> release/2.43/master branch, including fixes for the following CVEs:
>
>   CVE-2026-5435  resolv: More types as unknown in ns_sprintrrf
>   CVE-2026-5450  stdio-common: Fix buffer overflow in scanf %mc [BZ #3400=
8]
>   CVE-2026-5928  libio: Fix ungetwc operating on byte stream [BZ #33998]
>   CVE-2026-6238  resolv: Fix buffer overreads in ns_sprintrrf
>   CVE-2026-6791  posix: Fix stack overflow in wordexp tilde expansion (BZ=
 34091)
>
> Commits between the old SRCREV (e9517114ac) and the new SRCREV (1c9988e52=
5):
>
> 1c9988e525 rtld: cache cpuid results on the stack for intel
> dae425b554 posix: Fix stack overflow in wordexp tilde expansion (BZ 34091=
, CVE-2026-6791)
> 8759917de5 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
> 3a418da6a3 resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
> e64ae5a591 resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
> c9225a3e73 resolv: Check for inet_ntop failure in ns_sprintrrf
> c46f7b2fd6 resolv: Improve formatting of unknown records in ns_sprintrrf
> 1d7d1a16b0 resolv: Fix ns_sprintrrf formatting of class, type values (bug=
 34289)
> 349297a4eb resolv: Declare __p_class_syms, __p_type_syms for internal use
> fdf10644d6 hppa: Fix missing call to __feraiseexcept (BZ 34306)
> a6fa9a9594 arm: Save/restore VFP registers in PLT trampolines (BZ 34144, =
BZ 15792)
> fe0ccc9564 iconv: Suppress intermediate errors with //TRANSLIT (bug 34236=
)
> 22f3d24a6b Hurd: restore some SIOC ioctls
> a13ebdbc7e Hurd: comment ioctls which cannot currently compile
> 446f708e4c Hurd: comment PF_ROUTE/AF_ROUTE defines
> ced45fd472 Hurd: comment PF_LINK/AF_LINK defines
> 89cbf46693 elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cach=
e [BZ #34210]
> 18b97b03b7 Rename __unused fields to __glibc_reserved.
> a47b5b2b3e math: Fix fma alignment when exponent difference is exactly 64=
 (BZ 34183)
> 4070d808be stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
> 2890b35cd3 libio: Fix ungetwc operating on byte stream [BZ #33998]
>
> Testing Results:
>              Before    After    Diff
> PASS         6609      6611      +2
> XPASS        4         4          0
> FAIL         131       132       +1
> XFAIL        16        16         0
> UNSUPPORTED  554       555       +1
>
> Changes in testcases:
>
> testcase-name                                before  after
> resolv/tst-ns_sprintrr(new)                    -     PASS
> nptl/tst-robustpi7                            PASS    FAIL
>
> [Note: The uplift adds new testcases including resolv/tst-ns_sprintrr
> from commit 8759917de5, which passes, accounting for the PASS and
> UNSUPPORTED increases.
>
> nptl/tst-robustpi7 shows as PASS->FAIL, but it is a flaky test under
> QEMU user-mode emulation (PI robust-mutex handling). No nptl code was
> changed in the SRCREV range.]
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index af3db54cee..cf5a444095 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.43/master"
>  PV =3D "2.43+git"
> -SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"
> +SRCREV_glibc ?=3D "1c9988e52540c844928c6d93ff45305adc2c24a0"

Hello,

That would put wrynose ahead of master. Can you send a similar patch for
master so I can take it here as well?

Thanks!
--=20
Yoann Congal
Smile ECS


