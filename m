Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23D6C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 17:54:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.1095.1677779675777581175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 09:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qt10W7th;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id f11so5465226wrv.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHvSGCsDEw2ltu1yRjMkJ/N4l6ArjcxoL6z4xx1Czsk=;
        b=Qt10W7thbvk3oSzBIwj1AEi3ymb/aH1VO0x94H7m+bVOT6s7V9KzEiSjtNs5F4/0aa
         4fVFRcyZC4LidS4oM3+CfSu+lfTTqteSOha5LXzvt6qclPOfPQKg+43re9Kto10gxBBE
         tLXQcZSCnL+nCqFSsGgNnhjm6uJOc0olrUXd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHvSGCsDEw2ltu1yRjMkJ/N4l6ArjcxoL6z4xx1Czsk=;
        b=316afam02In8f43DCFA9Fv+A063FnB5NH6V0lWnUpjr3LWDci1qVynPYi092C7yUZm
         n3GkC6QgwML4NeV0XfVhrv06Ak+meEKwLzO05o1FbjdFiDdo1p8bMhml14NZUZVBgLIo
         jMCx6iV25YGKSmjTVSEtVoQt3Vbgo3CqCKjjowpaBhq2T3Msw0COV2RiXcbTpR6LnW/H
         YDEeUVRjiJz5Xqq3pmcMaZ2ZSkk7pqCI8KzimoGMEgZo6nufFuAWkDJC+b1GJMqcNsIq
         06uoy/Eq8vW3ZbNO1ecPP9q4We0kEPAR9Xl4EpoMvzSD0jXXK3wJ9ZBffHD25IVrFIBC
         kBUg==
X-Gm-Message-State: AO0yUKVoAyGOl2UZ7JNzjRsEmYNihqo9rFMrQTVsT+CbvcgAPlxHMJqZ
	nyIXG2uwzZUIrrz6wKdTByvbHQ==
X-Google-Smtp-Source: AK7set/QQzvo7VlCzaokb8EbJP0AnOKxcpKtxm+pnuL/RgyLhxOYvEY4/ZQSVd/Y0wVi0vXoOhcMOQ==
X-Received: by 2002:adf:ee06:0:b0:2c7:e406:67d8 with SMTP id y6-20020adfee06000000b002c7e40667d8mr8337068wrn.35.1677779674057;
        Thu, 02 Mar 2023 09:54:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:91b1:734c:7703:c5ab? ([2001:8b0:aba:5f3c:91b1:734c:7703:c5ab])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c458800b003df5be8987esm3904373wmo.20.2023.03.02.09.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 09:54:33 -0800 (PST)
Message-ID: <e30149bff283c0c88530dce494e8b24335634fa2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj
	 <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 02 Mar 2023 17:54:32 +0000
In-Reply-To: <17489CAAF65A13B6.9697@lists.openembedded.org>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <Y/4pZDsT0R9iSH+m@mail.local>
	 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
	 <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
	 <Y/6D8FQZMWzf4TZq@mail.local>
	 <17484164C4F9625C.21178@lists.openembedded.org>
	 <ZACLUF3CCWTAerRu@mail.local>
	 <17489CAAF65A13B6.9697@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 17:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177967

On Thu, 2023-03-02 at 13:18 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-03-02 at 12:41 +0100, Alexandre Belloni wrote:
> > On 01/03/2023 10:25:58+0100, Alexandre Belloni via lists.openembedded.o=
rg wrote:
> > > On 28/02/2023 23:45:05+0100, Alexandre Belloni wrote:
> > > > On 28/02/2023 17:50:05+0000, Richard Purdie wrote:
> > > > > On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> > > > > > On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> > > > > > <alexandre.belloni@bootlin.com> wrote:
> > > > > > >=20
> > > > > > > Hello Khem,
> > > > > > >=20
> > > > > > > As discussed I gave it a go again and got this:
> > > > > > >=20
> > > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hostto=
ols/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linu=
x_corefile_thread_data*)':
> > > > > > > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_=
elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, s=
td::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hostto=
ols/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*=
, int*)':
> > > > > > > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_=
elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*=
, int*)'
> > > > > > > > collect2: error: ld returned 1 exit status
> > > > > > > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > > > > > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/qe=
muarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-pok=
y-linux-gnueabi/gdb'
> > > > > > > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > > > > > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/qe=
muarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-pok=
y-linux-gnueabi'
> > > > > > > > make: *** [Makefile:1005: all] Error 2
> > > > > > > > ERROR: oe_runmake failed
> > > > > >=20
> > > > > > Is this host running updated buildtools tarball after the binut=
ils ld
> > > > > > search path fix ?
> > > > >=20
> > > > > Yes, it should be.
> > > >=20
> > > > Khem, you are probably right that this is host related, this failed
> > > > again on ubuntu2004:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/6=
689/steps/14/logs/stdio
> > > >=20
> > > > I'm wondering whether this reproduces on master and we have simply =
been
> > > > lucky.
> > >=20
> > > This doesn't reproduce on master on ubuntu2004 so I guess it is reall=
y
> > > cause by the binutils upgrade.
> >=20
> > I was wrong, it just reproduced on master, debian11-ty-3:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6730/=
steps/15/logs/stdio
> >=20
>=20
> I went digging and the gdb/config.log file shows:
>=20
> configure:28568: checking for ELF support in BFD
> configure:28588: ./libtool --quiet --mode=3Dlink gcc  -o conftest -I../..=
/gdb-13.1/gdb/../include -I../bfd -I../../gdb-13.1/gdb/../bfd -isystem/home=
/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cro=
ss-aarch64/13.1-r0/recipe-sysroot-native/usr/include -O2 -pipe     -isystem=
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gd=
b-cross-aarch64/13.1-r0/recipe-sysroot-native/usr/include -I/home/pokybuild=
/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cross-aarch64=
/13.1-r0/recipe-sysroot-native/usr/include -L../bfd -L../libiberty conftest=
.c -lbfd -liberty  -lncursesw -lm -ldl  >&5
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /hom=
e/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cr=
oss-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined ref=
erence to `pthread_join@GLIBC_2.34'
> /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /hom=
e/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cr=
oss-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined ref=
erence to `pthread_create@GLIBC_2.34'
> collect2: error: ld returned 1 exit status
>=20
> which is the same issue as we saw previously.=C2=A0
>=20
> The really big difference here is that debian11 doesn't have buildtools
> so this is with the host's ld and libpthread.
>=20
> I'm guessing this is a libzstd linked on a more recent system which
> then doesn't work against this older host libc. The one in uninative
> could help and would likely resolve things, but isn't involved at this
> point in a build. Not sure what the right fix is here.

This bug is horrible.

I reran a forced compile on that build and it all worked. Thankfully I
saved off the build directory, before and after and was able to diff
them.

The difference is this in python3.pc in the recipe-sysroot-native:

Libs.private: -ldl=20

vs:

Libs.private: -lpthread -ldl  -lutil

which sticks a -lpthread onto the linker command in the configure tests
within gdb so that it can link correctly to libbfd, which then
convinces its that it has elf symbols.

The underlying issue is that particular gdb test appears to strip our
build time LDFLAGS off for the purposes of the test. I'm guessing
something like:


Index: gdb-13.1/gdb/acinclude.m4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- gdb-13.1.orig/gdb/acinclude.m4
+++ gdb-13.1/gdb/acinclude.m4
@@ -234,7 +234,7 @@ AC_DEFUN([GDB_AC_CHECK_BFD], [
   # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
   # always want our bfd.
   CFLAGS=3D"-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
-  LDFLAGS=3D"-L../bfd -L../libiberty"
+  LDFLAGS=3D"-L../bfd -L../libiberty $LDFLAGS"
   intl=3D`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
   LIBS=3D"-lbfd -liberty $intl $LIBS"
   CC=3D"./libtool --quiet --mode=3Dlink $CC"

would help. There is some irony when you read the comment there. It
looks like it is trying and failing to link to libbfd in the gdb build
anyway rather than one from the host.

I'll have to step away for food and so on shortly so I wanted to brain
dump on what I found so far.

[python3.pc will vary in the native case depending on the host libc so
some libs will be added even if not later needed by uninative]

Cheers,

Richard



