Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C1BC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 21:28:43 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.35688.1743024512993887190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 14:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kjnIDIoI;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6003b679812so83040eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 14:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743024512; x=1743629312; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VuVI9T2T71SplxrksqHQiafGkb15PnAoBOse0KuN2U=;
        b=kjnIDIoIdVuZHmMO5SsjW4d5abxJsKcvtAdWoTOueSzuttiCFaYL0Btj8tR8f9Wd7U
         YEWubSxKIojL6rcTW+RDBp+aUZyg9PMjDTbDwzo+En/DvikhTyFgMlKOOfkcNV6etjsp
         gBZBX3Co4UmbJ7q177fu8sSITYzOuKUr92DQKmC48PBAnCOC7TTsYuDkVgNkSWG9bLD7
         w9fjv5Ct++MQS708/wkDAQyDrvMs09AXDIRg5v2OsSEQQOaRNNNDfDk+01bLEFWmS6q9
         h8Bo8W3GMc/gItnKnZ4Io5yE0u3eL2JwcvVMbi9yv2UT6D16hdl7fq8uO/pNHsZDsfIo
         fbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743024512; x=1743629312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/VuVI9T2T71SplxrksqHQiafGkb15PnAoBOse0KuN2U=;
        b=wdPb5nO52Kc5xsEmhPJpNdxILBD8FP5GMD+rUm++2n0aqUPWLBDwy28LZrfmncVCLu
         bmRJ9qHmth4I8eSqz3IJHs94GGkb/8/dmUcEJKsjw7K3V2yt0v0v3OvrchRNW86Cnwmc
         FE7MOBM8qjbGOAwDWGBtnt34D2t4PNHkBxIj0AgEt1ZqNKv2i1SoyeHURqxeCXiGj/yI
         4kSonRvk3mpduTGYGKVOZVkrg4joSUPIVHxG1Ozn+xwTLWw1joCkRUXQD39H1vH4gUKU
         hs8PsB4u5D3U2QkJ3LpQRMDHxjjzAHiiPjhtg4Dl9TmTpTYcB/AyiMOB3rnmA2SAv4zc
         RgnA==
X-Gm-Message-State: AOJu0YzIHCYuqq3NdkHngmzM7lw6r4pYb/IHEE/ee3pHr8LBAwgUKoh/
	apOGQe7IfId4KpLlVwypA0jqC2UnlqDCcQNUtUg0WLSgJ0j9SopEXsCeBuRei2ysijV4iWb/qE5
	4oAQ/BzQhCY7b07sV0vY32g80RJ+y70mRyf4=
X-Gm-Gg: ASbGncu9WbwhZyLTLLEBrI7ALK77lIgF1qB0Zlgq+ZsUUBlHpaX6JrFN2nhEhvvSVqe
	Tt4MoH+xSHgw93rVSugar4x3XYc8srFbdNBOFrWvm6lnCItYoiXSomYPTZXcHJWrK76s4uy8pyi
	u60agMxzjIctivO1en7GVhynaq4/ZjT/whcgeqeGzwCw0qmM0T3M1naQ==
X-Google-Smtp-Source: AGHT+IG948/+UzvOeUsFLjjIOhHpMT16fwwxhd0WFd5uZog+Ip3QowdTFZmkxjwZxFyPb5TVcWRU1RDtkQQxz8I5t1I=
X-Received: by 2002:a05:6820:2226:b0:602:65eb:eef5 with SMTP id
 006d021491bc7-602785a0a26mr676435eaf.1.1743024511858; Wed, 26 Mar 2025
 14:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <5be84788-6fa5-453c-83bc-d547246dc037@bootlin.com>
 <296b0e95be234db91dfaa8164e45d035973aa459.camel@linuxfoundation.org>
 <29e667c7-c9d9-496c-b7b7-bf580c39eda4@bootlin.com> <CAMKF1srT0JWLi5+1gv+W2xu-HyfzgZRaGAgFAGeHVx75+YOdsg@mail.gmail.com>
 <9a00d30a-cd78-4c34-bd9f-c2bcbeee2a05@bootlin.com>
In-Reply-To: <9a00d30a-cd78-4c34-bd9f-c2bcbeee2a05@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 14:28:06 -0700
X-Gm-Features: AQ5f1Jp2yZMzq2CZ7w-Xl1VTEZdHyh3N8vLYIKQcxZVSyFw9YotiQP6UXZMPqs8
Message-ID: <CAMKF1srEXJgsc5StuD2rh4FDhKAERrXnN1QBV=g+pZ80rXCCMg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] recipe's sysroot misconfiguration in multilib
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 21:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213695

On Wed, Mar 26, 2025 at 1:54=E2=80=AFPM Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> On 3/26/25 20:26, Khem Raj via lists.openembedded.org wrote:
> > On Wed, Mar 26, 2025 at 12:15=E2=80=AFPM Joao Marcos Costa
> > <joaomarcos.costa@bootlin.com> wrote:
> >>
> >> Hello, Richard
> >>
> >> Thanks for your reply
> >>
> >> On 3/26/25 19:55, Richard Purdie via lists.openembedded.org wrote:
> >>> On Wed, 2025-03-26 at 19:47 +0100, Joao Marcos Costa wrote:
> >>>> I have been trying to set up a multilib environment to generate
> >>>> libraries built with Control Flow Integrity support. The gcc toolcha=
in
> >>>> is already patched to support this custom multilib ABI, and it is in=
deed
> >>>> capable of generating binaries with the CFI flags.
> >>>>
> >>>> I am, however, facing this strange issue where a header is not found=
 in
> >>>> the multilib recipe-sysroot (i.e., libcfi-recipe-sysroot) of a given
> >>>> package (e.g., zstd), and do_compile task fails:
> >>>>
> >> (...)
> >>>>
> >>>> Besides my TUNE_*, DEFAULTTUNE, BASE_LIB values set up, I also added
> >>>> 'GCCMULTILIB =3D "--enable-multilib"' to gcc-cross.inc, to enable mu=
ltilib
> >>>> for the cross toolchain. Could I be missing something, maybe with
> >>>> recipes-devtools/gcc/gcc-multilib-config.inc?
> >>>
> >>> I'm finding it odd that you have to add --enable-multilib since in
> >>> general with gcc-cross, we use separate cross toolchains for each
> >>> multilib. This kind of implies you're configuring the setup different=
ly
> >>> to how the system would expect.
> >>
> >> If I don't, my cross toolchain is configured with "--disable-multilib"=
.
> >> To confirm this, I ran gcc with "-v" from within the recipe's native
> >> sysroot, and the output is:
> >>
> >> Target: riscv64-freedomusdkmllibcfi-linux
> >> Configured with:
> >> ../../../../../../work-shared/gcc-internal-13.2.0-r0/git/configure
> >> --build=3Dx86_64-linux --host=3Dx86_64-linux
> >> --target=3Driscv64-freedomusdkmllibcfi-linux --prefix=3D//host/usr
> >> --exec_prefix=3D//host/usr
> >> --bindir=3D//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
> >> --sbindir=3D//host/usr/bin/riscv64-freedomusdkmllibcfi-linux
> >> --libexecdir=3D//host/usr/libexec/riscv64-freedomusdkmllibcfi-linux
> >> --datadir=3D//host/usr/share --sysconfdir=3D//host/etc
> >> --sharedstatedir=3D//host/com --localstatedir=3D//host/var
> >> --libdir=3D//host/usr/lib/riscv64-freedomusdkmllibcfi-linux
> >> --includedir=3D//host/usr/include --oldincludedir=3D//host/usr/include
> >> --infodir=3D//host/usr/share/info --mandir=3D//host/usr/share/man
> >> --disable-silent-rules --disable-dependency-tracking
> >> --with-libtool-sysroot=3D//host --enable-clocale=3Dgeneric --with-gnu-=
ld
> >> --enable-shared --enable-languages=3Dc,c++,fortran --enable-threads=3D=
posix
> >> --disable-multilib --enable-default-pie --enable-c99 --enable-long-lon=
g
> >> --enable-(...)
> >>
> >> As a consequence, the build fails even before it gets to libcfi-zstd:
> >>
> >> ...libcfi-glibc-internal/2.37/recipe-sysroot-native/usr/bin/riscv64-fr=
eedomusdkmllibcfi-linux/../../libexec/riscv64-freedomusdkmllibcfi-linux/gcc=
/riscv64-freedomusdkmllibcfi-linux/13.2.0/ld.bfd:
> >> cannot find -lgcc: No such file or directory
> >> | collect2: error: ld returned 1 exit status
> >> | make[2]: *** [Makefile:1293:
> >
> > OE's notion of multilib is at system level, which means it will need
> > full runtimes for the chosen multilibs, GCC builds the compiler
> > runtime and has its own
> > directory naming structure to place them which may not be inline with
> > what OE toolchain is doing. For hosted targets we do not build a
> > toolchain with all
> > possible multilibs for a given architecture which technically is
> > possible with gcc. our mutlilibs are a small subset of that and that
> > is what toolchain will recognise
> > provided its placed in right locations in sysroot.
> >
>
> Thanks, Khem.
>
> After your reply and Richard's, I checked with a Poky build (arm64 +
> lib32 multilib), and doing the same test (i.e., gcc -v) I see both
> compilers (64-bit and 32-bit) were configured with "--disable-multilib".
> I will get rid of that GCCMULTILIB then.
>
> Please tell me if I got your point correctly: each multilib ABI (lib32,
> lib64, libfoo, libbar) will have it's respective toolchain built, and as
> long as the toolchain's naming matches what OE expects in terms of
> sysroot structure, everything will work transparently.
>
> In case I got you right, how can I tell what exactly OE expects of the
> sysroot locations and directory names? I ask this specially because in
> my arm64 + lib32 test, the target sysroots are:
>
> lib32-zstd/1.5.6/lib32-recipe-sysroot/usr/lib
> zstd/1.5.6/recipe-sysroot/usr/lib (with a symlink inside to lib64)
> zstd/1.5.6/recipe-sysroot/usr/lib64
>
> and to be fair, I was expecting the very opposite. Something like:
> lib32-zstd/1.5.6/lib32-recipe-sysroot/usr/lib32
> zstd/1.5.6/recipe-sysroot/usr/lib

zstd(64-bit ABI) and lib32-zstd(32bit ABI) packages will build in there own
recipe specific sysroots. Difference will be in the the libdir and PN
e.g. see below for 64bit and 32bit respectively
zstd/1.5.6/lib32-recipe-sysroot/usr/lib64
lib32-zstd/1.5.6/lib32-recipe-sysroot/usr/lib

The multilib dir could be lib lib32 lib64 and it is primarily driven from l=
egacy
and how linux systems accomodated 32bit arch on 64bit systems so there
is no rule but convention that was followed by the OS builders and it is no=
t
same across different architectures e.g. ppc/ppc64 mips/mipsn32/mips64
i686/x86_64
arm/aarch64 might have differences e.g. lib may contain 64bit
libraries in that case
lib32 may contain 32bit and lib64 may contain 64bit in that case lib
may have 32bit binaries


>
> In other words, the target architecture libdir would remain the same
> (i.e. usr/lib) and the multilib variant would be usr/lib32).
>
> Thanks once more.
>
> --
> Best regards,
> Jo=C3=A3o Marcos Costa
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213692): https://lists.openembedded.org/g/openembedde=
d-core/message/213692
> Mute This Topic: https://lists.openembedded.org/mt/111923149/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

