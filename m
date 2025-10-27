Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F41CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 19:13:57 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.41888.1761592430182074988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 12:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I/I/0PnX;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78619d34979so1039377b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761592429; x=1762197229; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KkVuTRycuXJt7nAVr6APJ56fNegPDcEBHfDwxJEPGo=;
        b=I/I/0PnXTlhDdE/EymGQUw+9KrmR5BNYdRjsVCyZ8IXxpd2xGU7dio2JgAbJYqdrS4
         35DzQhYt1LKmP1BrXEbI6GyjaoTPX487KOGZiEXhNwJ5Vm/3ComEwnFmUPMdS9hjuHCa
         y5e5vD8xUmgQNohmv8J3MrGH2OTSUoMGrcrFWZ8OeESnfyc+DiSTTer6XsquUd2Jc5LC
         9NPrYq9TDut8759PK5i9Jif+J0y569KXAlplS845n/9yLIYP3+GOeDtPGbK8TuZAw7Iz
         1/t88BA7AtG6NUtEuRduio1uI+PRNhywrq5LLrNGmbvYdT+21++VCtk9AlGtK29iDAtr
         9GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592429; x=1762197229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KkVuTRycuXJt7nAVr6APJ56fNegPDcEBHfDwxJEPGo=;
        b=CGLw05PYa9BYxlDhenp3J+hct8CtxwjDTEw5L1LS+/qk89kSXvefeKYAdetro2VNOP
         /+kAKnE+z84uRYgTx+FEfDpVxmY5GJbfq+wyKZ7782738B9RZXD8FD+cXRia9FRNaBM+
         9cEFNFiDeNkRHAfwnehB2pWv8c91sWe3VJCyKN8FjuTlZsDf+0GyuxxRKdac1gD0eJJg
         85QrgQzTJ+lH9pwI5v9bT667OUpI1EtsiSPvp3L551m/WieZ3LfU1flfj+tCutTrXNYy
         GySPDjr6h7xI/cD93Wl5VZMV+/rYRMDMMx/kXUrP2RaXY0UoYb7L7BP4GPSpBB+Pl57v
         iyVg==
X-Gm-Message-State: AOJu0YyG+EqVDOuH8P+/KJgN+tC7j4tw45IC8v4gYvIsrUpnJcDXaPKY
	3Smhv+ym1ENWLbc7BONH1MkCb3Zp/C/ZarB8g2BQFs0CBtXiMrYywkgnctQOWdeZ4WrkPBoBSwF
	bHay5tz2y/sOV2DkHzCdIjCQrtWnlONU=
X-Gm-Gg: ASbGncss6PHqxAQ4km13FpRFsFasnNPUe1GiECgDfputW3bzFh2Ek9xG5hoNoQ7IDvq
	OI5RXq/sqCk/N8PBe1SeMFma9SX5NujHY5kd4FFwXSKx/4+tGcVHtxUmY9UGkZORrRcqasErgST
	STofKFS1vslejdmcYFosn5TE3MJI8LcnWviA5nMtxH5cU6OSv/OqPG/daATzxwT7TCK8xcn7Dt8
	s1mBvrWD5DE3o8AXByNHlNGw1UzCK9ybnKHzy627OtTDV6epDiEkYgiHffvKHGuGeC6D8Sm9SAZ
	dNqswNUqNBo+OnDpvXRpjkrBFHhKZXzvhcchK+oqXdIOJg==
X-Google-Smtp-Source: AGHT+IEtF0EkUxG+LBqzna5Kqw70cvX0oC0MBRwqLjTT7GYusz5nyZ7lpwJmo+HkVVUkIFYdx3nA45AEk2nU9OjOVZo=
X-Received: by 2002:a05:690c:498a:b0:783:70f1:3084 with SMTP id
 00721157ae682-78617fcf554mr10032377b3.49.1761592429254; Mon, 27 Oct 2025
 12:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251027084704.3219220-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Oct 2025 12:13:22 -0700
X-Gm-Features: AWmQ_bmpfZO0ewwWO6z9vgfAqBjQCf-YGyfkBF1sA_YtpzQhAmB7H6zqlDFlMpw
Message-ID: <CAMKF1sqBvR+BmO2XLKK2=mOP-CLCtrijRPWCggMTO4=Z=ymPDw@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] glibc: stable 2.41 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225349

On Mon, Oct 27, 2025 at 1:47=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline e7c419a2957590fb657900fc92a89708f41abd9d..cf926cd7fb950=
0035be19bca90ba9c855dcfcf92
>
> cf926cd7fb (HEAD, origin/release/2.41/master) nss: Group merge does not r=
eact to ERANGE during merge (bug 33361)
> 9867e44cdc AArch64: Fix SVE powf routine [BZ #33299]
> a52c9b75c7 Optimize __libc_tsd_* thread variable access
> ed4672abb5 i386: Add GLIBC_ABI_GNU_TLS version [BZ #33221]
> 7aa907241c i386: Also add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> c1bec0b52d i386: Update ___tls_get_addr to preserve vector registers
> aa5dbd5332 elf: Preserve _rtld_global layout for the release branch
> 42f9c70ac2 elf: Test dlopen (NULL, RTLD_LAZY) from an ELF constructor
> 3f3b4fdd0b elf: Fix handling of symbol versions which hash to zero (bug 2=
9190)
> e2d9e9eb26 x86-64: Add GLIBC_ABI_DT_X86_64_PLT [BZ #33212]
> dd87fcda43 x86-64: Add GLIBC_ABI_GNU2_TLS version [BZ #33129]
> 85780b6055 elf: Compile _dl_debug_state separately (bug 33224)
> b05ce0de3d elf: Restore support for _r_debug interpositions and copy relo=
cations
> 9d6577fdff elf: Introduce _dl_debug_change_state
> 4a3e5f1e4c elf: Introduce separate _r_debug_array variable
> 940d821afb Use TLS initial-exec model for __libc_tsd_CTYPE_* thread varia=
bles [BZ #33234]
> 5d8614b284 ctype: Fallback initialization of TLS using relocations (bug 1=
9341, bug 32483)
> f409ec073f Use proper extern declaration for _nl_C_LC_CTYPE_{class,touppe=
r,tolower}
> 330cd035df Remove <libc-tsd.h>
> c467918138 AArch64: Improve codegen SVE log1p helper
> 6db0f659c8 AArch64: Optimise SVE FP64 Hyperbolics
> 503f7a7d33 AArch64: Optimize SVE exp functions
> 307a8a4434 AArch64: Improve codegen in SVE log1p
> 2a0b52fdd6 AArch64: Optimize inverse trig functions
> 0bb6dad5af AArch64: Optimize algorithm in users of SVE expf helper
> daa4de5253 AArch64: Avoid memset ifunc in cpu-features.c [BZ #33112]
> 1502c248d5 nptl: Fix SYSCALL_CANCEL for return values larger than INT_MAX=
 (BZ 33245)
> 513629b14d elf: Handle ld.so with LOAD segment gaps in _dl_find_object (b=
ug 31943)
> f48de98bce elf: Extract rtld_setup_phdr function from dl_main
> 62928cf7d8 elf: Do not add a copy of _dl_find_object to libc.so
> 373408c19f stdlib: resolve a double lock init issue after fork [BZ #32994=
]
>
> Testing Results:
>              Before     After    Diff
> PASS         5829       5837      +8
> XPASS        4          4          0
> FAIL         240        242       +2
> XFAIL        16         16         0
> UNSUPPORTED  161        161        0
>
> Testcases changes
>
> testcase-name                            before           after
> elf/check-dt-x86-64-plt(new)               -               PASS
> elf/check-gnu2-tls(new)                    -               PASS
> elf/tst-dlmopen4-nonpic(new)               -               PASS
> elf/tst-dlmopen4-pic(new)                  -               PASS
> elf/tst-dlopen-constructor-null(new)       -               PASS
> elf/tst-link-map-contiguous-ldso(new)      -               PASS
> elf/tst-link-map-contiguous-libc(new)      -               PASS
> elf/tst-tls23(new)                         -               PASS
> elf/tst-version-hash-zero(new)             -               PASS
> ctype/tst-ctype-tls-dlmopen(new)           -               FAIL
> ctype/tst-ctype-tls-dlopen-static(new)     -               FAIL
> elf/ifuncmain8                            PASS              -
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 881a9cce2c..b3a66f0a40 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,7 +1,7 @@
>  SRCBRANCH ?=3D "release/2.41/master"
>  PV =3D "2.41+git"
> -SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
> -SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> +SRCREV_glibc ?=3D "cf926cd7fb9500035be19bca90ba9c855dcfcf92"
> +SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"

What does localedef bump bring ? Do we need it ?

>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225324): https://lists.openembedded.org/g/openembedde=
d-core/message/225324
> Mute This Topic: https://lists.openembedded.org/mt/115971173/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

