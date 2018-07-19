Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A940F789F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:20:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s14-v6so6429537wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PZMmZclrtSLoWOoRjlg0kaELIzAaXvq/bzAjShwqe5k=;
	b=V18oaxdRtJIt2t0IQ2KN87zM/2Mo6fADp9HvqAIA5yrIsMCXfqYI1sDt9TH9BbsmxG
	+naT0noHwE3haLlF4OMkDk0OaHt1CwqaL4kLm5gkHP1atggYr3oUb0MsBBHNj+mfwdmc
	Oaax80wmO/URI3Yznysu47WYcay89sBUuCp35Zkr6P/93XMHRsBxqLHdxlcPAGhAXhTH
	i5hIHNGf+zbNHd9q6kRiWGSAIO73aARJI0Qi5SvtqsHHE+QngTRLVn+yRs8S02s6Nx9s
	Cwa+nnDjjhp1v62izERxtselq8cAlQKGvv/dImjExCO+Ly62rBGkCHO4GWsxMO29gdxB
	jtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PZMmZclrtSLoWOoRjlg0kaELIzAaXvq/bzAjShwqe5k=;
	b=PdqceJ/nXF2gaGMv4xF7c+Y+IOT8qkpMXIIrBhz1HHBTGkl2kDGETijbKcAgoBxVEt
	qG80fzDnmxQlnGCrt/jcFmJNtVB8r70CybqJ3OLzHqjosq24YrMqwMyXi/JCqI5eU9VE
	FntLtewJ9iG+086PBShMXHqx2ZwFgxxgzYpMo7vdFe/fB8LPKYPEXNh29aVJvBjR8Wgx
	g6uJy4DEsQOi8FbzY6o9FtZ5S3CCnuQJciCpRUCkKlshITXTNJjZFF87h6pSMNRT5yLO
	At37Wd+8oYtwKZcRoEYV7lwIgTnH3QSltsFDBwUOeioYDearknKDkyFOdym6v8jQH6j1
	Welg==
X-Gm-Message-State: AOUpUlGOGgVcg1qOgeLYxn7b+LIErv4D88kBFPvPN8fsc3zquuvfhWH1
	6i5PyEpSLuit/Muka5PBvfs=
X-Google-Smtp-Source: AAOMgpd6V0TQW9lxqn2w1+u/pKuHT/EcAXNRP0Z8gmOF5y3Af8Ca8dZnYWYqeLBkID1YNuucH+nDoQ==
X-Received: by 2002:a1c:958c:: with SMTP id
	x134-v6mr4002237wmd.86.1532006445117; 
	Thu, 19 Jul 2018 06:20:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y102-v6sm8516752wmh.9.2018.07.19.06.20.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 06:20:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jul 2018 15:20:46 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20180719132046.GC1436@jama>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
	<20180719121252.GB1436@jama>
	<bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 13:20:45 -0000
X-Groupsio-MsgNum: 113689
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2018 at 02:47:58PM +0200, Carlos Rafael Giani wrote:
>=20
>=20
> On 2018-07-19 14:12, Martin Jansa wrote:
> > On Thu, Jul 19, 2018 at 01:16:51PM +0200, Carlos Rafael Giani wrote:
> >> As a general rule, I think adding packageconfigs to an oe-core recipe
> >> that has dependencies outside of oe-core and meta-openembedded is
> >> questionable. Take the qt5 packageconfig for example. It is *not* part
> >> of gstreamer1.0-plugins-good in oe-core, and for good reason - it needs
> >> extra switches for passing paths to moc, uic etc.
> > I don't see what's questionable with that. PACKAGECONFIG is just a way
> > to pass configure options like EXTRA_OECONF just with benefit that it's
> > easily switched from outside and that it encapsulates build time and
> > runtime dependencies together with the options.
> >
> >> Now, what if a recipe outside of oe-core and meta-openembedded is just
> >> like that? It needs its own customizations, its own switches. It would
> >> be better off setting up its own packageconfig, just like what that
> >> bbappend in meta-qt5 does.
> > If someone submits PACKAGECONFIG addition for something which only
> > exists in his own layer, I'm fine with that, why should we make it
> > harder for people to use oe-core or meta-oe recipes?
>=20
> Adding a .bbappend that adds the packageconfig does not sound hard to=20
> me. However, having packageconfigs whose dependencies may or may not be=
=20
> dead (because of the layer being dead) sounds more like a maintenance=20
> problem.

It's not too hard, but completely unnecessary when the PACKAGECONFIG was
already there in oe-core and you're removing it for no good reason.
Especially if such PACKAGECONFIG needs to be added by multiple people in
multiple projects instead of just once in the recipe where it belongs.

And it brings annoying issues like the gstreamer bbappend in meta-qt5
without any good reason.

Carrying libdrm PACKAGECONFIGs in my bbappend was simple enough, but
then Ross migrated libdrm from autotools to meson and instead of simply
updating the PACKAGECONFIGs to the format used by meson atomically with
the meson migration in the same commit I had to update the .bbappend,
which caused my layer to require new oe-core again (to have the meson
migration, because the PACKAGECONFIG isn't backwards compatible) and at
that time I've rather submitted all my PACKAGECONFIGs to oe-core instead
of maintenance burden to keep them locally.

> > No I don't like that meta-qt5 has to use own bbappend for gstreamer,
> > it's necessary in this case because of the paths as you sad, but also
> > causes:
> > https://github.com/meta-qt5/meta-qt5/commit/73f99f2370a3dc5b81f42d0af7f=
e530431599454
> > which is quite annoying for meta-qt5 users, because this is one of very
> > few reasons why different meta-qt5 version isn't compatible with
> > different oe-core. So in order to use Qt 5.11 with oe-core from morty, I
> > need to BBMASK this bbappend and create the old one for
> > gstreamer1.0-plugins-bad in our project layer, it would be much nicer
> > and less error prone with PACKAGECONFIG directly in oe-core.
>=20
> Agreed. This is a drawback. Unavoidable in this case, unfortunately.
>=20
> > Also if you look at EXTRA_OECONF you'll see either --disable-qt twice or
> > --disable-qt followed by --enable-qt (when we depend on configure to let
> > the last option on command line win) which isn't ideal as well and might
> > confuse people looking at the log.do_configure.
>=20
> Hmm perhaps a bit, but the order matters, so I know that the last one=20
> "wins". Multiple switches like that are not uncommon in automated build=
=20
> environments, so I am used to seeing these.

Congrats! but it still doesn't mean we should add more of them without
good reasons, right?
=20
> >> I suppose with libvisual such a central packageconfig would work, but
> >> isn't the whole idea of oe-core to be lean? And yet, now we start addi=
ng
> >> more and more packageconfigs even though the recipes are in some other
> >> layers that are not part of the central ones (oe-core and
> >> meta-openembedded)?
> > Yes it's supposed to be lean as in number of recipes it needs to carry,
> > not lean by number of lines (PACKAGECONFIG is 1 line exactly as the
> > --diable flag in EXTRA_OECONF) or lean in number of ways how people are
> > able to use it.
> >
> > Why should meta-openembedded have special status for PACKAGECONFIGs
> > anyway, if you want to make it harder to customize the build, why stop
> > there?
>=20
> meta-openembedded isn't tied to any particular platform, BSP, distro,=20
> environment. It does have a special place, since it is a central layer=20
> for many setups. How many BSP layers, distro layers etc. list both=20
> oe-core and meta-openembedded as dependency, for example? meta-debian=20
> and meta-qt5-extra however do not have nearly the same status (and these=
=20
> are the places where libvisual is).

And what about people who have libvisual in their layer (from
meta-debian or meta-qt5-extra or written from scratch) are they also now
responsible for maintaining bbappend PACKAGECONFIG for gstreamer?

> >> You might as well add dozens of packageconfigs to
> >> gstreamer1.0-plugins-bad, just in case some obscure layer adds a recipe
> >> for OpenEXR or spandsp for example.
> > Yes, that's exactly what I often do, last time e.g. with libdrm
> > http://git.openembedded.org/openembedded-core/commit/?id=3Ddc7d3b2ff79a=
e324b96a51ec1be557a432ed351d
> > and e.g. qemu before that, adding PACKAGECONFIG for dependencies which
> > I haven't submitted to meta-networking yet at that time:
> > http://git.openembedded.org/openembedded-core/commit/?id=3Debb6ef1dbc7e=
03a4b7030b3056bd0fa59fdd047b
> > and I haven't submitted the recipe for virglrenderer yet as well and
> > I don't see any issue with having the PACKAGECONFIG for it already.
> >
>=20
> Eh, I don't think I can agree with that approach. Having an openexr=20
> packageconfig for example implies that this packageconfig is actually=20
> usable and gstreamer1.0-plugins-bad can be built with it enabled. But=20
> adding it without an openexr dependency? Sounds broken to me. This is=20
> why I prefer to keep such features disabled until there is a recipe for=
=20
> them in meta-openembedded.

It's not broken, it just isn't well tested. Everybody tests only the
explicitly disabled path until someone actually tries to enable it,
which is exactly the same for disabled PACKAGECONFIG and --disable-foo
in EXTRA_OECONF.

I'm not saying that these features should be enabled! Of course not,
they cannot be for features which require extra dependencies from other
layers. I'm just saying that --disable-twolame from
PACKAGECONFIG[twolame] is much better than --disable-twolame from
EXTRA_OECONF, because is easy to enable without the .bbappend and in
most cases it will work if you provide necessary dependencies or show
reasonable error showing what you need to provide.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW1CQLQAKCRA3VSO3ZXaA
HNZgAJd6PDLdCJRh/XWCnKFGnt9xKRBcAKCdj3MHoJIk/OL/2SAWLw8FmK2TvQ==
=csUb
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
