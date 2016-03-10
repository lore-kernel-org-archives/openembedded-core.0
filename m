Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1A311606A8;
	Thu, 10 Mar 2016 11:55:53 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so25238471wml.1;
	Thu, 10 Mar 2016 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8DoLQnJhAixuURQcgmZOVS6Yq33rofbhHjbtQ8EUKE0=;
	b=umvLf7OmbUAtRBMhnyikAVSG2K/ck4DMJwbeJRdMJxirptBnqLRk59M2w1jxK2DXgi
	JqqfuEdrCv1iB6YW5RSAYMduKsEfpy3Z+rGspMwTbCL02nTpk66TgaGgG2tJ4+Xx5X/c
	3InrO36qaxhUVUYQuCcI8/YchmcAkAs8Rq0/qyn6pokyi/FBOTnBbga8fNIub/iJHD+H
	yg9DDjZImsgHQjYvpsXMBq6AejxyQH5j50AfYueF2Ek4CWaIp2hU2/UxwoXPen4hjY7Q
	n9H8Brv01tOHWUoJqPDJ45fZqvsJp3XFqad+5DeUbMgEmpkaQhrw0qDYGeSzCqmkD2Ks
	LnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8DoLQnJhAixuURQcgmZOVS6Yq33rofbhHjbtQ8EUKE0=;
	b=ODs1S5TISNwOLB40r9hzWUPpQFq3lU1OFXXyPiOglzrn9oK5fwzWCzUdXqdhqopT42
	/5jWJV2/m90q9PwBQ//9VmJSdQ4/ZbepPmcoAEIRzEvBZARIdz7pZT+MN3O+FarIHB6T
	ncTwxznTUwka3FhBlsyp1wjtYE7VgVvQNfQd4S4upchXDAh1IttPi+HAKMwPLty9e/iK
	JtSha8z7BIhZMo+2UEFCyz24RuqOYNkIasE+hnntCJ1llrF8nPDspa19jI/7goE3iEMT
	M9JbLCRxlHcwSkdOSgrvTLbE3r+ajWgBY0BC6nFQxmXH50ucFOHFWugiE1oOdrT5gUIb
	6edg==
X-Gm-Message-State: AD7BkJJ1BLAW4XCOjYOMDoSPxjMuITtmn+QnGQRXVWwhVSJ7lsCQG5n2tGlOdSmPB6Kf7w==
X-Received: by 10.28.138.149 with SMTP id m143mr3653700wmd.94.1457610953766;
	Thu, 10 Mar 2016 03:55:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ka7sm3220899wjb.8.2016.03.10.03.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 03:55:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 12:58:51 +0100
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160310115851.GD2573@jama>
References: <20150904153710.BBCFA50436@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150904153710.BBCFA50436@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alexander Kanavin : remake: update to 4.1+dbg-1.1
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
X-List-Received-Date: Thu, 10 Mar 2016 11:55:54 -0000
X-Groupsio-MsgNum: 79403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline

--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 03:37:10PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: fb781bee39e312eef1d89c2d7f5ab27e8da1ee32
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dfb781bee39e312eef1d89c2d7f5ab27e8da1ee32
>=20
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Thu Sep  3 18:34:18 2015 +0300
>=20
> remake: update to 4.1+dbg-1.1
>=20
> remake-remove-errors-about-colophon-and-cygnus-comma.patch has been merge=
d upstream

Fails to build after make was built. Shouldn't it be at least blacklisted
by default so that potential user will need to explicitly decide between
make and remake (and unmerge the other one from sysroot first)?

ERROR: remake-4.1+dbg-1.1-r0 do_populate_sysroot: The recipe remake is tryi=
ng to install files into a shared area when those files already exist. Thos=
e files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/sysroot-provi=
ders/make
 Matched in manifest-qemuarm-makedepend.populate_sysroot
manifest-qemuarm-makedevs.populate_sysroot
manifest-qemuarm-make.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/gnu=
make.h
 Matched in manifest-qemuarm-make.populate_sysroot
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break things, if =
not now, possibly in the future (we've seen builds fail several months late=
r). If the system knew how to recover from this automatically it would howe=
ver there are several different scenarios which can result in this and we d=
on't know which one this is. It may be you have switched providers of somet=
hing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in tha=
t case you need to execute the clean task for both recipes and it will reso=
lve this error. It may be you changed DISTRO_FEATURES from systemd to udev =
or vice versa. Cleaning those recipes should again resolve this error howev=
er switching DISTRO_FEATURES on an existing build directory is not supporte=
d, you should really clean out tmp and rebuild (reusing sstate should be sa=
fe). It could be the overlapping files detected are harmless in which case =
adding them to SSTATE_DUPWHITELIST may be the correct solution. It could al=
so be your build is including two different conflicting versions of things =
(e.g. bluez 4 and bluez 5 and the correct solution for that would be to res=
olve the conflict. If in doubt, please ask on the mailing list, sharing the=
 error and filelist above.
ERROR: remake-4.1+dbg-1.1-r0 do_populate_sysroot: If the above message is t=
oo much, the simpler version is you're advised to wipe out tmp and rebuild =
(reusing sstate is fine). That will likely fix things in most (but not all)=
 cases.
ERROR: remake-4.1+dbg-1.1-r0 do_populate_sysroot: Function failed: sstate_t=
ask_postfunc
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/remake/4.1+dbg-1.1-r0/temp/log.do_populat=
e_sysroot.9947

>=20
> inherit pkgconfig has been added because m4 macros defined by pkgconfig a=
re now used
> in configure.ac
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/remake/remake.inc            |  4 +--
>  ...ve-errors-about-colophon-and-cygnus-comma.patch | 39 ----------------=
------
>  .../{remake_git.bb =3D> remake_4.1+dbg-1.1.bb}       |  8 ++---
>  3 files changed, 4 insertions(+), 47 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/remake/remake.inc b/meta/recipes-devto=
ols/remake/remake.inc
> index 6ac833e..df889fc 100644
> --- a/meta/recipes-devtools/remake/remake.inc
> +++ b/meta/recipes-devtools/remake/remake.inc
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "Makefile debugger which is gnumake 3.81 compatible"
> +SUMMARY =3D "Makefile debugger which is gnumake compatible"
>  DESCRIPTION =3D "remake is a patched and modernized version of GNU make \
>  utility that adds improved error reporting, the ability to trace \
>  execution in a comprehensible way, and a debugger."
> @@ -8,7 +8,7 @@ SECTION =3D "devel"
> =20
>  SRC_URI =3D "git://github.com/rocky/remake.git"
> =20
> -inherit autotools gettext update-alternatives
> +inherit autotools gettext update-alternatives pkgconfig
> =20
>  ALTERNATIVE_${PN} =3D "make"
>  ALTERNATIVE_LINK_NAME[make] =3D "${bindir}/make"
> diff --git a/meta/recipes-devtools/remake/remake/remake-remove-errors-abo=
ut-colophon-and-cygnus-comma.patch b/meta/recipes-devtools/remake/remake/re=
make-remove-errors-about-colophon-and-cygnus-comma.patch
> deleted file mode 100644
> index 98b6460..0000000
> --- a/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colo=
phon-and-cygnus-comma.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 1316f10a97a4a2f5d11a30ec367aa61101318742 Mon Sep 17 00:00:00 2001
> -From: "Maxin B. John" <maxin.john@enea.com>
> -Date: Wed, 6 Aug 2014 15:05:56 +0200
> -Subject: [PATCH] remake: remove errors about @colophon and @cygnus comma=
nds
> - not defined
> -
> -texinfo5 needs replacing @ with @@ when it is part of the text
> -
> -Upstream-Status: Backport
> -Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ----
> - doc/remake.texi | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/doc/remake.texi b/doc/remake.texi
> -index cd73437..fa5ba16 100644
> ---- a/doc/remake.texi
> -+++ b/doc/remake.texi
> -@@ -2752,7 +2752,7 @@ this list, we would like to add your names!
> - @printindex cp
> -=20
> - @tex
> --% I think something like @colophon should be in texinfo.  In the
> -+% I think something like @@colophon should be in texinfo.  In the
> - % meantime:
> - \long\def\colophon{\hbox to0pt{}\vfill
> - \centerline{The body of this manual is set in}
> -@@ -2764,7 +2764,7 @@ this list, we would like to add your names!
> - \centerline{{\sl\fontname\tensl\/}}
> - \centerline{are used for emphasis.}\vfill}
> - \page\colophon
> --% Blame: doc@cygnus.com, 1991.
> -+% Blame: doc@@cygnus.com, 1991.
> - @end tex
> -=20
> - @bye
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-de=
vtools/remake/remake_4.1+dbg-1.1.bb
> similarity index 80%
> rename from meta/recipes-devtools/remake/remake_git.bb
> rename to meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
> index 2ba2b80..c61913d 100644
> --- a/meta/recipes-devtools/remake/remake_git.bb
> +++ b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
> @@ -1,4 +1,3 @@
> -PR =3D "r1"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
>                      file://tests/COPYING;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> @@ -6,14 +5,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504 \
>  require remake.inc
> =20
>  SRC_URI +=3D "file://version-remake.texi.patch \
> -            file://remake-remove-errors-about-colophon-and-cygnus-comma.=
patch \
>             "
> -SRCREV =3D "f05508e521987c8494c92d9c2871aec46307d51d"
> +SRCREV =3D "cf54641d50a0165bb17622b3e9770f426ccbc561"
>  S =3D "${WORKDIR}/git"
> =20
> -PV =3D "3.82+dbg-0.9+git${SRCPV}"
> -
> -DEPENDS +=3D "readline"
> +DEPENDS +=3D "readline guile"
>  # Need to add "gettext-native" dependency to remake-native.
>  # By default only "gettext-minimal-native" is added
>  # when inherit gettext.
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhYXoACgkQN1Ujt2V2gBxC4QCglVK5T0jZr2XgACmU/GJ+4I8+
vpAAnRpV+AnJdFFzj67ETFJPyNUjY1Li
=xnDX
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
