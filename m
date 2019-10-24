Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 493CB7F96E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:35:20 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id r5so36738124qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qu4xSeWrYg4ozDg1C52ChE6nErDpowPUC+JsHEqjCSw=;
	b=XUWq2tjPY7FQpd4niE+xjNhbY5B1DNBgTkl8FHI9+EOjD9Q7MzdXjGm4K0Wzr9cPGb
	W6e8HN6KO9IFp4pofiqUkN3zpZkD8Im5CC1QAhPXlka7w+TteU9j76CJHwlbKOUE0I/q
	E53QM/Ncvvc2G6Eeo9Pjo92SGqeUZAVnU9CDf6x93ru8x/5PIOS9yhBjiTeTU0mxxb6q
	hz8ABUspVW442rXHPGSQGEIrsx1IbJZHOJdWSKcc+kIkzop3BwnxTop9n/W4v+3OrBkC
	f7ViBpK28kbEPT95Cu8nKRj+pzK2cxhHr3LdfoJNOMSmQ26Vk1sYglBxhAF8kH4XGueN
	sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qu4xSeWrYg4ozDg1C52ChE6nErDpowPUC+JsHEqjCSw=;
	b=PiZYpHf3sBmTCSxHtHYiijVfKNxmirzPoefPyU0fw+tL7kyx9R6MMxeLI7UUJNZk7s
	GiCD+Ms3DWGPkMVtSpn/c/bKYkGCfhVgMenT2pj42ALwS2jQVlVJWWryWINEVtpqkAoo
	5onxZuwsbZFrnwTJjwu4O1fMPXztsAobTRSkWDw63xCRo9mu0iGp+67Tv+lsb3aIjOD5
	GiFlERnj4BRjow+dbpMXtaIV+4DVz6Vp9LJir9l9o8xqono+jOLg/jCrEQY3Vp6gloRl
	z3nkHhlZ9LefG40XHCOdGq8Kmx+s/b1HJP8bctIQYO9bLBei0S4s5vcFwrVlUbg6Id+9
	aQTg==
X-Gm-Message-State: APjAAAXa0uHTXHvHYvI1XmkVsjGz539/ULX1lbURh9S+sgk7M+buw3kb
	WXiYj+s28tVH90VwVc1pFGComZD9+XpoR+bwphg=
X-Google-Smtp-Source: APXvYqyCzg7yAQdBBWqNPoy9rQy047+5TGjdOTfrrC4n7b7UAL82FeBumuLDldyCv0G90KifzLOmXnHre5bBQKxXU+k=
X-Received: by 2002:ac8:768e:: with SMTP id g14mr2911013qtr.378.1571906120801; 
	Thu, 24 Oct 2019 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
	<CAMKF1spQaeeoT-kUX9B0bYb_-29AVbnQD-7z7JcmL-2jK_1PUQ@mail.gmail.com>
	<6eb13feb2a0ad43d1cdba47f9dbeff47a4de7fb4.camel@linuxfoundation.org>
In-Reply-To: <6eb13feb2a0ad43d1cdba47f9dbeff47a4de7fb4.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:34:54 +0100
Message-ID: <CAMKF1sou7hfrYGM92AS-6FoZsy+dDWD_hanOfB0LNDYoV5=BHQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 08:35:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 24, 2019 at 9:25 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-10-24 at 09:20 +0100, Khem Raj wrote:
> > On Thu, Oct 24, 2019 at 9:15 AM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > On Wed, 2019-10-23 at 23:52 +0100, Khem Raj wrote:
> > > > On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > > > > > On 23/10/2019 14:03, Khem Raj wrote:
> > > > > > > Hi Richard
> > > > > > >
> > > > > > > New master-next I see these fails
> > > > > > >
> > > > > > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > > > > >
> > > > > > > First two are important one's we already know why
> > > > > > > ti-display-sharing-fw fails to fetch
> > > > > >
> > > > > > ERROR: QA Issue: libiio: Files/directories were installed but
> > > > > > not
> > > > > > shipped in any package:
> > > > > >    /usr/lib/python2.7
> > > > > >    /usr/lib/python2.7/site-packages
> > > > > >    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-
> > > > > > info
> > > > > >    /usr/lib/python2.7/site-packages/iio.pyc
> > > > > >    /usr/lib/python2.7/site-packages/iio.py
> > > > > >
> > > > > > That may have been triggered by some change in oe-core but
> > > > > > that's
> > > > > > definitely an issue with libiio.
> > > > >
> > > > > Its from this cmake change:
> > > > >
> > > > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
> > > > >
> > > >
> > > > I think its causing more failures, where suddenly, the recipes
> > > > are
> > > > now
> > > > resorting to native python, is this patch correct I wonder ?
> > > >
> > > > see
> > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
> > > >
> > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4
> > >
> > > The cmake change makes python visible from HOSTTOOLS. That isn't
> > > wrong
> > > as such, it is a change in behaviour. If recipes don't set python
> > > enabled/disabled explicitly, there is some fallout from that. I'd
> > > say
> > > that is a bug in those recipes which aren't giving explicit
> > > configuration to dependencies though.
> > >
> >
> > So now the behavior is interesting. It works fine if I build for a
> > machine where host-arch = target-arch
> > so if someone is building for x86_64 then they dont see the build
> > failures. IMO thats worse.
>
> That is a general problem with cross compiling and applies to any
> automatically detected dependency from the host. Python is in an odd
> place here since we do need it on the host to run bitbake and there are
> places where we need that exposed to code (e.g. they have python
> scripts), there are places where we don't want it exposed as host
> contamination.
>
> Have you looked at the buildhistory logs to see what changed in meta-oe
> as that would likely highlight the changes.

well nothing has changed in meta-oe as such to cause this issue. Since
now we expand where
all cmake can look for development headers and libraries, it happily
finds then it native sysroot
earlier it was guarded from looking into native sysroot. So its cmake
not differentiating if its mixing
two sysroots now, which is not new for cmake, it has to be given certain paths.

So yes when headers and libraries for python are set to point to
target sysroot then you aid it to look
into right sysroot but I think it might become a pain point in future
where someone will test it on x86_64
and think it builds and works where as it will be implicitly wrong. We
can fix what we know but that is
not all.

>
> Cheers,
>
> Richard
>
>
>
>
>
>

