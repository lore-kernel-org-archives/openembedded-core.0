Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tsad1-0000wn-5M
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:58:14 +0100
Received: by mail-pb0-f45.google.com with SMTP id mc8so279442pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FeTJnKM1kPinqc6jrJenWKeSoisBXnU8B9/eQSq6tN8=;
	b=jvSSR2MVuoqJTUPc7aBz5SPs2hd58PbGrH6XR2T/sbbDujlbZ8pW1YsZ3+nwF+CrTd
	9i1mW0dmdp9kXrjh6QVlD+c0noMntXzvgx8zoMrtrzfmvdoWEaAJFwiJjagvs8D99+TH
	J2pvp2CRx6etWadICWCtgtmvvN2KKuNyrpCPmgpx+k+vIg4YUq7e2p5FzdmETqKR9s75
	5GjlcbCi3dkoAGq4rq0f3IYB+3PHfyTrc45NAxTCJ/VNC1Nm8y8OXOJToeeSd6n113Bj
	O7inNlo0yfOKS/PvnH3gpww7bZdb8cCQugjLSA+O7aQi7wkSLw1COK9lp5sgRg9K6EDs
	708A==
X-Received: by 10.68.129.233 with SMTP id nz9mr197158484pbb.139.1357656179663; 
	Tue, 08 Jan 2013 06:42:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o5sm40872106pay.5.2013.01.08.06.42.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 06:42:58 -0800 (PST)
Date: Tue, 8 Jan 2013 15:43:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: tom.zanussi@intel.com
Message-ID: <20130108144301.GA3722@jama.palm1.palmone.com>
References: <cover.1357655073.git.tom.zanussi@intel.com>
	<8c55fe2c86ce12ea6a9fa491ed8a16971997285e.1357655073.git.tom.zanussi@intel.com>
MIME-Version: 1.0
In-Reply-To: <8c55fe2c86ce12ea6a9fa491ed8a16971997285e.1357655073.git.tom.zanussi@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] lttng2-ust: rename to lttng-ust
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
X-List-Received-Date: Tue, 08 Jan 2013 14:58:15 -0000
X-Groupsio-MsgNum: 33524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2013 at 08:31:19AM -0600, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>=20
> recipes-kernel/lttng/lttng-ust was removed by a previous patch, which
> also removed the naming conflict that caused the lttng-2.0 version of
> lttng-ust to be named lttng2-ust.  lttng2-ust was the only lttng-2.0
> recipe to be named in this way and since that was entirely due to the
> conflict, we can go back to the consistent naming for it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

what about upgrade path on target?

Cheers,

> ---
>  meta-yocto/conf/distro/include/distro_alias.inc                         =
| 1 -
>  meta-yocto/conf/distro/include/maintainers.inc                          =
| 1 -
>  meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb      =
| 2 +-
>  meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb                      =
| 2 +-
>  .../lttng-2.0/{lttng2-ust_2.0.5.bb =3D> lttng-ust_2.0.5.bb}             =
  | 0
>  5 files changed, 2 insertions(+), 4 deletions(-)
>  rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.5.bb =3D> lttng-ust=
_2.0.5.bb} (100%)
>=20
> diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto=
/conf/distro/include/distro_alias.inc
> index 0699c5f..1994e27 100644
> --- a/meta-yocto/conf/distro/include/distro_alias.inc
> +++ b/meta-yocto/conf/distro/include/distro_alias.inc
> @@ -226,7 +226,6 @@ DISTRO_PN_ALIAS_pn-lttng-modules =3D "OSPDT upstream=
=3Dhttp://lttng.org/"
>  DISTRO_PN_ALIAS_pn-lttng-tools =3D "OSPDT upstream=3Dhttp://lttng.org/"
>  DISTRO_PN_ALIAS_pn-lttng-ust =3D "OSPDT upstream=3Dhttp://lttng.org/"
>  DISTRO_PN_ALIAS_pn-lttng-viewer =3D "OSPDT upstream=3Dhttp://lttng.org/"
> -DISTRO_PN_ALIAS_pn-lttng2-ust =3D "OSPDT upstream=3Dhttp://lttng.org/"
>  DISTRO_PN_ALIAS_pn-makedepend =3D "Mandriva=3Dmakedepend Ubuntu=3Dxutils=
-dev"
>  DISTRO_PN_ALIAS_pn-makedevs =3D "OE-Core"
>  DISTRO_PN_ALIAS_pn-matchbox-config-gtk =3D "OpenedHand"
> diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/=
conf/distro/include/maintainers.inc
> index 5efb7d0..6de57dc 100644
> --- a/meta-yocto/conf/distro/include/maintainers.inc
> +++ b/meta-yocto/conf/distro/include/maintainers.inc
> @@ -490,7 +490,6 @@ RECIPE_MAINTAINER_pn-lsbtest =3D "Yi Zhao <yi.zhao@wi=
ndriver.com>"
>  RECIPE_MAINTAINER_pn-lsb =3D "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER_pn-lsof =3D "Bogdan Marinescu <bogdan.a.marinescu@inte=
l.com>"
>  RECIPE_MAINTAINER_pn-ltp =3D "Mihai Lindner <mihaix.lindner@linux.intel.=
com>"
> -RECIPE_MAINTAINER_pn-lttng2-ust =3D "Bogdan Marinescu <bogdan.a.marinesc=
u@intel.com>"
>  RECIPE_MAINTAINER_pn-lttng-control =3D "Bogdan Marinescu <bogdan.a.marin=
escu@intel.com>"
>  RECIPE_MAINTAINER_pn-lttng-modules =3D "Bogdan Marinescu <bogdan.a.marin=
escu@intel.com>"
>  RECIPE_MAINTAINER_pn-lttng-tools =3D "Bogdan Marinescu <bogdan.a.marines=
cu@intel.com>"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 591f33f..8f40c4e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -46,7 +46,7 @@ SYSTEMTAP_aarch64 =3D ""
>  # which means we can not use syscall() to call it. So we ignore
>  # it for x86_64/uclibc
> =20
> -LTTNGUST =3D "lttng2-ust"
> +LTTNGUST =3D "lttng-ust"
>  LTTNGUST_libc-uclibc =3D ""
>  LTTNGUST_mips =3D ""
>  LTTNGUST_aarch64 =3D ""
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/re=
cipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> index 2a5dd58..34d4484 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D61273c2e3f60dd=
38a74b01beb5f51fbd \
>                      file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
>                      file://lgpl-2.1.txt;md5=3D0f0d71500e6a57fd24d825f332=
42b9ca"
> =20
> -DEPENDS =3D "liburcu popt lttng2-ust"
> +DEPENDS =3D "liburcu popt lttng-ust"
> =20
>  SRCREV =3D "98c8c95b0e1afb2dac686338efdf036f6446d790"
>  PV =3D "v2.0.4"
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/rec=
ipes-kernel/lttng-2.0/lttng-ust_2.0.5.bb
> similarity index 100%
> rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> rename to meta/recipes-kernel/lttng-2.0/lttng-ust_2.0.5.bb
> --=20
> 1.7.11.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDsMHUACgkQN1Ujt2V2gBwS7ACgtpIuogUZH9dW1fzP7S0IihIq
n9cAoK3oB2m26PPNjthr6zCwQQ4BeXRX
=gxtq
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
