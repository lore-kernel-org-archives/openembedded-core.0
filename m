Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D740CC7EE30
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 13:18:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.15026.1677763118566484352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 05:18:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g3FeybMW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id c18so10670498wmr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56zy7TkwUo5Eqlow3jsFkxHqiPWvXhlNuZz5vSiBLmE=;
        b=g3FeybMWZY+dJdD1aORSW4QqWWo7wO9ttH52ERoRnDBpfN1X1nxyD3Sv5IbSaQe2rJ
         TXy+AbnVZEn+5rNdFamDqIbY3wiGy8OcvckRz91PV4X9+zdH20dh9ujfw96mdSdn5ALR
         vnveOaLGZ9Kp995Y/kIFPoUXo24JkVCR7kOPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56zy7TkwUo5Eqlow3jsFkxHqiPWvXhlNuZz5vSiBLmE=;
        b=IScWFT65i04WfySa3A3V1xFCNYniq12PtSI/L39DhzFzjVBpLMKVPvNdWv0oek7hgM
         LUcsaC/PKsDx8K0s7Z2Wcxwmh0TLsy45jZ3DkOVO/qt3ZHOmj2BAw+fZM5Kmu2/iAVu0
         sKMNH8+m4y0eov4GsSQj2B6OaSzOUNBQQF/0SfsUMARWH5M0RzNpRA5F0nsgplHMyK+M
         O169+QJd4hw0LyyMPc8bF5CtWNvjeiYH3PehFgaeMBmift56cYNJXvgPO3eABtdl+b78
         l3e6hbStmrclOZ95CnDqNl2ltN8Jrul5LDvPgBeTrYMyO7fnGS6kDx9gzrhK65Y5ynV8
         A0+A==
X-Gm-Message-State: AO0yUKV2Yi3uXoxK6Jo5Qzu0Wn/CJW3QCl+sFsURemHUrEOS7WoBMlWr
	KMLTvsoh3Mr/wRXXNc0786u/9g==
X-Google-Smtp-Source: AK7set/9pPXrxeLtPTKDs2Wfariv4gEamtl+jiCZDTUtlmAQaWyf+Rn7t2V/LqbEXSMzBT9smoEo0A==
X-Received: by 2002:a05:600c:3417:b0:3eb:29fe:f912 with SMTP id y23-20020a05600c341700b003eb29fef912mr7743166wmp.36.1677763116970;
        Thu, 02 Mar 2023 05:18:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:91b1:734c:7703:c5ab? ([2001:8b0:aba:5f3c:91b1:734c:7703:c5ab])
        by smtp.gmail.com with ESMTPSA id iz16-20020a05600c555000b003e21638c0edsm2962184wmb.45.2023.03.02.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:18:36 -0800 (PST)
Message-ID: <b8cca32f7f84c5e5ec3a5cc4809bd86ad07eb722.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj
	 <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 02 Mar 2023 13:18:35 +0000
In-Reply-To: <ZACLUF3CCWTAerRu@mail.local>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <Y/4pZDsT0R9iSH+m@mail.local>
	 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
	 <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
	 <Y/6D8FQZMWzf4TZq@mail.local>
	 <17484164C4F9625C.21178@lists.openembedded.org>
	 <ZACLUF3CCWTAerRu@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 13:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177963

On Thu, 2023-03-02 at 12:41 +0100, Alexandre Belloni wrote:
> On 01/03/2023 10:25:58+0100, Alexandre Belloni via lists.openembedded.org=
 wrote:
> > On 28/02/2023 23:45:05+0100, Alexandre Belloni wrote:
> > > On 28/02/2023 17:50:05+0000, Richard Purdie wrote:
> > > > On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> > > > > On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> > > > > <alexandre.belloni@bootlin.com> wrote:
> > > > > >=20
> > > > > > Hello Khem,
> > > > > >=20
> > > > > > As discussed I gave it a go again and got this:
> > > > > >=20
> > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttool=
s/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_=
corefile_thread_data*)':
> > > > > > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_el=
f_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std=
::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttool=
s/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, =
int*)':
> > > > > > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_el=
f_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, =
int*)'
> > > > > > > collect2: error: ld returned 1 exit status
> > > > > > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > > > > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemu=
arm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-=
linux-gnueabi/gdb'
> > > > > > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > > > > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemu=
arm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-=
linux-gnueabi'
> > > > > > > make: *** [Makefile:1005: all] Error 2
> > > > > > > ERROR: oe_runmake failed
> > > > >=20
> > > > > Is this host running updated buildtools tarball after the binutil=
s ld
> > > > > search path fix ?
> > > >=20
> > > > Yes, it should be.
> > >=20
> > > Khem, you are probably right that this is host related, this failed
> > > again on ubuntu2004:
> > >=20
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/668=
9/steps/14/logs/stdio
> > >=20
> > > I'm wondering whether this reproduces on master and we have simply be=
en
> > > lucky.
> >=20
> > This doesn't reproduce on master on ubuntu2004 so I guess it is really
> > cause by the binutils upgrade.
>=20
> I was wrong, it just reproduced on master, debian11-ty-3:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6730/st=
eps/15/logs/stdio
>=20

I went digging and the gdb/config.log file shows:

configure:28568: checking for ELF support in BFD
configure:28588: ./libtool --quiet --mode=3Dlink gcc  -o conftest -I../../g=
db-13.1/gdb/../include -I../bfd -I../../gdb-13.1/gdb/../bfd -isystem/home/p=
okybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cross=
-aarch64/13.1-r0/recipe-sysroot-native/usr/include -O2 -pipe     -isystem/h=
ome/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-=
cross-aarch64/13.1-r0/recipe-sysroot-native/usr/include -I/home/pokybuild/y=
octo-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cross-aarch64/1=
3.1-r0/recipe-sysroot-native/usr/include -L../bfd -L../libiberty conftest.c=
 -lbfd -liberty  -lncursesw -lm -ldl  >&5
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /home/=
pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cros=
s-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined refer=
ence to `pthread_join@GLIBC_2.34'
/home/pokybuild/yocto-worker/qemuarm64/build/build/tmp/hosttools/ld: /home/=
pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/x86_64-linux/gdb-cros=
s-aarch64/13.1-r0/recipe-sysroot-native/usr/lib/libzstd.so: undefined refer=
ence to `pthread_create@GLIBC_2.34'
collect2: error: ld returned 1 exit status

which is the same issue as we saw previously.=C2=A0

The really big difference here is that debian11 doesn't have buildtools
so this is with the host's ld and libpthread.

I'm guessing this is a libzstd linked on a more recent system which
then doesn't work against this older host libc. The one in uninative
could help and would likely resolve things, but isn't involved at this
point in a build. Not sure what the right fix is here.

Cheers,

Richard



>=20

