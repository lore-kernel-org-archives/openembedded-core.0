Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8182B7198F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 07:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id F08782E9A3;
	Thu, 28 Sep 2017 09:37:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r1r9RoijGcDY; Thu, 28 Sep 2017 09:37:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id DA1B12E76B;
	Thu, 28 Sep 2017 09:37:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB12C1E080;
	Thu, 28 Sep 2017 09:37:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFE671E07F;
	Thu, 28 Sep 2017 09:37:11 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 28 Sep 2017 09:37:11 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id A40171FB7;
	Thu, 28 Sep 2017 09:37:11 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 28 Sep 2017 09:37:11 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 28 Sep 2017 09:37:11 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 28 Sep 2017 09:37:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "andreas.kling@gmail.com" <andreas.kling@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] systemd: add runtime dependencies to pam
	plugins.
Thread-Index: AQHTN3Sw36q7cwykKUORWEctEzv8paLJ6Rxg
Date: Thu, 28 Sep 2017 07:37:11 +0000
Message-ID: <360d718b5d554d5d93b19ead209eb3bd@XBOX02.axis.com>
References: <20170926171708.19010-1-andreas.kling@gmail.com>
	<20170927094014.2666-1-andreas.kling@gmail.com>
In-Reply-To: <20170927094014.2666-1-andreas.kling@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3] systemd: add runtime dependencies to pam	plugins.
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
X-List-Received-Date: Thu, 28 Sep 2017 07:37:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> andreas.kling@gmail.com
> Sent: den 27 september 2017 11:40
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] systemd: add runtime dependencies to pam
> plugins.
>=20
> From: Andy Kling <andreas.kling@peiker-cee.de>
>=20
>   This ensures pam plugins required by /etc/pam.d/systemd-user
>   to open a user session are installed.
>=20
>   systemd[1]: Starting User Manager for UID 994...
>   systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)
>=20
>   Drop package systemd-pam to prevent confusion.
>   It is unused for a long time now.
>=20
>   v2: improve commit message
>   v3: drop systemd-pam

The patch version information does not belong in the commit message.
You should add this kind of information below the three dashes below.

> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> ---

This is where information about the patch belongs, e.g., what has changed=20
in the various versions of the patch.

>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core=
/systemd/systemd_234.bb
> index 881896bfb5..acc4c4623b 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -31,6 +31,12 @@ SRC_URI +=3D " \
>             "
>  SRC_URI_append_qemuall =3D " file://0001-core-device.c-Change-the-defaul=
t-device-timeout-to-2.patch"
>=20
> +PAM_PLUGINS =3D " \
> +    pam-plugin-unix \
> +    pam-plugin-loginuid \
> +    pam-plugin-keyinit \
> +"
> +
>  PACKAGECONFIG ??=3D "xz \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinu=
x ldconfig usrmerge', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbco=
mmon', '', d)} \
> @@ -100,7 +106,7 @@ PACKAGECONFIG[importd] =3D "--enable-importd,--disabl=
e-importd"
>  PACKAGECONFIG[libidn] =3D "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[audit] =3D "--enable-audit,--disable-audit,audit"
>  PACKAGECONFIG[manpages] =3D "--enable-manpages,--disable-manpages,libxsl=
t-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-nativ=
e"
> -PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}=
"
>  # Verify keymaps on locale change
>  PACKAGECONFIG[xkbcommon] =3D "--enable-xkbcommon,--disable-xkbcommon,lib=
xkbcommon"
>  # Update NAT firewall rules
> @@ -295,7 +301,6 @@ PACKAGES =3D+ "\
>      ${PN}-kernel-install \
>      ${PN}-rpm-macros \
>      ${PN}-binfmt \
> -    ${PN}-pam \
>      ${PN}-zsh-completion \
>      ${PN}-xorg-xinitrc \
>      ${PN}-container \
> --
> 2.14.1
>=20
> --

//Peter


