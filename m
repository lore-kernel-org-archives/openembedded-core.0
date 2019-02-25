Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 302CE7C8E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 21:19:47 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so12337132qtg.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 13:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8dtTEN0s03LQ5eEOXpNItP/VefCiQB+pa+jZfRRrI6g=;
	b=mpshsPWXCMV3KNeELsSUrF+lbVnyQnVdoGoU6hxqu4OlvNDX3k+eosa92ff9QnYNZe
	rLTeDUBFKvK+ylK6Ewpgv8hAgUxDhL8cAyDifjoMXZbca54ZE5Cc6IcuaRL+b333po1W
	7O+nF8JSH/cXj58mJ1fPC0hGESZuh1x18Ki+mcMG1Jro7KHjmJc9rCzIAqkq0+cYxH6X
	NsOE5TIxmiY2Krk1S8wJVO+/BES4JsFKI8iI1/xktqPHjCqH92Zk4W5YLjuHPXSAQzCC
	be/5aSe74Lr63a9kFMxnDq8MF3/9IkgPuNHR7lTmuQwFNHGYnaz7fin4wJPfrx6Mu0di
	iOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8dtTEN0s03LQ5eEOXpNItP/VefCiQB+pa+jZfRRrI6g=;
	b=WS6+E2VOPsSXHYmVyGVwW/Pva/+wNChAZf+xihXvFcaDmtZ1IUI0Z2t3xRf2Km8EGN
	PqqrO9roLqvYYNtFHz8MknDB35cPlojqCjaTXa4NdGvIM8rdS/tExfJyROapFxSX4S4m
	7NE3OnP+5w17Kz1u4OnQ1AdEfB6eV3GUGKP65f3NGAfpp/HgsVsHO7wa/59Kzc8Wapts
	B4LMCQua2+NCWmRrFbUbJjfL0QIBnh/r/Z/DY7ZhRz4YBS29Eng+2X0fX88bi71TZIY0
	jTKgh2vIy8A+jpQBEGMEWrHH2hkQXbxYwZXe2OglhvgJLjyga3djmtS2g/ErZsH0rBR9
	IMUw==
X-Gm-Message-State: AHQUAuZ+FUGEoIVb+o8lWoQYQPdyPGTYkphuLMuqfmBdV9yFxDtVEH+M
	IDhsrSBcYzCC2FNdZFeo8J8jCvlxATr7wMem3tk=
X-Google-Smtp-Source: AHgI3IbZfkMAkitvavAlQfRVhRyNKULQ7eyXoiBXl0MVvf7vxhXIxZ/1ys8sZTSBbS4KtiTAFQ5tWlpo3wP2A53NhCo=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr13088863qvf.194.1551129587905; 
	Mon, 25 Feb 2019 13:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20190225185954.15628-1-raj.khem@gmail.com>
	<CAPbeDC=NPHN6RYjOOi2-YabvmbCN6UJHGAm2TZskr_ZgzkNDSg@mail.gmail.com>
In-Reply-To: <CAPbeDC=NPHN6RYjOOi2-YabvmbCN6UJHGAm2TZskr_ZgzkNDSg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 13:19:21 -0800
Message-ID: <CAMKF1sq5g9Hradpb80MvkiUqp_Wf9K24sD8U-O3MOASzaUEDSw@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Mon, 25 Feb 2019 21:19:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 11:41 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On Mon, Feb 25, 2019 at 8:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > After eglibc was merged into glibc, Kconfig support was also dropped so
> > these libc features therefore are not effective anymore and can be
> > removed
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 10 +---------
> >  meta/conf/local.conf.sample.extended            | 16 ++--------------
> >  2 files changed, 3 insertions(+), 23 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index 76edff6480..35da7f10e1 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -11,15 +11,7 @@ LOCALE_UTF8_IS_DEFAULT ?= "1"
> >  LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
> >
> >  DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> > -DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> > -                                       libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> > -                                       libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \
> > -                                       libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> > -                                       libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> > -                                       libc-posix-wchar-io"
> > -DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
> > -DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
> > -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
> > +DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT}"
> >
>
> Maybe remove DISTRO_FEATURES_DEFAULT too ?
>

yes,  I think that can be done as well.

> >  IMAGE_FEATURES ?= ""
> >
> > diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
> > index 010bf6ca6f..91e321047f 100644
> > --- a/meta/conf/local.conf.sample.extended
> > +++ b/meta/conf/local.conf.sample.extended
> > @@ -24,22 +24,10 @@
> >  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j 4" would
> >  # be appropriate for example.
> >
> > -
> > -# glibc configurability is used to reduce minimal image's size.
> > -# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
> > -# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
> > -# and DISTRO_FEATURES definitions to local.conf to enable the options.
> > -#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> > -#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> > -#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \
> > -#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> > -#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> > -#               libc-posix-wchar-io"
> > -
> > -#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> > +#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
> >
> >  # If you want to get an image based on directfb without x11, Please copy this variable to build/conf/local.conf
> > -#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
> > +#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
> >
> >  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
> >  # packages at build time using qemu-native. Disabling it (by setting it to 0)
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

