Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tx4J5-0006Jr-1G
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 00:28:36 +0100
Received: by mail-we0-f173.google.com with SMTP id z2so1440521wey.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 15:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=s5M4xTaCxupsvJGFn6I/gaPEPCiShOM1Jl2/9SRRgC8=;
	b=Tiuk3Dysu4t8JdO4/5cT3RW+OPjQfcnp3mc5HYRie1/OMvUyo2oCUNb+jteLyH8O6t
	JG9pVyHVrWhBBl7pQvb9N0maYcOLmlQ+8ajtLzOctpLnJc5dtC+m6AmQL21hwax0uksJ
	kfqgTfJe3mDznozQfX3GulLqs4scT975+0tdCVPUfzWhqCAzjTsG/LAqBku0QwrBMp5I
	d/WJweoijJH9tzLc5aF/0EEpTFsCnaHuDx8Pmf5MZAxpl8WKxA8MfjLyMIKcLWqSg1p1
	QUQUD7s2N8SxwfMgCLy8Ffdk7j/CORMnFuGK3pc24IX6UJ4WKQpvLtODu9kcGUBoLlNc
	ir6w==
X-Received: by 10.194.85.234 with SMTP id k10mr23179488wjz.53.1358723559386;
	Sun, 20 Jan 2013 15:12:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fv2sm14423189wib.4.2013.01.20.15.12.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 15:12:38 -0800 (PST)
Date: Mon, 21 Jan 2013 00:12:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130120231240.GJ29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<7c26b8f7417dfbe245926137acfa61d0f659488c.1358635193.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <7c26b8f7417dfbe245926137acfa61d0f659488c.1358635193.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] default-providers: Automatically set PREFERRED_PROVIDER_udev
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
X-List-Received-Date: Sun, 20 Jan 2013 23:28:37 -0000
X-Groupsio-MsgNum: 34114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline

--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2013 at 10:47:05PM +0000, Ross Burton wrote:
> From: Radu Moisan <radu.moisan@intel.com>
>=20
> This is a more generic way to set preferred provider for udev.
> We expect to have multiple choices once we integrate other init
> managers, and this way we can automatically set it considering
> distro settings.
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/default-providers.inc |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index 8ed703c..89b6465 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -37,3 +37,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opkg"
>  PREFERRED_PROVIDER_console-tools ?=3D "kbd"
>  PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
>  PREFERRED_PROVIDER_make ?=3D "make"
> +PREFERRED_PROVIDER_udev ?=3D "${@base_contains('DISTRO_FEATURES','sysvin=
it','udev','',d)}"

'systemd' missing in 4th param? or another
"${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
?

> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD8eegACgkQN1Ujt2V2gBxOVwCeODi/HsOMVigzDE/ToDq62g0u
zBgAoJR3+y3x/cJ6c9yqCjKlmb+TfmBj
=FvbK
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
