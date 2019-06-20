Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3DED87E73D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:37:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g135so3873972wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ItSP1v+/jjeusazMcuKNdf+bCZAQVVvuuRGvumByJyg=;
	b=Jsgrjl9fYIqo5TAKbMTdstUXmiXW/aFtxjXP2VYDNw6/umSfpkYAVlbmKWygjmddhu
	kY4IFSHCxhw2seeeLNB+dZG1W7qeZQmva9TITTamKWMdfHM4vKbygxMptMuBAukOwCNJ
	dJZwCWNs1oKd+RTt1jeqGiIHT9fZjWTPUppq86jldBnmYWBlp894i/qqYbJq87rNrFe9
	EIIGP8D7KgrkS+EvFJq+sT6yEj5Z5/nurcoHzoCDIX84ZPp0Ip5SFTdd/DA4kKARh6sA
	xKYtiimDCeIp+UsDmzr17kNqyiIUeN6PNq9XfpTH+JY+H7sAEK0mD5FLXb2fx/kl/dyR
	POHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ItSP1v+/jjeusazMcuKNdf+bCZAQVVvuuRGvumByJyg=;
	b=jEQQlFaniYJHsx6YfBVhnCoxgpV5JsSvDGOeCup2qafQ5GE5bodoSr6XqUS5JrXDYx
	vT7vfZBfJIOupRJKdF4iOSH3/aTnNEeNJfplMFeeKA5HNCE951wbbrd6LrtCaeqx6m5+
	1YJIFQxicpW8YAnRVl37yqM+FASKhaAh1FUkOsJT7ULvaCd2bLv2C+/twwWu0Z5CEXaR
	AvnxL6RJbgYvop9PJ3I+NA28uafDSBG6D+SEeOUyHtACXFLIdf6Hpt08Lukux8x3rtgk
	wZUetRCLocknrl1kubI46qAgTmCOZQkr66If4EF1gdEmHiLZeaxh6niorx7bEWjFshbL
	OQ6Q==
X-Gm-Message-State: APjAAAW7kKLd9/4OO0mkz6vhHh9WssE9jWoDoSd44rGoCZCzOO+fq1ZL
	xpT2MSDlEUaaPa/jqMgnX5c=
X-Google-Smtp-Source: APXvYqyqVRAP3iIG2jD11yk8JpAZGB5JqHJeXtKTjKjSuyEEXcJDnZ9te+pj7HNiTq406ddsSPh6fw==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr528266wmk.46.1561052275723;
	Thu, 20 Jun 2019 10:37:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o126sm295311wmo.1.2019.06.20.10.37.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 10:37:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 20 Jun 2019 19:38:03 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190620173803.GA1488@jama>
References: <20190614072956.13672-1-bunk@stusta.de>
	<34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
	<CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
	<20190620071537.GA27107@localhost>
	<CAMKF1soeQ9YreTazqHFbwh-C4AU6H2sr1H5_jNED6+T6K3TTGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soeQ9YreTazqHFbwh-C4AU6H2sr1H5_jNED6+T6K3TTGw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Thu, 20 Jun 2019 17:37:55 -0000
X-Groupsio-MsgNum: 126052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 11:09:39AM -0600, Khem Raj wrote:
> On Thu, Jun 20, 2019 at 1:15 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Jun 19, 2019 at 12:59:05PM -0700, Khem Raj wrote:
> > > On Fri, Jun 14, 2019 at 4:44 AM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > >
> > > > On Fri, 2019-06-14 at 10:29 +0300, Adrian Bunk wrote:
> > > > > This removes clearly incorrect musl patches and marks
> > > > > systemd as incompatible with musl until these issues
> > > > > are fixed.
> > > > >
> > > > > The previous status quo where systemd was made compiling
> > > > > with patches that are known to introduce bugs and security
> > > > > vulnerabilities silently delivered a sub-standard package
> > > > > to users, this change makes it clear where work is needed
> > > > > to be done by people interested in systemd on musl.
> > > > >
> > > > > Patches that are merely questionable or not upstreamable
> > > > > are not touched.
> > > >
> > > > I'll be interested to see what others think of this, I can't imagine
> > > > this move being very popular...
> > >
> > > There are real products using this combination
> >
> > An OE-only combination neither upstream supports.
> >
> > > And this is not a good message, eventually we want to either fix or s=
top
> > > supporting this but I think now is not the time
> >
> > When is the time?
> >
> > In a month?
> > Before the Yocto 2.8 branching?
> > After the Yocto 2.8 branching?
> >
>=20
> When users that I know stop using it, and that might be a release or
> two. Meanwhile
> I think it will be good to address the issues with patches, if they
> introduce bugs or secvulns
> that I think will help the user community instead of removing the support.
>=20
> meanwhile, I would think that we can still work slowly towards making
> things better
> musl has provided a lot of good cleanup patches for systemd so this is
> not a wasted
> effort even if upstream systemd does not officially support anything
> besides glibc.

I don't use systemd/musl combination myself, but I agree with Khem.

As long as these bad musl related patches are applied to systemd only
when musl is used, then it's no harm to people not using systemd/musl
combo.

We can even PNBLACKLIST systemd when musl is being used with warning
that these patches are wrong and create security issues (more details
would be useful for the user to make educated decisions).

If we just remove them, then people who use this combo (for whatever
reason) will just import them to their layers and either fix them
locally (and never share it back) or use this bad version forever.

Keeping them with blacklist in oe-core will prevent people accidentally
assuming that systemd/musl is well supported combination while allowing
interested people to collaborate on fixing the patches in oe-core.

Regards,

> > The best solution would be if someone would step up to properly maintain
> > the systemd/musl combination, but usually such "either fix or stop" only
> > work with a clear deadline.
> >
>=20
>=20
>=20
> > cu
> > Adrian
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> >
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXQvEegAKCRA3VSO3ZXaA
HC48AJ46cKQcw4wEqJVEZismG5kesc/iLACYnwLYwJdy+7xisM4Q9hMAD7qMJw==
=/bYD
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
