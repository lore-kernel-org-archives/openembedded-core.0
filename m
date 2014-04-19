Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 732F96116C;
	Sat, 19 Apr 2014 16:03:52 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id b57so2438407eek.7
	for <multiple recipients>; Sat, 19 Apr 2014 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BVjhe23LwkxS96tqmcgFUoVlT/1tFHBX6r7mK3e4lws=;
	b=oMrAyK1pict/dZM1MPcSmOk1VZfr35LmsiNOchVZkrV/oJSID3y8dj1j+Rwjt+F6Z3
	LaPvggMHgFI91qBC/sVrP9TyQd+wGfgxtscczZaFoXSO+HGjCsVK8SiH2COiDiqz8ffb
	DevzFDgjLs/JOpDlCYAuxFmTIr3f3aZ1VqQZDrFQah9AhKmTVTgtVMeOh+2GlRhDEbQI
	El4Yaz93wBtReiulBC+OLukYfiVr1/nth8LiKsq4BlhkuGnEAnMD5R1rHjpbBcrM+1ew
	seNQbNmhJRvukhtf7WzaSvfnIfxCfoy7U1JugHDX1XSD1ajmCiMsgxHtWIcVc7kbK2nn
	FIAw==
X-Received: by 10.14.126.73 with SMTP id a49mr31630871eei.46.1397923433060;
	Sat, 19 Apr 2014 09:03:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e42sm86744691eev.32.2014.04.19.09.03.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:03:51 -0700 (PDT)
Date: Sat, 19 Apr 2014 18:03:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140419160356.GJ2486@jama>
References: <20140419152936.AAFAF5028A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140419152936.AAFAF5028A@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Sat, 19 Apr 2014 16:03:55 -0000
X-Groupsio-MsgNum: 52483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline

--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2014 at 03:29:36PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 2f157327963df245d61897df7a1dd214da4c98fd
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2f157327963df245d61897df7a1dd214da4c98fd
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sun Mar  2 17:39:21 2014 +0000
>=20
> bitbake.conf/base.bbclass: Drop PRINC support
>=20
> PRINC is no longer needed since we have the PR service instead
> which people should be using. Drop the PRINC code.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/base.bbclass | 16 ----------------
>  meta/conf/bitbake.conf    |  1 -
>  2 files changed, 17 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index f4f5321..109bbad 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -453,22 +453,6 @@ python () {
>          else:
>              appendVar('EXTRA_OECONF', extraconf)
> =20
> -    # If PRINC is set, try and increase the PR value by the amount speci=
fied
> -    # The PR server is now the preferred way to handle PR changes based =
on
> -    # the checksum of the recipe (including bbappend).  The PRINC is now
> -    # obsolete.  Return a warning to the user.
> -    princ =3D d.getVar('PRINC', True)
> -    if princ and princ !=3D "0":
> -        bb.warn("Use of PRINC %s was detected in the recipe %s (or one o=
f its .bbappends)\nUse of PRINC is deprecated.  The PR server should be use=
d to automatically increment the PR.  See: https://wiki.yoctoproject.org/wi=
ki/PR_Service." % (princ, d.getVar("FILE", True)))

Shouldn't this warning stay for next release? People should knowingly
remove PRINCs from their layers instead of PR going backwards silently
(except qa check when buildhistory is enabled).

> -        pr =3D d.getVar('PR', True)
> -        pr_prefix =3D re.search("\D+",pr)
> -        prval =3D re.search("\d+",pr)
> -        if pr_prefix is None or prval is None:
> -            bb.error("Unable to analyse format of PR variable: %s" % pr)
> -        nval =3D int(prval.group(0)) + int(princ)
> -        pr =3D pr_prefix.group(0) + str(nval) + pr[prval.end():]
> -        d.setVar('PR', pr)
> -
>      pn =3D d.getVar('PN', True)
>      license =3D d.getVar('LICENSE', True)
>      if license =3D=3D "INVALID":
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b3786a7..bcc387c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -190,7 +190,6 @@ ASSUME_PROVIDED =3D "\
>  PN =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or '=
defaultpkgname'}"
>  PV =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '=
1.0'}"
>  PR =3D "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or '=
r0'}"
> -PRINC ?=3D "0"
>  PF =3D "${PN}-${EXTENDPE}${PV}-${PR}"
>  EXTENDPE =3D "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
>  P =3D "${PN}-${PV}"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNSnmwACgkQN1Ujt2V2gBz50ACgh7XAN4WROKYkA4E3zcvBAa+D
MN8AnRDQ98tDzp4yCnq11uec1LwbyXDd
=TT6Y
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
