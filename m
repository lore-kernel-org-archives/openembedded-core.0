Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REiQb-0005xJ-Sr
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:08:01 +0200
Received: by bkat8 with SMTP id t8so2016221bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5aPq33KaKuUKxEwKFc6MkPQHJRp0+tY4OOci2+lEqCw=;
	b=tZRSYebWPIXzCECTzltDj1R+i8PNluXQYLXV8ChZeWwZxh8NpDYALAS6GEmhsxgsY1
	Heewna2cRYthEWYeM0GnDCLQJYPFlPWave8r1r5m1CTld7j2ghVLYdLZuNhzgOFrpvOR
	NVvI0JClMX5/lP37MS8N9bmslqliBzJlJGN5g=
Received: by 10.204.139.195 with SMTP id f3mr7036964bku.73.1318600933869;
	Fri, 14 Oct 2011 07:02:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm8583384bkv.8.2011.10.14.07.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 07:02:12 -0700 (PDT)
Date: Fri, 14 Oct 2011 16:02:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014140205.GI3542@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<7278a507dcecff4a27ceeb81a2d2de5b9cb84c87.1318505196.git.Martin.Jansa@gmail.com>
	<1318590739.23801.253.camel@ted>
	<20111014111926.GF3542@jama.jama.net>
	<31C6262B-E2E3-4C58-AFD9-BC8D2366C566@dominion.thruhere.net>
	<1318600723.2342.17.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318600723.2342.17.camel@ted>
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
X-List-Received-Date: Fri, 14 Oct 2011 14:08:02 -0000
X-Groupsio-MsgNum: 11018
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TA4f0niHM6tHt3xR"
Content-Disposition: inline

--TA4f0niHM6tHt3xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 02:58:34PM +0100, Richard Purdie wrote:
> On Fri, 2011-10-14 at 15:32 +0200, Koen Kooi wrote:
> > Op 14 okt. 2011, om 13:19 heeft Martin Jansa het volgende geschreven:
> >=20
> > > On Fri, Oct 14, 2011 at 12:12:11PM +0100, Richard Purdie wrote:
> > >> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > >>> * also install internal GL headers to libgl-dev
> > >>>=20
> > >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >>> ---
> > >>> meta/recipes-graphics/mesa/mesa-common.inc |   18 ++++++++++++++++--
> > >>> 1 files changed, 16 insertions(+), 2 deletions(-)
> > >>>=20
> > >>> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/reci=
pes-graphics/mesa/mesa-common.inc
> > >>> index 89ef0cf..62d9b24 100644
> > >>> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> > >>> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> > >>> @@ -40,7 +40,21 @@ require glx-use-tls.inc
> > >>> # Multiple virtual/gl providers being built breaks staging
> > >>> EXCLUDE_FROM_WORLD =3D "1"
> > >>>=20
> > >>> -PACKAGES =3D+ "libglu libglu-dev"
> > >>> -
> > >>> +PACKAGES =3D+ "libegl libegl-dev libegl-dbg libglu libglu-dev libo=
smesa libosmesa-dev libgl libgl-dev"
> > >>> +FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
> > >>> +FILES_libgl =3D "${libdir}/libGL.so.*"
> > >>> FILES_libglu =3D "${libdir}/libGLU.so.*"
> > >>> +FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
> > >>> +
> > >>> +FILES_libegl-dev =3D "${libdir}/libEGL.* ${includedir}/EGL"
> > >>> +FILES_libgl-dev =3D "${libdir}/libGL.* ${includedir}/GL"
> > >>> FILES_libglu-dev =3D "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
> > >>> +FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/osmes=
a.h"
> > >>> +
> > >>> +FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
> > >>> +FILES_libegl-dbg +=3D "${libdir}/egl/.debug/*"
> > >>> +
> > >>> +do_install_append () {
> > >>> +    install -d ${D}/${includedir}/GL
> > >>> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> > >>> +}
> > >>=20
> > >> This last do_install_append is wrong. Things should only be using
> > >> installed header files, not internal uninstalled ones. If the need
> > >> anything else there is a bug. I know the intel video driver had issu=
es
> > >> in this area but those were fixed in the driver.
> > >=20
> > > checking from where we got this in meta-oe I've found really old comm=
it
> > > http://git.openembedded.org/openembedded/commit/packages/mesa/mesa-co=
mmon.inc?id=3D523eeb1062797a8562446fbefe9413a59540816b
> > > so you're right, I'll try to rebuild without this and drop this part
> > > from patchset.
> > >=20
> > >> What other issues are people seeing without this piece?
> > >=20
> > > Unless someone else knows about still broken driver :).
> >=20
> >=20
> > | glxdriswrast.c:39:39: fatal error: GL/internal/dri_interface.h: No su=
ch file or directory
> > | compilation terminated.
> > | glxdricommon.c:36:39: fatal error: GL/internal/dri_interface.h: No su=
ch file or directory
> > | compilation terminated.
> > | make[1]: *** [glxdricommon.lo] Error 1
> > | make[1]: *** Waiting for unfinished jobs....
> > | make[1]: *** [glxdriswrast.lo] Error 1
> > | make[1]: Leaving directory `/OE/tentacle/build/tmp-angstrom_2010_x-eg=
libc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-2_1.11.1-r1/xorg-serve=
r-1.11.1/glx'
> >=20
> > Xorg requires 'mesa-dri', which doesn't build anymore due to the COMPAT=
IBLE_HOST :(
>=20
> This means the swrast dri backend should be installing that file...
>=20
> Hmm, so does the xserver now require the dri backend and the xlib one is
> now defunct?

I'm using mesa-xlib with xserver-xorg-lite and mesa-dri with
xserver-xorg, but in both cases with this do_install_append..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TA4f0niHM6tHt3xR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YQN0ACgkQN1Ujt2V2gBw3rACePODUneaSgRqXZc9Dle0/rP2x
hZIAnjUFmsVxRm8t5igA1Hg5+OWVbhFi
=sZTp
-----END PGP SIGNATURE-----

--TA4f0niHM6tHt3xR--
