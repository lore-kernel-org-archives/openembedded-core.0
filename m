Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SyhYZ-00019h-L6; Tue, 07 Aug 2012 13:02:35 +0200
Received: by weyr6 with SMTP id r6so2498304wey.6
	for <multiple recipients>; Tue, 07 Aug 2012 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7JI1gJWSpEAoLa8Aq/Ror5fPTUPaDL7QBV/PWKfZ43Q=;
	b=nzOTVuV08e2/gJ4zJcyYMywgJNB1EEeQe6b/EBlrgW22CSr4gOm6TswfAJmEjGdwNL
	12AFIJGBpc4d68GADOdV0Vb0jCidUlqbfimKD6NYDE0F5bhccWCSUSo1E7nSoCB65d55
	E04QWsAa8TYxfzoQGyzzaUIs3FOCT3E+bH2MPbwE3IcQfjKSbB2WkmrA4JEDcu82MP+g
	0vFsD5uqqzFqC7mGHJMPL46gwoWKUVcFw/5gpavSFQLp2Kqn0B69U0R1X2DeKCa490IV
	aEG9gKehykISrowjtl83Bnz9LiJm2LwdYXeHqvgbHovCCSdwlxeq0qjVgKDDflfh2p4I
	JN+g==
Received: by 10.180.14.8 with SMTP id l8mr26563160wic.6.1344336649958;
	Tue, 07 Aug 2012 03:50:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm30556689wid.7.2012.08.07.03.50.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 03:50:49 -0700 (PDT)
Date: Tue, 7 Aug 2012 12:50:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120807105045.GR3267@jama.jama.net>
References: <20120807102142.00BD510217@opal>
MIME-Version: 1.0
In-Reply-To: <20120807102142.00BD510217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : Revert "linux-firware: use ${base_libdir} instead of / lib for packaging"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 11:02:35 -0000
X-Groupsio-MsgNum: 27078
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEk28Nl/eckWL8CC"
Content-Disposition: inline

--vEk28Nl/eckWL8CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 07, 2012 at 10:21:41AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1da5966290954f4148cb39a0628b10f8f902ba18
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D1da5966290954f4148cb39a0628b10f8f902ba18
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue Aug  7 11:16:54 2012 +0100
>=20
> Revert "linux-firware: use ${base_libdir} instead of /lib for packaging"
>=20
> This change breaks firmware loading on 64 bit platforms. This therefore
> reverts commit ce2665b6ae77770d69ffbc4d45c96ce829d16738.
>=20
> ---
>=20
>  .../linux-firmware/linux-firmware_git.bb           |   36 ++++++++++----=
------
>  1 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/m=
eta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 5b93975..a7e4ed6 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -22,7 +22,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.radeon;md5=3De56b4=
05656593a0c97e478513051ea0e \
>  SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
>  PE =3D "1"
>  PV =3D "0.0+git${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r2"

^ breaks binary feeds

> =20
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linu=
x-firmware.git;protocol=3Dgit"
> =20
> @@ -35,50 +35,50 @@ do_compile() {
>  }
> =20
>  do_install() {
> -	install -d  ${D}${base_libdir}/firmware/
> -	cp -r * ${D}${base_libdir}/firmware/
> +	install -d  ${D}/lib/firmware/
> +	cp -r * ${D}/lib/firmware/
> =20
>  	# Libertas sd8686
> -	ln -sf libertas/sd8686_v9.bin ${D}${base_libdir}/firmware/sd8686.bin
> -	ln -sf libertas/sd8686_v9_helper.bin ${D}${base_libdir}/firmware/sd8686=
_helper.bin
> +	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
> +	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
> =20
>  	# Realtek rtl8192*=20
> -	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}${base_libdir}/firmwar=
e/rtlwifi/LICENCE.rtlwifi_firmware.txt
> +	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/=
LICENCE.rtlwifi_firmware.txt
> =20
>  	# fixup wl12xx location, after 2.6.37 the kernel searches a different l=
ocation for it
> -	( cd ${D}${base_libdir}/firmware ; ln -sf ti-connectivity/* . )
> +	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
>  }
> =20
>  PACKAGES =3D+ "${PN}-sd8686 ${PN}-rtl8192cu linux-firmware-rtl8192ce lin=
ux-firmware-rtl8192su ${PN}-wl12xx"
> =20
>  LICENSE_${PN}-sd8686 =3D "Firmware:LICENSE.libertas"
>  FILES_${PN}-sd8686 =3D " \
> -  ${base_libdir}/firmware/libertas/sd8686_v9* \
> -  ${base_libdir}/firmware/sd8686* \
> -  ${base_libdir}/firmware/LICENCE.libertas \
> +  /lib/firmware/libertas/sd8686_v9* \
> +  /lib/firmware/sd8686* \
> +  /lib/firmware/LICENCE.libertas \
>  "
> =20
>  LICENSE_${PN}-rtl8192cu =3D "Firmware:LICENCE.rtlwifi_firmware"
>  FILES_${PN}-rtl8192cu =3D " \
> -  ${base_libdir}/firmware/rtlwifi/rtl8192cufw.bin \
> -  ${base_libdir}/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
> +  /lib/firmware/rtlwifi/rtl8192cufw.bin \
> +  /lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt \
>  "
> =20
>  LICENSE_${PN}-rtl8192ce =3D "Firmware:LICENCE.rtlwifi_firmware"
>  FILES_${PN}-rtl8192ce =3D " \
> -  ${base_libdir}/firmware/rtlwifi/rtl8192cfw.bin \
> +  /lib/firmware/rtlwifi/rtl8192cfw.bin \
>  "
> =20
>  LICENSE_${PN}-rtl8192su =3D "Firmware:LICENCE.rtlwifi_firmware"
>  FILES_${PN}-rtl8192su =3D " \
> -  ${base_libdir}/firmware/rtlwifi/rtl8712u.bin \
> +  /lib/firmware/rtlwifi/rtl8712u.bin \
>  "
> =20
>  FILES_${PN}-wl12xx =3D " \
> -  ${base_libdir}/firmware/wl12* \
> -  ${base_libdir}/firmware/TI* \
> -  ${base_libdir}/firmware/ti-connectivity \
> +  /lib/firmware/wl12* \
> +  /lib/firmware/TI* \
> +  /lib/firmware/ti-connectivity \
>  "
> =20
> -FILES_${PN} +=3D "${base_libdir}/firmware/*"
> +FILES_${PN} +=3D "/lib/firmware/*"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vEk28Nl/eckWL8CC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAg8wUACgkQN1Ujt2V2gBxPxQCfS8N7UEgeXXgPBsGUgbiYRJLG
GREAn0pu2fkiVNv16ZY7ZP9t8+MJIplQ
=MjFm
-----END PGP SIGNATURE-----

--vEk28Nl/eckWL8CC--
