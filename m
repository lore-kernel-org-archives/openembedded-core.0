Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA84C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 17:50:10 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.30711.1677606608615592629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 09:50:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IkCYmCaj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q16so10671707wrw.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 09:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ydExzQl9m3QIrgGGj6/10uDPfkIY3tehawXw47xLLC0=;
        b=IkCYmCaj/hIrA/6nFE6jgchK01QF1xdDXPwzZAi/LBmizO4sENmANWTZYqqgG9pQhB
         ZETiP6OnioBd8GnsWLDSbGBFZW9zb6ZJWAUKQZ53iaL9bRnyLG+3Iw2ncQq64ue5NStv
         mqMZ+9QpxyA7pILepQqPwbgNdyHq93H76lhco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydExzQl9m3QIrgGGj6/10uDPfkIY3tehawXw47xLLC0=;
        b=gI7VCfgHn+HYv9UoiPi4qY5QxBEmSWzR8VMqJWaI+Nom3XGrwxXtenxn2ASg/ulX2+
         ENCdt48YsG2hRbfSO1Qv5Fr3+ozbQ+J8estzp3/V677NyAHA5bfe/q0dnoDEIhXnQc1u
         nDiE8wwAY7KOxaQNUA0ryAI9f3+/GMXB1fiImLlYJL1AgTh126gtGx9LLTYvbiDgbItb
         bNa2snHoxMzM73nrEX1wumjwx1dg+DveUYTBfe+xYXm7jPkdvRgIsGEiulC7tEKjgpoM
         oo13EDSS0gXdtudC80XIT2Z7PBtLIYYdL/wfvf9Y7jANUxy9c5rGXdHMLm9MnISj4NtU
         2qyQ==
X-Gm-Message-State: AO0yUKUa8O6NHJafBw9zIZ81uGAIC5QyPbYZ9xsgXOcm6cLEHf3BQZ8w
	f9ZjOnEBmKyuIMK949QPyjBHbQ==
X-Google-Smtp-Source: AK7set+ZE9LiU+dQzCJ8brUVEJZ/75Mtndqj8u19oozLrffk9uN8YukHzqdN8+afBRFWvn3bUWjH0w==
X-Received: by 2002:a05:6000:38e:b0:2c5:4c9f:cf3b with SMTP id u14-20020a056000038e00b002c54c9fcf3bmr10582489wrf.7.1677606606902;
        Tue, 28 Feb 2023 09:50:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11? ([2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11])
        by smtp.gmail.com with ESMTPSA id y14-20020adfee0e000000b002c71b4d476asm10612524wrn.106.2023.02.28.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 09:50:06 -0800 (PST)
Message-ID: <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2023 17:50:05 +0000
In-Reply-To: <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <Y/4pZDsT0R9iSH+m@mail.local>
	 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 17:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177846

On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >=20
> > Hello Khem,
> >=20
> > As discussed I gave it a go again and got this:
> >=20
> > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: li=
nux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_corefile=
_thread_data*)':
> > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_elf_build_=
thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std::unique=
_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: li=
nux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, int*)':
> > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_elf_make_t=
desc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > collect2: error: ld returned 1 exit status
> > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/buil=
d/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gn=
ueabi/gdb'
> > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/buil=
d/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gn=
ueabi'
> > > make: *** [Makefile:1005: all] Error 2
> > > ERROR: oe_runmake failed
>=20
> Is this host running updated buildtools tarball after the binutils ld
> search path fix ?

Yes, it should be.

Cheers,

Richard

