Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4B170660;
	Tue, 22 Jul 2014 16:25:55 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so9409859wes.0
	for <multiple recipients>; Tue, 22 Jul 2014 09:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IZl3I/ExIvqUHVC7aNN4bg+hzQ44NN+tjqQ8qpwKaDA=;
	b=cvVKccQsRMEaiA1TPQQpZkNc/Y0PIXMrn/zfJHi64dPcrJXsDvUNj2xn8eHWaYNBiX
	hI2PSjcTId7ARvz9KedfhcLX8zAWT/t3dHhmcHnqWRAcMwVd+hLK8J11KoJ+Y5DsREVY
	cTzAUgS04yRepEmYKtApCSHEn7ZKEsCPIlWgqN35Y9JVQX8uttDQVlrddyNvXj66Am59
	9Zy9GzlwNulAuwI7JYlVIBu0HBF8ClVxQVq67PbqVy9Q7bef7wo+OHhkROLFhRosxYp2
	seT4XtHOa9HLk7J8edNJvwxzrDofZ/yGQntgQGzykUnNEjb8fgzUpyqLQAJ5xaXfdHxz
	XWTQ==
X-Received: by 10.194.82.106 with SMTP id h10mr36135047wjy.115.1406046355045; 
	Tue, 22 Jul 2014 09:25:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft17sm2081750wjc.14.2014.07.22.09.25.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 09:25:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 18:26:10 +0200
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Message-ID: <20140722162610.GV22875@jama>
References: <20140710164012.3BE7C503BE@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140710164012.3BE7C503BE@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: debian.bbclass doesn't work in some setups Was: [oe-commits] Ross Burton : package.bbclass: add a stub implementation of package_name_hook
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
X-List-Received-Date: Tue, 22 Jul 2014 16:26:02 -0000
X-Groupsio-MsgNum: 55373
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zAZKrYjO7GRpkTOs"
Content-Disposition: inline

--zAZKrYjO7GRpkTOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 04:40:12PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: f6eb8e4e44b66217e4ada9f830a058c5ba120932
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Df6eb8e4e44b66217e4ada9f830a058c5ba120932
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Tue Jul  1 16:56:53 2014 +0100
>=20
> package.bbclass: add a stub implementation of package_name_hook
>=20
> do_package() calls package_name_hook so that e.g. debian-style renaming t=
hrough
> debian.bbclass can happen.  If there is no class providing a package_name=
_hook
> then this causes "WARNING: Function package_name_hook doesn't exist" ever=
y time
> do_package() is executed.
>=20
> Silence this warning by providing an empty package_name_hook in package.b=
bclass.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

We've discussed this on Friday, so just for reference and people who
weren't in #yocto channel

13:52 < JaMa> RP: it seems that debian.bbclass doesn't work with recent cha=
nges
13:53 < JaMa> RP: all packagenames lost .so version suffix
13:54 < JaMa> maybe package_name_hook exported from package.bbclass now som=
ehow conflicts with the same function exported by debian.bbclass?
13:54 < JaMa> rburton: ^
13:56 < JaMa> tmp-eglibc/work/arm920tt-oe-linux-gnueabi/libgcc/4.9.0-r0/tem=
p/run.package_name_hook.14013:
13:56 < JaMa> tmp-eglibc/work/arm920tt-oe-linux-gnueabi/libgcc/4.9.0-r0/tem=
p/run.package_package_name_hook.14013:
13:56 < JaMa> both show just empty function

15:03 < rburton> JaMa:  whaaaa
15:03 < rburton> i bloody tested that and it bloody worked :(

16:21 < JaMa> rburton: bitbake -e libgcc: http://bpaste.net/show/475166/

16:27 < rburton> JaMa: how interesting
16:28 < pev> Hm, when do you need to set IMAGE_BASENAME? Ive seen it done a=
 couple of times but not sure why/when?
16:28 < rburton> JaMa: python package_name_hook () {
16:28 < rburton>     bb.build.exec_func('debian_package_name_hook', d)
16:28 < rburton> }
16:28 < rburton> is what i hae
16:28 < rburton> inherit order?
16:29 < rburton> JaMa: how do you enable debian.bbclass?
16:29 < rburton> poky does INHERIT_DISTRO=3Ddebian blaa blaa

16:30 < JaMa> rburton: the same without your patch http://bpaste.net/show/4=
75181/
16:31 < JaMa> env.libgcc:INHERIT=3D" buildhistory buildstats buildstats-sum=
mary blacklist debian shr-mirrors package_ipk  debian devshell sstate licen=
se blacklist sanity"
16:31 < JaMa> env.libgcc2:INHERIT=3D" buildhistory buildstats buildstats-su=
mmary blacklist debian shr-mirrors package_ipk  debian devshell sstate lice=
nse blacklist sanity"
16:31 < JaMa> $ grep -A 1 "^python package_name_hook" env.libgcc*
16:31 < JaMa> env.libgcc:python package_name_hook () {
16:31 < JaMa> env.libgcc-    bb.build.exec_func('package_package_name_hook'=
, d)
16:31 < JaMa> --
16:31 < JaMa> env.libgcc2:python package_name_hook () {
16:31 < JaMa> env.libgcc2-    bb.build.exec_func('debian_package_name_hook'=
, d)
16:32 < JaMa> and enabled by:
16:32 < JaMa> #   append /OE/build/shr-core/meta-smartphone/meta-shr-distro=
/conf/distro/shr.conf:70
16:32 < JaMa> #     "debian"
16:35 < rburton> maybe this is a distro-inherit vs inherit thing
16:36 < rburton> try using DISTRO_INHERIT for that?
16:36 < rburton> INHERIT_DISTRO even
16:36 < rburton> oh, that's just a variable that gets passed to INHERIT
16:36 < rburton> hm

16:42 < rburton> JaMa: try moving debian after package_ipk
16:43 < rburton> (maybe we need an inherit package in debian)?

16:45 < JaMa> sorry, I've already started different build

16:46 < rburton> np
16:47 < rburton> easily tested outside of a build, i'll have a go in a bit

since then I'm building with this change reverted

>  meta/classes/package.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 7358376..26a20d1 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1119,6 +1119,18 @@ python package_fixsymlinks () {
>          d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commase=
p=3DFalse))
>  }
> =20
> +
> +python package_package_name_hook() {
> +    """
> +    A package_name_hook function can be used to rewrite the package name=
s by
> +    changing PKG.  For an example, see debian.bbclass.
> +    """
> +    pass
> +}
> +
> +EXPORT_FUNCTIONS package_name_hook
> +
> +
>  PKGDESTWORK =3D "${WORKDIR}/pkgdata"
> =20
>  python emit_pkgdata() {
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zAZKrYjO7GRpkTOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOkKIACgkQN1Ujt2V2gBwgPQCgt8VTOWyVeF7S3hY07FsEDgTK
S4MAn1lKo6FDui2Z/AeXrD+z8hDq9581
=X/hN
-----END PGP SIGNATURE-----

--zAZKrYjO7GRpkTOs--
