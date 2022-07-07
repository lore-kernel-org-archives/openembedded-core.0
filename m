Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4890EC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 15:10:35 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.6758.1657206628298283772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wbw3acSw;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id z13so23102962qts.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ndbNDvyBn5gd6ldUiZR23CDOWJM59f+c5XBOGSNjtbk=;
        b=Wbw3acSwF9KAV+uJkvKkp7sDpSFcExhP8UNCCTe7td/4Fr12bKI/hAgOu7KemR1fiq
         r8CIPRpLRe5bEJcIK/aMQPXMfXWuw1Rwsx8BJBV2VYqhf2fcE26ZdbmUnz6XMBdwbUCM
         2MDzFyrMR4+cbVlrSEX1s+C6XsERyxPhMraNklaxQHasB2FppAL6L1wGTtEZdmH94zyN
         kN0aUsq3QXebYsspygFHHRZH1/gOusd0M7j2LC0MStxrtIqO3/Feq2j9V3L8ffJ27ZUc
         PZ9fKXzcSJSWz126dguD5HXeTxF0odBekF7+/m1iB1uGKblCUyKQFEdbQpa1LyajeYBZ
         6PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ndbNDvyBn5gd6ldUiZR23CDOWJM59f+c5XBOGSNjtbk=;
        b=c27ixOzt/VaamTXOfFbvW2dMsTO1sKkiHXNGdaUlZCbpiU5doQevLuL3/mG3a6v9Vn
         xTmOVasxWrEvQ3iZqYzXnBhfaY0TeYcD+NVDThJLEo6K5zIxI8H/tMZqo08H2DuWAQm6
         j1lQeF9GrV+bpwQe0dHSJ+YDN5cmqiti7HtcFXOOSZmXUEEgazmIA0piIZrD3gmjzz+O
         ZI+XnydKXhzKerHbOJxX4ESbl4S+oGNXDRpyffDDSRoPX1QCzyOyoDQj8yddvafe56am
         IH/AobXwcgaYHxXfTlir06yDjlDZrm+bpfo+6UvYbYRVe1CMk77RHSlq2ERZyrvvy/3/
         y/hQ==
X-Gm-Message-State: AJIora8F8wlBCqSOwf3B7iMqS8X4XNX2I8nFtlckpPI1cUOhvo7sSrxA
	g/nZVcUpiZ+3u3Ep7q81K6q6IxnOuSGTgpbQWTk=
X-Google-Smtp-Source: 
 AGRyM1sF6ww5oV4Rq4XfHjGw6SocgGJ8/rzr8nOg9vXI+du4NdaoNkvmhNzQtkkPvBaUNX9QrohmCasod5CfJmoUiSM=
X-Received: by 2002:a05:622a:110e:b0:31d:455c:bd0a with SMTP id
 e14-20020a05622a110e00b0031d455cbd0amr21218863qty.54.1657206626987; Thu, 07
 Jul 2022 08:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220707035911.2153302-1-raj.khem@gmail.com>
 <054612390f09ab87115bdf160682495e8e06c4f8.camel@linuxfoundation.org>
 <2723e792-207e-6857-31d7-16738c0e42ad@gmail.com>
In-Reply-To: <2723e792-207e-6857-31d7-16738c0e42ad@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2022 11:10:00 -0400
Message-ID: 
 <CAMKF1srZaKOhgNHGwo4JTDdjNWTEO9MPSoxcAYj31AKbRU-2GA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: Remove -mfpmath=sse on x86
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 15:10:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167786

There are some tests in ltp where it conflicts especially for tunes
used in qemux86, the test adds -mno-sse which does nullify -msse3 but
does not nullify -mfpmath=sse and clang is pedantic about it whereas
gcc just warns

here is ltp cmd

cd tmp/work/core2-32-yoe-linux/ltp/20220527-r0/git/testcases/kernel/kvm

% ../../../../recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-clang
-target i686-yoe-linux -m32 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -mlittle-endian --dyld-prefix=/usr -Qunused-arguments
-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-fmacro-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0
-fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0
-fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot=
-fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot-native=
-Wl,-z,relro,-z,now -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
-Werror=format-security
--sysroot=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot
-I/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/git/testcases/kernel/kvm/include
-DCOMPILE_PAYLOAD -ffreestanding -O2 -Wall
-fno-asynchronous-unwind-tables -mno-mmx -mno-sse -fno-pie -c -o
lib_guest.o lib_guest.c


here is a reduced case

% gcc -m32 -msse3 -mfpmath=sse -xc /dev/null -c -mno-sse
cc1: warning: SSE instruction set disabled, using 387 arithmetics
[kraj@apollo /tmp]
% clang -m32 -msse3 -mfpmath=sse -xc /dev/null -c -mno-sse
error: the 'sse' unit is not supported with this instruction set

On Thu, Jul 7, 2022 at 11:05 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 7/7/22 4:38 AM, Richard Purdie wrote:
> > On Wed, 2022-07-06 at 20:59 -0700, Khem Raj wrote:
> >> Fixes build errors seen with clang
> >> error: the 'sse' unit is not supported with this instruction set
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>   meta/recipes-extended/ltp/ltp_20220527.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
> >> index b3ef8f59105..034b62b321e 100644
> >> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> >> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> >> @@ -19,6 +19,7 @@ EXTRA_OECONF:append:libc-musl = " LIBS=-lfts "
> >>   # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-pointer
> >>   # earlier in CFLAGS, etc.
> >>   CFLAGS:append:x86-64 = " -fomit-frame-pointer"
> >> +TUNE_CCARGS:remove:x86 = "-mfpmath=sse"
> >>
> >>   CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> >>   CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> >
> > I really don't like remove operations in OE-Core. If it is
> > incompatible, why is it there in the first place? Does that need to be
> > clang only?
>
> There are some tests in ltp where it conflicts especially for tunes used
> in qemux86, the test adds -mno-sse which does nullify -msse3 not nullify
> -mfpmath=sse
>
>
> cd tmp/work/core2-32-yoe-linux/ltp/20220527-r0/git/testcases/kernel/kvm
>
> %
> ../../../../recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-clang
> -target i686-yoe-linux  -m32 -march=core2 -mtune=core2 -msse3
> -mfpmath=sse -mlittle-endian --dyld-prefix=/usr -Qunused-arguments
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fmacro-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0
>
> -fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0=/usr/src/debug/ltp/20220527-r0
>
> -fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot=
>
> -fdebug-prefix-map=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot-native=
>   -Wl,-z,relro,-z,now     -O2 -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
> --sysroot=/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/recipe-sysroot
> -I/mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/ltp/20220527-r0/git/testcases/kernel/kvm/include
> -DCOMPILE_PAYLOAD -ffreestanding -O2 -Wall
> -fno-asynchronous-unwind-tables -mno-mmx -mno-sse -fno-pie -c -o
> lib_guest.o lib_guest.c
>
> >
> > Cheers,
> >
> > Richard
> >

