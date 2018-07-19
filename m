Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B02D175114
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:02:31 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v14-v6so8204290wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 07:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bL7bOG2orRYKdjvYl+uL76tGSNJ9UXn97ikvhcN1dsg=;
	b=keFUvjNlJRfCKG6O8GOgKelyLv4Unv36hWX9iL8THtS7ZX0NLYnzjPIT2FDcKX/NQt
	y0pm/GDx8AU0Wj8YqLooK05XuOYPwmhDyrsnVGA66AI3JK+2Ss8LUxgWiktMve437FzH
	xTV6DcFItoA0Vk7cJZ8thXox5pBFiziV5jl65n5nCaYBepkhE9TcHPy8Y9oWYkKPLd0h
	7IBFdgq4a3hshG7neFrOLsbJYXFcNydh8M5wko4y9epEgZ/qmd9ndDMqv4F1GVV0n93j
	RbxKQatM/RS7c8IMl4KD+gHRrIcjYHz3tJs6zvW4/NB0S4bRHHBBojHk8ctWjfS4uxIy
	4QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bL7bOG2orRYKdjvYl+uL76tGSNJ9UXn97ikvhcN1dsg=;
	b=l/0Iwb7ZHDBx0bwsPO5K1sXfq4urcP2+Sj2z4fsK6W/65eFkYmtZVoqW5qZXaugamR
	ysvg12RoePb29oRuozfUP2meG9trHRvQ3eE8DbUSzpCaMoE+gxnGo0L9uVXWsJz9j/2R
	/ZU5pyPbhzA1kim/q5jzVDMli2O86Q1hUnSpcpjZKvsx9qMidjoBpHL6E8VpHfbQnjsq
	F26ocz6+2Ww5Yuz03x2QEFwvzi9KBtKw1L0XOcFdGmCOee6DVasal3EOU9Bl9EH9Y+tx
	GhP97LsYih4aL1q8wfoDrdoURLmEckQ39fry6OOOicROB7ZGomXk6tHt5Zej/TGsFfRr
	hkKg==
X-Gm-Message-State: AOUpUlEpOJHslxkVlGbhfJu148k2pn0RbzI6zQ19yZW6IVnmsa5J9xZt
	PkqpKJfpPRhB6fvOKSNluwRPFkdW
X-Google-Smtp-Source: AAOMgpfm5RBeCM+gx+CCspnO5Hm1k68pRKmc+GQwM11WkZmR9lTHsLiBhk+JS6QhvMN7Hp0Qe+IXyA==
X-Received: by 2002:adf:fd12:: with SMTP id
	e18-v6mr7318811wrr.280.1532008952236; 
	Thu, 19 Jul 2018 07:02:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j131-v6sm4606931wmb.35.2018.07.19.07.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 07:02:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jul 2018 16:02:34 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20180719140234.GD1436@jama>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
	<20180719121252.GB1436@jama>
	<bfaa505c-1ffe-3c22-e0f3-9a06f4fab4bc@pseudoterminal.org>
	<20180719132046.GC1436@jama>
	<26d1dd91-a30d-a8db-61f9-5f1a3cf59520@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <26d1dd91-a30d-a8db-61f9-5f1a3cf59520@pseudoterminal.org>
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
X-List-Received-Date: Thu, 19 Jul 2018 14:02:32 -0000
X-Groupsio-MsgNum: 113694
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Content-Disposition: inline

--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2018 at 03:38:16PM +0200, Carlos Rafael Giani wrote:
> The main problem I see with all of this - aside from filling the recipes=
=20
> with packageconfigs that may or may not become actually usable in the=20
> future - is that when the packageconfig recipes don't yet exist, you are=
=20
> essentially speculating. Even the *names* of the dependencies may turn=20
> out to be different in the future (foo vs. libfoo for example). Or=20
> perhaps you need to include more dependencies, like what can happen with=
=20
> OpenGL ES (it also needs libEGL).
>=20
>=20
> On 2018-07-19 15:20, Martin Jansa wrote:
> > On Thu, Jul 19, 2018 at 02:47:58PM +0200, Carlos Rafael Giani wrote:
> >>
> >> On 2018-07-19 14:12, Martin Jansa wrote:
> >>> On Thu, Jul 19, 2018 at 01:16:51PM +0200, Carlos Rafael Giani wrote:
> >>>> As a general rule, I think adding packageconfigs to an oe-core recipe
> >>>> that has dependencies outside of oe-core and meta-openembedded is
> >>>> questionable. Take the qt5 packageconfig for example. It is *not* pa=
rt
> >>>> of gstreamer1.0-plugins-good in oe-core, and for good reason - it ne=
eds
> >>>> extra switches for passing paths to moc, uic etc.
> >>> I don't see what's questionable with that. PACKAGECONFIG is just a way
> >>> to pass configure options like EXTRA_OECONF just with benefit that it=
's
> >>> easily switched from outside and that it encapsulates build time and
> >>> runtime dependencies together with the options.
> >>>
> >>>> Now, what if a recipe outside of oe-core and meta-openembedded is ju=
st
> >>>> like that? It needs its own customizations, its own switches. It wou=
ld
> >>>> be better off setting up its own packageconfig, just like what that
> >>>> bbappend in meta-qt5 does.
> >>> If someone submits PACKAGECONFIG addition for something which only
> >>> exists in his own layer, I'm fine with that, why should we make it
> >>> harder for people to use oe-core or meta-oe recipes?
> >> Adding a .bbappend that adds the packageconfig does not sound hard to
> >> me. However, having packageconfigs whose dependencies may or may not be
> >> dead (because of the layer being dead) sounds more like a maintenance
> >> problem.
> > It's not too hard, but completely unnecessary when the PACKAGECONFIG was
> > already there in oe-core and you're removing it for no good reason.
> > Especially if such PACKAGECONFIG needs to be added by multiple people in
> > multiple projects instead of just once in the recipe where it belongs.
>=20
> libvisual is not in oe-core or meta-openembedded, otherwise I would have=
=20
> added it. As for zlib etc. I already added them back in in v2 of the=20
> patches.

But you're still _removing_ the PACKAGECONFIG for libvisual.

> > And it brings annoying issues like the gstreamer bbappend in meta-qt5
> > without any good reason.
> >
> > Carrying libdrm PACKAGECONFIGs in my bbappend was simple enough, but
> > then Ross migrated libdrm from autotools to meson and instead of simply
> > updating the PACKAGECONFIGs to the format used by meson atomically with
> > the meson migration in the same commit I had to update the .bbappend,
> > which caused my layer to require new oe-core again (to have the meson
> > migration, because the PACKAGECONFIG isn't backwards compatible) and at
> > that time I've rather submitted all my PACKAGECONFIGs to oe-core instead
> > of maintenance burden to keep them locally.
>=20
> As said, I can then agree to add packageconfigs for recipes that already=
=20
> exist somewhere. But adding them speculatively with not-yet-existing=20

Except you can never know what exists elsewhere, because not all layers
are public or on layerindex.

> dependencies is an entirely different matter. I wouldn't do that.=20
> Instead, I'd keep the --disable-twolame etc. switches around.
>=20
> > Congrats! but it still doesn't mean we should add more of them without
> > good reasons, right?
>=20
> Sure, but avoiding them is not a high priority for me. They are more of=
=20
> an annoyance than an outright problem.
>=20
>=20
> > And what about people who have libvisual in their layer (from
> > meta-debian or meta-qt5-extra or written from scratch) are they also now
> > responsible for maintaining bbappend PACKAGECONFIG for gstreamer?
>=20
> Yeah, at least initially. If some layer introduces a recipe that happens=
=20
> to have a corresponding plugin in base/good/bad/ugly, it makes sense to=
=20
> add a .bbappend at first. Later on, you can patch oe-core if it sounds=20
> like having this packageconfig in a central place makes sense. To me,=20
> this sounds like a more modular approach.
>=20
>=20
> >> Eh, I don't think I can agree with that approach. Having an openexr
> >> packageconfig for example implies that this packageconfig is actually
> >> usable and gstreamer1.0-plugins-bad can be built with it enabled. But
> >> adding it without an openexr dependency? Sounds broken to me. This is
> >> why I prefer to keep such features disabled until there is a recipe for
> >> them in meta-openembedded.
> > It's not broken, it just isn't well tested. Everybody tests only the
> > explicitly disabled path until someone actually tries to enable it,
> > which is exactly the same for disabled PACKAGECONFIG and --disable-foo
> > in EXTRA_OECONF.
> >
> > I'm not saying that these features should be enabled! Of course not,
> > they cannot be for features which require extra dependencies from other
> > layers. I'm just saying that --disable-twolame from
> > PACKAGECONFIG[twolame] is much better than --disable-twolame from
> > EXTRA_OECONF, because is easy to enable without the .bbappend and in
> > most cases it will work if you provide necessary dependencies or show
> > reasonable error showing what you need to provide.
> >
>=20
> It is not about them being enabled, but about what happens if someone=20

you said "why I prefer to keep such features disabled" in previous
e-mail.

> sees these packageconfigs and tries to enable them. Then, oops, they=20
> don't work, because the dependency is non-existent. So, if this=20
> packageconfig _cannot_ work because the dependency doesn't exist yet=20
> anywhere in any layer, why is this packageconfig there in the first place?

Because it's our best shot on making it configure-able, if someone names
the dependency differently, then the PACKAGECONFIG can be improved later
or that extra dependency can get PROVIDES with the name used in
PACKAGECONFIG. But that's still closer to usable than

EXTRA_OECONF_remove =3D "--disable-foo"
EXTRA_OECONF_append =3D " --enable-foo"
DEPENDS_append =3D " foo"
RDEPENDS_${PN}_append =3D " foo-utils"

or adding PACKAGECONFIG in bbappend and ending with --disable-foo
followed by --enable-foo in EXTRA_OECONF.

> For example, the libneon recipe got removed because upstream is dead.=20
> Would you still keep its packageconfig around just in case someone=20
> decides to bring back the recipe for their own personal layer?
> (Ironically, I just noticed that I made a mistake by _not_ removing the=
=20
> neon packageconfig while still adding --disable-neon to EXTRA_OECONF ..)

Yes, I would keep PACKAGECONFIG for it, because for most people it will
result in the same --disable-neon and for someone who had neon
PACKAGECONFIG enabled before it will work after bringing back just the
libneon recipe (without reinventing PACKAGECONFIG knob in gstreamer
bbappend).

I don't want to continue in this discussion, hopefully someone else will
add an opinion as well.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW1CZ+QAKCRA3VSO3ZXaA
HJupAJ9IHMiX3WKF8259/LL+VNZ2ONLxEwCbBMP5rV3Oor33XUmuvzbsMkBL73s=
=PFMJ
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
