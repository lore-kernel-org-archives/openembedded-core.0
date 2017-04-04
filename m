Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E46FA65CC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 07:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 11E232E196;
	Tue,  4 Apr 2017 09:58:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id cG8jw-oQvNFe; Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 605752E096;
	Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F2C61A0A0;
	Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40BB11A09F;
	Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 343C327E1;
	Tue,  4 Apr 2017 09:58:04 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 4 Apr 2017 09:58:04 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 4 Apr 2017 09:58:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] busybox.inc: drop comment explaining '-e
	MAKEFLAGS=' in EXTRA_OEMAKE
Thread-Index: AQHSrOlXZdF+aZ2P3U2xBPTaP1yzhaG0138Q
Date: Tue, 4 Apr 2017 07:58:04 +0000
Message-ID: <8ac6e01adbb04438b9818ecb9dd3608b@XBOX02.axis.com>
References: <1491271123-9771-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1491271123-9771-1-git-send-email-armccurdy@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] busybox.inc: drop comment explaining '-e	MAKEFLAGS=' in EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 04 Apr 2017 07:58:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andre McCurdy
> Sent: den 4 april 2017 03:59
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] busybox.inc: drop comment explaining '-e
> MAKEFLAGS=3D' in EXTRA_OEMAKE
>=20
> EXTRA_OEMAKE no longer contains '-e MAKEFLAGS=3D' so the comment
> explaining that it needs to be removed / over-ridden is obsolete.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> index 6246c95..375632d 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -18,7 +18,6 @@ BUSYBOX_SPLIT_SUID ?=3D "1"
>  export EXTRA_CFLAGS =3D "${CFLAGS}"
>  export EXTRA_LDFLAGS =3D "${LDFLAGS}"
>=20
> -# We don't want '-e MAKEFLAGS=3D' in EXTRA_OEMAKE
>  EXTRA_OEMAKE =3D "CC=3D'${CC}' LD=3D'${CCLD}' V=3D1 ARCH=3D${TARGET_ARCH=
} CROSS_COMPILE=3D${TARGET_PREFIX} SKIP_STRIP=3Dy HOSTCC=3D'${BUILD_CC}' HO=
STCPP=3D'${BUILD_CPP}'"

Given that the comment presumably was there to explain why=20
"EXTRA_OEMAKE =3D ..." is used rather than the customary=20
"EXTRA_OEMAKE +=3D ...", maybe the code should be changed to=20
actually use +=3D instead now that EXTRA_OEMAKE no longer=20
contains -e by default.

>  PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-=
mdev ${PN}-hwclock"
> --
> 1.9.1

//Peter


