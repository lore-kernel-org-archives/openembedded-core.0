Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 9017 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jun 2016 12:14:33 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0061.outbound.protection.outlook.com [157.55.234.61])
	by mail.openembedded.org (Postfix) with ESMTP id 54AF16FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Weg1kRO0HQ9Nb9r6D9V9Lgxk+hchOdGUBeUSmB/mvfU=;
	b=iVhHPeA65Z4JLrHTZjN2ur/zKEAB4q1kbZrkILf9vZUHpW2G6Ds8Oe4ApF+bb87Z3loNOk5bUKFLXFJj0uUFSB/3F3mHQTGaBj+wzn4T9vnbO6jXH15xZGvnmpmKA8WJUNYJK9Wh9KFKjru3NvJt1VesMyVmLBRHAzVjCcGdyw4=
Received: from DB3PR04MB042.eurprd04.prod.outlook.com (10.242.136.151) by
	DB3PR04MB042.eurprd04.prod.outlook.com (10.242.136.151) with Microsoft
	SMTP Server (TLS) id 15.1.517.8; Wed, 22 Jun 2016 09:44:16 +0000
Received: from DB3PR04MB042.eurprd04.prod.outlook.com
	([fe80::3131:6aa6:231e:9fae]) by DB3PR04MB042.eurprd04.prod.outlook.com
	([fe80::3131:6aa6:231e:9fae%21]) with mapi id 15.01.0517.014;
	Wed, 22 Jun 2016 09:44:16 +0000
From: Ting Liu <ting.liu@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][PATCH v2] u-boot: extend UBOOT_CONFIG format to
	support different binary name
Thread-Index: AQHRxxbRpHjbuev1Wk6zb+zvc2HZ7Z/1RtOQ
Date: Wed, 22 Jun 2016 09:44:16 +0000
Message-ID: <DB3PR04MB0421FF112832EC62FF6F650992C0@DB3PR04MB042.eurprd04.prod.outlook.com>
References: <1466002870-9934-1-git-send-email-ting.liu@nxp.com>
In-Reply-To: <1466002870-9934-1-git-send-email-ting.liu@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=ting.liu@nxp.com; 
x-originating-ip: [199.59.231.64]
x-ms-office365-filtering-correlation-id: e77d6233-0c36-482a-6140-08d39a81c703
x-microsoft-exchange-diagnostics: 1; DB3PR04MB042;
	6:Tq1B10NujRvZCXzkKrXkORMnV5t//OAmhTaqWYH3yUk4Fmy60uk7JDmP6z0qmsv0iQzseA9fS9x0DJ7D2q1VBy4cNgqnFA+ITa5rXz7vyhhS8yt75tosFijFyUesc04c3XX6UcKKTxtN3/nERcWl+2tSF0FQp/7oMYgad3upNu2C2rMu5kY7BVjLbEPxUGd194DfTpLSu+6VoFP8McpXqX6s9z98KlxtnQi9LppshnS0CBxAkHpa8AQft5xAkbw99+MVa+VU/Z/JB4xW6Q5XWTH5W4wBYKGBeloOgwKKl9iMiWybfIR4kkRlbRmCOIyggdIzWegGSHiu2+xCmn3Za0n9L3z5i3sgOo2z0K1Mf+U=;
	5:aTfT7QV3INwiTqWnEA2TsUCOHkNKzI0q+78fzgEf3aKLgujPnA13WPr2kC3MnTtLIYEsn88ch9Y3UKPfbYF1BtGcXasgtKfqbBTn2Hn2BhSrC4dFrXhpf+2wali9ma89LhdqCda189zNyQ5HRLXrMQ==;
	24:eZeD/j6NrHpEgeZfhqt/ADQ/g/YX42JAShzD2fzTKVYbL4eM97d2Jz2kdeBKO3fIV+z2n5PPu/EDlYdDle62MRYCxe8KxEBqCUWD2RODxDo=;
	7:bzcfqE220+VFXH9OLCsldBvoiwjtAXpG62RaVT+/ZGku0YntlH4Av3389yVHW36V7Yp5zc2Ri1yjZLYiiM8suOJIbMJ5sNoXuL3dCquKTrMscsfq2YvzObg527Jp1B9v/K8fhGPPsCIPFZTETGmOeaAWHWI4BOUWyCr63Y6XqQzFJfNehU4Eq070dF9FgZUMsv+WM2dCQ03mCZrGlkTgG4+Y5QNeMYvGedYuEeu0nYQTzjPnP8vV9HaDCVLAjLhq
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB042;
x-microsoft-antispam-prvs: <DB3PR04MB0424C5F796FA3FDF15D579D992C0@DB3PR04MB042.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB3PR04MB042; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB042; 
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(199003)(377454003)(189002)(13464003)(107886002)(2906002)(8936002)(189998001)(8676002)(50986999)(68736007)(7696003)(76176999)(5002640100001)(102836003)(5250100002)(2950100001)(54356999)(33656002)(2501003)(6116002)(81156014)(110136002)(86362001)(9686002)(586003)(3846002)(101416001)(5003600100003)(7846002)(97736004)(2900100001)(3660700001)(81166006)(76576001)(19580395003)(87936001)(74316001)(19580405001)(105586002)(106116001)(11100500001)(3280700002)(450100001)(106356001)(92566002)(2351001)(7736002)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB042;
	H:DB3PR04MB042.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; CAT:NONE; LANG:en; CAT:NONE; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2016 09:44:16.7117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB042
Subject: Re: [PATCH v2] u-boot: extend UBOOT_CONFIG format to support different binary name
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
X-List-Received-Date: Wed, 22 Jun 2016 12:14:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: ting.liu@nxp.com [mailto:ting.liu@nxp.com]
> Sent: Wednesday, June 15, 2016 11:01 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Zhenhua Luo <zhenhua.luo@nxp.com>; Ting Liu <ting.liu@nxp.com>
> Subject: [oe-core][PATCH v2] u-boot: extend UBOOT_CONFIG format to
> support different binary name
>=20
> From: Ting Liu <ting.liu@nxp.com>
>=20
> When using UBOOT_CONFIG format, the final u-boot binary for each config
> may have different names. Extend UBOOT_CONFIG format to support
> different binary to be copied.
>=20
> The new format is supposed to be compatible with old one as
> ${UBOOT_BINARY} is copied by default, and images,binary can be empty.
>=20
> An example format to specify it, in the machine, is:
> UBOOT_CONFIG ??=3D "sdcard-ifc sdcard-qspi lpuart qspi secure-boot nor"
> UBOOT_CONFIG[nor] =3D "ls1021atwr_nor_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[sdcard-ifc] =3D "ls1021atwr_sdcard_ifc_config,,u-boot-with-
> spl-pbl.bin"
> UBOOT_CONFIG[sdcard-qspi] =3D "ls1021atwr_sdcard_qspi_config,,u-boot-
> with-spl-pbl.bin"
> UBOOT_CONFIG[lpuart] =3D "ls1021atwr_nor_lpuart_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[qspi] =3D "ls1021atwr_qspi_config,,u-boot-dtb.bin"
> UBOOT_CONFIG[secure-boot] =3D "ls1021atwr_nor_SECURE_BOOT_config"
>=20
> Signed-off-by: Ting Liu <ting.liu@nxp.com>
> ---
>  meta/classes/uboot-config.bbclass  | 19 ++++++++++++++++---
> meta/recipes-bsp/u-boot/u-boot.inc | 12 +++++++++---
>  2 files changed, 25 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-
> config.bbclass
> index cb061af..3f760f2 100644
> --- a/meta/classes/uboot-config.bbclass
> +++ b/meta/classes/uboot-config.bbclass
> @@ -3,7 +3,7 @@
>  # The format to specify it, in the machine, is:
>  #
>  # UBOOT_CONFIG ??=3D <default>
> -# UBOOT_CONFIG[foo] =3D "config,images"
> +# UBOOT_CONFIG[foo] =3D "config,images,binary"
>  #
>  # or
>  #
> @@ -11,9 +11,13 @@
>  #
>  # Copyright 2013, 2014 (C) O.S. Systems Software LTDA.
>=20
> +UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
> +
>  python () {
>      ubootmachine =3D d.getVar("UBOOT_MACHINE", True)
>      ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
> +    ubootbinary =3D d.getVar('UBOOT_BINARY', True)
> +    ubootbinaries =3D d.getVar('UBOOT_BINARIES', True)
>      # The "doc" varflag is special, we don't want to see it here
>      ubootconfigflags.pop('doc', None)
>=20
> @@ -27,6 +31,9 @@ python () {
>      if ubootmachine and ubootconfigflags:
>          raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and
> UBOOT_CONFIG at the same time.")
>=20
> +    if ubootconfigflags and ubootbinaries:
> +        raise bb.parse.SkipPackage("You cannot use UBOOT_BINARIES as it
> + is internal to uboot_config.bbclass.")
> +
>      if not ubootconfigflags:
>          return
>=20
> @@ -36,13 +43,19 @@ python () {
>              for f, v in ubootconfigflags.items():
>                  if config =3D=3D f:
>                      items =3D v.split(',')
> -                    if items[0] and len(items) > 2:
> -                        raise bb.parse.SkipPackage('Only config,images c=
an be
> specified!')
> +                    if items[0] and len(items) > 3:
> +                        raise bb.parse.SkipPackage('Only
> + config,images,binary can be specified!')
>                      d.appendVar('UBOOT_MACHINE', ' ' + items[0])
>                      # IMAGE_FSTYPES appending
>                      if len(items) > 1 and items[1]:
>                          bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." %=
 items[1])
>                          d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
> +                    if len(items) > 2 and items[2]:
> +                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." =
% items[2])
> +                        d.appendVar('UBOOT_BINARIES', ' ' + items[2])
> +                    else:
> +                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." =
%
> ubootbinary)
> +                        d.appendVar('UBOOT_BINARIES', ' ' +
> + ubootbinary)
>                      break
>      elif len(ubootconfig) =3D=3D 0:
>         raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFI=
G.')
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
> boot/u-boot.inc
> index 1071d1f..1f64faa 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -32,7 +32,6 @@ UBOOT_LOCALVERSION ?=3D ""
>  # but enable individual recipes to change this value.
>  UBOOT_SUFFIX ??=3D "bin"
>  UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> -UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
>  UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
>  UBOOT_MAKE_TARGET ?=3D "all"
>=20
> @@ -82,15 +81,22 @@ do_compile () {
>=20
>      if [ -n "${UBOOT_CONFIG}" ]
>      then
> +        unset i j k
>          for config in ${UBOOT_MACHINE}; do
>              i=3D$(expr $i + 1);
> -            for type  in ${UBOOT_CONFIG}; do
> +            for type in ${UBOOT_CONFIG}; do
>                  j=3D$(expr $j + 1);
>                  if [ $j -eq $i ]
>                  then
>                      oe_runmake O=3D${config} ${config}
>                      oe_runmake O=3D${config} ${UBOOT_MAKE_TARGET}
> -                    cp  ${S}/${config}/${UBOOT_BINARY}  ${S}/${config}/u=
-boot-
> ${type}.${UBOOT_SUFFIX}
> +                    for binary in ${UBOOT_BINARIES}; do
> +                        k=3D$(expr $k + 1);
> +                        if [ $k -eq $i ]; then
> +                            cp ${S}/${config}/${binary} ${S}/${config}/u=
-boot-
> ${type}.${UBOOT_SUFFIX}
> +                        fi
> +                    done
> +                    unset k
>                  fi
>              done
>              unset  j
> --
> 1.9.2


