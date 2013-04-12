Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQl4D-0007gJ-3r
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:59:30 +0200
Received: by mail-pd0-f179.google.com with SMTP id x11so1594819pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=AtccOBGo2MHYMIvUMadlmGX/w9rrxU/32aa92uITDzo=;
	b=kAXaWs/AxkjfuAwaRpP95c3CqpP7UY9HlWUZP+ingVADNc2TTsgqINluDhVPGjl26U
	9RYwzA7BzwZellCqGyIQwUBTFeAPmJt1JgjFiu8s7zzdvvZzA+gLp3mdWU3k+mXvzqJ8
	ckTdtrh5ff3jZxBRzOHkQyIphxbG5TmEZ0G5v6BYe545NAz5qe6hqQRYLMs826ytN2+I
	AoAYSp9TfVRAQic4FT+3c9FX7MHDxC9z6ArnczHnbF3/LR3ocoAyeSbEnXV26KxNKyJ0
	bwpMAf/nUlTY31mC6zhKdsQ5Vv0w1hYDN5+oDBLQzhSy1UUDtWPHqiB5aVyv9ZLvV/7b
	1NIQ==
X-Received: by 10.66.149.227 with SMTP id ud3mr14763047pab.33.1365799323559;
	Fri, 12 Apr 2013 13:42:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iy2sm9083301pbb.31.2013.04.12.13.42.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 13:42:02 -0700 (PDT)
Date: Fri, 12 Apr 2013 22:41:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20130412204156.GX2477@jama>
References: <1365795733-25014-1-git-send-email-mark.hatle@windriver.com>
	<CADkTA4Nxoa2=q8++zuJyoa-eHCYa+Q1bf-r1Eu8z4h4Li7xzOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4Nxoa2=q8++zuJyoa-eHCYa+Q1bf-r1Eu8z4h4Li7xzOw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hello-mod: Ensure the produced package name begins with kernel-module-
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 20:59:33 -0000
X-Groupsio-MsgNum: 37849
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wHYmV+hLPeNaasdK"
Content-Disposition: inline

--wHYmV+hLPeNaasdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 04:06:56PM -0400, Bruce Ashfield wrote:
> On Fri, Apr 12, 2013 at 3:42 PM, Mark Hatle <mark.hatle@windriver.com> wr=
ote:
> > The special key kernel-module- is necessary for the system to avoid a p=
ackage
> > rename when installing a multilib image.  For example:
> >
> > local.conf: IMAGE_INSTALL_append =3D " hello-mod"
> >
> > bitbake lib32-core-image-minimal
> >
> > The system will translate names and prepend 'lib32-', unless the package
> > begins with kernel-module-.
>=20
> Mark and I were talking about this, and since this is something that is r=
equired
> in a multlib system, and an external module has gone to the trouble of
> inheriting
> module.bbclass, and we have the kernel-module-split.bbclass, that this
> is something
> we should be able to programatically do and generate the package names th=
at
> meet the expectations of the system.
>=20
> I suggested a bugzilla and we can tackle this at the front end of the upc=
oming
> dev cycle.
>=20
> I think that's reasonable, if anyone knows of a reason why this absolutel=
y can't
> be done automatically .. or I'm out to lunch, I'm happy to have my
> redirect, NAK'd :)

Agreed, hello-mod should give good example and=20
inherit kernel-module-split

if it does not work as-is now then we should improve kernel-module-split and
hello-mod.

> >  meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/=
meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > index 64a6dda..621f700 100644
> > --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > @@ -13,3 +13,11 @@ SRC_URI =3D "file://Makefile \
> >            "
> >
> >  S =3D "${WORKDIR}"
> > +
> > +# Kernel module packages MUST begin with 'kernel-module-', otherwise
> > +# multilib image generation can fail.
> > +#
> > +# The following line is only necessary if the recipe name does not beg=
in
> > +# with kernel-module-.
> > +#
> > +PKG_${PN} =3D "kernel-module-${PN}"
> > --
> > 1.8.1.2.545.g2f19ada
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wHYmV+hLPeNaasdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFocZQACgkQN1Ujt2V2gBwFNwCfZy3+kWKGtwKRnkcEHscqbnnk
ujEAn0297zVKxKWx1aNAtfdHVFU+LZsq
=elB+
-----END PGP SIGNATURE-----

--wHYmV+hLPeNaasdK--
