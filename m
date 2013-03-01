Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBMP2-0000Xu-4F
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 10:37:22 +0100
Received: by mail-pa0-f49.google.com with SMTP id kp6so1684889pab.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8R7V2qr9c8uUEsIWBzvdnz5lxMnwTZcD3osRpP5cxps=;
	b=d1sgKCsk1mIWV/Asfb4ZP6jKqFZJbc+Rcx6/rny8Q2O5gUZi8rAnxYIplxoXzbPfao
	f98hG6Sc9fg0pILbmxl6RCNWYICl9qq8u+B7NsprjAqmHb7EQEpumtOH5+zMm4wdT3mb
	1Siu5RkqAF4RzjiygqmEgxALrbJCMJpC0nO7pCRGGYZ0HcUT9DrU5XEik1RIB6oW7PlU
	vk05ZYDk5ZnZBnOJv7uEvCG5uHLe6v7qL0hweMSan0VIzLVLO53g/q25YLTbt0vz0ElO
	hQvnv76V3X7zfTIFP4Lt0RYW+LjGWkdXlry+hf6EHAi/kl8vYlzqv+u+rbVOTl62H4Eq
	8x5A==
X-Received: by 10.66.240.67 with SMTP id vy3mr17235612pac.180.1362129656198;
	Fri, 01 Mar 2013 01:20:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm399107pbt.39.2013.03.01.01.20.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 01:20:55 -0800 (PST)
Date: Fri, 1 Mar 2013 10:20:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Jeffrey Honig <jeffrey.honig@windriver.com>
Message-ID: <20130301092051.GG3279@jama>
References: <3796.1362104349@schlepp.honig.net>
MIME-Version: 1.0
In-Reply-To: <3796.1362104349@schlepp.honig.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH]: Resolve sysvinit and util-linux conflicting man pages.
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
X-List-Received-Date: Fri, 01 Mar 2013 09:37:27 -0000
X-Groupsio-MsgNum: 36067
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline

--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2013 at 09:19:09PM -0500, Jeffrey Honig wrote:
> From: Jeffrey C Honig <jeffrey.honig@windriver.com>
>=20
> [ CQID: WIND00404316 ]
>=20
> Use alternatives mechanism to prevent sysvlinux and util-linux
> man pages from causing conflicts.

It would be better to set higher then default priority in one of them,
otherwise last installed/upgraded wins (at least with opkg u-a=20
implementation).

> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
>  meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>  3 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipe=
s-core/sysvinit/sysvinit_2.88dsf.bb
> index 0a11139..e64b67a 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,7 +5,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
>                      file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e=
1818b786938876a4"
> -PR =3D "r10"
> +PR =3D "r11"
> =20
>  RDEPENDS_${PN} =3D "${PN}-inittab"
> =20
> @@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] =3D "${base_sbindir}/p=
oweroff"
>  ALTERNATIVE_${PN}-pidof =3D "pidof"
>  ALTERNATIVE_LINK_NAME[pidof] =3D "${base_bindir}/pidof"
> =20
> +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 u=
tmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> +
>  PACKAGES =3D+ "sysvinit-pidof sysvinit-sulogin"
>  FILES_${PN} +=3D "${base_sbindir}/* ${base_bindir}/*"
>  FILES_sysvinit-pidof =3D "${base_bindir}/pidof.sysvinit ${base_sbindir}/=
killall5"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 10439c0..c91f4a3 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] =3D "${base_sbindi=
r}/pivot_root"
>  ALTERNATIVE_LINK_NAME[mkfs.minix] =3D "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> =20
> +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 u=
tmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> +
>  # There seems to be problem, atleast on nslu2, with these, untill they a=
re
>  # fixed the busybox ones have higher priority
>  ALTERNATIVE_PRIORITY[hwclock] =3D "10"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION =3D "2.22"
> -PR =3D "r0"
> +PR =3D "r1"
>  require util-linux.inc
> =20
>  # note that `lscpu' is under GPLv3+
> --=20
> 1.7.9.5
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwcvMACgkQN1Ujt2V2gByfuQCeO+H71VDMA7RY/kcTpRliwnOr
Ls8AoJDz4P+C3YYaU2e6y1uUh4YskuFy
=ukOf
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
