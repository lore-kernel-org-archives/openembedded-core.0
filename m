Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sww7r-0001cR-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:11:43 +0200
Received: by weyr6 with SMTP id r6so5454424wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=4xr43J/rpTq1vZFwstGLBGFycx0+DlYep7PmMXvkIzw=;
	b=PW5vzJJMsCzLWp8V6yrLAM7Bz+pFHpUv6ASFQwkIeMwLnimgYYQGc14LiwnoBQ4pzm
	2n1YH8dhpGH2ENR5sNkl4zoxAEVe6sXwF2CXsMxhZ0D0gof9UgGtZxIAvYieuh06bnln
	FvTMZdVm5BImltP6HoNEPh/d5U8s/etDjmvzUfNebLiYelraxrK2gak7wKp6dUkf1lVk
	u4wKMDvc09pFONgdIfKvlJ9oreQmT1n53DxN2JwdQyCZeMTes6/KrbfhZWlsHp80BKto
	PcRpvtb7gWo7mKveEHtR8dfS3KG8U0f6eH+C6SKc0shlzSaSO+iQQ5G4vx9V/1IXqeGq
	oVrQ==
Received: by 10.180.86.106 with SMTP id o10mr4943114wiz.22.1343916004174;
	Thu, 02 Aug 2012 07:00:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm33831935wiv.11.2012.08.02.07.00.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:00:03 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Thu, 2 Aug 2012 16:00:01 +0200
Resent-Message-ID: <20120802140001.GR16306@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm17411697wib.8.2012.08.02.06.53.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 06:53:37 -0700 (PDT)
Date: Thu, 2 Aug 2012 15:53:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120802135335.GQ16306@jama.jama.net>
References: <1343250562.29991.0.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343250562.29991.0.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [oe] [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
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
X-List-Received-Date: Thu, 02 Aug 2012 14:11:43 -0000
X-Groupsio-MsgNum: 26782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aNvCJ41Feu8IgPyB"
Content-Disposition: inline

--aNvCJ41Feu8IgPyB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 10:09:22PM +0100, Richard Purdie wrote:
> Currently all sstate files are placed into one directory. This does not s=
cale and
> causes a variety of filesystem issues. This patch adds a two character su=
bdirectory
> to the layout (based on the first two characters of the hash) so that fil=
es
> can be split into several directories.
>=20
> This should help performance of sstate in most cases by avoding creating =
directories with=20
> huge numbers of files.
>=20
> The SSTATE_MIRRORS syntax needs updating to account for the extra path el=
ement by
> the addition of a PATH item, for example:
>=20
> SSTATE_MIRRORS =3D "file://.* file:///some/path/to/sstate-cache/PATH"
> SSTATE_MIRRORS =3D "file://.* http://192.168.1.23/sstate-cache/PATH"
>=20
> This change also sets the scene for using things like lsb-release in
> the=20

Is it possible to create 2nd level cache with this?

I have some server with slow upload but fully populated sstate-cache.

So on server with faster upload which could be used as offical
SSTATE_MIRROR for SHR distro I would like to add

SSTATE_MIRRORS ?=3D "file://.* http://slow-server/sstate-cache/PATH"

And then sync my sstate-cache directory to public accessible web root (with=
 rsync).

Problem is that now sstate-cache has all files in slightly different=20
layout then original sstate-cache on slow server. From what I see I guess=
=20
it finds URL with correct prefix "sstate-cache/Gentoo-2.1/0d" and downloads=
 it=20
directly to sstate-cache dir (and adds .done)

OE @ ~/oe-core $ ll sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x8=
6_64-2-*populate-lic*
-rw-r--r-- 1 bitbake bitbake 9257 Jul 30 12:31 sstate-cache/sstate-apr-nati=
ve-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate=
-lic.tgz
-rw-r--r-- 1 bitbake bitbake    0 Aug  2 15:40 sstate-cache/sstate-apr-nati=
ve-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate=
-lic.tgz.done

And then creates symlink in right prefix back to absolute path of sstate-ca=
che/file:
OE @ ~/oe-core $ ll sstate-cache/Gentoo-2.1/0d/sstate-apr-native-x86_64-lin=
ux-1.4.6-r1-x86_64-2-*populate-lic*
lrwxrwxrwx 1 bitbake bitbake 123 Aug  2 15:40 sstate-cache/Gentoo-2.1/0d/ss=
tate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe9453659=
6e50_populate-lic.tgz ->=20
/OE/oe-core/sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0=
d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz

But after sstate-cache directory is rsynced somewhere else and oe-core/ssta=
te-cache is removed,=20
all those symlinks point nowhere and public sstate-cache is unusable.

Can we have relative paths used in symlinks or even instruct fetcher to dow=
nload that=20
file directly to right prefix?

Cheers,

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 570b371..d00779a 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -4,16 +4,21 @@ SSTATE_MANIFESTS ?=3D "${TMPDIR}/sstate-control"
>  SSTATE_MANFILEBASE =3D "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-"
>  SSTATE_MANFILEPREFIX =3D "${SSTATE_MANFILEBASE}${PN}"
> =20
> +def generate_sstatefn(spec, hash, d):
> +    if not hash:
> +        hash =3D "INVALID"
> +    return hash[:2] + "/" + spec + hash
> =20
>  SSTATE_PKGARCH    =3D "${PACKAGE_ARCH}"
>  SSTATE_PKGSPEC    =3D "sstate-${PN}-${PACKAGE_ARCH}${TARGET_VENDOR}-${TA=
RGET_OS}-${PV}-${PR}-${SSTATE_PKGARCH}-${SSTATE_VERSION}-"
> -SSTATE_PKGNAME    =3D "${SSTATE_PKGSPEC}${BB_TASKHASH}"
> +SSTATE_PKGNAME    =3D "${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', T=
rue), d.getVar('BB_TASKHASH', True), d)}"
>  SSTATE_PKG        =3D "${SSTATE_DIR}/${SSTATE_PKGNAME}"
> +SSTATE_PATHSPEC   =3D "${SSTATE_DIR}/*/${SSTATE_PKGSPEC}"
> =20
>  SSTATE_SCAN_FILES ?=3D "*.la *-config *_config"
>  SSTATE_SCAN_CMD ?=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name =
\"".join(d.getVar("SSTATE_SCAN_FILES", True).split())}" \) -type f'
> =20
> -BB_HASHFILENAME =3D "${SSTATE_PKGNAME}"
> +BB_HASHFILENAME =3D "${SSTATE_PKGSPEC}"
> =20
>  SSTATE_MANMACH ?=3D "${SSTATE_PKGARCH}"
> =20
> @@ -158,10 +163,11 @@ def sstate_installpkg(ss, d):
>          oe.path.remove(dir)
> =20
>      sstateinst =3D d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
> +    sstatefetch =3D d.getVar('SSTATE_PKGNAME', True) + '_' + ss['name'] =
+ ".tgz"
>      sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tg=
z"
> =20
>      if not os.path.exists(sstatepkg):
> -       pstaging_fetch(sstatepkg, d)
> +       pstaging_fetch(sstatefetch, sstatepkg, d)
> =20
>      if not os.path.isfile(sstatepkg):
>          bb.note("Staging package %s does not exist" % sstatepkg)
> @@ -223,8 +229,7 @@ def sstate_installpkg(ss, d):
>  def sstate_clean_cachefile(ss, d):
>      import oe.path
> =20
> -    sstatepkgdir =3D d.getVar('SSTATE_DIR', True)
> -    sstatepkgfile =3D sstatepkgdir + '/' + d.getVar('SSTATE_PKGSPEC', Tr=
ue) + "*_" + ss['name'] + ".tgz*"
> +    sstatepkgfile =3D d.getVar('SSTATE_PATHSPEC', True) + "*_" + ss['nam=
e'] + ".tgz*"
>      bb.note("Removing %s" % sstatepkgfile)
>      oe.path.remove(sstatepkgfile)
> =20
> @@ -417,7 +422,7 @@ def sstate_package(ss, d):
> =20
>      return
> =20
> -def pstaging_fetch(sstatepkg, d):
> +def pstaging_fetch(sstatefetch, sstatepkg, d):
>      import bb.fetch2
> =20
>      # Only try and fetch if the user has configured a mirror
> @@ -430,7 +435,7 @@ def pstaging_fetch(sstatepkg, d):
>      bb.data.update_data(localdata)
> =20
>      dldir =3D localdata.expand("${SSTATE_DIR}")
> -    srcuri =3D "file://" + os.path.basename(sstatepkg)
> +    srcuri =3D "file://" + sstatefetch
> =20
>      bb.mkdirhier(dldir)
> =20
> @@ -519,8 +524,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_ha=
shfn, d):
>      }
> =20
>      for task in range(len(sq_fn)):
> -        sstatefile =3D d.expand("${SSTATE_DIR}/" + sq_hashfn[task] + "_"=
 + mapping[sq_task[task]] + ".tgz")
> -        sstatefile =3D sstatefile.replace("${BB_TASKHASH}", sq_hash[task=
])
> +        sstatefile =3D d.expand("${SSTATE_DIR}/" + generate_sstatefn(sq_=
hashfn[task], sq_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
>          if os.path.exists(sstatefile):
>              bb.debug(2, "SState: Found valid sstate file %s" % sstatefil=
e)
>              ret.append(task)
> @@ -544,10 +548,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_h=
ashfn, d):
>              if task in ret:
>                  continue
> =20
> -            sstatefile =3D d.expand("${SSTATE_DIR}/" + sq_hashfn[task] +=
 "_" + mapping[sq_task[task]] + ".tgz")
> -            sstatefile =3D sstatefile.replace("${BB_TASKHASH}", sq_hash[=
task])
> +            sstatefile =3D d.expand(generate_sstatefn(sq_hashfn[task], s=
q_hash[task], d) + "_" + mapping[sq_task[task]] + ".tgz")
> =20
> -            srcuri =3D "file://" + os.path.basename(sstatefile)
> +            srcuri =3D "file://" + sstatefile
>              localdata.setVar('SRC_URI', srcuri)
>              bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
> =20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aNvCJ41Feu8IgPyB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAahl8ACgkQN1Ujt2V2gBzqrwCggfX5OnrO0eMRU06CRgmtLerg
WLgAn2eLkMjsfPC9rdYicXn0ynH7eF8Z
=YB9k
-----END PGP SIGNATURE-----

--aNvCJ41Feu8IgPyB--
