Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94B207E6C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 22:57:12 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id p24so10550441lfo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pieS6Wj3pDJOSko66TAQG6ZFBvkw1IJovKuTorXsjRQ=;
	b=nYlLeTDJ+la/QkX9Y09Z/i2yZ28TOyu9+Up66oFhXEK8K9hLAsoC3mMKSe0NG/ktMb
	UJedSygSdh0uZ/lNvuMmrOVSldXjvN2t4auXF9Cs/hl7wPM9lz1kVEziyt0wije3m0z9
	CHa8IbML+tAoM3T3/2R+4VX2/cRfSbwzB6jhxZexYENCkVinz+VcoDkZQve6/pxYijl2
	fGENm0Q8MGQdIqOYJRIv6gsnTvK/NtHLH7sd+RdDKyQxXpds2WxsFgXIlpK/yO0CkVEf
	hFk3qbBS/jIkSlij0BVUq4K6RSYwglir8PuGps/hcsjOMuNolhb9XkNJNYHxHgsDD0/i
	mVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pieS6Wj3pDJOSko66TAQG6ZFBvkw1IJovKuTorXsjRQ=;
	b=C5aUhd0Go6xG4NEg1w3Avr4Ut0KhTPLxUHzxf76IA9u8uEeGqATPeXnXZf6CrHbey7
	LovrWC64oFh4S9IEl+Z2L1PXOZ5OKIOsqbkl+DuaUOICf3NQXfuJzNgChlDYZIKi+RSo
	tvuDcgcNzt/NovlBL9Ou8i3cm4D4HiCw1p3yGO0g+jq76c0p2DnJdZX2soL4ZcKvkiFw
	9oUoQUx+De3ad/GwO7uGiQ14RvXojMe33actpvlJgLHri9qOz21bW5OByJzksJauSPAT
	kyiprnQxXxtBKxpYS4WeBHf6QJNd4vI6So3c1anPxgbVce7cloy2e0fGrop4RjgoBI4o
	h/9A==
X-Gm-Message-State: APjAAAXWhV/BlL+4j4II6Q9iBV5LSEwGfcpBt03KQez8yd5CuoNWjOTt
	QOH9ywq+4BwLDCXxcKLjLDewb6maELCkaudwPAE=
X-Google-Smtp-Source: APXvYqw5VZt6LnHOC/8aSyUCwzht0D3RfHGHYIf9FszNQ318mUvoa6Fk986E6KEIDCRqp5EMRUFUoEWJp5zHrXTF/sE=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr39610210lfi.140.1560293832754;
	Tue, 11 Jun 2019 15:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
In-Reply-To: <be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jun 2019 18:57:01 -0400
Message-ID: <CADkTA4PEz-0ZuFCStXLSXYYwKDgXUuVHUUdMDSrUF0Bx+71d9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Tue, 11 Jun 2019 22:57:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 6:50 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> >
> > For the moment,
> > 0001~0004 are on master branch only.
> > 0005~0007 are on stable-2.11 branch, but v2.11 has not been released
> > yet.
> >
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> > v2: Correct a typo in SOB for 0001*.patch
>
> I just discussed this with lttng upstream maintainers a little. We're
> going to have continual tension between keeping lttng-modules up to
> date and new kernel versions.
>
> How about we also have a git version of this particular recipe which
> has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
> PREFERRED_VERSION when using newer kernels?
>
> That should keep people using very recent kernels happy, let us use a
> stable release version and avoid us adding/removing large patchsets on
> a semi regular basis?
>
> Would you be willing to try/submit such a git recipe?

This makes sense to me as well, since I'm one of the folks that runs
into this issue the most. In fact, I've been carrying a local _git
version of the lttng recipe for over a year, since I didn't feel like
getting into the _git versus release tarballs debate. This solution
should avoid that debate and keep all the different versions of
kernels moving along.

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

