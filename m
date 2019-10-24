Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1677F8EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:38:15 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q70so14907522qke.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FscOkU58B1FmFoTRcWuGf4Uwn046z1AyTPLKFehSuoA=;
	b=JPDZm/2SWyu+rP98l189atPXANJpn0koTqLP0YUKDKrNFv+WZJ15QN5j5P1obajQRf
	I2BI69gdt4PIwMMEJE9jTeAN4wLyVYbyJFDc5f9cLKkjyC8BdLQfaaRBx+1Ub3CnA0pJ
	AFSIHTiUsi32fmZs/fizDSomBmG6EyBfuWNbwRm/cUC456RQIZOem/p+EecAumx+qg42
	U1MyB1zObFMdPSKt/Gixu1GC49vzLl21sCPzFvD+IH4x/xg1kRfkW0S2KJBII5/t/DgE
	L0g+MIwY7uzDpcqx3LLiEr+63IfEP+kgS23TQxmEYjYOwdAh6VhoBz9LWKvpotDSjrt+
	rD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FscOkU58B1FmFoTRcWuGf4Uwn046z1AyTPLKFehSuoA=;
	b=Q2JCQkPNeDfIKitnGFrZmAzJH/sJX/tsbS5kHBMUkEA2ZAB4BPkhrQsfR/Db4yE3ed
	Vc68woUgN27Pfz4X9SeHXxh4G3YeJ6R5ub9yN79xHL+lMI1kfTNJQk0KVqPVkNpdR/6o
	w2SPJa6pXqkH+RcaNUEvbFnyizkG4tU1nED3Mg8zf2gAaOBfeLkZpywH3c6OssYmYi8o
	r8qe78Vnkd5zhcOJ+gc9lScHUHVoEJZGnV2gab4fwvwcyVtIsNpmp1Q39izAlVEXcSKA
	i/kg5UTf45w/PzYbr75yCXOKSh/L5KxVyjuoCN5SeeNHTprNe7CIC4ixmYACEitTw2j0
	2SKA==
X-Gm-Message-State: APjAAAXl7dw/ii+g0KmaPpBlqxF/vtNtObwO/1mBljImvNomv6GRRfoM
	/uuwFyr0pB1rarC68ZZPj13D87EKLlshIrpTITw=
X-Google-Smtp-Source: APXvYqz0UXk7sZxrx+Lh4fHhfEQsKSC3DNsQMWR0tiSVOwF9sMyx4l4y7XthXzvgOA/R34NbHxQ4cX8ipu3rlzhY/W4=
X-Received: by 2002:a37:b985:: with SMTP id
	j127mr12319647qkf.337.1571899095661; 
	Wed, 23 Oct 2019 23:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
In-Reply-To: <CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 07:37:48 +0100
Message-ID: <CAMKF1srQTs1EEJK40No03JwieBtt=Ym+_mG35dVa=TF=Q_9kmQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Thu, 24 Oct 2019 06:38:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 11:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > > On 23/10/2019 14:03, Khem Raj wrote:
> > > > Hi Richard
> > > >
> > > > New master-next I see these fails
> > > >
> > > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > >
> > > > First two are important one's we already know why
> > > > ti-display-sharing-fw fails to fetch
> > >
> > > ERROR: QA Issue: libiio: Files/directories were installed but not
> > > shipped in any package:
> > >    /usr/lib/python2.7
> > >    /usr/lib/python2.7/site-packages
> > >    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
> > >    /usr/lib/python2.7/site-packages/iio.pyc
> > >    /usr/lib/python2.7/site-packages/iio.py
> > >
> > > That may have been triggered by some change in oe-core but that's
> > > definitely an issue with libiio.
> >
> > Its from this cmake change:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
> >
>
> I think its causing more failures, where suddenly, the recipes are now
> resorting to native python, is this patch correct I wonder ?
>
> see
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
>
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4

more fallouts
https://errors.yoctoproject.org/Errors/Details/274418/
>
> >
> > >
> > > WARNING:
> > > TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > > r0/temp/run.do_configure.7679:1
> > > exit 1 from 'NO_FETCH_BUILD=1
> > > TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > > r0/recipe-sysroot-native/usr/bin/python3-native/python3
> > > setup.py clean'
> > > ERROR: Execution of
> > > 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > > r0/temp/run.do_configure.7679'
> > > failed with exit code 1:
> > > Traceback (most recent call last):
> > >    File "setup.py", line 17, in <module>
> > >      setup(**config['options'])
> > >    File
> > > "TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> > > r0/recipe-sysroot-native/usr/lib/python3.7/site-
> > > packages/setuptools/__init__.py",
> > > line 145, in setup
> > >      return distutils.core.setup(**attrs)
> > >
> > > Looks like whatever astor is doing with setuptools doesn't agree
> > > with the upgrade to 41.4.0?
> >
> > Yes, I can confirm that reverting
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b9703df2853e72b974a63ef1146f09a6c197990d
> > locally does make it build again.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

