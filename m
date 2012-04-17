Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SK2sw-0004D4-MY
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 09:31:34 +0200
Received: by wgbdr12 with SMTP id dr12so5024897wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HhBJKyG+eVGhYVjrqtxIqvfCEvYjfW3O1nIa9wfe3mY=;
	b=qL2SK44PAe5r7KIVhqsqeuPZNVoy7CnP7el6ZH/elqLzdEbQ1sAJM8HV7rJ4tRjZYC
	jkMmOQnZRwQ7ET1eAmBWSQqseQmkfA6OIndEshPVlchfjJT2wet7q2nIiIf4RsHF9IK3
	agE5HNN0H1chopKqdE6oL5bpVlEbI2YVjIY5q/s262AWtl7U65Fj+GzpffwCP19OvY6I
	gh8sXPjrtXSNXfZOuqFCYphTx0tCl53TrDAkRetFLp3+CTfPttWZTPQ3jfLUIP+gfukP
	TIghsuE6mzetS7nUOq94d6CXISStqXcaOisIYnTMOn0BZ0RNF90n1zc2AGz5liAPbqwn
	D4kg==
Received: by 10.216.137.226 with SMTP id y76mr8039510wei.96.1334647329045;
	Tue, 17 Apr 2012 00:22:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm40389781wib.8.2012.04.17.00.22.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 00:22:07 -0700 (PDT)
Date: Tue, 17 Apr 2012 09:22:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120417072207.GA3665@jama.jama.net>
References: <cover.1334616144.git.mark.hatle@windriver.com>
	<5ad851d6c479b34fb05833a6397cd86592d0d899.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5ad851d6c479b34fb05833a6397cd86592d0d899.1334616144.git.mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 03/17] coreutils_*.bb: Sync up file path with busybox and minor cleanup
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
X-List-Received-Date: Tue, 17 Apr 2012 07:31:34 -0000
X-Groupsio-MsgNum: 20862
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2012 at 05:45:06PM -0500, Mark Hatle wrote:
> We need to ensure that the filepaths used by coreutils and busybox are
> the same.  Do this for base64, mktemp and df.  Also remove references
> to hostname/uptime in 8.14 version as these were only relevant for the
> older 6.9 version.
>=20
> su from the 6.9 version is removed, as it should come from shadow.
>=20
> (No PR bumps, as the previous patch did that.)
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_6.9.bb  |   10 +++++++---
>  meta/recipes-core/coreutils/coreutils_8.14.bb |   23 +++----------------=
----
>  2 files changed, 10 insertions(+), 23 deletions(-)
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-=
core/coreutils/coreutils_6.9.bb
> index 32ea321..597d457 100644
> --- a/meta/recipes-core/coreutils/coreutils_6.9.bb
> +++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
> @@ -34,7 +34,7 @@ ALTERNATIVE_PRIORITY =3D "100"
>  ALTERNATIVE_LINKS =3D ""
> =20
>  # [ gets a special treatment and is not included in this
> -bindir_progs =3D "base64 basename cksum comm csplit cut dir dircolors di=
rname du \
> +bindir_progs =3D "basename cksum comm csplit cut dir dircolors dirname d=
u \
>                  env expand expr factor fmt fold groups head hostid id in=
stall \
>                  join link logname md5sum mkfifo nice nl nohup od paste p=
athchk \
>                  pinky pr printenv printf ptx readlink seq sha1sum sha224=
sum sha256sum \
> @@ -43,7 +43,7 @@ bindir_progs =3D "base64 basename cksum comm csplit cut=
 dir dircolors dirname du \
>  ALTERNATIVE_LINKS +=3D "${bindir}/${@' ${bindir}/'.join((d.getVar('bindi=
r_progs', True)).split())}"
> =20
>  # hostname gets a special treatment and is not included in this
> -base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false kill =
ln ls mkdir \
> +base_bindir_progs =3D "base64 cat chgrp chmod chown cp date dd df echo f=
alse kill ln ls mkdir \
>                       mknod mv pwd rm rmdir sleep stty sync touch true un=
ame"
>  ALTERNATIVE_LINKS +=3D "${base_bindir}/${@' ${base_bindir}/'.join((d.get=
Var('base_bindir_progs', True)).split())}"
> =20
> @@ -69,12 +69,16 @@ do_install_append() {
>  	# hostname and uptime separated. busybox's versions are preferred
>  	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
>  	mv ${D}${bindir}/uptime ${D}${bindir}/uptime.${PN}
> +
> +	# remove su, it should come from shadow or another package
> +	rm ${D}${bindir}/su
>  }
> =20
>  pkg_postinst_${PN} () {
> -	# Special cases. uptime and hostname is broken, prefer busybox's versio=
n. [ needs to be treated separately.
> +	# Special cases. uptime and hostname is broken, prefer busybox's versio=
n.
>  	update-alternatives --install ${bindir}/uptime uptime uptime.${PN} 10
>  	update-alternatives --install ${base_bindir}/hostname hostname hostname=
=2E${PN} 10
> +	# [ needs to be treated separately.
>  	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
>  }
> =20
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes=
-core/coreutils/coreutils_8.14.bb
> index 9ccb813..9994526 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> @@ -24,7 +24,7 @@ EXTRA_OECONF_virtclass-native =3D "--without-gmp"
>  ALTERNATIVE_PRIORITY =3D "100"
>  ALTERNATIVE_LINKS =3D ""
> =20
> -# [ df mktemp base64 gets a special treatment and is not included in this
> +# [ gets a special treatment and is not included in this
>  bindir_progs =3D "basename chcon cksum comm csplit cut dir dircolors dir=
name du \
>                  env expand expr factor fmt fold groups head hostid id in=
stall \
>                  join link logname md5sum mkfifo nice nl nohup nproc od p=
aste pathchk \
> @@ -33,18 +33,14 @@ bindir_progs =3D "basename chcon cksum comm csplit cu=
t dir dircolors dirname du \
>                  tr truncate tsort tty unexpand uniq unlink uptime users =
vdir wc who whoami yes"
>  ALTERNATIVE_LINKS +=3D "${bindir}/${@' ${bindir}/'.join((d.getVar('bindi=
r_progs', True)).split())}"
> =20
> -# hostname gets a special treatment and is not included in this
> -base_bindir_progs =3D "cat chgrp chmod chown cp date dd echo false kill =
ln ls mkdir \
> -                     mknod mv pwd rm rmdir sleep stty sync touch true un=
ame"
> +base_bindir_progs =3D "base64 cat chgrp chmod chown cp date dd df echo f=
alse kill ln ls mkdir \
> +                     mknod mktemp mv pwd rm rmdir sleep stty sync touch =
true uname"
>  ALTERNATIVE_LINKS +=3D "${base_bindir}/${@' ${base_bindir}/'.join((d.get=
Var('base_bindir_progs', True)).split())}"
> =20
>  sbindir_progs=3D "chroot"
>  ALTERNATIVE_LINKS +=3D "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbi=
ndir_progs', True)).split())}"
> =20
>  # Manual file provides for manually controlled alternatives
> -MANUAL_ALTERNATIVE_LINKS +=3D "${base_bindir}/df:${bindir}/df.${PN}"
> -MANUAL_ALTERNATIVE_LINKS +=3D "${base_bindir}/mktemp:${bindir}/mktemp.${=
PN}"
> -MANUAL_ALTERNATIVE_LINKS +=3D "${base_bindir}/base64:${bindir}/base64.${=
PN}"

This was added by [PATCH 02/17] and now it is removed?

IIRC base64 mktemp df are still installed to ${bindir} and only u-a link
was using ${base_bindir} to resolve conflict with busybox's u-a:
http://git.openembedded.org/openembedded-core/commit/?id=3D7f71e866ecdbe049=
1c26b4eb5b83d8d2573f8eda

Maybe I've overlooked something but will this work with your patch?

>  MANUAL_ALTERNATIVE_LINKS +=3D "${bindir}/[:${bindir}/lbracket.${PN}"
> =20
>  do_install_append() {
> @@ -54,9 +50,6 @@ do_install_append() {
>  	install -d ${D}${sbindir}
>  	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i; do=
ne
> =20
> -	# Process the special items due to mismatch with busybox
> -	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN=
}; done
> -
>  	# [ requires special handling because [.coreutils will cause the sed st=
uff
>  	# in update-alternatives to fail, therefore use lbracket - the name used
>  	# for the actual source file.
> @@ -69,21 +62,11 @@ do_install_append() {
>  pkg_postinst_${PN} () {
>  	# Special cases. [ needs to be treated separately.
>  	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
> -=09
> -	# Special cases. base64, mktemp and df need to be treated separately, b=
ecause busybox have them in base_binding not bindir
> -	update-alternatives --install ${base_bindir}/base64 base64 ${bindir}/ba=
se64.${PN} 100;
> -	update-alternatives --install ${base_bindir}/mktemp mktemp ${bindir}/mk=
temp.${PN} 100;
> -	update-alternatives --install ${base_bindir}/df df ${bindir}/df.${PN} 1=
00;
>  }
> =20
>  pkg_prerm_${PN} () {
>  	# The special cases
> -	update-alternatives --remove hostname hostname.${PN}
> -	update-alternatives --remove uptime uptime.${PN}
>  	update-alternatives --remove '[' 'lbracket.${PN}'
> -	update-alternatives --remove base64 ${bindir}/base64.${PN}
> -	update-alternatives --remove mktemp ${bindir}/mktemp.${PN}
> -	update-alternatives --remove df ${bindir}.df.${PN}
>  }
> =20
>  BBCLASSEXTEND =3D "native"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+NGh8ACgkQN1Ujt2V2gBzkZgCfTpPCMjrvcAkmqPsmbXPEju9o
70wAn2JfMAq8/zGpN58NRXnKez3+lBIs
=63+J
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
