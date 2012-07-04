Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SmSab-0001gb-Gt; Wed, 04 Jul 2012 18:38:05 +0200
Received: by wibhq4 with SMTP id hq4so4928802wib.6
	for <multiple recipients>; Wed, 04 Jul 2012 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SguF/p55woRXn3RnNJcPYFSMb2qKayzslym9rcFyXHU=;
	b=Qb1VWOzZA0ahVQafMbvCM+YCZ+drGNQcbvklqCAGR/7isqSHbNNbgtBG/ei66FlzEv
	FiTysBuAXnja11IpRcctNaEOs+YgeKp35I1p4ZbLdj2tvnCTcVm/F2wihbGziShQA/5f
	JYi2bN5RKkLzYFrq463wHpUZmalnnZRr6hMGI4S9bgoKWDWdgZZ/jJa8XQN1BJs5auhz
	Nv1IgFkSkrrhEv2eqOe3eT7X2fCNSqKlmt9/r5LBZ2YKq4BE4UWFfGD6vnsZv2BaLADv
	32P4hc0ICyggV2FkXT53gNSr2OZLir8QpoD3eHbcMZFm72trrI0ag5RSTQWNj+6SDiWP
	AfMg==
Received: by 10.216.237.193 with SMTP id y43mr6056645weq.75.1341419222227;
	Wed, 04 Jul 2012 09:27:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n6sm67790871wie.7.2012.07.04.09.27.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 09:27:01 -0700 (PDT)
Date: Wed, 4 Jul 2012 18:26:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120704162654.GE15100@jama.jama.net>
References: <20120704134932.B766810217@opal>
MIME-Version: 1.0
In-Reply-To: <20120704134932.B766810217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : meta/classes: Update recrdeptask fields for recursive dependency handling changes in bitbake
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
X-List-Received-Date: Wed, 04 Jul 2012 16:38:05 -0000
X-Groupsio-MsgNum: 24672
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oPmsXEqKQNHCSXW7"
Content-Disposition: inline

--oPmsXEqKQNHCSXW7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2012 at 01:49:32PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8229fb5d7205f5e5b198ab2860fbcc02054476eb
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8229fb5d7205f5e5b198ab2860fbcc02054476eb
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Jul  2 12:27:46 2012 +0000
>=20
> meta/classes: Update recrdeptask fields for recursive dependency handling=
 changes in bitbake
>=20
> This also deletes the buildall task since I seen usecases for it.

Is there a typo in last sentence? :)

I've seen
BB_DEFAULT_TASK =3D "buildall"
in my local.conf and now it had to go..

Cheers,

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/classes/distrodata.bbclass    |    8 ++++----
>  meta/classes/recipe_sanity.bbclass |    3 +--
>  meta/classes/utility-tasks.bbclass |   10 ++--------
>  3 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bb=
class
> index 5b10eac..7b212c9 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -177,7 +177,7 @@ python do_distrodata() {
>  }
> =20
>  addtask distrodataall after do_distrodata
> -do_distrodataall[recrdeptask] =3D "do_distrodata"
> +do_distrodataall[recrdeptask] =3D "do_distrodataall do_distrodata"
>  do_distrodataall[nostamp] =3D "1"
>  do_distrodataall() {
>  	:
> @@ -634,7 +634,7 @@ python do_checkpkg() {
>  }
> =20
>  addtask checkpkgall after do_checkpkg
> -do_checkpkgall[recrdeptask] =3D "do_checkpkg"
> +do_checkpkgall[recrdeptask] =3D "do_checkpkgall do_checkpkg"
>  do_checkpkgall[nostamp] =3D "1"
>  do_checkpkgall() {
>  	:
> @@ -677,7 +677,7 @@ python do_distro_check() {
>  }
> =20
>  addtask distro_checkall after do_distro_check
> -do_distro_checkall[recrdeptask] =3D "do_distro_check"
> +do_distro_checkall[recrdeptask] =3D "do_distro_checkall do_distro_check"
>  do_distro_checkall[nostamp] =3D "1"
>  do_distro_checkall() {
>  	:
> @@ -727,7 +727,7 @@ python do_checklicense() {
>  }
> =20
>  addtask checklicenseall after do_checklicense
> -do_checklicenseall[recrdeptask] =3D "do_checklicense"
> +do_checklicenseall[recrdeptask] =3D "do_checklicenseall do_checklicense"
>  do_checklicenseall[nostamp] =3D "1"
>  do_checklicenseall() {
>  	:
> diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_san=
ity.bbclass
> index da8ad76..61e07bf 100644
> --- a/meta/classes/recipe_sanity.bbclass
> +++ b/meta/classes/recipe_sanity.bbclass
> @@ -136,11 +136,10 @@ python do_recipe_sanity () {
>      bad_runtime_vars(cfgdata, d)
>  }
>  do_recipe_sanity[nostamp] =3D "1"
> -#do_recipe_sanity[recrdeptask] =3D "do_recipe_sanity"
>  addtask recipe_sanity
> =20
>  do_recipe_sanity_all[nostamp] =3D "1"
> -do_recipe_sanity_all[recrdeptask] =3D "do_recipe_sanity"
> +do_recipe_sanity_all[recrdeptask] =3D "do_recipe_sanity_all do_recipe_sa=
nity"
>  do_recipe_sanity_all () {
>      :
>  }
> diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-ta=
sks.bbclass
> index cbb000a..6c2232e 100644
> --- a/meta/classes/utility-tasks.bbclass
> +++ b/meta/classes/utility-tasks.bbclass
> @@ -46,20 +46,14 @@ python do_checkuri() {
>  }
> =20
>  addtask checkuriall after do_checkuri
> -do_checkuriall[recrdeptask] =3D "do_checkuri"
> +do_checkuriall[recrdeptask] =3D "do_checkuriall do_checkuri"
>  do_checkuriall[nostamp] =3D "1"
>  do_checkuriall() {
>  	:
>  }
> =20
>  addtask fetchall after do_fetch
> -do_fetchall[recrdeptask] =3D "do_fetch"
> +do_fetchall[recrdeptask] =3D "do_fetchall do_fetch"
>  do_fetchall() {
>  	:
>  }
> -
> -addtask buildall after do_build
> -do_buildall[recrdeptask] =3D "do_build"
> -do_buildall() {
> -	:
> -}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oPmsXEqKQNHCSXW7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0bs4ACgkQN1Ujt2V2gBynFwCdFHvlNQQ6O0PeemqXEIYKFzcm
t1oAoIscWdY3HZMcSkAqIA+qcxKP6DWN
=JWyW
-----END PGP SIGNATURE-----

--oPmsXEqKQNHCSXW7--
