Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E1C57F2C0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 17:37:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id bx28so13364676edb.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 09:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MmfHx2y5J0yZRS8Xa0iRpTo7IdAF22xvRapiqsxUXKY=;
	b=UWxRJyBytUYrxH0kvmjB0d6fHBgT9MwnqK7ZYoSGqwgJrU4PmE22n8H3YOjMZt7QBV
	Tttp2zcEUl8D6r9f/gJ5NS2yRribningkQqw6Hx6sTXIj55S7SSdVDN3ixc/5Ru/EJyH
	6o0WKyBuO97kXBw/4rB+az2zNnpjfxF8QyhkV+6tUXx7pfQVRFGPhIVJjjmDdt9WqRcR
	scE9u+jcNcX3S1Rl/x4IsbDkCOTvbSkDNAGKN6gSJZMTYBsicUEKadk+TE4rWIuEIr5G
	ZoXbAFRTimvv5yK03rM5IjkdzfpeYdLC1iI+2DNkmam5PDIqIcXFHeYe7gKjsmc6yaaU
	FQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MmfHx2y5J0yZRS8Xa0iRpTo7IdAF22xvRapiqsxUXKY=;
	b=oD+zpygrSHIF4pbntTzrwptDlbqdLYlL2CdfhscnErRX6hCMduQro6y3wUKjW2ijbn
	1KuGvC1fT9P6bH/wVWXg2kzb4IXxB4Rd2tN3Aok4MvUO2iwh9hHlH4XxD0xaPNB1y1SW
	ZiJw3nSwWa7YkmRP7HdecwVOfZgoGjUzBcZRKfJRCfSLdkcvhz1dRFXiGFFmtF5H6e8c
	zpMJAovJyM4+jLRdyu850OuOOluWstL8qG2HspdVXVl68xY+vvbvOclis3o6YalnXvEh
	JtZPrSHojY94/4pi/r1TooHmkpJETsDOwHCNAceiJajSi2dQNw5cKX70bDxoQv7PVQBE
	kacA==
X-Gm-Message-State: APjAAAXlJhrHTJJDby04emliaj/7R02YbXGQAcp655zYwgZqCVOkTHSE
	stgTMaRx6SUHdxMv7YXVMo96NwT6YN2nS93yEGQ=
X-Google-Smtp-Source: APXvYqwXBlsFe07hOWE63tmTCpNBncZunBLQegYSC+LjtSdj9Sr2wthXqGCBRIfwRTG8655731biGQxiXHzibML/hNM=
X-Received: by 2002:a05:6402:1659:: with SMTP id
	s25mr28257801edx.219.1577036269742; 
	Sun, 22 Dec 2019 09:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20191222040549.286151-1-raj.khem@gmail.com>
	<20191222040549.286151-4-raj.khem@gmail.com>
	<CADkTA4Of55K6p5QwTv01gTA6YF2MeGFSK6_9RYcHtSdSaCyZzA@mail.gmail.com>
In-Reply-To: <CADkTA4Of55K6p5QwTv01gTA6YF2MeGFSK6_9RYcHtSdSaCyZzA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Dec 2019 12:37:37 -0500
Message-ID: <CADkTA4P40td8aTZnyKJjKnUtcmRVrpp8=Yud20p4A+sjHoLGCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-yocto: Fix build with gcc10
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
X-List-Received-Date: Sun, 22 Dec 2019 17:37:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 22, 2019 at 12:04 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Sat, Dec 21, 2019 at 11:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Thanks Khem!
>
> As usual, please don't merge this patch directly, I'll apply it for
> linux-yocto* and linux-yocto-dev so we have full coverage on the
> reference kernels.

FYI: The integrated patch is here:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-next

My other -stable bumps are still pending, so I'm waiting for them to
merge, so I can send the patch (since it needs those SRCREV bumps).

Bruce

>
> I can send SRCREV bumps tonight, once I've done some quick build tests.
>
> Bruce
>
> > ---
> >  ...sed-64-Define-__force_order-only-whe.patch | 42 +++++++++++++++++++
> >  meta/recipes-kernel/linux/linux-yocto_5.2.bb  |  2 +
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
> >
> > diff --git a/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
> > new file mode 100644
> > index 0000000000..bd48de6dd9
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/files/0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch
> > @@ -0,0 +1,42 @@
> > +From 199caf12cdbe24796dc31fbd4fe5729ba2acf659 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 20 Dec 2019 17:42:02 -0800
> > +Subject: [PATCH] x86/boot/compressed/64: Define __force_order only when
> > + CONFIG_RANDOMIZE_BASE is unset
> > +
> > +kaslr_64.c also defines the same variable, however when both files are
> > +included into final link, linker complains about multiple definition of
> > +`__force_order' which is coming from kaslr_64.o and pgtable_64.o, its
> > +possible that kaslr_64.o is disabled via CONFIG_RANDOMIZE_BASE config
> > +option, therefore define it conditionally only when
> > +CONFIG_RANDOMIZE_BASE is not set
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > +Cc: Kees Cook <keescook@chromium.org>
> > +Cc: "H. Peter Anvin" <hpa@zytor.com>
> > +Cc: Ingo Molnar <mingo@redhat.com>
> > +Cc: Thomas Gleixner <tglx@linutronix.de>
> > +Cc: x86-ml <x86@kernel.org>
> > +Cc: Arnd Bergmann <arnd@arndb.de>
> > +---
> > + arch/x86/boot/compressed/pgtable_64.c | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
> > +index c8862696a47b..077d19268b0b 100644
> > +--- a/arch/x86/boot/compressed/pgtable_64.c
> > ++++ b/arch/x86/boot/compressed/pgtable_64.c
> > +@@ -12,7 +12,9 @@
> > +  * It is not referenced from the code, but GCC < 5 with -fPIE would fail
> > +  * due to an undefined symbol. Define it to make these ancient GCCs work.
> > +  */
> > ++#ifndef CONFIG_RANDOMIZE_BASE
> > + unsigned long __force_order;
> > ++#endif
> > +
> > + #define BIOS_START_MIN                0x20000U        /* 128K, less than this is insane */
> > + #define BIOS_START_MAX                0x9f000U        /* 640K, absolute maximum */
> > +--
> > +2.24.1
> > +
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > index ff0f547399..5af0924808 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > @@ -29,6 +29,8 @@ SRCREV_meta ?= "bd0762cd138f1624b5a5f8669cfa3ac2b71cb87b"
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> >
> > +SRC_URI += "file://0001-x86-boot-compressed-64-Define-__force_order-only-whe.patch"
> > +
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >  LINUX_VERSION ?= "5.2.20"
> >
> > --
> > 2.24.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

