Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 697A87F8F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:21:06 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u184so22666534qkd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dI7H5IS9HSXMcPjk7vFkSI4rtNAkxIiFAh0pakVu9Ak=;
	b=d21CpbE4Fl5IsgK5de3RCYaXSssjT4r6CWICxQ61/SPdd/f1Zcnpk0MsoAFZ5/v7NV
	wVFsSCo/EWiWRDGIoJ2gCJWYe2djc8/6Li6+h0cP4CebuxowxTAspxtPW+pHSmoDt+/n
	JcDKV/Dn0BRAcUka9M0mJhMi3XqT0E+ny8oOgdgrWwKx4I/K0fd1a3Lq0Whzy4MVQVkt
	bHYhA4iUU83obtOLKoHq7ZVc4ceeCcoQ9cZSUhWwjVBD5Dna+GUR1kAatpOVtSN94eTQ
	Kd7QX7x5DkfanrRb9XO8Zy51WwoiHYy2CmDukY+GION/vBVwkw29sWfH6MMqjmzASyyl
	PCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dI7H5IS9HSXMcPjk7vFkSI4rtNAkxIiFAh0pakVu9Ak=;
	b=HXROnK167DL5Tdv3ArXDWOs/aJ84cRgP00vFWPKZ/8WN3EoWyga2E0bPILninuumDS
	iKnzDU16aUglmgcBP1upvRPT37lzk2ApQyVzwkQYWRa6YzdrGKp7pWs9pDiFJjED+LrU
	QVLWISrhQIWlUYrpxf8xCw9WZxpfpRM+oVhWV+VIrKTCAC4aDgHJuiiUVK4w4Z0NwlUd
	SyqGcmD0L4jHkZYlaKvTbcS/piLE/MYNlO86AOfyHLw5HjfQLhiGI0EnxuKTk5eTaJNX
	vVYiQZfQ7ikL1YWJm2aowBoMdUahc3BCtv1EloxWZ2yRjDO1lHQxIcA2v1d4Mqxyxqbg
	JTNw==
X-Gm-Message-State: APjAAAWxMj8rIoskX1xYC8QMw+fv5LxNpLi6P8QqasN+V306KLu58UXN
	e7IxK+SUbP7yNGpvZOqB6ZBv3WzsWvhuvLwkTAs=
X-Google-Smtp-Source: APXvYqzuIfQX/QK+2gTM4sWcz4RiLSb27OWCo2QSKuuA0GtsXcgU3LZcWh4qbxHMTX8ubuvWiu4Avjgan0oJO2kLvlw=
X-Received: by 2002:a05:620a:20d2:: with SMTP id
	f18mr12855844qka.474.1571905266949; 
	Thu, 24 Oct 2019 01:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
In-Reply-To: <25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:20:40 +0100
Message-ID: <CAMKF1spQaeeoT-kUX9B0bYb_-29AVbnQD-7z7JcmL-2jK_1PUQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 08:21:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 9:15 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-10-23 at 23:52 +0100, Khem Raj wrote:
> > On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > > > On 23/10/2019 14:03, Khem Raj wrote:
> > > > > Hi Richard
> > > > >
> > > > > New master-next I see these fails
> > > > >
> > > > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > > >
> > > > > First two are important one's we already know why
> > > > > ti-display-sharing-fw fails to fetch
> > > >
> > > > ERROR: QA Issue: libiio: Files/directories were installed but not
> > > > shipped in any package:
> > > >    /usr/lib/python2.7
> > > >    /usr/lib/python2.7/site-packages
> > > >    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
> > > >    /usr/lib/python2.7/site-packages/iio.pyc
> > > >    /usr/lib/python2.7/site-packages/iio.py
> > > >
> > > > That may have been triggered by some change in oe-core but that's
> > > > definitely an issue with libiio.
> > >
> > > Its from this cmake change:
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
> > >
> >
> > I think its causing more failures, where suddenly, the recipes are
> > now
> > resorting to native python, is this patch correct I wonder ?
> >
> > see
> > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
> >
> > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4
>
> The cmake change makes python visible from HOSTTOOLS. That isn't wrong
> as such, it is a change in behaviour. If recipes don't set python
> enabled/disabled explicitly, there is some fallout from that. I'd say
> that is a bug in those recipes which aren't giving explicit
> configuration to dependencies though.
>

So now the behavior is interesting. It works fine if I build for a
machine where host-arch = target-arch
so if someone is building for x86_64 then they dont see the build
failures. IMO thats worse.

> Cheers,
>
> RIchard
>
>
>

