Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6939C60167;
	Tue, 24 Jun 2014 10:04:24 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so5593064wib.5
	for <multiple recipients>; Tue, 24 Jun 2014 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rppsDnLM6lkCJcxxPiJRl6Yd+Ae0ci+LJJxe431kayg=;
	b=wI7C3GFNOHSkNBg0vF7GVLhxDFFXFq3xqzAuCjYUAmFscBi+DJHgbKjWSvKZcj2QI8
	hMZNUIRYweKIPsxOw5zmFS9UE/ShPCYsVtOGHh6RoSZiFw7lyocQ0TyLAlQGEmd2G23M
	Q7lghM4VoLl71haVvQ+OVdEFuO12hr1XL3eDstnEFFDOaatWbWfgG9kcAu1IDhpRFouU
	HJHgZj68JmJF9/1pVL8cvAO4IiW8aSnXJ/Mrvohgmco2lBqz4Pti6gE2k+mgbbI/XqhY
	jUqn/yTzwdXYvn4i0hFRJC2zD9cZfkzdMatfRVLEvzGyg53MWrfc5E1x9St02PB8s/oy
	wqVQ==
X-Received: by 10.194.62.5 with SMTP id u5mr33828855wjr.46.1403604264509;
	Tue, 24 Jun 2014 03:04:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jv9sm42308147wjc.28.2014.06.24.03.04.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 03:04:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Jun 2014 12:04:22 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140624100422.GM2437@jama>
References: <20140621080922.GE2117@jama>
 <1403600852.2104.125.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1403600852.2104.125.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2014-06-21
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
X-List-Received-Date: Tue, 24 Jun 2014 10:04:29 -0000
X-Groupsio-MsgNum: 54340
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Content-Disposition: inline

--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 10:07:32AM +0100, Richard Purdie wrote:
> On Sat, 2014-06-21 at 10:09 +0200, Martin Jansa wrote:
> > On Wed, Jun 11, 2014 at 12:57:59PM +0200, Martin Jansa wrote:
> > > On Tue, Jun 10, 2014 at 12:07:22PM +0200, Martin Jansa wrote:
> > > > On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> > > > > This build still contains huge patch setting B =3D S or inherit f=
or
> > > > > autotools-brokensep for all recipes which were failing in earlier
> > > > > master builds.
> > >=20
> > > I've removed this patch for this build to see how bad it is. And it's=
 BAD.
> >=20
> > Now it doesn't have the big B=3DS patch, but long patchset of PNBLACKLI=
STs I've sent
> > earlier this week.
> >=20
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >=20
> > =3D=3D Failed tasks 2014-06-21 =3D=3D
> >=20
> > I have a fix for python-cython. This doesn't include the big patch from=
 RP.
> >=20
> > =3D=3D=3D common (28) =3D=3D=3D
> [...]
> >     * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.=
10.13.bb, do_configure
>=20
> The gst-ffmpeg failure is somewhat strange. Both libav and libpostproc
> can provide libpostproc but at least in my tests, it builds just fine
> regardless of which one(s) I've previously built (both in OE-Core and
> with meta-oe added).
>=20
> So I'm not sure why its happening or therefore how to fix it :/.

This is caused by newer libav-9*, sorry I haven't said that in e-mail (I
did in some previous status updates though).

I've returned PREFERRED_VERSION for libav-9* because there was some talk
about making it default and (re)moving libav-0.8.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOpTSYACgkQN1Ujt2V2gBzNkgCfaLXeLjPNbiFiLlpwZ11lEJFx
z9YAn2yJYXVGXFjqqw8kNPtdULWqZAaf
=NSxf
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
