Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDBB7551E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Jul 2018 13:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D082E18440;
	Sat,  7 Jul 2018 15:02:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id P4aD6CNihfC0; Sat,  7 Jul 2018 15:02:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 27BA41843C;
	Sat,  7 Jul 2018 15:02:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D107D1A063;
	Sat,  7 Jul 2018 15:02:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C536C1A062;
	Sat,  7 Jul 2018 15:02:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat,  7 Jul 2018 15:02:43 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id B8DD22AF3;
	Sat,  7 Jul 2018 15:02:43 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Sat, 7 Jul 2018 15:02:43 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Sat, 7 Jul 2018 15:02:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] meson: map mipsel TARGET_ARCH to mips for
	the	cross file
Thread-Index: AQHUFTjhVA3xlANChUG2ndWHgziORKSDuslA
Date: Sat, 7 Jul 2018 13:02:43 +0000
Message-ID: <cd8b5e6834ac4c9a948cc921dab0c7ed@XBOX02.axis.com>
References: <20180706145116.30481-1-ross.burton@intel.com>
	<20180706145116.30481-2-ross.burton@intel.com>
In-Reply-To: <20180706145116.30481-2-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/2] meson: map mipsel TARGET_ARCH to mips for the	cross file
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
X-List-Received-Date: Sat, 07 Jul 2018 13:02:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Ross Burton
> Sent: den 6 juli 2018 16:51
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] meson: map mipsel TARGET_ARCH to mips
> for the cross file
>=20
> Meson uses 'mips' for both big- and little-endian MIPS machines, so map
> mipsel
> to mips.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/meson.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 13a6f948756..0c9bf73596a 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -52,6 +52,8 @@ def meson_cpu_family(var, d):
>      arch =3D d.getVar(var)
>      if arch =3D=3D 'powerpc':
>          return 'ppc'
> +    if arch =3D=3D 'mipsel':

Change if to elif for consistency.

> +        return 'mips'
>      elif re.match(r"i[3-6]86", arch):
>          return "x86"
>      else:
> --
> 2.11.0

//Peter


