Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AAEC6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 22:47:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.8926.1677797233048148145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 14:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H1FbIFeR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id j3so586230wms.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrQMzVkcyHm9JU0WaWI0M7A4BHsdUg+UfsZxmOVn+lY=;
        b=H1FbIFeRUDZEhBMyEPdL5QifWUuJuirfEz+2xImgh2cNiU2mSBpoO0G3qoLU75zv2q
         JZd4wa6B52zB6TaLzx/VbngHR8RpMZnmyy8q1LvMBebJ5Yxz56ZqmwjM+WitknfKo5EU
         w5YZkpM30ET0p10eJ4e/dq7vgZOstg4cI2uMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrQMzVkcyHm9JU0WaWI0M7A4BHsdUg+UfsZxmOVn+lY=;
        b=vx9k9SqcXALbDlUyMisu1LZT4JvCcdBVQmOrvBy92g2flzyrCahzKT3sIzC5hTVtMs
         QPP4A14lRLACGBxKDmZxoAyAiv0s+eWWRfDC5MYPYChcgVT1poOLG7EKF1S/fBub07v8
         yNTyriEBRc3sZ2sH+4g5tMHHBq/i2CiOyzDYnSF9hiIVIhaGMBHwBYOQT4V66k9aG3Di
         m35zMqU90BIDUII4RDIzksRTRgA4llU3QVG8OYJ/3oXmGlavh//hURjLvLgziG0XwfIJ
         kuNhwhEEOGnFKW8zbir8SBSSaizn1Y6pzckTGBaaVW0HHCuvnboGKzDevlWdWoNZotL1
         BHAQ==
X-Gm-Message-State: AO0yUKWbzfQm1NqWIP7ZZJuKr0g7HNNpxoQZR2fblUt8dgkQENbz9xDb
	KZpPjfmizgSiROKJU5PpSjkc1g==
X-Google-Smtp-Source: AK7set8IP1WI2DxBppjYtiF4jNtkJY4qg5AHdWR2lb7VlVEE1szp2K0OelpEG+r2MM3pUuohafF6dw==
X-Received: by 2002:a05:600c:1d16:b0:3df:9858:c030 with SMTP id l22-20020a05600c1d1600b003df9858c030mr2592405wms.5.1677797231424;
        Thu, 02 Mar 2023 14:47:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d94:f1f8:f2d7:19ce? ([2001:8b0:aba:5f3c:8d94:f1f8:f2d7:19ce])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c425400b003dc47d458cdsm752378wmm.15.2023.03.02.14.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 14:47:11 -0800 (PST)
Message-ID: <837bd2b15bbc0cdcb5df9bc3a32cabfaac4e2a25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj
	 <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 02 Mar 2023 22:47:10 +0000
In-Reply-To: <1748ABB9EC6D9FC3.21180@lists.openembedded.org>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <Y/4pZDsT0R9iSH+m@mail.local>
	 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
	 <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
	 <Y/6D8FQZMWzf4TZq@mail.local>
	 <17484164C4F9625C.21178@lists.openembedded.org>
	 <ZACLUF3CCWTAerRu@mail.local>
	 <17489CAAF65A13B6.9697@lists.openembedded.org>
	 <1748ABB9EC6D9FC3.21180@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 22:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177970

On Thu, 2023-03-02 at 17:54 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2023-03-02 at 13:18 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2023-03-02 at 12:41 +0100, Alexandre Belloni wrote:
> > > On 01/03/2023 10:25:58+0100, Alexandre Belloni via lists.openembedded=
.org wrote:
> > > > On 28/02/2023 23:45:05+0100, Alexandre Belloni wrote:
> > > > > On 28/02/2023 17:50:05+0000, Richard Purdie wrote:
> > > > > > On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> > > > > > > On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> > > > > > > <alexandre.belloni@bootlin.com> wrote:
> > > > > > > >=20
> > > > > > > > Hello Khem,
> > > > > > > >=20
> > > > > > > > As discussed I gave it a go again and got this:
> > > > > > > >=20
> > > > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/host=
tools/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, li=
nux_corefile_thread_data*)':
> > > > > > > > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcor=
e_elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*,=
 std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/host=
tools/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bf=
d*, int*)':
> > > > > > > > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcor=
e_elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> =
>*, int*)'
> > > > > > > > > collect2: error: ld returned 1 exit status
> > > > > > > > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > > > > > > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/=
qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-p=
oky-linux-gnueabi/gdb'
> > > > > > > > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > > > > > > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/=
qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-p=
oky-linux-gnueabi'
> > > > > > > > > make: *** [Makefile:1005: all] Error 2
> > > > > > > > > ERROR: oe_runmake failed
> > > > > > >=20
> > > > > > > Is this host running updated buildtools tarball after the bin=
utils ld
> > > > > > > search path fix ?
> > > > > >=20
> > > > > > Yes, it should be.
> > > > >=20
> > > > > Khem, you are probably right that this is host related, this fail=
ed
> > > > > again on ubuntu2004:
> > > > >=20
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds=
/6689/steps/14/logs/stdio
> > > > >=20
> > > > > I'm wondering whether this reproduces on master and we have simpl=
y been
> > > > > lucky.
> > > >=20
> > > > This doesn't reproduce on master on ubuntu2004 so I guess it is rea=
lly
> > > > cause by the binutils upgrade.
> > >=20
> > > I was wrong, it just reproduced on master, debian11-ty-3:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/673=
0/steps/15/logs/stdio
> > >=20
> >=20
> > I went digging and the gdb/config.log file shows:
> >=20
> > configure:28568: checking for ELF support in BFD
> > configure:28588: ./libtool --quiet --mode=3Dlink gcc  -o conftest -I../=
../gdb-13.1/gdb/../include -I../bfd -I../../gdb-13.1/gdb/../bfd -isystem/ho=
me/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-c=
ross-aarch64/13.1-r0/recipe-sysroot-native/usr/include -O2 -pipe     -isyst=
em/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/=
gdb-cross-aarch64/13.1-r0/recipe-sysroot-native/usr/include -I/home/pokybui=
ld/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cross-aarch=
64/13.1-r0/recipe-sysroot-native/usr/include -L../bfd -L../libiberty confte=
st.c -lbfd -liberty  -lncursesw -lm -ldl  >&5
> > /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /h=
ome/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-=
cross-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined r=
eference to `pthread_join@GLIBC_2.34'
> > /home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /h=
ome/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-=
cross-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined r=
eference to `pthread_create@GLIBC_2.34'
> > collect2: error: ld returned 1 exit status
> >=20
> > which is the same issue as we saw previously.=C2=A0
> >=20
> > The really big difference here is that debian11 doesn't have buildtools
> > so this is with the host's ld and libpthread.
> >=20
> > I'm guessing this is a libzstd linked on a more recent system which
> > then doesn't work against this older host libc. The one in uninative
> > could help and would likely resolve things, but isn't involved at this
> > point in a build. Not sure what the right fix is here.
>=20
> This bug is horrible.
>=20
> I reran a forced compile on that build and it all worked. Thankfully I
> saved off the build directory, before and after and was able to diff
> them.
>=20
> The difference is this in python3.pc in the recipe-sysroot-native:
>=20
> Libs.private: -ldl=20
>=20
> vs:
>=20
> Libs.private: -lpthread -ldl  -lutil
>=20
> which sticks a -lpthread onto the linker command in the configure tests
> within gdb so that it can link correctly to libbfd, which then
> convinces its that it has elf symbols.
>=20
> The underlying issue is that particular gdb test appears to strip our
> build time LDFLAGS off for the purposes of the test. I'm guessing
> something like:
>=20
>=20
> Index: gdb-13.1/gdb/acinclude.m4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- gdb-13.1.orig/gdb/acinclude.m4
> +++ gdb-13.1/gdb/acinclude.m4
> @@ -234,7 +234,7 @@ AC_DEFUN([GDB_AC_CHECK_BFD], [
>    # points somewhere with bfd, with -I/foo/lib and -L/foo/lib.  We
>    # always want our bfd.
>    CFLAGS=3D"-I${srcdir}/../include -I../bfd -I${srcdir}/../bfd $CFLAGS"
> -  LDFLAGS=3D"-L../bfd -L../libiberty"
> +  LDFLAGS=3D"-L../bfd -L../libiberty $LDFLAGS"
>    intl=3D`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
>    LIBS=3D"-lbfd -liberty $intl $LIBS"
>    CC=3D"./libtool --quiet --mode=3Dlink $CC"
>=20
> would help. There is some irony when you read the comment there. It
> looks like it is trying and failing to link to libbfd in the gdb build
> anyway rather than one from the host.
>=20
> I'll have to step away for food and so on shortly so I wanted to brain
> dump on what I found so far.
>=20
> [python3.pc will vary in the native case depending on the host libc so
> some libs will be added even if not later needed by uninative]

I confirmed that:

a) to reproduce you need a broken libzstd which on the autobuilder, I'd
replaced the bad one with a good one. The python3 changes aren't the
issue, they just look suspicious
b) the patch above doesn't work since we don't autoreconf gdb
c) if you patch configure to add $LDFLAGS it does make the build work

The patch works since the LDFLAGS from uninative then get used which
unbreak things.

So we just need to work out the right patch and ideally discuss this
with upstream binutils.

Cheers,

Richard






