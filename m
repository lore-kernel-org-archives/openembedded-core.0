Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF2E7754FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 20:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 121A0189CC;
	Thu, 14 Jun 2018 22:27:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 99hTqo_5VOAW; Thu, 14 Jun 2018 22:27:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A67A0185E2;
	Thu, 14 Jun 2018 22:27:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C84E1E070;
	Thu, 14 Jun 2018 22:27:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EB5E1E066;
	Thu, 14 Jun 2018 22:27:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Jun 2018 22:27:07 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 71C08257F;
	Thu, 14 Jun 2018 22:27:07 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Jun 2018 22:27:07 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 14 Jun 2018 22:27:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alistair Francis <alistair.francis@wdc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] recipes-devtools/qemu: Add RISC-V support
Thread-Index: AQHUBBgDKukjykia4kGbeXmpF49CJKRgMv2Q
Date: Thu, 14 Jun 2018 20:27:07 +0000
Message-ID: <02be3d76fe1d439fb46f5d97270de0fd@XBOX02.axis.com>
References: <20180614194322.93009-1-alistair.francis@wdc.com>
In-Reply-To: <20180614194322.93009-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/4] recipes-devtools/qemu: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 20:27:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alistair Francis
> Sent: den 14 juni 2018 21:43
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/4] recipes-devtools/qemu: Add RISC-V
> support
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index faaea781cd..d1543b81f9 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -9,7 +9,7 @@ inherit autotools pkgconfig bluetooth
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
>  # QEMU_TARGETS is overridable variable
> -QEMU_TARGETS ?=3D "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 =
x86_64"
> +QEMU_TARGETS ?=3D "arm aarch64 i386 mips mipsel mips64 mips64el ppc sh4 =
x86_64 riscv32 riscv64"

Might as well keep the targets logically sorted:

QEMU_TARGETS ?=3D "arm aarch64 i386 mips mipsel mips64 mips64el ppc riscv32=
 riscv64 sh4 x86_64"

>=20
>  EXTRA_OECONF =3D " \
>      --prefix=3D${prefix} \
> --
> 2.17.1

//Peter


