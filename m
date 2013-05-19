Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdzCo-0000z3-EN
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 10:43:07 +0200
Received: by mail-pb0-f51.google.com with SMTP id jt11so3415926pbb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 01:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=P3qRku6l9S5hFlomi8ZPXcxpwOeNDlusREWgEbdnJhc=;
	b=GK7IDKMd7JefEW6hV6QXJf5+VsB7FUebRLH4YL+VKZMrNT5FhSCT+q10ccHvce2dOx
	K94aCn8MHb2/H1fOuAGzCQrUnNGtHgGsJND33ZOL0CiNcHEDAL+eYV+1NblZ1kcecWUH
	3XzDwSUD6sIe8nZH+URh0Qla7RY4nOiZGTijhK3dGkDEGpx0js8LjRz53Rmg6tmqBHkd
	I42qlR2xuJAko/Cyouc8Gg5YBTBnz6fh0fkiNh1QflnKf+rlzd4XxvFp2ugM+5Tns463
	Sb8hxBvp7EXZtAlbahiRbQHdNUM66lVS2DoZA1n/EvAyWEWubFx4huUNb8Ccurq57rEE
	uPKg==
X-Received: by 10.68.139.33 with SMTP id qv1mr49370170pbb.93.1368951883372;
	Sun, 19 May 2013 01:24:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ov2sm18858626pbc.34.2013.05.19.01.24.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 01:24:41 -0700 (PDT)
Date: Sun, 19 May 2013 10:24:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130519082432.GD3196@jama>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Sun, 19 May 2013 08:43:14 -0000
X-Groupsio-MsgNum: 39422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2013 at 04:05:39AM -0700, Saul Wold wrote:
> This changes the default GCC to 4.8, it has been tested with OE-Core
> and a number of layers have been testing with it for the last few weeks.
>=20
> There are some minor issues outside of OE-Core. These will be addressed
> with time.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Cc: Khem Raj <raj.khem@gmail.com>
>=20
> ---
>  meta/conf/distro/include/tcmode-default.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 88d109b..f3942b5 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -17,7 +17,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial=
 =3D "${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial =3D "nati=
vesdk-${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
> =20
> -GCCVERSION ?=3D "4.7%"
> +GCCVERSION ?=3D "4.8%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>  BINUVERSION ?=3D "2.23.2"
>  EGLIBCVERSION ?=3D "2.17"

There is also ICE when pixman is built with thumb enabled (e.g. qemuarm
+ ARM_INSTRUCTION_SET =3D "thumb" set, with thumb disabled it builds fine.

OE @ ~/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/pixman/1_0.29.4-r0/=
pixman-0.29.4/test $ make
=2E./arm-oe-linux-gnueabi-libtool  --tag=3DCC   --mode=3Dcompile arm-oe-lin=
ux-gnueabi-gcc  -march=3Darmv5te -mthumb -mthumb-interwork --sysroot=3D/OE/=
oe-core/tmp-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I..  -I../pixman -=
I../pixman -I/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/include/libpng16  =
  -O2 -pipe -g -feliminate-unused-debug-types -Wall -fno-strict-aliasing -f=
visibility=3Dhidden -c -o utils-prng.lo utils-prng.c
arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=3Da=
rmv5te -mthumb -mthumb-interwork --sysroot=3D/OE/oe-core/tmp-eglibc/sysroot=
s/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../pixman -I../pixman -I/OE/oe-core/tm=
p-eglibc/sysroots/qemuarm/usr/include/libpng16 -O2 -pipe -g -feliminate-unu=
sed-debug-types -Wall -fno-strict-aliasing -fvisibility=3Dhidden -c utils-p=
rng.c  -fPIC -DPIC -o .libs/utils-prng.o
utils-prng.c: In function 'prng_srand_r':
utils-prng.c:73:1: internal compiler error: Segmentation fault
 }
 ^
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make: *** [utils-prng.lo] Error 1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYjEAACgkQN1Ujt2V2gBwDegCeKYXjOS435o51+MPnz9aaJbuN
emcAnjIRhKHMvhLRg+yuL2Tlybuu5XEq
=WRk4
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
