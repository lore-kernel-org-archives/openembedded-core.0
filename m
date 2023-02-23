Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB3DC64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 22:21:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3361.1677190885015968945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 14:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VDBBkOJ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id p8so12250390wrt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 14:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RBxWOZKOnBaD2gJBOm6CPG4/q/i9yrHHKicdFnRMJyE=;
        b=VDBBkOJ+C5ntrCktquFSJeoivm2P2jL4AqqPUg1cKb0E1Q7CM8DB9sh5iBnrnuOBlH
         lLphUyRo9sIG7ovIWR1ZpDM1PhtBql8hlKjiKwzMsrvCIFwuzues4qLqZb0rvZRcGszd
         xd+8fuQvTXpsF11fKTJQ4eHZGroTaYI7TfAwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBxWOZKOnBaD2gJBOm6CPG4/q/i9yrHHKicdFnRMJyE=;
        b=Go7MX8srBzLBAYef+tz8W7pbYwJYJmAY7HvIudwc4NGlP7HIGlSw9kApdoJf8sXQgC
         ip6zF0fMaN4t7+bdcdwZVItI4h9DB6mCktZMBdHt2m3zLumcquHHT9koA14BuGryHrok
         Fs59F2dATKVARApadXjpRHzi0fGlnS3SAgYfrUnB9IRLgN82U4Yh0ElBuWTHf2b71Xin
         FOZNTM82Do1C9GT/Muu8XXAbKImd+1iAZabXviaiREX9jlDW8alZS/1IapKTA6aiZqey
         J1HIG6BtwlIIma05VUdMaGMSzQyABTqc39/oqh3HYH59xVxdtWTKiBn8E1d/3X1Rxfvm
         rMwQ==
X-Gm-Message-State: AO0yUKVZ7tFgfi6HvSJRobMsDjUmF5WXW9m6gcedi6K6poW1y0ntFxfW
	yVT1DWAoh8/z7FTFzyxv3152oQ==
X-Google-Smtp-Source: AK7set/1Z+VcNlWF/hrkhCM8crA0k3H3uZiLUACN7LtsgXoS/IjTnwXZZ4RnPuiDfdVk32XmxPy9Lg==
X-Received: by 2002:a5d:4dce:0:b0:2c4:503:7afc with SMTP id f14-20020a5d4dce000000b002c405037afcmr13044355wru.7.1677190883340;
        Thu, 23 Feb 2023 14:21:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id q1-20020a1cf301000000b003e2232d0960sm632853wmq.23.2023.02.23.14.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 14:21:22 -0800 (PST)
Message-ID: <802d14e4397dbc698209c68ac13dd20812b4d58c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] gdb: Upgrade to 13.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2023 22:21:22 +0000
In-Reply-To: <CAMKF1sqPCrJD+JOmnqzXO5-E7HAbW9iTLhXqJQKCyNFpnKeDRg@mail.gmail.com>
References: <20230222165358.2186844-1-raj.khem@gmail.com>
	 <Y/aosEttiq8sdxoA@mail.local>
	 <CAMKF1sq9ZGnyQ4v=oLRmbPQBofQ+G3HYSU2nP3oA-feCk4v_EQ@mail.gmail.com>
	 <CAMKF1sqPCrJD+JOmnqzXO5-E7HAbW9iTLhXqJQKCyNFpnKeDRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 22:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177635

On Wed, 2023-02-22 at 22:34 -0800, Khem Raj wrote:
> On Wed, Feb 22, 2023 at 5:35 PM Khem Raj <raj.khem@gmail.com> wrote:
> >=20
> > On Wed, Feb 22, 2023 at 3:43 PM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >=20
> > > Hello,
> > >=20
> > > This failed on musl:
> > >=20
> > > > checking minix/config.h usability... ../../gdb-13.1/gdbserver/linux=
-low.cc: In function 'int proc_xfer_memory(CORE_ADDR, unsigned char*, const=
 gdb_byte*, int)':
> > > > ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected ':' =
before ')' token
> > > >  5393 |                  ? write (fd, writebuf, len));
> > > >       |                                             ^
> > > >       |                                             :
> > > > ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected prim=
ary-expression before ')' token
> > > > ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected ':' =
before ')' token
> > > >  5393 |                  ? write (fd, writebuf, len));
> > > >       |                                             ^
> > > >       |                                             :
> > > > ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected prim=
ary-expression before ')' token
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/670=
3/steps/11/logs/stdio
> > >=20
> > > Note that reproducible still failed:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/24=
38/steps/13/logs/stdio
> > >=20
> >=20
> > I looked into the configure logs on builder as I was not able to
> > reproduce here locally. Here is what I see in gdb/config.log, I think
> > this node is using buildtools stuff and seems
> > its getting libpthread.so.0 from host which needs certain symbols from
> > libc which I guess are missing because its linking libc from
> > buildtools tarball as well.
> >=20
> > configure:28568: checking for ELF support in BFD
> > configure:28588: ./libtool --quiet --mode=3Dlink gcc  -o conftest
> > -I../../gdb-13.1/gdb/../include -I../bfd -I../../gdb-13.1/gdb/../bfd
> > -isystem/home/pokybuild/yocto-worker/reproducible/build/build-st/reprod=
ucibleB/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe-sysroot-nativ=
e/usr/include
> > -O2 -pipe     -isystem/home/pokybuild/yocto-worker/reproducible/build/b=
uild-st/reproducibleB/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe=
-sysroot-native/usr/include
> > -I/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducible=
B/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe-sysroot-native/usr/=
include
> > -L../bfd -L../libiberty conftest.c -lbfd -liberty  -lncursesw -lm  >&5
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__pause_nocancel@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_dlclose@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_allocate_rtsig_private@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__nanosleep_nocancel@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_dlsym@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_siglongjmp@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_thread_freeres@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_current_sigrtmax_private@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_current_sigrtmin_private@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `_dl_make_stack_executable@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_longjmp@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_dlopen_mode@GLIBC_PRIVATE'
> > /home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86=
_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_6=
4-pokysdk-linux/bin/ld:
> > /lib64/libpthread.so.0: undefined reference to
> > `__libc_pthread_init@GLIBC_PRIVATE'
> > collect2: error: ld returned 1 exit status
> > configure:28588: $? =3D 1
> >=20
> >=20
>=20
> I have put together a test case on alma8-ty-1 node under /home/pokybuild/=
khem
> if we try to link a .so which has libpthread.so.0 in DT_NEEDED
> sections ( libzstd.so in gdb case) that's when problem is seen.
> gcc from buildtools tarball mixes things in a somewhat confusing way.
> Where it brings libpthread from host's /lib64
> and libc from buildtools tarball install and this combo does end up in
> knots resulting in above errors. if we add -pthread to gcc call then
> it uses
> libpthread from correct path ( which is from buildtools tarball )
>=20
> I can see a workaround is to add -pthread to CC/CXX/LD in gdb-cross
> but that just hides the problem IMO, I think gcc from buildtools
> tarball
> is not behaving as expected and that should be investigated further
> builds without buildtools tarballs work fine.
>=20
> Unrelated to this but relevant for sure I also saw a patch to fix a
> meta-oe recipe from Joshua
>=20
> https://patchwork.yoctoproject.org/project/oe/patch/20230222165122.148964=
5-1-JPEWhacker@gmail.com/
>=20
> which could be suffering from the same problem as above which he is
> trying to fix by adding -pthread to ldflags.

The test case really helped, thanks Khem.

I ran it under strace and noticed the paths were /etc/etc/ld.co.conf
within buildtools. That was meaning it was searching in the non-
relocatated paths for libpthread. If I added the file, it fixed things.

I've sent a patch to binutils to fix the nativesdk variant. I've also
rebuild buildtools with that fix, tested it with the test case and it
worked. I therefore updated the helper config to use the new buildtools
and am trying a full build with that as well as testing on alma8 with a
reproducible build.

Hopefully that gets to the bottom of things!

Cheers,

Richard



