Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 696FF7F94E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:15:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p21so257547wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VonnkeOqX/CYklUsW6W6SCsCg0vZtRozFqUCBshZnws=;
	b=Y6XyiLRMLR/3YxaWUbqkl0Uk77UGjWN/uSHzQE6U2Oomv36pvPBSAG2TQGz31awZJ4
	aRVG0DpXslwJsDtOoVfud9g0VjpBuqpc54lpzzRyUJZctb87KJZa5h4tLPCZqOO49S6f
	mn5dCpN0aUB2z5MpmTZzBMtJL2FeRq+yvA7xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VonnkeOqX/CYklUsW6W6SCsCg0vZtRozFqUCBshZnws=;
	b=IV5+ssBofmnAyjCuZvzRjxVgjuWAHZQeXqdhuk17rNxncslGbjWSBmJfj5oo3XB4MN
	5vewnb09XiDOBEurNZgxbvp2XZuCgvJ8KAD8teAEI3ak+AMP+/N9jxq9kFJFgsZmImfl
	B0Tcp52Vox1wlSWxlF6weEC5+jhowWNuicLrLeBhfPIJqng9WptoIBse4EswqXe1pcFa
	PfNjQfVpmegjQqdNZpf2Cb2OUeyPBnY47OLpLOoXLYtd/EWFnSpTaTgNRoHS5U5kHIMZ
	Kwr8c+k+wckBV39cly0HmLCiu8YKPA/GcqbzRksT5QMSin25F36WBH5IiJkXSJt89Apb
	CGPA==
X-Gm-Message-State: APjAAAWSCn91K6JlmdYpD9RrpV9+ItfDcZqD3wNdtUU3i2jxs+9Rlb50
	SNAl9zH2E2euqKyc2Nusa9TOwg==
X-Google-Smtp-Source: APXvYqzFo9qDfCFT+u4nwZV1CF1YaFdHWrDwkinbvZ2RDAIVf4oLhRaD4euuP8W1PPF2wXektPaVOg==
X-Received: by 2002:a1c:9c0c:: with SMTP id f12mr3631600wme.133.1571904903850; 
	Thu, 24 Oct 2019 01:15:03 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q22sm1525210wmj.31.2019.10.24.01.15.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 01:15:03 -0700 (PDT)
Message-ID: <25022a4c11222cda48ad70ae0f7bce0625678f15.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:15:01 +0100
In-Reply-To: <CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
	<CAMKF1spmEssM+wdqvorosM4uWfigOXgbr6YEToFYFODeok7WxA@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Oct 2019 08:15:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 23:52 +0100, Khem Raj wrote:
> On Wed, Oct 23, 2019 at 8:31 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
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
> I think its causing more failures, where suddenly, the recipes are
> now
> resorting to native python, is this patch correct I wonder ?
> 
> see
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=5d02e814bc7d30f925b2eeec85eb053cec516f26
> 
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=yoe/mut&id=3ab0af60e8512cbb718e8a0112d9c9aa98c620a4

The cmake change makes python visible from HOSTTOOLS. That isn't wrong
as such, it is a change in behaviour. If recipes don't set python
enabled/disabled explicitly, there is some fallout from that. I'd say
that is a bug in those recipes which aren't giving explicit
configuration to dependencies though.

Cheers,

RIchard




