Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Su0ig-0007Ms-FW; Wed, 25 Jul 2012 14:29:38 +0200
Received: by bkcik5 with SMTP id ik5so336366bkc.6
	for <multiple recipients>; Wed, 25 Jul 2012 05:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D/uAfEIZg1TUVhijwqOO8GRHmJMpaQB9/I/EsJg8ELo=;
	b=0rmKmjGamlIcKTRvKm9ueYrJl1Jc/C816Ur02zk9LssQRgH6yNP7AuatLR+fpVWXVP
	Ykqg3Ptph3pQWjWZ7NTIixWw8QQxMh73F/WPMtZVcJIn6QX13RDPYx1tLEg5wMV9VxlJ
	aGlTQvgU4BowDd2tdlq8yfQRr5aPN2QfqKRcM8A82x6/AZQHvnaBERd7p2bdBSridgIF
	wy9JRbaQCZRuHlvbjajEMzOfD4rNINj4FWzpjR0rSIlSYCwhUgIP2ETsIk0geP6+dYwe
	VkH+X0bXgBuNfhmetVJMiwhAL2ZHe+Hv862II3TmuR13yBrMZbID/z/umsjn6oc0jZTO
	o2NA==
Received: by 10.204.145.82 with SMTP id c18mr11673715bkv.133.1343218688784;
	Wed, 25 Jul 2012 05:18:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm12711618bkc.5.2012.07.25.05.18.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 05:18:07 -0700 (PDT)
Date: Wed, 25 Jul 2012 14:18:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120725121811.GA20145@jama.jama.net>
References: <20120722104406.D46AB10330@opal>
MIME-Version: 1.0
In-Reply-To: <20120722104406.D46AB10330@opal>
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
X-List-Received-Date: Wed, 25 Jul 2012 12:29:38 -0000
X-Groupsio-MsgNum: 26149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 22, 2012 at 10:44:06AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: effb75d42098b3e367d393215fd5d52a0191e954
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Deffb75d42098b3e367d393215fd5d52a0191e954
>=20
> Author: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> Date:   Thu Jul 19 13:33:52 2012 +0300
>=20
> autoconf: updated to 2.69
>=20
> Tested with core-image-sato-sdk and lib32-core-image-sato-sdk.
> This update was done mainly because multilib builds failed on master with=
 this error:
>=20
> | autoreconf: running: aclocal -I /poky/build/tmp/work/x86-pokymllib32-li=
nux/lib32-automake-1.12.1-r0/automake-1.12.1/m4/ -I /poky/build/tmp/sysroot=
s/x86_64-linux/usr/share/aclocal-1.12 -I /poky/build/tmp/work/x86-pokymllib=
32-linux/lib32-automake-1.12.1-r0/automake-1.12.1/aclocal-copy/ -I /poky/bu=
ild/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1.12.1=
/m4/ -I /poky/build/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /po=
ky/build/tmp/work/x86-pokymllib32-linux/lib32-automake-1.12.1-r0/automake-1=
=2E12.1/aclocal-copy/ --force --warnings=3Dcross
> | aclocal: warning: unknown warning category 'cross'
> | configure.ac:18: error: Autoconf version 2.69 or higher is required

since this upgrade I see autom4te segfaulting when building webkit-efl
autom4te[8513]: segfault at 29e782688 ip 00007f7c52a96e23 sp 00007fff077310=
20 error 4 in Dumper.so[7f7c52a90000+8000]

webkit-efl build finishes fine and is usable afaik but someone would
expect tools like autoconf to behave better and not segfault.

This happens on 2 different builders each with different webkit-efl
version.

Cheers,

>=20
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/autoconf/autoconf.inc        |    2 +-
>  .../{autoconf_2.68.bb =3D> autoconf_2.69.bb}         |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-d=
evtools/autoconf/autoconf.inc
> index 2c07701..4f5a5b2 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -12,7 +12,7 @@ RDEPENDS_${PN} =3D "m4 gnu-config"
>  RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native"
>  RDEPENDS_${PN}_virtclass-nativesdk =3D "m4-nativesdk gnu-config-nativesd=
k"
> =20
> -SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
> +SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
>  	   file://program_prefix.patch"
> =20
>  inherit autotools
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recip=
es-devtools/autoconf/autoconf_2.69.bb
> similarity index 85%
> rename from meta/recipes-devtools/autoconf/autoconf_2.68.bb
> rename to meta/recipes-devtools/autoconf/autoconf_2.69.bb
> index 8d466e0..478f8ed 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
> @@ -17,8 +17,8 @@ SRC_URI +=3D "file://autoreconf-include.patch \
>              file://remove-usr-local-lib-from-m4.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "864d785215aa60d627c91fcb21b05b07"
> -SRC_URI[sha256sum] =3D "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150=
ff35e571454332c8"
> +SRC_URI[md5sum] =3D "82d05e03b93e45f5a39b828dc9c6c29b"
> +SRC_URI[sha256sum] =3D "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b=
59dc0dd6fd4c2969"
> =20
>  SRC_URI_append_virtclass-native =3D " file://fix_path_xtra.patch"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAP5AMACgkQN1Ujt2V2gBy9FQCfU9KRH9GJPgblZdce7JH85py7
V/AAn1D/iNZR4aRAAfHplu6hI0AAWaZ/
=Bm7B
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
