Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id B7AFF7DE5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 14:36:40 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m2so15524676qkd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DNC0OVMpLBmnDrTsmKuh3uLDL9JX4iALgD+WUL9HOaU=;
	b=q3bgQ0k7/YUB/kvpSYo+Sh0HO/5j8QwkeHnHFPy5VKv/YLClmxrKkqX8aM8DZ8FXPg
	4r9LvjTrkYFbOTel22gr5lVI91AMDHGmz+rqFcJ7d5WsKdfngpDMu3TNM4YcoJUobusV
	CbQSz3XgeMZ0aV1FCL9Ho/97uXnCxBk1lkmdQx38cF0JY84LZbHxDafOwbqEqkFx/M7l
	etEuFZwwyFinZBewYwvK4JshaJGt/zVzIDrOiOwvLupqAKx9jWGVLwekrhhc06J0jrbQ
	UALi2h4qc0bX/4ko0lT1FgXajpk8qnksPschXqThNVXnPUTPPng8JlxaOBEt3L9NRc1q
	frBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DNC0OVMpLBmnDrTsmKuh3uLDL9JX4iALgD+WUL9HOaU=;
	b=iTGJouGA0gVHYKFpHQkB/Q1FkU8H9hP8shGM6IztYiINzDBWOvhnMtrr4zeDfXawGC
	WW9YYZJShKakKjbf0C4T2Vdfu7t3Quyj/J7y+HjcrDTugbK9doL/Sr+Ika2duh97RIRd
	JsLfUEUb0tzShXU9bP5agYJ23H2pF4DTf7Wnng6G7fFcmj2ht+igO8NfogsG45w2I29g
	X5lejzodVhcciyz09xAtq42ljnz3Wgq301RYdgwOi5zsZb+/YJmBRfquuEEv/wbSOxGh
	LGJteoSU5knlAvPUJeNFy2grAmkbC1NLD0NeXNKO3oLQpSS0vuTpirMATR6KinLyYM2g
	1+bA==
X-Gm-Message-State: APjAAAVtcsh2bC9cRks9K2glu8lF2PKBN5D+t5SfwRGJvm3+DbeggXlk
	x/yFAQ5hebTKSrh217GKCrVB7EvGc8BlBIQ/J2Y=
X-Google-Smtp-Source: APXvYqwKAwGnC0P6D8Yq7ktXm3Ai1+MjHJCwwOA4ZE4+avndMKHCL6CWwWvDUShl8C1qJX+0ryGXSkGBWhrFIKJu+ZM=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr34614146qke.212.1565707001361;
	Tue, 13 Aug 2019 07:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190812232234.41199-1-raj.khem@gmail.com>
	<9a259359b640fefefd52b5eee616156b75aa0e80.camel@linuxfoundation.org>
In-Reply-To: <9a259359b640fefefd52b5eee616156b75aa0e80.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 07:36:15 -0700
Message-ID: <CAMKF1souyrRrqxV9WKfyTBg6ap3whkdxdvEjs3ovsSaZcm00Lg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Move content from gcclibdir into libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Aug 2019 14:36:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 7:23 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-08-12 at 16:22 -0700, Khem Raj wrote:
> > OE does not use the traditional /usr/lib/gcc prefix to store gcc-
> > runtime
> > it basically is moved into libdir, however some newer files were
> > installed by newer versions of gcc especially libgomp ( omp.h
> > openacc.h )
> > into gcclibdir, so we have content in both directories, this confuses
> > other tools which are trying to guess the gcc installation and its
> > runtime location, since now we have two directories, the tools either
> > choose one or other and we get inconsistent behavior, e.g. clang for
> > aarch64 uses /usr/lib but same clang for riscv64 chose /usr/lib/gcc
> >
> > This change ensures that OE ends up with single valid location for
> > gcc
> > runtime files
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-runtime.inc    | 5 +++++
> >  meta/recipes-devtools/gcc/gcc-runtime_8.3.bb | 3 ++-
> >  meta/recipes-devtools/gcc/gcc-runtime_9.1.bb | 3 ++-
> >  3 files changed, 9 insertions(+), 2 deletions(-)
>
> This appears to break mingw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/925
>

seems   virtual:nativesdk:/home/pokybuild/yocto-worker/meta-mingw/build/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb:do_package

but I cant see which files can you help

> Cheers,
>
> Richard
>
>
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index a5c2600d7f..ebba774108 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -77,6 +77,11 @@ do_install () {
> >               cd ${B}/${TARGET_SYS}/$d/
> >               oe_runmake 'DESTDIR=${D}'
> > MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
> >       done
> > +     if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> > +             install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +             mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/*
> > ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +             rmdir --ignore-fail-on-non-empty -p
> > ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> > +     fi
> >       rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
> >       rm -rf ${D}${infodir}/libitm.info ${D}${infodir}/dir
> >       rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> > b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> > index a1c7a76d0b..172af4e7e1 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
> > @@ -5,7 +5,8 @@ require gcc-runtime.inc
> >  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
> >
> >  FILES_libgomp-dev += "\
> > -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
> > +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
> >  "
> >
> >  # Building with thumb enabled on armv6t fails
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > index a1c7a76d0b..172af4e7e1 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime_9.1.bb
> > @@ -5,7 +5,8 @@ require gcc-runtime.inc
> >  EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
> >
> >  FILES_libgomp-dev += "\
> > -    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
> > +    ${libdir}/${TARGET_SYS}/${BINV}/include/omp.h \
> > +    ${libdir}/${TARGET_SYS}/${BINV}/include/openacc.h \
> >  "
> >
> >  # Building with thumb enabled on armv6t fails
> > --
> > 2.22.0
> >
>

