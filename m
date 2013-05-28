Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF886A57F;
	Tue, 28 May 2013 13:46:05 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 14so5251557pdc.39
	for <multiple recipients>; Tue, 28 May 2013 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WP4PR7SrT6rTVw+hNjh4/iDLtXe1G/P80qAq1IC2P04=;
	b=cFavPhTRB/Pa9okNfPOiipRDpWvzMMvbcGYxD8FxQvuDvCoG3jhM7JNMjlahtNr5Ky
	s4u0Arp7kdxT0hBoKhbNfddqLsp6l3USM0u8A6hM2d+Sfd8PAOfMGVPwJwBCCnN2YQ5C
	dhIkzNoFn9sVj8XLgKEXjvCiQzcQn4cH9iSY8/MsyWavXzIO05aZXJcKYMgYwPZDbvSK
	j6YyTBueLPOYJ7Vpj12kAIq6z5RKTrfbBIu4Xt3DP4i4A2/nvvCk6rMHc/LoK5tJx2kV
	KVbsUNcGZY6Vtsy4jzKFFJmVH5eRdmy1SwL+dY7huYF3EihsmlXgBREefI5EKlrmFSM9
	oFRg==
X-Received: by 10.66.246.131 with SMTP id xw3mr33956467pac.114.1369748766763; 
	Tue, 28 May 2013 06:46:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bs2sm35261589pad.17.2013.05.28.06.46.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 06:46:05 -0700 (PDT)
Date: Tue, 28 May 2013 15:46:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528134606.GJ3192@jama>
References: <20130528132841.A450B5039B@opal>
MIME-Version: 1.0
In-Reply-To: <20130528132841.A450B5039B@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Tue, 28 May 2013 13:46:05 -0000
X-Groupsio-MsgNum: 39771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dwWFXG4JqVa0wfCP"
Content-Disposition: inline

--dwWFXG4JqVa0wfCP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 01:28:41PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: e1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3De1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
>=20
> Author: Mark Hatle <mark.hatle@windriver.com>
> Date:   Tue May 21 13:29:03 2013 -0500
>=20
> base.bbclass: Deprecate the PRINC logic
>=20
> The PRINC logic is now deprecated, the PR server should be used to handle
> the automatic incrementing of the PR (package release) field.  The default
> setting of '0' has been removed, and a warning message has been added.

How are people supposed to remove existing PRINC without causing version
going backwards?

Do I have to choose between seeing 100 warnings about deprecated PRINC
or 100 ERRORs from buildhistory about versions going backwards?

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/base.bbclass |    4 ++++
>  meta/conf/bitbake.conf    |    1 -
>  2 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b1642a2..29084a2 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -465,8 +465,12 @@ python () {
>              appendVar('EXTRA_OECONF', extraconf)
> =20
>      # If PRINC is set, try and increase the PR value by the amount speci=
fied
> +    # The PR server is now the preferred way to handle PR changes based =
on
> +    # the checksum of the recipe (including bbappend).  The PRINC is now
> +    # obsolete.  Return a warning to the user.
>      princ =3D d.getVar('PRINC', True)
>      if princ and princ !=3D "0":
> +        bb.warn("Use of PRINC is deprecated.  The PR server should be us=
ed to automatically increment the PR.  See: https://wiki.yoctoproject.org/w=
iki/PR_Service"
>          pr =3D d.getVar('PR', True)
>          pr_prefix =3D re.search("\D+",pr)
>          prval =3D re.search("\d+",pr)
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 174236d..115832c 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -186,7 +186,6 @@ ASSUME_PROVIDED =3D "\
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
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dwWFXG4JqVa0wfCP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGktR4ACgkQN1Ujt2V2gBzFGQCgtC5HhAxe+97SfV6WNoynYZcO
PJ8AnjpuMHwkKSIJkf38vpdiWWmsmEA8
=OmNt
-----END PGP SIGNATURE-----

--dwWFXG4JqVa0wfCP--
