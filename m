Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 134177856C;
	Fri, 11 Aug 2017 18:14:36 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g32so3016252wrd.5;
	Fri, 11 Aug 2017 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lGuWVbHBEP/Vr3A5fBM/7wF5cKwarR9I5BG+ln6++o4=;
	b=JcA5U6iG2Cikz9mpfOwJ/BNzZfnEaPfv7K9iMfuUMVNa62qAmC1w3bmp4JiGyejtk+
	vsmh51XFe/dTBuDo+NvZfNIa9SG7YGVxTKpa9dhzLRGkhWQl+GYD1dvs0mZVHy0IXLB0
	UtNH6t8kXf6QX6fJ/sjf+kiIDpLW2yg31fRSNM2JGjhhwQfpY4l919/WnXJau3gTwd1k
	4Zd8JzX+MUu0Ujm+1nPXa+S0HZ+Qm6S+mymyDkswAZL+0Sbz0Hc5xBaec/i482LP9r6W
	HnkZYb4k3LMUVeYaQN/KEf4bWTfiP1jyq0/VIx6TDYJnVqeUX4UwNM8dFZtohR+zJLy3
	Blew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lGuWVbHBEP/Vr3A5fBM/7wF5cKwarR9I5BG+ln6++o4=;
	b=gMZMsl8fBHAauiCwlfyJb8brlgjtz/++buMk1BTHtm/Vta2cJNSYPhQwcLsG9E3Jy1
	+qUzyyw4ed/QYdQIR6m/EBXmVrdigCSHIsw6dNldDVtYSgUDOBvQSANqzRqhXs5lLGtC
	FC3tjm2b6p/XV3itf3R1+3zQ8vvytKf374E78vjdsg7KU5Qiw++GEOWvkdgJkFXWHCba
	/KY53n7ByCfRJOHE+bnzfGB6MCGuFmQdN711JZX0msVDWnN+u/MVqu9/VoLiDlbLkjcz
	4nQipFspvk82G6f/up96Le1Eq//pW2eVcG0d3duXbsTymTzZahaAwgD909dVXrNkwMqY
	VJfA==
X-Gm-Message-State: AHYfb5g97i/TmPIMOQeSdfa5TnutPo123WrcWEYxQW15Z0U4WM85CzMt
	yEosiUhWrz6KuA==
X-Received: by 10.223.176.57 with SMTP id f54mr10865000wra.194.1502475277431; 
	Fri, 11 Aug 2017 11:14:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id r70sm20207wmb.35.2017.08.11.11.14.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 Aug 2017 11:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Aug 2017 20:16:08 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20170811181608.GA11833@jama>
References: <20170811080344.GB3320@jama>
	<CAMKF1sohv7_j=Gduw5y-9-4jCKWNjx-pc205PmfvN2vR4MOe6Q@mail.gmail.com>
	<20170811164545.GC3320@jama>
	<CALbNGRRdCu1oYc=SOf0LrENZ+tJhJMSTu20OvzBWo8BwMbQMUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRdCu1oYc=SOf0LrENZ+tJhJMSTu20OvzBWo8BwMbQMUQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-08-09
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
X-List-Received-Date: Fri, 11 Aug 2017 18:14:37 -0000
X-Groupsio-MsgNum: 101287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 07:58:36PM +0200, Andreas M=FCller wrote:
> On Fri, Aug 11, 2017 at 6:45 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > firefox and mariadb fail like this only since conf/distro/include/secur=
ity_flags.inc was included
> >
> > qtbase fails because of ptest addition as reported on ML
> >
> >> Kodi patch to use std::string was sent. mongodb needs something simila=
r.
> >
> > The kodi patch from Andreas was already included in this build. Yours
> > kodi patch looks similar, but not backported from upstream.
> >
> > see:
> >> > 3a03560 kodi: fix build with latest gcc
> I checked the log and don't understand what happened: kodi on qemux86
> failed exactly with the error message I saw before fixing. Since the
> other qemus did not fail: are you sure my patch did not come in while
> build was already running?

Yes, that's possible (like for squid, maybe qtbase as well).

The problem is that qemux86 and qemux86-64 run on one builder, qemuarm
on another. Each build takes around 25-26 hours (depending on kind of
changes which were introduced since last time, almost any oe-core
upgrade means build from scratch, if I update just pending patches in
meta-oe/master-next, then it's 2-5 hours).

And this report is generated based on the state of qemuarm build.

So quite often I start all 3 at the same time, then some interesting
changes came in later, so qemux86-64 build picks them and because I know
it will take quite long time I re-trigger the qemuarm build to finish in
parallel (so qemux86 usually ends being the "oldest"). But to provide at
least some feedback I don't re-trigger another qemux86 build, because
that would add another day till the report is complete.

No of course another round is already running, hopefully I'll ignore the
temptation to add more changes to it while it's running and do something
better with my life - more consitent report should be available
tomorrow.

Regards,

> >
> >
> >> imagemagick issue is also taken care of
> >
> > is it? where? Notice that this includes also the 2nd imagemagick upgrade
> > which also already disappeared from the site.
> Randy suggested to skip imagemagick update until upstream stabilizes.
> >
> >> I have sent a patch for squid issue
> >
> > You mean this one?
> >> > e435561 squid: Add missing dependencies on openssl expat and libxml2
> >
> > it's already included (might be missing in qemux86 build which was
> > started first).
> >
> -> kodi?
>=20
> Regards
>=20
> Andreas

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWY30ZwAKCRA3VSO3ZXaA
HAPPAKCoVIgBD8087Q8mys5VV5cYFEX9iwCfXK7yvUp6to9lFxQSGVJvDR6bJQw=
=wOj+
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
