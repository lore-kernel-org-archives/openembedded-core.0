Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tvtkd-0005P6-1U
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 18:59:46 +0100
Received: by mail-pa0-f43.google.com with SMTP id fb10so1611671pad.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xHNdtlUwvaJhER4+DUH5BaXIc1aRtw4JcAQzH/1UpHs=;
	b=sEWmE9jaL8FhTKEhk5cU73AzynBW0zBuLWN3n1NayHiyMmZjIzP9qbD2NsPYf2Obi7
	lkB19iJzL7V9Yeu2MH8FvmKypgGCySsAAu04enATz0gvVUvVotC+XZrY8d21P8TfLeYL
	TbF8nIgkwFUOZb9T+1iQ0rrvEjbTAZo22zRlmDhUP2e5AiNnuWgRuj5MYoXIJBFJ8PUa
	efseIVXW2mpWNBTp3zHmbdvhYpT/cZfH4BrxUca1PU8OYGP+jcnNTNXObE+MPHirNuup
	QVX82cjMH70doEbFfSlO+i55YLV/LIs+BWIdIKGh2erNVcdmO3yX1KRKq5l3GRsele6w
	fkcA==
X-Received: by 10.68.241.232 with SMTP id wl8mr15485040pbc.144.1358444658989; 
	Thu, 17 Jan 2013 09:44:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ou3sm1419932pbb.46.2013.01.17.09.44.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:44:17 -0800 (PST)
Date: Thu, 17 Jan 2013 18:44:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130117174412.GL3067@jama>
References: <20130116125428.8B76B1036C@opal>
MIME-Version: 1.0
In-Reply-To: <20130116125428.8B76B1036C@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : update-rc.d: check also that symlinks are valid
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
X-List-Received-Date: Thu, 17 Jan 2013 17:59:46 -0000
X-Groupsio-MsgNum: 33984
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline

--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 12:54:28PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4b63e73422ea25aba1bde0beddb02bc04948e13c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4b63e73422ea25aba1bde0beddb02bc04948e13c
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Wed Jan 16 13:58:55 2013 +0200
>=20
> update-rc.d: check also that symlinks are valid
>=20

now every update-rc.d call on target fails with
/usr/sbin/update-rc.d: line 151: [: argument expected

> Running:
>=20
> update-rc.d -r /path/to/target/rootfs basename defaults
>=20
> at do_rootfs time in package postinstall stage, when
> /path/to/target/rootfs/etc/init.d/basename is a symlink and points to som=
e path
> on target (for example: /etc/init.d/basename.some_package), would fail an=
d the
> postinstall execution would be postponed for first boot, on target.
>=20
> This patch adds the posibility to verify whether the file the symlink
> points to actually exists in the target rootfs.
>=20
> [YOCTO #3716]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../update-rc.d/check-if-symlinks-are-valid.patch  |   53 ++++++++++++++=
++++++
>  meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    6 ++-
>  2 files changed, 57 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-=
are-valid.patch b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlin=
ks-are-valid.patch
> new file mode 100644
> index 0000000..4476e91
> --- /dev/null
> +++ b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-val=
id.patch
> @@ -0,0 +1,53 @@
> +Check if symlinks are valid
> +
> +When using root option and $initd/$bn is a symlink, the script would fai=
l because
> +the symlink points to a path on target. For example:
> +
> +/path/to/target/rootfs/etc/init.d/syslog -> /etc/init.d/syslog.busybox
> +
> +Hence, [ -f /path/to/target/rootfs/etc/init.d/syslog ] condition would r=
eturn
> +false.
> +
> +This patch adds the posibility to check whether the file the symlink poi=
nts to
> +actually exists in rootfs path and then continue.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>=20
> +
> +Index: git/update-rc.d
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/update-rc.d	2013-01-16 12:12:58.349814356 +0200
> ++++ git/update-rc.d	2013-01-16 13:02:42.490864939 +0200
> +@@ -147,13 +147,29 @@
> + bn=3D$1
> + shift
> +=20
> ++sn=3D$initd/$bn
> ++if [ -L "$sn" -a -n $root ]; then
> ++	readlink=3D$(which readlink)
> ++
> ++	if [ -n $readlink ]; then
> ++		sn=3D$($readlink "$sn")
> ++		case "$sn" in
> ++			/*) sn=3D${root}${sn} ;;
> ++			*)  sn=3D$initd/$sn ;;
> ++		esac
> ++	else
> ++		echo "update-rc.d: readlink tool not present, cannot check whether \
> ++				$sn symlink points to a valid file." >&2
> ++	fi
> ++fi
> ++
> + if [ $1 !=3D "remove" ]; then
> +-	if [ ! -f "$initd/$bn" ]; then
> ++	if [ ! -f "$sn" ]; then
> + 		echo "update-rc.d: $initd/$bn: file does not exist" >&2
> + 		exit 1
> + 	fi
> + else
> +-	if [ -f "$initd/$bn" ]; then
> ++	if [ -f "$sn" ]; then
> + 		if [ $force -eq 1 ]; then
> + 			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)"=
 >&2
> + 		else
> diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/reci=
pes-core/update-rc.d/update-rc.d_0.7.bb
> index 0aac5fa..bfcbd97 100644
> --- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> +++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
> @@ -5,13 +5,15 @@ SECTION =3D "base"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://update-rc.d;beginline=3D5;endline=3D15;md5=
=3D148a48321b10eb37c1fa3ee02b940a75"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  # Revision corresponding to tag update-rc.d_0.7
>  SRCREV =3D "eca680ddf28d024954895f59a241a622dd575c11"
> =20
>  SRC_URI =3D "git://github.com/philb/update-rc.d.git;protocol=3Dgit \
> -           file://add-verbose.patch;"
> +           file://add-verbose.patch \
> +           file://check-if-symlinks-are-valid.patch \
> +          "
> =20
>  S =3D "${WORKDIR}/git"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD4OGwACgkQN1Ujt2V2gBzohwCgjddnbi1jiIETq1IBK9DJqTE9
r/UAn2XPGE13Sp9QhBqPnMLbTdoz6lSe
=npA7
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--
