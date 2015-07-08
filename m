Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id A954E73BB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:36:47 +0000 (UTC)
Received: by wiga1 with SMTP id a1so281016385wig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ckWWjPB+UoFyy1HVrQgFtB2dxs1NUvNh/RHGPzTvsBk=;
	b=PijU1oaBJT8Imf1vKxpuJjcVKkfQcW51Lq6ijZItBX5o/emFYCxsmzzYUgodlJH08h
	MaO+s/EpZoDTEi1FtSWL7g+sHpP+uM8pNOPBrl+j3yAGe0fD4rCPAbzF8W/m/j7VBfxy
	uO7QNbjh9//gySNkONGmvdGxbYWmSsGQRltmdDCTvDvWCIEivzofl0UcBK6pwk+aC9hu
	RTBkl0t+yWzD3VYrf1I2sE6Fkd6FsM/Qpo9rnnw1JLYX+BiFfSHFw596bA4k/TCVm1mq
	TYqupjKkrM8EFpBEJcZxhTV/pcTDyPuGYXIBcx/lSiMI86ban5lqfD+5MK7yuI8GVKBQ
	VRlg==
X-Received: by 10.194.21.70 with SMTP id t6mr19735495wje.74.1436351807336;
	Wed, 08 Jul 2015 03:36:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id dt1sm2214741wib.7.2015.07.08.03.36.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jul 2015 03:36:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Jul 2015 12:36:56 +0200
To: Kai Kang <kai.kang@windriver.com>
Message-ID: <20150708103656.GB2398@jama>
References: <cover.1436346123.git.kai.kang@windriver.com>
	<4e6ff252db44e357cbdda2cdfcbd553defaf7958.1436346123.git.kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4e6ff252db44e357cbdda2cdfcbd553defaf7958.1436346123.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] subversion: improve the regex of sed command of SVN_SERF_INCLUDES macro
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
X-List-Received-Date: Wed, 08 Jul 2015 10:36:47 -0000
X-Groupsio-MsgNum: 67670
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline

--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2015 at 05:03:40PM +0800, Kai Kang wrote:
> [Yocto #7474]
>=20
> The regex of sed command is too simple, which mangles any "-D" in
> strings, for example, a project name is "My-Demo", it will be removed
> from the path by the sed regex, which causes a build failure. Improving
> it to only delete the -D behind of a space or the -D at start of a
> string.

Seems to duplicate:
commit 04554b128c358e3c10f6581fd4506764a65240b8
Author: Jose Lamego <jose.a.lamego@linux.intel.com>
Date:   Fri Jul 3 07:34:50 2015 +0000

    subversion_1.8.13.bb: Regex modified to allow '-D' in paths
   =20

>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../Improve_the_regex_of_sed_command_of.patch      | 31 ++++++++++++++++=
++++++
>  .../subversion/subversion_1.8.13.bb                |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/Im=
prove_the_regex_of_sed_command_of.patch
>=20
> diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_t=
he_regex_of_sed_command_of.patch b/meta/recipes-devtools/subversion/subvers=
ion-1.8.13/Improve_the_regex_of_sed_command_of.patch
> new file mode 100644
> index 0000000..626923b
> --- /dev/null
> +++ b/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_rege=
x_of_sed_command_of.patch
> @@ -0,0 +1,31 @@
> +Improve the regex of sed command of SVN_SERF_INCLUDES macro
> +
> +The regex of sed command is too simple, which mangles any "-D"
> +in strings, for example, a project name is "My-Demo", it will
> +be removed from the path by the sed regex, which causes a build
> +failure. Improving it to only delete the -D behind of a space or
> +the -D at start of a string.
> +
> +Reference:
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7874
> +
> +Upstream-Status: Submitted [http://mail-archives.apache.org/mod_mbox/sub=
version-dev/201507.mbox/%3C559CDA70.8030403%40windriver.com%3E]
> +
> +Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +diff --git a/build/ac-macros/serf.m4.old b/build/ac-macros/serf.m4
> +index 885c5a1..39969c6 100644
> +--- a/build/ac-macros/serf.m4.old
> ++++ b/build/ac-macros/serf.m4
> +@@ -143,7 +143,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
> +         if $PKG_CONFIG $serf_major --atleast-version=3D$serf_check_vers=
ion; then
> +           AC_MSG_RESULT([yes])
> +           serf_found=3Dyes
> +-          SVN_SERF_INCLUDES=3D[`$PKG_CONFIG $serf_major --cflags | $SED=
 -e 's/-D[^ ]*//g'`]
> ++          SVN_SERF_INCLUDES=3D[`$PKG_CONFIG $serf_major --cflags | $SED=
 -e 's/[[:space:]]-D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
> +           SVN_SERF_LIBS=3D`$PKG_CONFIG $serf_major --libs`=20
> +           break
> +         else
> diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta=
/recipes-devtools/subversion/subversion_1.8.13.bb
> index a98be67..73ace61 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
> @@ -12,6 +12,7 @@ inherit gettext pythonnative
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://libtool2.patch \
>             file://disable_macos.patch \
> +           file://Improve_the_regex_of_sed_command_of.patch \
>  "
>  SRC_URI[md5sum] =3D "4413417b529d7bdf82f74e50df02e88b"
>  SRC_URI[sha256sum] =3D "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e=
5d500e843d607579"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWc/UcACgkQN1Ujt2V2gBytKQCfSrmxWznHlnBl2BonSzgbdFCT
VtgAn0TxG8/FlPOvw91S91mIBLgsso2h
=7GeV
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
