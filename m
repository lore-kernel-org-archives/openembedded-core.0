Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id B67FD761A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 14:16:00 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so162984364wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EBkN8549MOdQhQpo/53BX15P1YNEDYgyr92kAlU+Lm8=;
	b=bh+sG0HiNa0QrwenjS5un04ZW2JET1ZEDiqNa8o+XcAcdDltB+hkngPDQ7bdwgQfGH
	QOn+6P1zMfJ58VsKvb/W7jSjxQtV624mFqme1MbY0Q4Vhub39xgmKfF+qJA8RQYKI09F
	ev50nytsHgdqlcHgbYWPt8/yKJFaivIiAPk6rSLT9RdPzD1a1phuSjiWTnEL6l2akMJW
	4J5d+7hV63nN/dinNgaknxXkfmjiJ98Av3CclT96nnwgsLCRbfIxaXh2fkBcl7ckTkPS
	w9BUxFnW5b88n6h2XY5hKQvZ3177mipc71sRD0nxgpzCnzIxiOKSfIIPXQVuPAS8PWps
	33vA==
X-Received: by 10.194.21.70 with SMTP id t6mr73465474wje.74.1438092960089;
	Tue, 28 Jul 2015 07:16:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bm9sm19285810wib.10.2015.07.28.07.15.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jul 2015 07:15:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Jul 2015 16:16:03 +0200
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Message-ID: <20150728141603.GC2465@jama>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB44B6C087@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemu_git.bb: remove it
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
X-List-Received-Date: Tue, 28 Jul 2015 14:16:01 -0000
X-Groupsio-MsgNum: 68523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline

--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 02:04:28PM +0000, Iorga, Cristian wrote:
> Hi Robert,
>=20
> Hmm,
> Qemu git recipe is useful, and is close to being up to date, why to remov=
e it??

Close to being up to date? Aren't you talking about
=2E/meta/recipes-devtools/qemu/qemu_2.4.0-rc2.bb?

bitbake@jama:/OE/webos/ow/oe-core$ find . -name qemu\*bb -exec grep
PV.*=3D {} \;
REALPV =3D "2.4.0-rc2"
PV =3D "2.3.99+${REALPV}"
PV =3D "1.3.0+git${SRCPV}"

As Robert said, 1.3 version is old and current qemu_git recipe broken,
because 04024dea2674861fcf13582a77b58130c67fccd8 isn't in master branch
anymore after it was moved to stable-1.3 branch:

bitbake@jama:/OE/projects/qemu$ git branch -a --contains 04024dea2674861fcf=
13582a77b58130c67fccd8
  remotes/origin/stable-1.3

> Qemu brakes quite often, as seen recently on autobuilders, building from =
git allowed us to move forward (although it is true that the git upgrade wa=
s not integrated into master.)
> I vote against this patch.

Regards,
>=20
> Thanks,
> Cristian
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf Of Robert Yang
> Sent: Tuesday, July 28, 2015 12:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] qemu_git.bb: remove it
>=20
> Remove it since we have 2.4.0, the git version is 1.3 can't be built by
> deafult:
> ERROR: Fetcher failure: Unable to find revision 04024dea2674861fcf13582a7=
7b58130c67fccd8 in branch master even from upstream
>=20
> We can fix it, but seems that no one uses it any more.
>=20
> And move patches from "files" dir to "qemu" dir.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
>  .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
>  .../qemu-enlarge-env-entry-size.patch              |    0
>  meta/recipes-devtools/qemu/qemu_git.bb             |   15 ---------------
>  4 files changed, 15 deletions(-)
>  rename meta/recipes-devtools/qemu/{files =3D> qemu}/Qemu-Arm-versatilepb=
-Add-memory-size-checking.patch (100%)  rename meta/recipes-devtools/qemu/{=
files =3D> qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)  rena=
me meta/recipes-devtools/qemu/{files =3D> qemu}/qemu-enlarge-env-entry-size=
=2Epatch (100%)  delete mode 100644 meta/recipes-devtools/qemu/qemu_git.bb
>=20
> diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-me=
mory-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versati=
lepb-Add-memory-size-checking.patch
> similarity index 100%
> rename from meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-mem=
ory-size-checking.patch
> rename to meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory=
-size-checking.patch
> diff --git a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsol=
ete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-=
obsolete-syscalls.patch
> similarity index 100%
> rename from meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsole=
te-syscalls.patch
> rename to meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-=
syscalls.patch
> diff --git a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size=
=2Epatch b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
> similarity index 100%
> rename from meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.=
patch
> rename to meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.pat=
ch
> diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtoo=
ls/qemu/qemu_git.bb
> deleted file mode 100644
> index a30932a..0000000
> --- a/meta/recipes-devtools/qemu/qemu_git.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -require qemu.inc
> -
> -SRCREV =3D "04024dea2674861fcf13582a77b58130c67fccd8"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
> -                    file://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850=
e7d3ef548588159913"
> -
> -PV =3D "1.3.0+git${SRCPV}"
> -
> -SRC_URI_prepend =3D "git://git.qemu.org/qemu.git"
> -S =3D "${WORKDIR}/git"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -COMPATIBLE_HOST_class-target_mips64 =3D "null"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW3jqIACgkQN1Ujt2V2gBzHaQCffOzH9fIZ3KRRTrwXJy/EcOXF
YnMAoKIHx5+FCLZudXm7E54mLaUpnhsM
=mqbb
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
