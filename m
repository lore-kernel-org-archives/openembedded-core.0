Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 260957F9BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:34:46 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n15so14463709wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=p526RwZQbd/S+IobcHO08WbAYlIsxJuXhKyNFrPcurg=;
	b=bm4fP6lyj49ekx4hoeWoOYF+NFUkS/tKMTdfyVfglcz03PZYIhQ5riIZw+ypW74cSy
	a8zHwgQLORr6CvUEH5gM+KndmmiOuE/gSczvIev9toRamx+n8fmzEvqegEVwhTE8P/SF
	a+xdhqH7A5ibi5wKTuazRiKoYUoLBb0MPRxt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p526RwZQbd/S+IobcHO08WbAYlIsxJuXhKyNFrPcurg=;
	b=maswwI/IkknTDVOfa8VryoLlv1uWMRfbW2vozEwwYj2YDHiW8ZpOOs4jsNjlt2fIog
	08mnmVwe5P0VLvAgfvlENZpq/nDUhTQTrh2cUNrFfuE6L8R2KcVFAS8rZTj36E9lSTVt
	+oq11o+Zbd4I8WNHf08l4tLleBYp6gBqzVBsEjF4elfc8twUFI4aA8s7WOXd169BasuN
	lFFjtlSfjjqBpItzzCleSvFhf8WxzX3p0e7RoEVCELYy8Nno6i8Zvuy5EdZRGrYHz3OE
	Q4YwjuUEPNPN3YWce/HcS+w6oyO0uzK+qmfHkCjlK6YSK1OTT6TYrxfnInnbYoabm20J
	9GRg==
X-Gm-Message-State: APjAAAV+lI8s/yWUhuq1nhLvNvxfOYkv2MZcjUt6QRU2Yw0z5VVhcSGT
	Cfxo+0uD0BlEKNtBjeH/akriYA==
X-Google-Smtp-Source: APXvYqyVzrFUVEWif/d3B4o82ELtPxqMa55DVvMuOF8YElusS2jsKW4wO7YzrCqZCOFwqH3STtvXqA==
X-Received: by 2002:adf:f686:: with SMTP id v6mr3119638wrp.141.1571909686674; 
	Thu, 24 Oct 2019 02:34:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q25sm12349033wra.3.2019.10.24.02.34.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 02:34:46 -0700 (PDT)
Message-ID: <3c6cf1039b1c9e4acee78f420ac6c94b5895db02.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 10:34:44 +0100
In-Reply-To: <CAMKF1sou7hfrYGM92AS-6FoZsy+dDWD_hanOfB0LNDYoV5=BHQ@mail.gmail.com>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
	<CAMKF1spQaeeoT-kUX9B0bYb_-29AVbnQD-7z7JcmL-2jK_1PUQ@mail.gmail.com>
	<6eb13feb2a0ad43d1cdba47f9dbeff47a4de7fb4.camel@linuxfoundation.org>
	<CAMKF1sou7hfrYGM92AS-6FoZsy+dDWD_hanOfB0LNDYoV5=BHQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 24 Oct 2019 09:34:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 09:34 +0100, Khem Raj wrote:
> On Thu, Oct 24, 2019 at 9:25 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Thu, 2019-10-24 at 09:20 +0100, Khem Raj wrote:
> > > On Thu, Oct 24, 2019 at 9:15 AM <
> > > richard.purdie@linuxfoundation.org>
> > > wrote:
> > > > On Wed, 2019-10-23 at 23:52 +0100, Khem Raj wrote:
> > > > > On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > > > > > > On 23/10/2019 14:03, Khem Raj wrote:
> > > > > > > > Hi Richard
> > > > > > > > 
> > > > > > > > New master-next I see these fails
> > > > > > > > 
> > > > > > > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > > > > > > 
> > > > > > > > First two are important one's we already know why
> > > > > > > > ti-display-sharing-fw fails to fetch
> > > > > > > 
> > > > > > > ERROR: QA Issue: libiio: Files/directories were installed
> > > > > > > but
> > > > > > > not
> > > > > > > shipped in any package:
> > > > > > >    /usr/lib/python2.7
> > > > > > >    /usr/lib/python2.7/site-packages
> > > > > > >    /usr/lib/python2.7/site-packages/libiio-0.18-
> > > > > > > py2.7.egg-
> > > > > > > info
> > > > > > >    /usr/lib/python2.7/site-packages/iio.pyc
> > > > > > >    /usr/lib/python2.7/site-packages/iio.py
> > > > > > > 
> > > > > > > That may have been triggered by some change in oe-core
> > > > > > > but
> > > > > > > that's
> > > > > > > definitely an issue with libiio.
> > > > > > 
> > > > > > Its from this cmake change:
> > > > > > 
> > > > > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
> > > > > > 
> > > > > 
> > > > > I think its causing more failures, where suddenly, the
> > > > > recipes
> > > > > are
> > > > > now
> > > > > resorting to native python, is this patch correct I wonder ?
> > > > > 
> > > > > see
> > > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
> > > > > 
> > > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4
> > > > 
> > > > The cmake change makes python visible from HOSTTOOLS. That
> > > > isn't
> > > > wrong
> > > > as such, it is a change in behaviour. If recipes don't set
> > > > python
> > > > enabled/disabled explicitly, there is some fallout from that.
> > > > I'd
> > > > say
> > > > that is a bug in those recipes which aren't giving explicit
> > > > configuration to dependencies though.
> > > > 
> > > 
> > > So now the behavior is interesting. It works fine if I build for
> > > a
> > > machine where host-arch = target-arch
> > > so if someone is building for x86_64 then they dont see the build
> > > failures. IMO thats worse.
> > 
> > That is a general problem with cross compiling and applies to any
> > automatically detected dependency from the host. Python is in an
> > odd
> > place here since we do need it on the host to run bitbake and there
> > are
> > places where we need that exposed to code (e.g. they have python
> > scripts), there are places where we don't want it exposed as host
> > contamination.
> > 
> > Have you looked at the buildhistory logs to see what changed in
> > meta-oe
> > as that would likely highlight the changes.
> 
> well nothing has changed in meta-oe as such to cause this issue.
> Since now we expand where all cmake can look for development headers
> and libraries, it happily finds then it native sysroot earlier it was
> guarded from looking into native sysroot. So its cmake not
> differentiating if its mixing two sysroots now, which is not new for
> cmake, it has to be given certain paths.

No, cmake has always looked in the native sysroot. What the patch
changes is whether HOSTTOOLS are seen or not. The exact change is:

-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN} ${HOSTTOOLS_DIR})

It already looks at native, cross and external tools, just not
HOSTTOOLS_DIR. This does look very much like an omission and would
break ASSUME_PROVIDED usage for example so it does fix a real world
issue I can imagine people running into.

> So yes when headers and libraries for python are set to point to
> target sysroot then you aid it to look
> into right sysroot but I think it might become a pain point in future
> where someone will test it on x86_64
> and think it builds and works where as it will be implicitly wrong.
> We can fix what we know but that is not all.

Agreed, but that is a problem we already have and is why we do ask
people test another arch. Its also why we ask people to list
dependencies and explicitly enable or disable them.

I do understand what you mean but I don't think it changes much as its
the same general problem the project has always faced and continues to
face.

If you want to propose the patch be reverted, you can however I'm not
really seeing a case for it myself.

Cheers,

Richard




