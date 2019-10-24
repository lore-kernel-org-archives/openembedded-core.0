Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 81FFA7F8C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:25:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g7so1732130wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=qiqKB9zS1jg1afKqionzUWOW5X4Zyg1gFHFO/KbVhiE=;
	b=Q7gYG7t10sg5whjNLDi4rJkuiQ48zd2yZwXuvFEWGIrVT6ktJTkVmQ//vEDkeI9X20
	RCyRUIrZljjAbxr2ATrsRupWJpBqKIQs20zXDh6Wxp33GfL7Z1JRv8Ks24o7N2/zG0eU
	pfNW9bm19rPQAarfgHblOyvVE9pS3MYjIlVjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qiqKB9zS1jg1afKqionzUWOW5X4Zyg1gFHFO/KbVhiE=;
	b=eEzQ8GEjoIfUCyEO1uR5V0BgpeMUvBaxrNjsSb6p51NGvIJVG1LxAAo3WHaB76hZvY
	muYyiKWQiXCLTwv5iyiyFHgaPmDPPbjAnmup9Kq9J54b7WnfHM7k1UBy69I2DaIgCdrl
	ETmYFQXnWXpgNVLcS2L9NcfF59A3TYcLJqhoRM1dL2g8C3q5+PEYjwiB2C7wBV8KPhI3
	0HfqniJ5iOTehHPJR01YXhJ0SmlcbiDlPmp9cUYFkqDAjiLumH752X3eeoHmWgVFc1Ap
	tX0+BkWaw3FqTbX8ujlHV5+3KlWB28YZNfXdK24pUSCL2rXzcKMOiavMp0mFlQGz7jsj
	MDLQ==
X-Gm-Message-State: APjAAAVssE3SD+WvioB6XIOOQ1UIxR+z2ufrZ9hVKUOX8ChdJkIBms3g
	cih+IY0+ptihHPCf8U7isVc2mnrlDs4=
X-Google-Smtp-Source: APXvYqyflv30X/+mFSdMV3pK5QnQ6MsAF9xqkmJAmZ8FHn7WyiDRZWF2eV7irR5DpQijmCq/mZ0QgQ==
X-Received: by 2002:a1c:a546:: with SMTP id o67mr3722870wme.57.1571905535871; 
	Thu, 24 Oct 2019 01:25:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c14sm19194417wru.24.2019.10.24.01.25.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 01:25:35 -0700 (PDT)
Message-ID: <6eb13feb2a0ad43d1cdba47f9dbeff47a4de7fb4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:25:34 +0100
In-Reply-To: <CAMKF1spQaeeoT-kUX9B0bYb_-29AVbnQD-7z7JcmL-2jK_1PUQ@mail.gmail.com>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
	<25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
	<CAMKF1spQaeeoT-kUX9B0bYb_-29AVbnQD-7z7JcmL-2jK_1PUQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 08:25:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 09:20 +0100, Khem Raj wrote:
> On Thu, Oct 24, 2019 at 9:15 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Wed, 2019-10-23 at 23:52 +0100, Khem Raj wrote:
> > > On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> > > > > On 23/10/2019 14:03, Khem Raj wrote:
> > > > > > Hi Richard
> > > > > > 
> > > > > > New master-next I see these fails
> > > > > > 
> > > > > > https://errors.yoctoproject.org/Errors/Build/91645/
> > > > > > 
> > > > > > First two are important one's we already know why
> > > > > > ti-display-sharing-fw fails to fetch
> > > > > 
> > > > > ERROR: QA Issue: libiio: Files/directories were installed but
> > > > > not
> > > > > shipped in any package:
> > > > >    /usr/lib/python2.7
> > > > >    /usr/lib/python2.7/site-packages
> > > > >    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-
> > > > > info
> > > > >    /usr/lib/python2.7/site-packages/iio.pyc
> > > > >    /usr/lib/python2.7/site-packages/iio.py
> > > > > 
> > > > > That may have been triggered by some change in oe-core but
> > > > > that's
> > > > > definitely an issue with libiio.
> > > > 
> > > > Its from this cmake change:
> > > > 
> > > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1
> > > > 
> > > 
> > > I think its causing more failures, where suddenly, the recipes
> > > are
> > > now
> > > resorting to native python, is this patch correct I wonder ?
> > > 
> > > see
> > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
> > > 
> > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4
> > 
> > The cmake change makes python visible from HOSTTOOLS. That isn't
> > wrong
> > as such, it is a change in behaviour. If recipes don't set python
> > enabled/disabled explicitly, there is some fallout from that. I'd
> > say
> > that is a bug in those recipes which aren't giving explicit
> > configuration to dependencies though.
> > 
> 
> So now the behavior is interesting. It works fine if I build for a
> machine where host-arch = target-arch
> so if someone is building for x86_64 then they dont see the build
> failures. IMO thats worse.

That is a general problem with cross compiling and applies to any
automatically detected dependency from the host. Python is in an odd
place here since we do need it on the host to run bitbake and there are
places where we need that exposed to code (e.g. they have python
scripts), there are places where we don't want it exposed as host
contamination.

Have you looked at the buildhistory logs to see what changed in meta-oe 
as that would likely highlight the changes.

Cheers,

Richard







