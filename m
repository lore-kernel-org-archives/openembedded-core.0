Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 990C07C757
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 21:14:53 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id u7so3163123qtg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5XinwEjqMdWuQmM5vyPLCTpUORGn1cYa+hRh4B07OQE=;
	b=sInOXQfRNSRsppU778BHj6XsVR4QV+pvWd7qCUtgOIzcXqvbGmXYXSUUzUyx/lZD5d
	HNtsqAP7NefkV9OVex5xSdAdJuzSOvCgZcIhz86x9v7XiVssRn1IiK+F6cJFsDrU3Hf6
	Z9dGD1MtyobmSYMFpGwO1MmBfh071BOoIogKeAGZOX3bxM7hPmmJCYXvf0CfapC1W50S
	6SwINfys5rDTQrBloByJKXttKrnQ4PsX9AvzwX27c6njfWIfW8DG404kXSUHwbjmpKJJ
	s3ZaWpiDT57zIEggIXicbQ7gIV4KfMZbyNIrOe4BzJ1BHzeUN7CkpHLuqjJT2yOpgH5m
	nNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5XinwEjqMdWuQmM5vyPLCTpUORGn1cYa+hRh4B07OQE=;
	b=NVo1jIKnzIEsH52ojWUmwErAvZ6ajsjJPzDxIo2oOhMEjO2wKeQIQ5O4MV9K5Kwnug
	l3yyTm5e59KDGkwCCeNmj1II0tUD3dm3W2K8dCyCmvgSNqU3leMi5q6ZjXQS7UyZMIFX
	tXSfCEU92IZ+n2by0i2pHqgqrrrSwhrMdXumA9iNHvt3BpXoJ+BLmOxwrVy006awoprO
	gwq5OkSZ/lE++LZpqqQa9q5SeDQLuUcXKaC9hGCX0AGw0BT/TrCqUJQiewAM+Ote094W
	4Qfl5MNfuYavpnIUfigdwFAs8oyd42d5Djqx3SrDrhSbLR4+8wWBkZxmqd33lUlci0sR
	n9DA==
X-Gm-Message-State: AHQUAuZx6mhXS0/1ELjwDYgMp6xfVA9L1NjiA+UfooLGj9HPKts1qSe7
	oaEr3QuEU8BwBPb2kyxFfKavk5HcZwEj+zpPzew=
X-Google-Smtp-Source: AHgI3IbgujA1geuZYh7EBVxWiPAjEUwWSm9MTk5DXlXhekMxvQpmrUA5EAVQsd257S/BMH+OE/geIuPg26A1fHM/xEA=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr15481008qvk.55.1551129294228; 
	Mon, 25 Feb 2019 13:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20190225185954.15628-1-raj.khem@gmail.com>
	<CAJ86T=W+9YVOKOQ28x0_Fm1RKocKZf8mPdqN1TvbveHiAN7reA@mail.gmail.com>
In-Reply-To: <CAJ86T=W+9YVOKOQ28x0_Fm1RKocKZf8mPdqN1TvbveHiAN7reA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2019 13:14:28 -0800
Message-ID: <CAMKF1spm7DPK7uaCrqJA0-mkJ5Jgmi1Y_6Qy48GdxudiKeM0ag@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 25 Feb 2019 21:14:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 12:14 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Mon, Feb 25, 2019 at 11:00 AM Khem Raj <raj.khem@gmail.com> wrote:
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
>
> There are a lot of recipes which check the ipv6 distro feature. Those
> recipe should probably be updated before this is merged.
>

I think I will move ipv6 and ipv4 to DISTRO_FEATURES_DEFAULT
that will avoid immediate need to address it systemwide.

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

