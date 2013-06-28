Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id E2E6C61A45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 19:50:20 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so1240562eaj.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Sb/ZmapPqcbe6gK+YC61vvUKkPRqT8x1kSWDwyXcwQg=;
	b=qjd1JR/ZK91wbIZCLAWhzvoynd7KKlrbequc64s7+N3o3O7/iEL+PLF3dF4mckWyNE
	IbxHq5Ob9KJrON54MqytOc4NbyDj2dV8o9tjCoBrv98DFmPUt9JSxF6ZwGqm8+uGf+6d
	Y16NHpf/YiQUNExVsFLIoQuWQ7bxmVEJsURCJEIGzITYxMpnbAifMw2dlS+h2agOnR18
	jzy5R9gGCfdeI/XIiucUQnSddpoYJooJgyLDoSWuYafH5cg7rDLQKfk03oXnBGtLflrr
	DUzs20e/M+5x/m3FfSvsR7cvA0QqE/U85PbmNj+S685ASszAq6GxaC66xbrJiLYuKqE/
	bhNw==
X-Received: by 10.14.104.135 with SMTP id i7mr14943409eeg.3.1372449021035;
	Fri, 28 Jun 2013 12:50:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm12430178eeb.13.2013.06.28.12.50.19 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 12:50:20 -0700 (PDT)
Date: Fri, 28 Jun 2013 21:51:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130628195100.GO3261@jama>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
	<e50493eabf21983d1c6755c0dfa8552a8e5cfa83.1372442170.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e50493eabf21983d1c6755c0dfa8552a8e5cfa83.1372442170.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] linux-firmware: be consistent with license package naming
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
X-List-Received-Date: Fri, 28 Jun 2013 19:50:21 -0000
X-Groupsio-MsgNum: 41148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dZihrQ6eCIduWT38"
Content-Disposition: inline

--dZihrQ6eCIduWT38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 06:56:47PM +0100, Paul Eggleton wrote:
> Much as I prefer en_GB spelling, we need to be consistent with the other
> package names in this recipe. Thanks to Trevor Woerner for pointing this
> out.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/m=
eta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index f586321..81795f2 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -58,7 +58,7 @@ PACKAGES =3D+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx $=
{PN}-vt6656 \
>               ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl=
8192su \
>               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bc=
m4334 \
>               ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k $=
{PN}-ath9k \
> -             ${PN}-iwlwifi-licence ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi=
-6000g2b-6"
> +             ${PN}-iwlwifi-license ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi=
-6000g2b-6"
> =20
>  FILES_${PN}-atheros-license =3D "/lib/firmware/LICENCE.atheros_firmware"
> =20
> @@ -170,10 +170,10 @@ RDEPENDS_${PN}-bcm4334 +=3D "${PN}-broadcom-license"
>  ALTERNATIVE_linux-firmware-bcm4334 =3D "brcmfmac-sdio.bin"
>  ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] =3D "/lib/f=
irmware/brcm/brcmfmac4334.bin"
> =20
> -RDEPENDS_${PN}-iwlwifi-6000g2a-5 =3D "${PN}-iwlwifi-licence"
> -RDEPENDS_${PN}-iwlwifi-6000g2b-6 =3D "${PN}-iwlwifi-licence"
> +RDEPENDS_${PN}-iwlwifi-6000g2a-5 =3D "${PN}-iwlwifi-license"
> +RDEPENDS_${PN}-iwlwifi-6000g2b-6 =3D "${PN}-iwlwifi-license"
> =20
> -FILES_${PN}-iwlwifi-licence =3D   "/lib/firmware/LICENCE.iwlwifi_firmwar=
e"
> +FILES_${PN}-iwlwifi-license =3D   "/lib/firmware/LICENCE.iwlwifi_firmwar=
e"
>  FILES_${PN}-iwlwifi-6000g2a-5 =3D "/lib/firmware/iwlwifi-6000g2a-5.ucode"
>  FILES_${PN}-iwlwifi-6000g2b-6 =3D "/lib/firmware/iwlwifi-6000g2b-6.ucode"

FWIW there is also -lic suffix in license.bbclass:
LICENSE_CREATE_PACKAGE ??=3D "0"
LICENSE_PACKAGE_SUFFIX ??=3D "-lic"

I don't know if it would cause some collision between package created
here and automatically by license.bbclass, but I guess not as the later
creates only ${PN}-lic.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dZihrQ6eCIduWT38
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHN6SMACgkQN1Ujt2V2gBxvzQCdF4mUKpuN5BTilQjCVMIDdp7Z
Jf4An0LDbT7egQRNgPVuqx8sYx53IRyk
=Xmm6
-----END PGP SIGNATURE-----

--dZihrQ6eCIduWT38--
