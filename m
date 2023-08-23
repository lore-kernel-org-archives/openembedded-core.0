Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9D4EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:26:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11390.1692797197508163164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fBf0za/Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso2195165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692797196; x=1693401996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIb3EQmojKsOcRAcQBT3oAO82nUTz9TcxdTKxIat+c8=;
        b=fBf0za/Z+cANpwccKi9wVMsq5XEGn47PcJvQcNO22bUlLc8VFrDmxgSU6FeVDX/Z83
         tXycG7S+Kw0JDW4In9Ce2lTadrcSsLrT4gbKnxw0+p0VJ5qeUfYeDVOsddT4mXTqO/QB
         /TmM2kqbklzF9ktXcbDS+EbF0cw6hm3OJiO0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797196; x=1693401996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YIb3EQmojKsOcRAcQBT3oAO82nUTz9TcxdTKxIat+c8=;
        b=J1r3yjCRhRszXVZERk6Ah4VBDGHdFJRnexTjlkUG7svOVzPWWHwBDP9o9d8+WcuKS7
         mlwWzzZ+TLFY930XL3lmxNIhtC7WRRtdXZBdtRsWELRBz0VIgqreFEhRnZc8/X1KOlNX
         +dZwHfkNIPKwC9y8faT/CvGDoLMwx31UUvkTp+AL3hZG9aP7h2F6jrk5c4CIVGdoUE45
         w2a4HfSBzSWPCJ3rod8KT+Gnzxzka4epLUaTQhZKUkwsjg0jSns4V5hnK6iailqzxNCz
         zfAo1sjXXIQjAdqEf8HDGLLGqHPixiAcfWhzd54N0a2yruJF4yO3tNcYH93iTzTcvmXl
         j3SQ==
X-Gm-Message-State: AOJu0YyKEiV1O4SFh4BqMxCrNYSblQGDWq6jUhanNticp/jowEJdrnUO
	t46jlxaz5Naql4wswkp5tmR0IA==
X-Google-Smtp-Source: AGHT+IGhENMpKMhA1gRGCfwex0Y1R19LqAJLGQwy+OvUHMWme57gK8hnSVQ/jYLhhT/tadduNBOlxw==
X-Received: by 2002:a7b:ce0a:0:b0:3fa:8fb1:50fe with SMTP id m10-20020a7bce0a000000b003fa8fb150femr9992316wmc.15.1692797195914;
        Wed, 23 Aug 2023 06:26:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af? ([2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b003feef82bbefsm10925898wmj.29.2023.08.23.06.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:26:35 -0700 (PDT)
Message-ID: <fe6796ac3794f4723ce799be5e8c3d9cc278b7f8.camel@linuxfoundation.org>
Subject: Re: openssh ptest banner failure (was Re: [OE-core] [PATCH v2 2/9]
 testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS )
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Alexander Kanavin
	 <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2023 14:26:34 +0100
In-Reply-To: <ZOYDPQgCfD8PyWmD@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
	 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
	 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
	 <ZOW1tEl+PiOK09l/@nuoska>
	 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
	 <ZOXVyxiqDDnjCp61@nuoska>
	 <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
	 <177DFD85A9F91D1D.28529@lists.openembedded.org> <ZOYDPQgCfD8PyWmD@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186577

On Wed, 2023-08-23 at 16:01 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Wed, Aug 23, 2023 at 01:49:39PM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > The tests passed with one warning, which I'll try to check:
> >=20
> > WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: There were faili=
ng ptests.
> > Traceback (most recent call last):
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py=
", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py=
", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py=
", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", l=
ine 27, in test_ptestrunner_expectfail
> >     self.do_ptestrunner()
> >   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", l=
ine 120, in do_ptestrunner
> >     self.fail(failmsg)
> > AssertionError:=20
> > Failed ptests:
> > {'openssh': ['banner']}
>=20
> Has this openssh banner test on x86_64 been failing on yocto autobuilders=
?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15178

so yes, it has. Not always but sometimes. We do try and ensure there
are open bugs for any issues although I'm aware the current qemuppc one
does not have a bug as yet.

Cheers,

Richard

>=20
> Log tmp/work/qemux86_64-poky-linux/core-image-ptest-openssh/1.0/temp/log.=
do_testimage
> shows:
>=20
> PASS: environment passing
> run test transfer.sh ...
> PASS: transfer data
> run test banner.sh ...
> test banner: missing banner file
> test banner: size 0
> test banner: size 10
> test banner: size 100
> test banner: size 1000
> cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
> banner size 1000 mismatch
> test banner: size 10000
> test banner: size 100000
> test banner: suppress banner (-q)
> FAIL:  banner
> make: *** [Makefile:223: t-exec] Error 1
>=20
> On manual execution this passes:
>=20
> $ runqemu slirp nographic novga core-image-ptest-openssh
> ...
> root@qemux86-64:~# ptest-runner
> START: ptest-runner
> 2023-08-23T12:04
> BEGIN: /usr/lib/openssh/ptest
> ...
> PASS: transfer data
> run test banner.sh ...
> test banner: missing banner file
> test banner: size 0
> test banner: size 10
> test banner: size 100
> test banner: size 1000
> test banner: size 10000
> test banner: size 100000
> test banner: suppress banner (-q)
> PASS: banner
> ...
>=20
> client rekey tests are still running.
>=20
> Cheers,
>=20
> -Mikko
>=20


