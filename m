Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SyNnz-0007sx-Tk; Mon, 06 Aug 2012 15:57:12 +0200
Received: by wgbdr1 with SMTP id dr1so2387207wgb.24
	for <multiple recipients>; Mon, 06 Aug 2012 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G8mKcwBcw3qonFf+SPhyVj6qJPwOj5xThp2qZK5A244=;
	b=UWPUi1p1DfKAWdldghhfihpmoRYRDx7RQwhS5A//x0x1J90twJIRzqnULyUoguEIbv
	ORSWJ+mryh/xCakdYv84lZjN92P2RBpqDBR8YMrnVTbSMQsErEXZdC90xj8CUO2oFBn3
	HPxrugM59Ynh4IilqqaL8DJdmjrZREg+UWDsm+jlITr2GDWT+sHlGBhuMJhtsblYbLls
	k+7oKojft7q4uF8PydIdR+aQkvSM/LTC2kls53040PwFptGfE2G2ZUe9ZY+GCrCbWdJx
	PWiBT+yeRr+Yj+hyxFqPtAJSSztijlBofCatsp+FPt/othPIBc7SLeFLOQSVI5hHtyXN
	8R5w==
Received: by 10.216.60.67 with SMTP id t45mr5213742wec.95.1344260727381;
	Mon, 06 Aug 2012 06:45:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm15643236wiz.4.2012.08.06.06.45.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:45:25 -0700 (PDT)
Date: Mon, 6 Aug 2012 15:45:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120806134521.GK3267@jama.jama.net>
References: <20120722104406.D46AB10330@opal>
	<20120725121811.GA20145@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120725121811.GA20145@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bogdan Marinescu : autoconf: updated to 2.69
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
X-List-Received-Date: Mon, 06 Aug 2012 13:57:12 -0000
X-Groupsio-MsgNum: 27023
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline

--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 02:18:11PM +0200, Martin Jansa wrote:
> On Sun, Jul 22, 2012 at 10:44:06AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: effb75d42098b3e367d393215fd5d52a0191e954
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Deffb75d42098b3e367d393215fd5d52a0191e954
> >=20
> > Author: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > Date:   Thu Jul 19 13:33:52 2012 +0300
> >=20
> > autoconf: updated to 2.69
> >=20
> > Tested with core-image-sato-sdk and lib32-core-image-sato-sdk.
> > This update was done mainly because multilib builds failed on master wi=
th this error:
> >=20
> > | autoreconf: running: aclocal -I /poky/build/tmp/work/x86-pokymllib32-=
linux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysro=
ots/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymll=
ib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ -I /poky/=
build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12=
=2E1/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I=
 /poky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automa=
ke-1.12.1/aclocal-copy/ --force --warnings=3Dcross
> > | aclocal: warning: unknown warning category 'cross'
> > | configure.ac:18: error: Autoconf version 2.69 or higher is required
>=20
> since this upgrade I see autom4te segfaulting when building webkit-efl
> autom4te[8513]: segfault at 29e782688 ip 00007f7c52a96e23 sp 00007fff0773=
1020 error 4 in Dumper.so[7f7c52a90000+8000]
>=20
> webkit-efl build finishes fine and is usable afaik but someone would
> expect tools like autoconf to behave better and not segfault.
>=20
> This happens on 2 different builders each with different webkit-efl
> version.

Nobody else have seen this in dmesg? It happens quite often and probably
not only while building webkit-efl. Because I don't build webkit-efl so
often:
dmesg | grep -c "segfault at.*Dumper.so"
37

It could be related to perl as Dumper.so is part of perl install
dev-lang/perl-5.16.0 (/usr/lib64/perl5/5.16.0/x86_64-linux-thread-multi/aut=
o/Data/Dumper/Dumper.so)

Maybe inheriting perlnative in autoconf would solve that too.

Cheers,

>=20
> Cheers,
>=20
> >=20
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
> >  .../{autoconf_2.68.bb =3D> autoconf_2.69.bb}         |    4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes=
-devtools/autoconf/autoconf.inc
> > index 2c07701..4f5a5b2 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf.inc
> > +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> > @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "m4 gnu-config"
> >  RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native"
> >  RDEPENDS_${PN}_virtclass-nativesdk =3D "m4-nativesdk gnu-config-native=
sdk"
> > =20
> > -SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
> > +SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
> >  	   file://program_prefix.patch"
> > =20
> >  inherit autotools
> > diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/rec=
ipes-devtools/autoconf/autoconf_2.69.bb
> > similarity index 85%
> > rename from meta/recipes-devtools/autoconf/autoconf_2.68.bb
> > rename to meta/recipes-devtools/autoconf/autoconf_2.69.bb
> > index 8d466e0..478f8ed 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> > +++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> > @@ -17,8 +17,8 @@ SRC_URI +=3D "file://autoreconf-include.patch \
> >              file://remove-usr-local-lib-from-m4.patch \
> >             "
> > =20
> > -SRC_URI[md5sum] =3D "864d785215aa60d627c91fcb21b05b07"
> > -SRC_URI[sha256sum] =3D "c491fb273fd6d4ca925e26ceed3d177920233c76d542b1=
50ff35e571454332c8"
> > +SRC_URI[md5sum] =3D "82d05e03b93e45f5a39b828dc9c6c29b"
> > +SRC_URI[sha256sum] =3D "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a9=
5b59dc0dd6fd4c2969"
> > =20
> >  SRC_URI_append_virtclass-native =3D " file://fix_path_xtra.patch"
> > =20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAfynEACgkQN1Ujt2V2gBzxpQCZAa+Z083SWy1C+0DFR1/5cAsA
mSEAn3K4wYJukbZpks3iyaBArc43qsq9
=RfQB
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--
