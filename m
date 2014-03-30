Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3272060C02;
	Sun, 30 Mar 2014 11:30:28 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so5569029eek.26
	for <multiple recipients>; Sun, 30 Mar 2014 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gyYv4ZwaTkVAt6SARS1kSzwpIy/drHwlFD0QP1Fgys0=;
	b=RipXlsO/s1HeEvEYynVgCuLsDSJ4XbqBEKWag30pugjCYAHhs55b19IEpn0v6pyn1V
	0D9PCBobHgfYGjPz1mUcrTrmyLqAUYGSVtJRw3PP1iNvoY9mOOka4y96zI7u1HDGcSfH
	dGq2RxZhYVmvES4w9fFwiQggql9dHM0NC8nf09gc5BUioqmndkMpMxICP2ZaRip4Jon6
	eKJa6ntZw6KlcxH1Dt9jITxFNsF1wN0gfeIF0hzEIoqGwXA7l0xNDJ0VVF0xkcSoWlfe
	/pJtDE/vbeVQMCz5jtuZ/bPXwFVDQWq+XVqgyOrUCzZprUYNK8Bl3Jk0lH2lnuuJSdy4
	ZJ5w==
X-Received: by 10.15.91.77 with SMTP id r53mr107269eez.70.1396179029112;
	Sun, 30 Mar 2014 04:30:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm25165326eel.27.2014.03.30.04.30.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 04:30:27 -0700 (PDT)
Date: Sun, 30 Mar 2014 13:30:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20140330113031.GF2428@jama>
References: <20140330090302.B0FBA50478@opal>
MIME-Version: 1.0
In-Reply-To: <20140330090302.B0FBA50478@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Sun, 30 Mar 2014 11:30:34 -0000
X-Groupsio-MsgNum: 51872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/NRh952CO+2tg14"
Content-Disposition: inline

--K/NRh952CO+2tg14
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2014 at 09:03:02AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D42c0eba4fac6b8bd28b58ec04574d04b0ab0c457
>=20
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Thu Mar 27 13:22:32 2014 -0400
>=20
> linux-yocto/3.10: fix drm build failure
>=20
> Andrea Adami reported the following build failure:
>=20
>     .../drm/drm_mm.h:105:2: error: implicit declaration of function
>     'BUG_ON' [-Werror=3Dimplicit-function-declaration]
>     |   BUG_ON(!hole_node->hole_follows);
>     |   ^
>     |   CC      drivers/pci/setup-res.o
>     |   CC      drivers/gpu/drm/i915/i915_drv.o
>     | cc1: some warnings being treated as errors
>     | make[6]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
>     | make[5]: *** [drivers/gpu/drm/ttm] Error 2
>=20
> Cherry picking mainline commit 86e81f0e6 [drm/mm: include required header=
s in drm_mm.h]
> fixes the build problems.
>=20
> cc: Andrea Adami <andrea.adami@gmail.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>=20
> ---
>=20
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_3.10.bb
> index 9b0c5d3..fe6773a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
> @@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
>  KBRANCH =3D "standard/preempt-rt/base"
>  KBRANCH_qemuppc =3D "standard/preempt-rt/qemuppc"
> =20
> -SRCREV_machine ?=3D "f121a3aa028df37b8050779adaa239d29aaa2edd"
> -SRCREV_machine_qemuppc ?=3D "7172d3cbc73584e724b61ef5d13fc3519720f4c0"
> +SRCREV_machine ?=3D "f4351616572c6ad5a8b71b1becf02c3e779b85b8"
> +SRCREV_machine_qemuppc ?=3D "a6dfc85e99633d739068a03d2551e39847628551"
>  SRCREV_meta ?=3D "df3aa753c8826127fb5ad811d56d57168551d6e4"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=
=3D1;branch=3D${KBRANCH},meta;name=3Dmachine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/re=
cipes-kernel/linux/linux-yocto-tiny_3.10.bb
> index baa82fd..123f307 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
> @@ -9,7 +9,7 @@ LINUX_VERSION ?=3D "3.10.34"
> =20
>  KMETA =3D "meta"
> =20
> -SRCREV_machine ?=3D "2ee37bfe732c73f7d39af55875ce8d30b282471c"
> +SRCREV_machine ?=3D "c7739be126930006e3bfbdb2fb070a967abc5e09"
>  SRCREV_meta ?=3D "df3aa753c8826127fb5ad811d56d57168551d6e4"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes=
-kernel/linux/linux-yocto_3.10.bb
> index 56fbd07..49dd13d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
> @@ -11,13 +11,13 @@ KBRANCH_qemux86  =3D "standard/common-pc/base"
>  KBRANCH_qemux86-64  =3D "standard/common-pc-64/base"
>  KBRANCH_qemumips64 =3D "standard/mti-malta64"
> =20
> -SRCREV_machine_qemuarm ?=3D "e18e8c2c7cad913a25342f9f860eeeefce24b8aa"
> -SRCREV_machine_qemumips ?=3D "6f191aaecfdbebda450cec4a1f30fb0d1a2ed889"
> -SRCREV_machine_qemuppc ?=3D "ba2e16160c7f910de432511ca0008101a7b2263b"
> -SRCREV_machine_qemux86 ?=3D "2ee37bfe732c73f7d39af55875ce8d30b282471c"
> -SRCREV_machine_qemux86-64 ?=3D "2ee37bfe732c73f7d39af55875ce8d30b282471c"
> -SRCREV_machine_qemumips64 ?=3D "e05f0378e9c21d689eed8aacb306d2c1a044e0d0"
> -SRCREV_machine ?=3D "2ee37bfe732c73f7d39af55875ce8d30b282471c"
> +SRCREV_machine_qemuarm ?=3D "0e99eabbe5b3bec853ace496f94612bc37800260"
> +SRCREV_machine_qemumips ?=3D "b6b20f49e9a169a0672b7cc2d7b93d6652ca7873"
> +SRCREV_machine_qemuppc ?=3D "d71b782615b802c78e1586494b94dd40531775c8"
> +SRCREV_machine_qemux86 ?=3D "c7739be126930006e3bfbdb2fb070a967abc5e09"

Is it correct revision?

ERROR: Fetcher failure: Unable to find revision c7739be126930006e3bfbdb2fb0=
70a967abc5e09 in branch
standard/common-pc/base even from upstream=20
ERROR: Logfile of failure stored in: work/qemux86-webos-linux/linux-yocto/1=
_3.10.34+gitAUTOINC+df3aa753c8_c7739be126-r0/temp/log.do_fetch.73290

> +SRCREV_machine_qemux86-64 ?=3D "c7739be126930006e3bfbdb2fb070a967abc5e09"
> +SRCREV_machine_qemumips64 ?=3D "88abb1eb327f4e3c711d19a228cb153fdd9b3506"
> +SRCREV_machine ?=3D "c7739be126930006e3bfbdb2fb070a967abc5e09"
>  SRCREV_meta ?=3D "df3aa753c8826127fb5ad811d56d57168551d6e4"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=
=3D1;branch=3D${KBRANCH},${KMETA};name=3Dmachine,meta"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K/NRh952CO+2tg14
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM4AFcACgkQN1Ujt2V2gBy9hwCglwq6yAgP7HyctcNB6EJVDc/x
DPQAnA6qXPfuA+YV021cNnzP+R3E77Bo
=qzf8
-----END PGP SIGNATURE-----

--K/NRh952CO+2tg14--
