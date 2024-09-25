Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B33CF9C71
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:40:53 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.9224.1727246444483273393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b/MFXMAv;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5e1b55346c0so2510908eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 23:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727246444; x=1727851244; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7S7mAPPrw241ULMYFB0+HJnwVhs7r7MGQOtYYgTv+k=;
        b=b/MFXMAvXEZr+5p3U2Lz7bY6qFm1j9MbHeXEP6jgHZDMTwA7RYknEPwTJzkbWgELES
         4RvSir/N4ZUCbRdRB9txVHncn8WKysdUVqoPeIK4zdcS5VFYDZGrpxuBySwHGBA+y4A+
         XHEkbUcmTACZkvol3LmQscFseXb4s9Eppca+BrjHJbS4IGCscomxwe0hI4Sltk/j5rU4
         x1iMC7J6gJ4SqnY34e5C07w7YSGLK7s9C1s+oROur6Z2Uiq++46ajgq4o9lrAhnpw+OS
         xl343ANtC3m4Xafwuojnu5oYDqZF4gRSaLlDeIDgUnItvdvml5RlvVCSJRxENxyy3HYf
         REJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246444; x=1727851244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7S7mAPPrw241ULMYFB0+HJnwVhs7r7MGQOtYYgTv+k=;
        b=iaI+kuGjF+sT7zPfkat/n4BXqiDWEa8jEOr3KSCqfV/kqcvwI26VdfUm1J3mDN2cue
         7b8rRIUjwxWcvf9C5ccAmOR9qghADvPy0NB1rc4s2qYV76zpYl0x7MJtt5r0NRCP9oBr
         bFMQpzCorvp1HoS6l7wV0wquFEs1Us65Viqsebl9VxwXE65J38ka1UkjdjTd9ASDq12n
         DsQtoZdGXz0JoSZ8WoUJtqKkSKp3neSHUAA9K18OM0PjqZLnZc29QX3JTqNmmHEBEdqb
         oPBOJr1+icgliNub+RKSUYqvNboSERcCyNJTyfAL2deO6pPfoIyzzPVl+lWE8p83nF5U
         scRg==
X-Gm-Message-State: AOJu0Yx7YCFLEhu6MeIgnAVYzTgFFOomwAVAXCb+iISiMjburWPRYSWZ
	95HgDzSYh+5ZT2LS1vfd3mya/tNIsHos9HfiqEiRhGKtad1F3zhAo7wcfsa9UL6j1WFWdxFihId
	Iy1o7affSzBegWdSTKVee10ttrZv53Mwz
X-Google-Smtp-Source: AGHT+IG17wbmr/M187N98/mkJUlh/l0/vh/mu2qhh5eqPoS8Nc69uXSsY9pnIt4VisLOyVQHj/n9GEDU2+nINsIh6xA=
X-Received: by 2002:a05:6820:22a7:b0:5e1:c9d8:38ca with SMTP id
 006d021491bc7-5e5c6a0978cmr1169798eaf.4.1727246443713; Tue, 24 Sep 2024
 23:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240925061919.2013743-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240925061919.2013743-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2024 23:40:17 -0700
Message-ID: <CAMKF1soqCDcC3VKcR9tGV8dPpfByxv-s=UKAmtZDJ-6BrdRkgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: stable 2.40 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204894

looks ok. Have you run tests on it?

On Tue, Sep 24, 2024 at 11:19=E2=80=AFPM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Below commits on glibc-2.40 stable branch are updated.
> 7073164add libio: Attempt wide backup free only for non-legacy code
> adfb14e71f debug: Fix read error handling in pcprofiledump
> f4a9b6e97b elf: Fix tst-dlopen-tlsreinit1.out test dependency
> f496b750f1 elf: Avoid re-initializing already allocated TLS in dlopen (bu=
g 31717)
> b7edcfa0f4 elf: Clarify and invert second argument of _dl_allocate_tls_in=
it
> 3414b17e9d nptl: Use <support/check.h> facilities in tst-setuid3
> 3b3350d7ba posix: Use <support/check.h> facilities in tst-truncate and ts=
t-truncate64
> e24902f409 ungetc: Fix backup buffer leak on program exit [BZ #27821]
> dac7a0694b ungetc: Fix uninitialized read when putting into unused stream=
s [BZ #27821]
> 2f749d2b15 Make tst-ungetc use libsupport
> 27fb563bfe stdio-common: Add test for vfscanf with matches longer than IN=
T_MAX [BZ #27650]
> bc240ba7c8 support: Add FAIL test failure helper
> 709319f9de string: strerror, strsignal cannot use buffer after dlmopen (b=
ug 32026)
> 586e4cd8c6 Define __libc_initial for the static libc
> c0af0c2ba0 x86: Fix bug in strchrnul-evex512 [BZ #32078]
> 898f25e0b1 x32/cet: Support shadow stack during startup for Linux 6.10
> e3556937c2 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
> 39ee60a719 support: Add options list terminator to the test driver
> 5641780762 manual/stdio: Further clarify putc, putwc, getc, and getwc
> 6a97e2ba14 Fix name space violation in fortify wrappers (bug 32052)
> aa533d58ff x86: Tunables may incorrectly set Prefer_PMINUB_for_stringop (=
bug 32047)
> 928769737c resolv: Fix tst-resolv-short-response for older GCC (bug 32042=
)
> ca53bc68ab Add mremap tests
> 2eb2d78ca7 mremap: Update manual entry
> 3433a35842 linux: Update the mremap C implementation [BZ #31968]
> 46f19b2342 Enhanced test coverage for strncmp, wcsncmp
> 509166c9a5 Enhance test coverage for strnlen, wcsnlen
> 132a72f93c manual: make setrlimit() description less ambiguous
> 65fbcfe589 manual/stdio: Clarify putc and putwc
> 5d2a931a81 malloc: add multi-threaded tests for aligned_alloc/calloc/mall=
oc
> 2aebac5e15 malloc: avoid global locks in tst-aligned_alloc-lib.c
> 145b588637 Fix version number in NEWS file
> b6aeba2de1 manual: Do not mention STATIC_TLS in dynamic linker hardening =
recommendations
> ef14142663 resolv: Do not wait for non-existing second DNS response after=
 error (bug 30081)
> 8bbb8d7b16 resolv: Allow short error responses to match any query (bug 31=
890)
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 61996781bd..c8614e3c60 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.40/master"
>  PV =3D "2.40+git"
> -SRCREV_glibc ?=3D "6daa77104520ca992a9369bd01cccd4d98c82984"
> +SRCREV_glibc ?=3D "7073164add3b874cf0c19ca0fb84236f6bb0985d"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204889): https://lists.openembedded.org/g/openembedde=
d-core/message/204889
> Mute This Topic: https://lists.openembedded.org/mt/108643422/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

