Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 17EA46E88D;
	Mon,  3 Feb 2014 14:31:16 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so3738691eek.9
	for <multiple recipients>; Mon, 03 Feb 2014 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qh2+LuzF+kepMUk8TRgIA95vq/2vKtsK2NtzJPyFOHU=;
	b=U9NpG+M3OmcRBPmJ1pws4ZEpVo4iF0QmJUTWzWd/E8mz3v5gHM8G+98Ks4eeYWbClE
	/oUSmClLixBtl4DqmtmBUFjZuDuTdycTsfBi3h5xoWp+Qzy/Oeo5n65FYMFR7KVky7Cy
	YYXlsKfvPxOXF8gHkLvzZ4sidGwk+j942Hu1VM5irMJjYiAHZ/XlC261w3uoJsf+sO6M
	pPSlxuLs96relDbarwYYnbGAfUrWX/Kw3rJhmj6exv9XeNuXtaeIAhdBqoFzFely7F1t
	H9E7r0oMwNZNBW3wuUOIlVxHY0kh81nvpwQ3ufi71HJSRYPUEGReHTzZTUStaLRHPLI8
	aCSA==
X-Received: by 10.15.51.196 with SMTP id n44mr1716154eew.27.1391437877344;
	Mon, 03 Feb 2014 06:31:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j42sm76440063eep.21.2014.02.03.06.31.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 06:31:16 -0800 (PST)
Date: Mon, 3 Feb 2014 15:31:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-ID: <20140203143127.GD3698@jama>
References: <20140202223258.8D272503AA@opal>
MIME-Version: 1.0
In-Reply-To: <20140202223258.8D272503AA@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : binutils: Upgrade to 2.24
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
X-List-Received-Date: Mon, 03 Feb 2014 14:31:18 -0000
X-Groupsio-MsgNum: 49790
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline

--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 02, 2014 at 10:32:58PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 015eca84f1b0f25868b47d2480bb60cea698f70e
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D015eca84f1b0f25868b47d2480bb60cea698f70e
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Sat Feb  1 01:00:15 2014 -0800
>=20
> binutils: Upgrade to 2.24
>=20
> This builds and runs images for all qemu machines

Hi Khem,

can you please check following QA warning:

NOTE: recipe binutils-2.24-r0: task do_package: Started
WARNING: QA Issue: binutils: Files/directories were installed but not shipp=
ed
  /usr/bin/ld.bfd
  /usr/bin/dwp
NOTE: recipe binutils-2.24-r0: task do_package: Succeeded

ld.bfd is there for very long time, but I think that dwp is new with
2.24

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  ...pc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch |  122 ---
>  ...pc.c-md_assemble-Do-not-generate-APUinfo-.patch |   46 -
>  ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |   68 --
>  ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   31 -
>  ...-Replace-with-when-it-is-part-of-the-text.patch |  196 ----
>  ...pc.c-md_apply_fix-Sign-extend-fieldval-un.patch |   85 --
>  ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   43 -
>  .../binutils-2.23.2/backport/0003-gold.patch       |  203 ----
>  .../binutils-2.23.2/backport/aarch64-crn.patch     |  117 ---
>  .../binutils-2.23.2/backport/aarch64-movi.patch    |  144 ---
>  .../binutils-fix-ineffectual-zero-of-cache.patch   |   60 --
>  .../binutils-fix-skip-whitespace-pr14887.patch     |   50 -
>  .../binutils-replace-strncat-with-strcat.patch     |   26 -
>  .../binutils-fix-over-array-bounds-issue.patch     |   20 -
>  .../binutils-x86_64_i386_biarch.patch              |   29 -
>  .../binutils-2.23.2/binutils-xlp-support.patch     |  398 -------
>  .../{binutils-2.23.2.inc =3D> binutils-2.24.inc}     |   26 +-
>  ...n_2.23.2.bb =3D> binutils-cross-canadian_2.24.bb} |    0
>  ...tils-cross_2.23.2.bb =3D> binutils-cross_2.24.bb} |    0
>  ...rosssdk_2.23.2.bb =3D> binutils-crosssdk_2.24.bb} |    0
>  .../binutils-armv5e.patch                          |    0
>  .../binutils-poison.patch                          |   88 +-
>  .../binutils-uclibc-100-uclibc-conf.patch          |    0
>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
>  ...binutils-uclibc-300-006_better_file_error.patch |    0
>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
>  .../binutils-uclibc-gas-needs-libm.patch           |    0
>  .../binutils/binutils/binutils-xlp-support.patch   |  402 +++++++
>  .../binutils/binutils/fix-pr15815.patch            |   36 +
>  .../libiberty_path_fix.patch                       |    0
>  .../libtool-2.4-update.patch                       | 1096 +++++++++-----=
------
>  .../libtool-rpath-fix.patch                        |    0
>  .../mips64-default-ld-emulation.patch              |   41 +-
>  .../relocatable_sdk.patch                          |    0
>  .../{binutils_2.23.2.bb =3D> binutils_2.24.bb}       |    6 +-
>  36 files changed, 1017 insertions(+), 2318 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3D015eca84f1b0f25868b47d2480bb60cea698f70e
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLvqD8ACgkQN1Ujt2V2gBx1xgCgshz5KcsIqHloZgTAWrFbuTX+
Ht0AoIti96IvZjrFXD4CwidVzaBbG6zt
=4R00
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--
