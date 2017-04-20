Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58DFC72F39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 13DFA18346;
	Thu, 20 Apr 2017 14:51:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dljGoovCa67G; Thu, 20 Apr 2017 14:51:47 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 38FE81833E;
	Thu, 20 Apr 2017 14:51:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D05E1A07E;
	Thu, 20 Apr 2017 14:51:47 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01BF81A073;
	Thu, 20 Apr 2017 14:51:47 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 20 Apr 2017 14:51:46 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id E9B011926;
	Thu, 20 Apr 2017 14:51:46 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 20 Apr 2017 14:51:46 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 20 Apr 2017 14:51:46 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>,
	Robert Yang <liezhi.yang@windriver.com>
Thread-Topic: Building logrotate for older releases is broken (was: RE:
	[OE-core] [PATCH 1/1] logrotate: set downloadfilename)
Thread-Index: AdK51N3R5LOSi80lQOSbe+uTZvTOLA==
Date: Thu, 20 Apr 2017 12:51:46 +0000
Message-ID: <4130d91cdc58431bbea8292c7cc30498@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Building logrotate for older releases is broken (was: RE: [PATCH 1/1] logrotate: set downloadfilename)
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
X-List-Received-Date: Thu, 20 Apr 2017 12:51:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: den 17 april 2017 11:49
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] logrotate: set downloadfilename
>=20
> Otherwise, the filename is r3-9-1.tar.gz which isn't straightforward.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/re=
cipes-extended/logrotate/logrotate_3.9.1.bb
> index c938d9f..3773170 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
> @@ -19,7 +19,7 @@ S =3D "${WORKDIR}/${BPN}-r3-9-1"
>=20
>  UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>=20
> -SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
> +SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz;down=
loadfilename=3D${BP}.tar.gz\
>             file://act-as-mv-when-rotate.patch \
>             file://update-the-manual.patch \
>             file://disable-check-different-filesystems.patch \
> --
> 2.10.2

The integration of this patch into OE-Core has broken building old=20
releases that rely on fetching the logrotate-3.9.1.tar.gz tar ball=20
with MD5 checksum 4492b145b6d542e4a2f41e77fa199ab0 from the mirror=20
at http://downloads.yoctoproject.org/mirror/sources/. Can you please=20
change the recipe to not call the downloaded tar ball the same name=20
as it had in Jethro, Krogoth and Morty (given that the checksums do=20
not match), and then restore the original tar ball in the mirror?

Without this correction, it is impossible to recreate old builds=20
based on either of the Jethro, Krogoth and Morty releases without=20
doing manual fixes.

//Peter


