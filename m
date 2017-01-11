Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.38])
	by mail.openembedded.org (Postfix) with ESMTP id 25CD66093D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 06:45:44 +0000 (UTC)
Received: from 1cRCfH-0000CI-VI by out10b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cRCfI-0000DE-U0; Tue, 10 Jan 2017 22:45:44 -0800
Received: by emcmailer; Tue, 10 Jan 2017 22:45:44 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cRCfH-0000CI-VI; Tue, 10 Jan 2017 22:45:43 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0319.002; Wed, 11 Jan 2017 07:45:43 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "Armin Kuster (akuster808@gmail.com)" <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH][krogoth] libxtst: 1.2.2 -> 1.2.3
Thread-Index: AQHSazJTxE8X1/03Q0eVDZIG4+DgP6Ey1Fzg
Date: Wed, 11 Jan 2017 06:45:43 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48AC10DDA2@SESTOEX04.enea.se>
References: <1484046665-61406-1-git-send-email-sona.sarmadi@enea.com>
In-Reply-To: <1484046665-61406-1-git-send-email-sona.sarmadi@enea.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: FW: [PATCH][krogoth] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Wed, 11 Jan 2017 06:45:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I hope it is ok to upgrade libXtst, please let me know if you want to keep =
the same version and apply the patch instead of upgrade.

 The upgrade have only following changes:

https://cgit.freedesktop.org/xorg/lib/libXtst/
Age	Commit message	Author	Files	Lines
2016-10-04	libXtst 1.2.3HEADlibXtst-1.2.3master	Matthieu Herrb	1	-1/+1
2016-09-25	Out of boundary access and endless loop in libXtst	Tobias Stoeck=
mann	1	-4/+39
2013-11-23	Remove fallback for _XEatDataWords, require libX11 1.6 for it	Mi=
chael Joost	2	-18/+1
2013-05-31	libXtst 1.2.2libXtst-1.2.2

This does not affect master. According to Mitre this affects libXtst before=
 1.2.3:

Multiple integer overflows in X.org libXtst before 1.2.3 allow remote X ser=
vers to trigger out-of-bounds memory access operations by leveraging the la=
ck of range checks.

Cheers
//Sona

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Sona Sarmadi
> Sent: den 10 januari 2017 12:11
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH][krogoth] libxtst: 1.2.2 -> 1.2.3
>=20
> Upgrade libxtst from 1.2.2 to 1.2.3 to address:
> Out of Bounds Write Denial of Service Vulnerability, CVE-2016-7951
>=20
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2016-7951
> https://cgit.freedesktop.org/xorg/lib/libXtst/commit/?id=3D9556ad67af312
> 9ec4a7a4f4b54a0d59701beeae3
>=20
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb =3D> libxtst_1.2.3.bb} =
| 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-
> graphics/xorg-lib/{libxtst_1.2.2.bb =3D> libxtst_1.2.3.bb} (78%)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
> b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> similarity index 78%
> rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
> rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> index 1b0bcf3..31ea439 100644
> --- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> @@ -16,5 +16,5 @@ PE =3D "1"
>=20
>  XORG_PN =3D "libXtst"
>=20
> -SRC_URI[md5sum] =3D "25c6b366ac3dc7a12c5d79816ce96a59"
> -SRC_URI[sha256sum] =3D
> "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c83
> 09f6d9"
> +SRC_URI[md5sum] =3D "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
> +SRC_URI[sha256sum] =3D
> "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4b
> f5204"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

