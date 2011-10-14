Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REftE-00057B-UQ
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:25:24 +0200
Received: by bkat8 with SMTP id t8so1839939bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dCSW/Z1eMTWewbGHPZtRzsNVUbY+QdkumaJY07lUWl0=;
	b=KKPYYcPtbrr7OzCjAhwAtPvwWZKHz2Y3Ouyn3hwiMw+jqmZJslYs/OKxCn9e59MzwP
	GTL1hE7uvi5VlrwwwtsASWQ0mmIJhenyKJLJ6sFBhNzSE4P2yENShtIuAqeZY80NVjZM
	g+sg1kqox2LVMEYh7Bp323rIBYFDZ+mNNUx10=
Received: by 10.204.152.195 with SMTP id h3mr6480339bkw.1.1318591174851;
	Fri, 14 Oct 2011 04:19:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm8085458bkt.4.2011.10.14.04.19.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 04:19:33 -0700 (PDT)
Date: Fri, 14 Oct 2011 13:19:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014111926.GF3542@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
	<1318590739.23801.253.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318590739.23801.253.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core 11/20] mesa: package gl/egl/osmesa to separate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2011 11:25:25 -0000
X-Groupsio-MsgNum: 11000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline

--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 12:12:11PM +0100, Richard Purdie wrote:
> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > * also install internal GL headers to libgl-dev
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
> >  1 files changed, 16 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-=
graphics/mesa/mesa-common.inc
> > index 89ef0cf..62d9b24 100644
> > --- a/meta/recipes-graphics/mesa/mesa-common.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> > @@ -40,7 +40,21 @@ require glx-use-tls.inc
> >  # Multiple virtual/gl providers being built breaks staging
> >  EXCLUDE_FROM_WORLD =3D "1"
> > =20
> > -PACKAGES =3D+ "libglu libglu-dev"
> > -
> > +PACKAGES =3D+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmes=
a libosmesa-dev libgl libgl-dev"
> > +FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> > +FILES_libgl =3D "${libdir}/libGL.so.*"
> >  FILES_libglu =3D "${libdir}/libGLU.so.*"
> > +FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
> > +
> > +FILES_libegl-dev =3D "${libdir}/libEGL.* ${includedir}/EGL"
> > +FILES_libgl-dev =3D "${libdir}/libGL.* ${includedir}/GL"
> >  FILES_libglu-dev =3D "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
> > +FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> > +
> > +FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
> > +FILES_libegl-dbg +=3D "${libdir}/egl/.debug/*"
> > +
> > +do_install_append () {
> > +    install -d ${D}/${includedir}/GL
> > +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> > +}
>=20
> This last do_install_append is wrong. Things should only be using
> installed header files, not internal uninstalled ones. If the need
> anything else there is a bug. I know the intel video driver had issues
> in this area but those were fixed in the driver.

checking from where we got this in meta-oe I've found really old commit
http://git.openembedded.org/openembedded/commit/packages/mesa/mesa-common.i=
nc?id=3D523eeb1062797a8562446fbefe9413a59540816b
so you're right, I'll try to rebuild without this and drop this part
=66rom patchset.

> What other issues are people seeing without this piece?

Unless someone else knows about still broken driver :).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YGr4ACgkQN1Ujt2V2gBxnHQCgsddzM3EiPt1aLD5L/TdU0tfN
+2wAniOB8R1xw7NmX9GKnFj3BdcsQpPE
=JDEW
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
