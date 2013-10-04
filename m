Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF0F6CC9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 10:17:27 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1699300eek.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2013 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=02EXEecIR7fxOacDNYlod3Ae4CloQqrE2u8AavfrXz4=;
	b=qwBnmaVQHuscKH+hLIwWybEZuUzPAFDKm92ZWZSCyTl73AKap7jgUhYLLJehpsodzB
	FVQv2Cx1wE08JpBL2GKQbroiAJmh6gJ5NIcLWeHxtdNq78HdjY6vsurv+9dWN/CdpblD
	ZYMuNwMzYeQN5F2Blg0ajbgnFF3J2VAC/I/CKRPIttPxOuMwCYYJ48ij3tnL3GbDGoFb
	FeJQTLqOt8kgJD836hEc6yTyfQXBaR3emhaiuh6shjoxE0fCSLZwT0MZw+Fbm5++vm9g
	v03FKREsX9B5RfO+YKsDhjEIDQsKL3g56AiligW+EkVEUgaW+GST8LBST31wn1NMo+v2
	W25g==
X-Received: by 10.14.179.9 with SMTP id g9mr214477eem.93.1380881848822;
	Fri, 04 Oct 2013 03:17:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm26352832eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 03:17:27 -0700 (PDT)
Date: Fri, 4 Oct 2013 12:17:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131004101734.GD6240@jama>
References: <524E24AE.5060009@windriver.com>
	<CAJTo0LZ9hgtDX1EHvinBtrnVgJsm6YeTOQ6p1FBp49MTVOn4+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ9hgtDX1EHvinBtrnVgJsm6YeTOQ6p1FBp49MTVOn4+A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISTRO_FEATURES and world builds.
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
X-List-Received-Date: Fri, 04 Oct 2013 10:17:29 -0000
X-Groupsio-MsgNum: 45575
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Content-Disposition: inline

--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 09:02:50AM +0100, Burton, Ross wrote:
> On 4 October 2013 03:15, Randy MacLeod <randy.macleod@windriver.com> wrot=
e:
> > ERROR: Nothing PROVIDES 'virtual/libgl' (but
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/clutter/=
clutter-1.0_1.14.4.bb,
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/mes=
a-demos_8.1.0.bb,
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/glew/gle=
w_1.10.0.bb,
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-qt/qt4/qt4-x11-fr=
ee_4.8.5.bb,
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/lib=
glu_9.0.0.bb,
> > /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/cogl/cog=
l-1.0_1.14.0.bb
> > DEPENDS on or otherwise requires it)
> > ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required di=
stro
> > feature ['opengl'] (not in DISTRO_FEATURES)
>=20
> Would a better solution be for "world" builds to recognise that a
> dependency was explicitly skipped and turn that into a warning instead
> of an error?

Agreed, I'm using PNBLACKLIST to mask recipes with unsatisfied
dependencies when building world on distro without x11 and opengl and
it's really long list:

https://github.com/openwebos/meta-webos/blob/master/conf/distro/include/web=
os-recipe-blacklist-world.inc

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOlb4ACgkQN1Ujt2V2gBygnwCdGeUo210CkN9oK99MTc3Kx/8t
OpAAn26vJe8j4OW4h0JdGNQElNZPi92o
=3kQ4
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
