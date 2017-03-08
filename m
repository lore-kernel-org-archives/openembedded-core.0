Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 72F6A774E2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 18:41:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v190so7487353wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dVeDwZB1OtxU8iy6L/L++9Vhg+L8/bmETQXtexs5Bec=;
	b=BciRAmdY9bzN6mAckG5Bp1Sgc6HGzjfs7s6xT5MtslkB4I7B4m9QghdfP1FVvBUNXP
	oZWAskyAD4o/pMUb08SypFKudduP6UM8rTevIrV6BdNYRERU6J+uXLIy3i/eyX/0VjDc
	ywoKz+Kavv30oJgXz6fNEVzmO+YI5Q+UTx8FL2IV2g9O2rPRRe7Ytr+bRCB9oD9gQqcz
	p4kne6PLVm4vIGhEpHRYDXeac0MIA5nNr64QhY8+JcBWGq4GkPFy0UBbHVes3RkFuW4Y
	c/LMLhgETe1zVI52QNNzxbq+S8lqKsKrEymU05ESHFRDkoMUP1g8BjhU8PSwCrjvnlXm
	EqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dVeDwZB1OtxU8iy6L/L++9Vhg+L8/bmETQXtexs5Bec=;
	b=hKkm5ZuG3MsJ2gQD8vq/BceJaAB8cl/2kZEz1XHzeQn1b0MViHcYCt6ToxHdBESVyE
	/DKBjbXpr0Os8iyyMb4vxuII88hNKlyrXenrSBAQaCQkRxwRyYg7xFnhuZPkAkA1r8CC
	D8wZlv1n+4ns4/yH050Pd9uoEHOQqhAOESUCMyG5Jrghn1i6MwUNqsO1Gx2fGhzTbSy1
	37ynOn3nJ1N7g8cxkeTHkloFSY+cO41nplXgi60tX1HfZvmv8zEUEtzSxCqI4JeEulcH
	RvO0Ox+lKb5xxYdEQLheNP7/CVj4vsb5lbMDklNqEhfYz4TkMREfFOvjUDn9WeQ1C0vR
	b4/w==
X-Gm-Message-State: AMke39nllm285DsecntY0aIKyouTxFsc/W3FtoKrLj3+C2AgW5AzVnrZazL5DHw6R1Hxnw==
X-Received: by 10.28.13.20 with SMTP id 20mr24111893wmn.24.1488998496091;
	Wed, 08 Mar 2017 10:41:36 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g5sm5208663wrb.48.2017.03.08.10.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 10:41:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 19:41:36 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170308184136.GF3279@jama>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
	<CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
	<1488996030.22968.78.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1488996030.22968.78.camel@linuxfoundation.org>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 18:41:35 -0000
X-Groupsio-MsgNum: 94422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Content-Disposition: inline

--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 06:00:30PM +0000, Richard Purdie wrote:
> On Wed, 2017-03-08 at 17:21 +0000, Burton, Ross wrote:
> >=20
> > On 8 March 2017 at 09:43, Peter Kjellerstedt <peter.kjellerstedt@axis
> > .com> wrote:
> > > since I see that you have integrated/staged the two patches that
> > > add
> > > inherits of pkgconfig, but not the patches that add the dummy
> > > commands,
> > > I assume you have some reservations to these patches. What are your
> > > take on the subject of blacklisting vs whitelisting the commands
> > > from
> > > the build host? I know that having these dummy commands in place
> > > helped
> > > me a great deal when updating our recipes to build correctly with
> > > RSS.
> > >=20
> > FWIW I wasn't entirely keen on how the blacklisting had to be very
> > careful about how PATH was manipulated, which is why I merged to my
> > staging branch the fixes but not the dummy commands.
> >=20
> > If the majority of people agree that this should be merged I don't
> > have a strong opinion either way.
>=20
> Ultimately I think there is a better solution than this but I haven't
> had time to look at that as yet.
>=20
> I do worry that it makes assumptions about PATH that may or may not be
> valid everywhere, equally I do see it could be useful.
>=20
> So I also have mixed feelings...

I got many complains about my PNBLACKLISTs saying that the issues weren't
reproducible elsewhere and in the end it was in 90% one of these
commonly installed tools like pkgconfig being used from the host.

So I agree that PATH changes are tricky and that whitelisting would be
even better than this, but still I would prefer to get this merged as it
will help to identify and fix most common issues and changing this to
whitelist would be easier in future.

My jenkins buildhost is quite minimal (that's why it detected so many
issues with RSS, but I'll include the rest of this series in next run to
see if it will find even more).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMBQYAAKCRA3VSO3ZXaA
HKR3AKCHOEW7zXqkwlTUx+hJVTOKIv4VSwCeKWNUeKHXyLaU+37o8NFW0NxjR/E=
=mg9u
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
