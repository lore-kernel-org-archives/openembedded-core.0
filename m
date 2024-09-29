Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D19CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 17:00:23 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.35907.1727629215665708449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 10:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a+yag/hq;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2871f46bb84so984339fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727629215; x=1728234015; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzdcw9PbACmvyhs77FnU+U1jIY/y+Gg9dGSGBGEi0Sc=;
        b=a+yag/hq9RpqvROOppDlzOOuhZr6oQQXaM/6gN3/BZEla4rsBNSEl8wGrYz2QugacW
         KSc85MUeb0+Q3vh7sUsLsYT6wOnZg7P+1AmsLjgmjW2w4Qie3PUL5PElhkn1vP0MhP9i
         NrF+6zxa/bi8huEx2eqeY2J3x1rBv9u1Bgp8C3jj+GSGH3fdzilGeQO2k9V3rVHeyY5v
         W01WqB2b661Q3NJBdl9A7NNb25EWII6CSGSEn7cWucOmqj8KDs6IKCaUF0PagPBj4Mzw
         S2rLPZx92mSyJxKG91qfEcSbYbhqZQDpQeisp1Vidv3P17h9LB6dPTrASUlOjo38V6GO
         8MPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727629215; x=1728234015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzdcw9PbACmvyhs77FnU+U1jIY/y+Gg9dGSGBGEi0Sc=;
        b=rPplNKbKeWfaP35sxF9jXAJo++0O5RBQeGdwtXIo1UGFE1B6VQMTkhkKQ0MNVHosxs
         LSkpAN/rULvqIevDaAkuE2w9LUUw+r15kOeIy4zD+hci4uZIMMlVz/yZmOBEKNeLyXYY
         JmVwONQCvHAZDOByY/lZXd0H9sGK1UWpDPz++VLlmWhA4l83UD5d9WDpIhSkT9WtVIam
         AwNefNOmn/7lfBStRr7feSVRDxWbarYqYXtZFOd3u8GGEHEHuWCR++RSMh1OXfhTMqjh
         YuWvgeSt1pqXiMtkpb7XQSicIljQJV41J2bGQukJrMo/cfu9VjtbAekRmgloBZuaR3b4
         ohMw==
X-Gm-Message-State: AOJu0YyQYi5MyuOsSuTACl9b7UQs2xcAnlZVsjkBMjEL4D4Uus7OBfh9
	5R1XHWjFFbaK495IGOs+P6NzSFobZUIGfLVEurykjcgpws3PIJgDaM/8OdXhRsPAFvDFwffQW5C
	kElWo+V6KNIg+XuoVnBN6BJELda3SgA==
X-Google-Smtp-Source: AGHT+IHoboX0vePkO+RnywplGpEFRSohpKY2VsHOXh5IZTapZWoWNRMm1fFf/m9k4eGANuAf5UQ49DhILJfkOHCPxtY=
X-Received: by 2002:a05:6870:eca3:b0:27b:55af:ca2b with SMTP id
 586e51a60fabf-28710a5da29mr6097347fac.11.1727629214775; Sun, 29 Sep 2024
 10:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240929161825.3616542-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20240929161825.3616542-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Sep 2024 09:59:49 -0700
Message-ID: <CAMKF1soSvyNvxs57m2h6UYticD9S9Z_6tic4-WP9=wy0WL92ug@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates.
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Naveen.Gowda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 17:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205058

lgtm.

On Sun, Sep 29, 2024 at 9:18=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Below commits on glibc-2.39 stable branch are updated.
> 84f6bfce2c libio: Attempt wide backup free only for non-legacy code
> 4e382ce01c debug: Fix read error handling in pcprofiledump
> 7f5027995f elf: Fix tst-dlopen-tlsreinit1.out test dependency
> 27a0c6b490 elf: Avoid re-initializing already allocated TLS in dlopen (bu=
g 31717)
> e3d5d2d350 elf: Clarify and invert second argument of _dl_allocate_tls_in=
it
> 28c4f32f71 elf: Support recursive use of dynamic TLS in interposed malloc
> 5ff30b2f75 nptl: Use <support/check.h> facilities in tst-setuid3
> cae418638e posix: Use <support/check.h> facilities in tst-truncate and ts=
t-truncate64
> a500b48bd2 ungetc: Fix backup buffer leak on program exit [BZ #27821]
> 70939528c6 ungetc: Fix uninitialized read when putting into unused stream=
s [BZ #27821]
> f0c308ab23 Make tst-ungetc use libsupport
> 3c5f493d87 stdio-common: Add test for vfscanf with matches longer than IN=
T_MAX [BZ #27650]
> 98de2f2bae support: Add FAIL test failure helper
> e73fd06b7f string: strerror, strsignal cannot use buffer after dlmopen (b=
ug 32026)
> 37c2aa4eaa Define __libc_initial for the static libc
> 49953727d1 x86: Fix bug in strchrnul-evex512 [BZ #32078]
> 81631a0dd1 Adjust check-local-headers test for libaudit 4.0
> 9fbbe86f7c x32/cet: Support shadow stack during startup for Linux 6.10
> eeff407b19 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
> 1ab7faf86d support: Add options list terminator to the test driver
> 6eebc92cb2 manual/stdio: Further clarify putc, putwc, getc, and getwc
> afc15c2044 Fix name space violation in fortify wrappers (bug 32052)
> 5a5eb72d8e resolv: Fix tst-resolv-short-response for older GCC (bug 32042=
)
> 7f5ccdd8af Add mremap tests
> a8c230c881 mremap: Update manual entry
> 9f349d02c6 linux: Update the mremap C implementation [BZ #31968]
> 127ef30c46 Enhanced test coverage for strncmp, wcsncmp
> 3b25c7fa87 Enhance test coverage for strnlen, wcsnlen
> 4bdcc1963b manual: make setrlimit() description less ambiguous
> b71a51189d manual/stdio: Clarify putc and putwc
> 946006d37c malloc: add multi-threaded tests for aligned_alloc/calloc/mall=
oc
> f11b7178a1 malloc: avoid global locks in tst-aligned_alloc-lib.c
> 51db012c94 resolv: Track single-request fallback via _res._flags (bug 314=
76)
> 8c9fbc6651 resolv: Do not wait for non-existing second DNS response after=
 error (bug 30081)
> fc1dc39984 resolv: Allow short error responses to match any query (bug 31=
890)
> cb19cef087 elf: Fix localplt.awk for DT_RELR-enabled builds (BZ 31978)
> f6a75fddf4 Fix usage of _STACK_GROWS_DOWN and _STACK_GROWS_UP defines [BZ=
 31989]
>
> Results before updates as below:
>
> No. of passes                     4581
> No. of expected passes            2
> No. of expected failures          16
> No. of unexpected failures        214
> No. of unsupported tests          45
>
> Results after updates as below:
>
> No. of passes                     4605
> No. of expected passes            2
> No. of expected failures          16
> No. of unexpected failures        212
> No. of unsupported tests          46
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 955b22bc38..dc162b2946 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
> +SRCREV_glibc ?=3D "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205057): https://lists.openembedded.org/g/openembedde=
d-core/message/205057
> Mute This Topic: https://lists.openembedded.org/mt/108720704/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

