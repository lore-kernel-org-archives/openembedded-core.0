Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91815C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 01:02:46 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.106484.1669597357081982695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 17:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Q/5FaY25;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669597357;
  x=1701133357;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kWtwtybt6ad75F8B56PTJQ1l4WYko3dkxzwmUjA+5Ss=;
  b=Q/5FaY25isnbn9ZHLmn5mAQI2Qwi4tjztpvcN/7xJwAGG7V1DYVAiSTa
   DoXRPjEbVRB17W2o0XFMy8kAuudvbx6qyuBpaMHLkcI3TsIgma5pAivdh
   MQZsFspJNwoOqjn8/Z6+jXuCvneUFbn4Hp6qOVioN6WzV4zvKmmQ5S5uR
   EwsYF0aARsy3VCctNsiPGNq5g9AA95ShfloknA6+Teit4vhCzBMg9ynWm
   dThNSFNoqu1BlZBKaXLLF13i6l1m1xBG/UlCpk2/dVrteP+LiOi8P0uNr
   /GhOYOp8yDA4GqbJ5e9o086WsKLj94nUjSM7foOV4BST0RJ+CCrsvjMCO
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Petr Vorel <pevik@seznam.cz>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Petr Vorel <petr.vorel@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, =?iso-8859-1?Q?Daniel_D=EDaz?=
	<daniel.diaz@linaro.org>, Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Changhyeok Bae <changhyeok.bae@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: RE: [OE-core] [PATCH v3 1/1] iputils: update to 20221126
Thread-Topic: [OE-core] [PATCH v3 1/1] iputils: update to 20221126
Thread-Index: AQHZAq7Kdmhl3BuaNk+CjShceEUhg65Tf+/g
Date: Mon, 28 Nov 2022 01:02:34 +0000
Message-ID: <cfe308eff7634b6d9be8f32c032dae41@axis.com>
References: <20221127222234.502122-1-pevik@seznam.cz>
In-Reply-To: <20221127222234.502122-1-pevik@seznam.cz>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173892

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Petr Vorel
> Sent: den 27 november 2022 23:23
> To: openembedded-core@lists.openembedded.org
> Cc: Petr Vorel <petr.vorel@gmail.com>; Richard Purdie <richard.purdie@lin=
uxfoundation.org>; Daniel D=EDaz <daniel.diaz@linaro.org>; Khem Raj <raj.kh=
em@gmail.com>; Alexandre Belloni <alexandre.belloni@bootlin.com>; Changhyeo=
k Bae <changhyeok.bae@gmail.com>; Alexander Kanavin <alex.kanavin@gmail.com=
>
> Subject: [OE-core] [PATCH v3 1/1] iputils: update to 20221126
>=20
> From: Petr Vorel <petr.vorel@gmail.com>
>=20
> This release removed: ninfod, rarpd, rdisc.
> Remove also related, not yet upstreamed patch.
>=20
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>=20
> changes v2-v3:
> * Remove ninfod related code (Alexandre Belloni):
> ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
>=20
> Hope now it's correct (Alexandre Belloni is going to test v2 without
> this line).
>=20
> Kind regards,
> Petr
>=20
>  .../0001-rarpd-rdisc-Drop-PrivateUsers.patch  | 27 -------------------
>  ...putils_20211215.bb =3D> iputils_20221126.bb} | 20 +++-----------
>  2 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644 meta/recipes-extended/iputils/iputils/0001-rarpd-rdis=
c-Drop-PrivateUsers.patch
>  rename meta/recipes-extended/iputils/{iputils_20211215.bb =3D> iputils_2=
0221126.bb} (64%)
>=20
> diff --git a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-=
PrivateUsers.patch b/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc=
-Drop-PrivateUsers.patch
> deleted file mode 100644
> index c61e39dc80..0000000000
> --- a/meta/recipes-extended/iputils/iputils/0001-rarpd-rdisc-Drop-Private=
Users.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From dfeeb3f1328d09f516edeb6349bd63e3c87f9397 Mon Sep 17 00:00:00 2001
> -From: Alex Kiernan <alex.kiernan@gmail.com>
> -Date: Thu, 13 Feb 2020 06:08:45 +0000
> -Subject: [PATCH] rarpd:Drop PrivateUsers
> -
> -rarpd cannot gain the necessary capabilities with
> -PrivateUsers enabled.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> -
> ----
> - systemd/rarpd.service.in | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/systemd/rarpd.service.in b/systemd/rarpd.service.in
> -index e600c10..f5d7621 100644
> ---- a/systemd/rarpd.service.in
> -+++ b/systemd/rarpd.service.in
> -@@ -12,7 +12,6 @@ AmbientCapabilities=3DCAP_NET_RAW
> - DynamicUser=3Dyes
> - PrivateTmp=3Dyes
> - PrivateDevices=3Dyes
> --PrivateUsers=3Dyes
> - ProtectSystem=3Dstrict
> - ProtectHome=3Dyes
> - ProtectControlGroups=3Dyes
> diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/rec=
ipes-extended/iputils/iputils_20221126.bb
> similarity index 64%
> rename from meta/recipes-extended/iputils/iputils_20211215.bb
> rename to meta/recipes-extended/iputils/iputils_20221126.bb
> index 3ddce0be54..ad9c275e0c 100644
> --- a/meta/recipes-extended/iputils/iputils_20211215.bb
> +++ b/meta/recipes-extended/iputils/iputils_20221126.bb
> @@ -11,9 +11,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dbb64c89bb0e23b72930d2380894c47a1"
>  DEPENDS =3D "gnutls"
>=20
>  SRC_URI =3D "git://github.com/iputils/iputils;branch=3Dmaster;protocol=
=3Dhttps \
> -           file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
>             "

Since there no longer is any patch, the above can be changed to:

SRC_URI =3D "git://github.com/iputils/iputils;branch=3Dmaster;protocol=3Dht=
tps"

> -SRCREV =3D "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
> +SRCREV =3D "5ffabc4190cab975c7332645259e286a032e183b"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> @@ -23,14 +22,11 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>20\d+)"
>  # breaks the version order.
>  CVE_CHECK_IGNORE +=3D "CVE-2000-1213 CVE-2000-1214"
>=20
> -PACKAGECONFIG ??=3D "libcap rarpd \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninf=
od', '', d)} \
> +PACKAGECONFIG ??=3D "libcap \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"

AFAICT after looking at the code, there is no longer any reason to=20
pass the systemd configuration as there is nothing related to systemd=20
being installed anymore. I.e., the above can be simplified to:

PACKAGECONFIG ??=3D "libcap"

and PACKAGECONFIG[systemd] below can be removed too. Unless of course=20
you are planning to add new systemd services in the not too distant=20
future, in which case you might as well leave it as it is.

>  PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse -DNO_SETC=
AP_OR_SUID=3Dtrue, libcap libcap-native"
>  PACKAGECONFIG[libidn] =3D "-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse, libidn2"
>  PACKAGECONFIG[gettext] =3D "-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=3Dfalse,=
 gettext"
> -PACKAGECONFIG[ninfod] =3D "-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=3Dfalse,=
"
> -PACKAGECONFIG[rarpd] =3D "-DBUILD_RARPD=3Dtrue,-DBUILD_RARPD=3Dfalse,"
>  PACKAGECONFIG[systemd] =3D "-Dsystemdunitdir=3D${systemd_system_unitdir}=
,,systemd"
>  PACKAGECONFIG[docs] =3D "-DBUILD_HTML_MANS=3Dtrue -DBUILD_MANS=3Dtrue,-D=
BUILD_HTML_MANS=3Dfalse -DBUILD_MANS=3Dfalse, libxslt"
>=20
> @@ -43,9 +39,7 @@ ALTERNATIVE_PRIORITY =3D "100"
>  ALTERNATIVE:${PN}-ping =3D "ping"
>  ALTERNATIVE_LINK_NAME[ping] =3D "${base_bindir}/ping"
>=20
> -SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff $=
{PN}-rdisc \
> -             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd=
', '', d)} \
> -             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninf=
od', '', d)}"
> +SPLITPKGS =3D "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
>  PACKAGES +=3D "${SPLITPKGS}"
>=20
>  ALLOW_EMPTY:${PN} =3D "1"
> @@ -56,11 +50,3 @@ FILES:${PN}-ping =3D "${base_bindir}/ping.${BPN}"
>  FILES:${PN}-arping =3D "${base_bindir}/arping"
>  FILES:${PN}-tracepath =3D "${base_bindir}/tracepath"
>  FILES:${PN}-clockdiff =3D "${base_bindir}/clockdiff"
> -FILES:${PN}-rarpd =3D "${base_sbindir}/rarpd ${systemd_system_unitdir}/r=
arpd@.service"
> -FILES:${PN}-rdisc =3D "${base_sbindir}/rdisc"
> -FILES:${PN}-ninfod =3D "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninf=
od.sh"
> -
> -SYSTEMD_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '$=
{PN}-ninfod', '', d)} \
> -                    ${PN}-rdisc"
> -SYSTEMD_SERVICE:${PN}-ninfod =3D "ninfod.service"
> -SYSTEMD_SERVICE:${PN}-rdisc =3D "rdisc.service"

Since you remove all of the SYSTEMD_* variables, you should also=20
remove systemd from the inherit line.

> --
> 2.38.1

//Peter


