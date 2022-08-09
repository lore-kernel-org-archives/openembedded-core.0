Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD29C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 20:00:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.263.1660075209672592802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 13:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFc/Xvos;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n4so13701312wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=2bt5EOsJToxB3FjQiJxoyfYS7UJKlf8Ze8DF0AhuLzk=;
        b=KFc/XvosV18+UPhwtvqvauHcS9mjhfmClnLfb5FhHAuVat+GsBQpFfAxdVwUutzcp9
         /cAn3SPrHx7I5Thu/TuNxmkarYRF7Typ+2I11L/S0q1xETOhP/hdJD1dEWdT9Ikbqrq/
         jx1xLfNLW8t/j5BIh0uroivM/7gVlABRu/Rc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=2bt5EOsJToxB3FjQiJxoyfYS7UJKlf8Ze8DF0AhuLzk=;
        b=6Eg2aqdBj76OL7MX/5j7vkDnaeQDXCCRepO/Sz4TZJeXLaTcQ0Qpkhd7hdK7/MyymL
         dIYx6y84BA8/hE69NuK583p0CWBA8W2uwZCDmUkPK8AY7Yw3mnV6nJVsfnIgc3j0YrdD
         CDQJAThI9uATsOUFYGK9ejRe2AaJFM9bqj5b37FgQfBEABofk0fSt2jGwHS9ukj7Ry1y
         jpzlKc0IiM4KfdJpUxo4lPve6dyodwviHX3I379Xu8oGQFh+1A2mKhcYgjaBxfA3pCZ8
         tN9t0pQ6hGgueNF+HovrHSOFjmiVoyrNWf/FynFlIn+Eax441ZIQqyt8+b6yhkX9ozkC
         PqQA==
X-Gm-Message-State: ACgBeo2S6vmcUaHigg2VxtuaF8tL9hvghlNKbnDGGWWUw9FofZFiY7SB
	jJ0EMG6fwMIaEStsVLPHX5fqVQ==
X-Google-Smtp-Source: 
 AA6agR4biK82eRhvtf7pyTd/OY9i8PeEYTrRs2aiUoS4YteEe/oRTSDIFMy1VppYobRkoy3hmYu2Ig==
X-Received: by 2002:adf:ce89:0:b0:220:6cc5:aff8 with SMTP id
 r9-20020adfce89000000b002206cc5aff8mr15368685wrn.396.1660075207902;
        Tue, 09 Aug 2022 13:00:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78b2:407:e1aa:2bc?
 ([2001:8b0:aba:5f3c:78b2:407:e1aa:2bc])
        by smtp.gmail.com with ESMTPSA id
 6-20020a1c1906000000b003a511e92abcsm18177529wmz.34.2022.08.09.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:00:06 -0700 (PDT)
Message-ID: 
 <98105f0e26a0b19e6bc890789c127f169dcbe621.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/13] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2022 21:00:06 +0100
In-Reply-To: 
 <CADkTA4PMGK-QRLpZYXN+mU0g-b0oLcm0Q8CdeGzpLWWdkKFdUg@mail.gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
	 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
	 <CADkTA4PMGK-QRLpZYXN+mU0g-b0oLcm0Q8CdeGzpLWWdkKFdUg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 20:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169162

On Mon, 2022-08-08 at 23:44 -0400, Bruce Ashfield wrote:
> On Mon, Aug 8, 2022 at 3:38 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Bruce,
> >=20
> > On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> > > As I mentioned earlier today, I've built and booted the 5.19 kernel
> > > on all architectures, have run core-iamge-kernel-dev, core-image-sato
> > > and validated musl.
> > >=20
> > > At this point, we need wider coverage to scare out the remaining
> > > gremlins.
> > >=20
> > > I'm also sending update to 5.10 and 5.15 in the pull request, since
> > > these are the retbleed stable updates, and I didn't want to sit on
> > > them any longer. These are of course independenct of the 5.19 work.
> > >=20
> > > I found one issue with vboxguestdrivers in meta-oe agains the new
> > > kernel/headers, and I've sent a patch to that mailing list. I also
> > > had to fix lttng-modules (as usual) and have sent a patch to that
> > > mailing list as well.
> > >=20
> > > devsrc needed a few tweaks as well, and they are included in the
> > > series.
> > >=20
> > > Note: I've mixed in the poky / meta-yocto patches as part of this
> > > pull request, just for ease of sending it for wider testing and to
> > > see if I missed any references to 5.10 or have left any else
> > > dangling.
> >=20
> > We've had a few autobuilder issues but I did run this through with
> > other changes. The logs were a mess but I think I see three issues
> > which are likely kernel related. The first kernel module issue happened
> > a lot, the other two were more isolated to oe-selftest or a single
> > failure.
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4999/=
steps/16/logs/stdio
> >=20
> > RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (19.=
47s)
> >=20
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   [Previous line repeated 2 more times]
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/runtime/cases/kernelmodule.py", line 46, in test_kernel_module
> >     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> > AssertionError: 2 !=3D 0 : cd /tmp && make
> > make -C /usr/src/kernel M=3D/tmp modules
> > make[1]: Entering directory '/lib/modules/5.19.0-yocto-standard/build'
> > /bin/sh: -c: line 1: syntax error near unexpected token `('
> > /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.1.0" !=3D ""aarch64-poky-linux=
-gcc (GCC) 12.1.0"" ]; then \'
> > make[1]: Leaving directory '/lib/modules/5.19.0-yocto-standard/build'
> > make[1]: *** [Makefile:1728: prepare] Error 2
> > make: *** [Makefile:5: all] Error 2
> >=20
>=20
> Patch sent.

Just to round things off on the list, there was one further issue which
I sent a patch to kernel-devsrc for. With that fixed we could merge
5.19 for core for master, thanks!

Cheers,

Richard

