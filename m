Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B655979496
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 05:50:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s12-v6so7986279wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 22:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iGw+DfDQq1s8OSxwACW6luxZGGiMaD7hkDcy/gDm4uI=;
	b=gy1YAbq3qw2FUMv9B0FUzDEQI4jsgy6+I5AAKbYki2Gi4ZtO3uh4jhBQsAGjV5fgHD
	ytNdzd+tpt/dcAt+w2I0gjltTFPDBUdZO7NFQ0PW1fdmiSDbw6BryseGNwf9djVJtNJQ
	+zdCJAgq234rcXhU9ll4qT21iAu0n43G6AUZc2gIRrdQtyXCv26pLDmzjj6OIMJl+nHd
	Z3hIdnBpAmtCmJ6YB3wG+a6AN9Um8IjgVe4wtajtOaEBnOyiP1GCJkOisDNiRz5DaDeC
	lBt93hJWi5b3vAC42fS+uwVwVeJcXwslJWXzNhgOIaETF9KwH1Vh4yr3UvUWdnoPdtkA
	sPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iGw+DfDQq1s8OSxwACW6luxZGGiMaD7hkDcy/gDm4uI=;
	b=RYQHM42EFsgHOck0Cr5Fk28wMwJTw26oRs/V7O1VkL/hgeePTf4qYeI15HE65Eq9NE
	Twp5hee/Q4+4Q8R2/okIKZhEsYQSbPFSFOOpeWImbYLWB9p5Mv0nuExq1m0MoqINzEAF
	UIBiXwEjnWvKtm/3ssKbwH6Qwm033N12VkBiO+2au2btoKsko8t26oLR7qXYD/J0ZUq6
	QAeky3LLxL1lzzKIAf2lbGepjTEbhuBYGbilmRxA5Yu9NL5Az/G8F70I0cuPr32Wo5KQ
	Z2+7HxRVeZNumyl+uzF+4jPipLTWDd92x2votJAblENLCnFhnaD0lTdSAJmBZO28RvqF
	8zWg==
X-Gm-Message-State: APzg51DDRTCqLARlMx+oEANdGfpGCk6VN0j52AOczJ739s0q4hfh/SrC
	KQFmdw4DpUUe9iUXuzoLO6/cY5jo
X-Google-Smtp-Source: ANB0VdYVKYH8kjj6hfO0WnNoC+C8XmbJKAyTwn1GT/HfxAeroVyDoQq4TuQMJ4jmNoNr+rbT8bl17Q==
X-Received: by 2002:a1c:c7c3:: with SMTP id
	x186-v6mr9809560wmf.109.1537163456468; 
	Sun, 16 Sep 2018 22:50:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h7-v6sm12257325wrs.3.2018.09.16.22.50.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 16 Sep 2018 22:50:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 17 Sep 2018 07:50:55 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20180917055055.GB3408@jama>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<44bc8e8162a345bc10eb206b7858fd9f2bd91881.1536130313.git.liezhi.yang@windriver.com>
	<CA+chaQccRwckqnoA601TNz-qr5QHLw+2uCigHKTS4D2b4DP_Yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQccRwckqnoA601TNz-qr5QHLw+2uCigHKTS4D2b4DP_Yg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] bitbake.conf: Make BUILD_OPTIMIZATION respect to DEBUG_BUILD
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
X-List-Received-Date: Mon, 17 Sep 2018 05:50:56 -0000
X-Groupsio-MsgNum: 116333
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 03:25:58PM +0200, Martin Jansa wrote:
> This seems to cause nativesdk-glibc failures when DEBUG_BUILD is used, it
> fails like this:
>=20
> ../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
> ../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used
> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>       b =3D invsqrtpi * temp / sqrtl (x);
>           ~~~~~~~~~~^~~~~~
>=20
> the target build suffers from the same, that's why I was using this for a
> while:
> # glibc-2.21 fails to build with:
> # iso-2022-cn-ext.c:501:4: error: 'tmpbuf' may be used uninitialized in
> this function [-Werror=3Dmaybe-uninitialized]
> # connections.c:1916:1: error: inlining failed in call to 'clear_db_cache=
':
> call is unlikely and code size would grow [-Werror=3Dinline]
> # add few -Wno-error like meta/recipes-core/glibc/glibc.inc is trying to
> doin get_optimization function,
> # but fails because we append -Os at the end and -O2 is found first
> SELECTED_OPTIMIZATION_append_pn-glibc =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'webos-minsize', '
> -Wno-error=3Dmaybe-uninitialized -Wno-error=3Dinline', '', d)}"
>=20
>=20
> There is some logic in meta/recipes-core/glibc/glibc.inc to
> append -Wno-error to SELECTED_OPTIMIZATION when "-O", "-O1", "-Os" is use=
d,
> but the same would be needed for BUILD_OPTIMIZATION now.
>=20
> Or maybe it would be worth marking those uninitialized/unused variables
> with #pragma instead of injecting -Wno-error?
>=20
> Then we can get rid of:
> python () {
>     opt_effective =3D "-O"
>     for opt in d.getVar('SELECTED_OPTIMIZATION').split():
>         if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
>             opt_effective =3D opt
>     if opt_effective =3D=3D "-O0":
>         bb.fatal("%s can't be built with %s, try -O1 instead" %
> (d.getVar('PN'), opt_effective))
>     if opt_effective in ("-O", "-O1", "-Os"):
>         bb.note("%s doesn't build cleanly with %s, adding -Wno-error to
> SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
>         d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
> }
> from meta/recipes-core/glibc/glibc.inc (not use about -O0 case) and remove
> following notes:
> NOTE: glibc doesn't build cleanly with -O, adding -Wno-error to
> SELECTED_OPTIMIZATION
> NOTE: nativesdk-glibc doesn't build cleanly with -O, adding -Wno-error to
> SELECTED_OPTIMIZATION
> from every build with DEBUG_BUILD enabled.
>=20
> What would be the preferred fix?

I've sent possible fix here:
http://lists.openembedded.org/pipermail/openembedded-core/2018-September/15=
5744.html

>=20
> On Wed, Sep 5, 2018 at 9:05 AM Robert Yang <liezhi.yang@windriver.com>
> wrote:
>=20
> > We may also need debug native tools, so make BUILD_OPTIMIZATION respect=
 to
> > DEBUG_BUILD, otherwise, we need set CFLAGS in the recipe which isn't
> > convenient.
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index dbadeb3..93aee1a 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -612,7 +612,7 @@ FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
> >  DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pip=
e"
> >  SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
> > 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> >  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZAT=
ION"
> > -BUILD_OPTIMIZATION =3D "-O2 -pipe"
> > +BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g
> > -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pi=
pe"
> >
> >  ##################################################################
> >  # Settings used by bitbake-layers.
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW59AvwAKCRA3VSO3ZXaA
HHSZAJ9/QRh/cWQSff12b5pt9MuxZyc3gACeO6LEyD4I9/9M/7+dcKI+CFFVxr0=
=vwaS
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
