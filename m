Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id B65256B41B
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 22:51:56 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1222822eei.21
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pK4T9BDk3gYkmbaQNIOFu8bUGT1MSBdT0aWrTAw9oTs=;
	b=Dw2vuQaXk3WIIAOtDdDzobxZePP6p/oxa5AB6bsd/gsJ1lrpyBX034reaqV7lc3vzm
	XjlYGMcwrqobWfMhnUW2eYk0CPuRoWU25AvBZ91Vr6qqjNd0HQp++9cX0Pz0s/fPpPjH
	8qoWdYaeZdJxpzyscsG7wYU8+DVhu0Y/5UZI+a0jyd+nPc+GjTD48rrGB2icPQI3e3gU
	ALQUvxqhZ8l0GwBTgj1dupN9RWXfAQHHCYZGj0dsR4Kf/5CJbaf9cRE0WP/kZg4vYbDW
	zbEo9msiywbRTKTy8iD46OMyUO1SA9tqO0m7j8CStey3VrjWTDGZexskfYCkzSJ4geB0
	5xog==
X-Received: by 10.15.36.9 with SMTP id h9mr21694770eev.30.1377211916173;
	Thu, 22 Aug 2013 15:51:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm20632003eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 15:51:55 -0700 (PDT)
Date: Fri, 23 Aug 2013 00:53:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130822225302.GN522@jama>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<52168CC1.5050906@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <52168CC1.5050906@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 22:51:57 -0000
X-Groupsio-MsgNum: 43823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aIbcA3MSwnGacr4f"
Content-Disposition: inline

--aIbcA3MSwnGacr4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 03:12:17PM -0700, Saul Wold wrote:
> On 08/22/2013 02:24 PM, Khem Raj wrote:
> > Hi
> >
> > In spare cycles my box ran world build for all eglibc/qemus, arm, ppc, =
mips looks all fine however I see errors on mips64,x86 and x86_64
> > I am looking into the mips64 one.
> >
> > x86_64
> > =3D=3D=3D=3D=3D=3D
> >
> > Summary: 17 tasks failed:
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xo=
rg-lib/libxft_2.3.1.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/ca=
iro/cairo_1.12.14.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/=
gstreamer/gst-plugins-base_0.10.36.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivit=
y/bluez/bluez4_4.101.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/cur=
l/curl_7.32.0.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/bee=
crypt/beecrypt_4.2.1.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xo=
rg-xserver/xserver-xorg_1.14.0.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/me=
sa/mesa_9.1.6.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-core/glib-n=
etworking/glib-networking_2.36.2.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/enc=
hant/enchant_1.6.0.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/neo=
n/neon_0.30.0.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-base_1.0.9.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/tag=
lib/taglib_1.8.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-extended/pa=
rted/parted_3.1.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-extended/li=
buser/libuser_0.59.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivit=
y/neard/neard_0.10.bb, do_compile
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivit=
y/bluez5/bluez5_5.7.bb, do_compile
> >
> I do regular builds on my local machine of world and qemumips (not=20
> mips64) with MUT, I wonder what your failures are.  I will do a scratch=
=20
> build right now.
>=20
> What's your exact setup?  any other settings in your local.conf?
>=20
> Sau!
>=20
>=20
> >
> > x86
> > =3D=3D=3D=3D
> >
> > Summary: 1 task failed:
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xo=
rg-driver/xf86-video-intel_2.21.13.bb, do_compile
> >
> This is strange because we do world builds regularly.

IIRC this one happens when opengl isn't in DISTRO_FEATURES. It's also
included in my "State of bitbake world" reports every time..

> > mips64
> > =3D=3D=3D=3D=3D=3D
> >
> > Summary: 1 task failed:
> >    /builds1/angstrom/sources/openembedded-core/meta/recipes-devtools/dp=
kg/dpkg_1.17.1.bb, do_configure
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aIbcA3MSwnGacr4f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIWlk4ACgkQN1Ujt2V2gBwsrACgpi1ZYijsf+m/S8D8LSd9Lmqe
dDgAnj3y9ds23LHa8UrvRZ01Z3HA3TUD
=VmIO
-----END PGP SIGNATURE-----

--aIbcA3MSwnGacr4f--
