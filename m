Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfbiU-0005FR-NY
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 20:30:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1763198eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 11:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wLDA1q2EcaVfDu8SvAkKLw2DrFF/TF+nUxi184bchw8=;
	b=YZiWubVK7U9sE+7DaQhCSVPFVqyi3yxMxOCDGLKv7xK3zg9HGcHT1OChLCCjIKMYtl
	XXr61yoIyN1Nd4qlCEk8Cj9oz2jzpeMgLstbKM2n9PEvVUXwZGedrk3lbe1b6Gl2jyZu
	dG6u6xcDvhTMWfcHfZ8+z72LIuMYQWankGGcmzazYlkNGA1pk/+EqLBrln29ZQpy6MR+
	YPHDMy86RT9WCSJfKR2Js6zZURhjeDyn4cW/GOnKa3yTM0dg+ioRcE0Cn0a2K4rCZbPw
	5wzRXXC7WNtl7bspyt9rtaTdNmip1ei6QFkU/hMlnTgTQrwaHphcvtTAyGZJAHi6gbdu
	HFDw==
Received: by 10.14.213.134 with SMTP id a6mr39342206eep.45.1354562148307;
	Mon, 03 Dec 2012 11:15:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm32959604eel.14.2012.12.03.11.15.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 11:15:47 -0800 (PST)
Date: Mon, 3 Dec 2012 20:15:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121203191542.GG3354@jama.jama.net>
References: <20121203144920.55C841035D@opal>
MIME-Version: 1.0
In-Reply-To: <20121203144920.55C841035D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Saul Wold : util-linux: Update to 2.22.1
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
X-List-Received-Date: Mon, 03 Dec 2012 19:30:10 -0000
X-Groupsio-MsgNum: 32101
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline

--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 02:49:20PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ac807121ce3ba965f3e2a4f664a60ae4e33ce550
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dac807121ce3ba965f3e2a4f664a60ae4e33ce550
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Fri Nov 16 19:51:34 2012 +0000
>=20
> util-linux: Update to 2.22.1
>=20
> Fix the configure-sbindir test, which was not working correctly
> add a patch to configure to correctly test if the prefixes are
> conatined in libdir so they don't duplicate.
>=20
> Removed aarch64 patch since it been merged into this version
>=20
> Rebased util-linux-ng-replace-siginterrupt.patch

This seems to autodetect systemd if available and cause some unpackaged
files

util-linux-2.22.1: util-linux: Files/directories were installed but not
shipped
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/uuidd.socket
  /lib/systemd/system/uuidd.service

I should be resolved by meta-systemd, by adding bbappend (that's what I
did for pcsc-lite doing the same).

But maybe oe-core should explicitly disable systemd for meta-systemd to
explicitly enable it back.

Cheers,

>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc        |   21 +++++++++++---=
-----
>  .../util-linux/add-aarch64-support.patch           |   18 --------------=
---
>  .../util-linux/util-linux/configure-sbindir.patch  |   15 +++++++++----
>  .../util-linux/util-linux/fix-configure.patch      |   20 ++++++++++++++=
+++++
>  .../util-linux/uclibc-__progname-conflict.patch    |   14 ++++++------
>  .../util-linux-ng-replace-siginterrupt.patch       |   15 +++++++------
>  .../{util-linux_2.21.2.bb =3D> util-linux_2.22.1.bb} |   10 ++++----
>  7 files changed, 62 insertions(+), 51 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3Dac807121ce3ba965f3e2a4f664a60ae4e33ce550
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC8+l4ACgkQN1Ujt2V2gByq0ACfSuj+uJXDBL8pNgH3l2YeYwil
4/4An1y6iradsWwEZcBIWD5zsQ/gmQev
=P8bq
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
