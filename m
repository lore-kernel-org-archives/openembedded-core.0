Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (unknown [209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC5961F16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 11:12:33 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id p9so652225lbv.39
	for <multiple recipients>; Thu, 15 May 2014 04:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mM9LdH1hZFvKmDxh+SqaeC4G3dh0da1p2Jj1dLCszp8=;
	b=H0d5aQ49IDVjM0CZWWb+5bUCXyePRX6GK4t3FYtTvmJ04sEelx0JuKVXKKyZwhAaaF
	9nR/X+ImibDOJb0bFIx1FSvKMRckkS/LbITPV1LEDQeXWHmTJqaJoqy6DemcgS5G6jDd
	wGlULQXrbp/rNhblvPL2URxBI7kbjXd4A3yHamZJvTnKkWQgYkyRyJl5uNme88wscYeT
	QZ6iv0WZAcaIsCGdXPHfkbNs7pQmNz8i2PgedQYIAk/RE8NvUU0fvpeteBhyJYZfCkOy
	YBZNoTYU9jUrJqObctTwxjoTGKW9x0F5n89zzHtHu55choZD/RnO9wrk3+5ddIbsnmO7
	xvow==
X-Received: by 10.112.14.5 with SMTP id l5mr6734263lbc.12.1400152353712;
	Thu, 15 May 2014 04:12:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	aa1sm5056396lbd.12.2014.05.15.04.12.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 04:12:32 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 May 2014 13:13:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140515111302.GC2433@jama>
References: <20140506170105.9D101503BF@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140506170105.9D101503BF@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Valentin Popa : nettle: add nettle to oe-core
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
X-List-Received-Date: Thu, 15 May 2014 11:12:38 -0000
X-Groupsio-MsgNum: 53239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline

--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 05:01:05PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: e0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3De0e5eaee72e49c01e76d56cd03fbfb3e20febbb0
>=20
> Author: Valentin Popa <valentin.popa@intel.com>
> Date:   Mon Apr 28 17:28:19 2014 +0300
>=20
> nettle: add nettle to oe-core
>=20
> Newer versions of gnutls depends on nettle.

Any idea why it fails in some builds like this:

| checking whether ln -s works... yes
| checking build system compiler gcc ... no
| configure: error: Specified CC_FOR_BUILD doesn't seem to work
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.

config.log:
configure:4412: checking build system compiler gcc
configure:4425: gcc  conftest.c
conftest.c: In function 'main':
conftest.c:4:3: warning: incompatible implicit declaration of built-in func=
tion 'exit' [enabled by default]
   exit(0);
   ^
configure:4428: $? =3D 0
/OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.out: cannot exe=
cute binary file
/OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./b.out: No such fi=
le or directory
/OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a.exe: No such fi=
le or directory
/OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./a_out.exe: No suc=
h file or directory
/OE//nettle/2.7.1-r0/nettle-2.7.1/configure: line 4430: ./conftest: No such=
 file or directory
configure:4435: result: no
configure:4440: error: Specified CC_FOR_BUILD doesn't seem to work

export CC_FOR_BUILD=3D"gcc "

> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-support/nettle/nettle_2.7.1.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-s=
upport/nettle/nettle_2.7.1.bb
> new file mode 100644
> index 0000000..87f1639
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "A low level cryptographic library"
> +HOMEPAGE =3D "http://www.lysator.liu.se/~nisse/nettle/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f1720=
6a5b0a1 \
> +                    file://serpent-decrypt.c;beginline=3D53;endline=3D67=
;md5=3Dbcfd4745d53ca57f82907089898e390d \
> +                    file://serpent-set-key.c;beginline=3D56;endline=3D70=
;md5=3Dbcfd4745d53ca57f82907089898e390d"
> +
> +DEPENDS +=3D "gmp"
> +
> +SRC_URI =3D "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "003d5147911317931dd453520eb234a5"
> +SRC_URI[sha256sum] =3D "bc71ebd43435537d767799e414fce88e521b7278d48c8606=
51216e1fc6555b40"
> +
> +do_configure_prepend() {
> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
> +       fi
> +}
> +
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN0oT4ACgkQN1Ujt2V2gBz+ewCcDhNc12OfHE5DdtHLoefOzMVr
guQAn2SwtNR4kOS86CMCwN2YbcXsYZco
=5n2T
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
