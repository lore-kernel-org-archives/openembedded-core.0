Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13F5478FA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C489F18355;
	Tue, 14 Aug 2018 12:31:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gpG6up0IZCe3; Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 85B2018349;
	Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4431A06D;
	Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F91E1A067;
	Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 435D32C95;
	Tue, 14 Aug 2018 12:31:52 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 14 Aug 2018 12:31:52 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 14 Aug 2018 12:31:51 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 14 Aug 2018 12:31:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Thread-Topic: [OE-core] [PATCH v3] runqemu: exit gracefully with an error
	message	if qemu system is not evaluated
Thread-Index: AQHUM3nN0eIDHi6cTE2JOUnv4KZJZqS/DIJQ
Date: Tue, 14 Aug 2018 10:31:51 +0000
Message-ID: <d6b6bb9bc5554afd9c7a96e7fa93d4b5@XBOX02.axis.com>
References: <1534215111-3416-1-git-send-email-jkrishnanjanappa@mvista.com>
In-Reply-To: <1534215111-3416-1-git-send-email-jkrishnanjanappa@mvista.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] runqemu: exit gracefully with an error message	if qemu system is not evaluated
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
X-List-Received-Date: Tue, 14 Aug 2018 10:31:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jagadeesh
> Krishnanjanappa
> Sent: den 14 augusti 2018 04:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] runqemu: exit gracefully with an error
> message if qemu system is not evaluated
>=20
> It solves below error:
> -- snip --
> return 'qemu-system-%s' % qbsys
> UnboundLocalError: local variable 'qbsys' referenced before assignment
> -- snip --
>=20
> [YOCTO #12846]
>=20
> * v3 changes:
>   Added yocto bugzilla ID in the required format

The two lines above belong after the --- line below as they are only=20
relevant during the patch submission process, not once the change is=20
integrated.

>=20
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/runqemu b/scripts/runqemu
> index f52b9a8..409d17c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1118,6 +1118,11 @@ class BaseConfig(object):
>              qbsys =3D 'riscv64'
>          elif mach =3D=3D 'qemuriscv32':
>              qbsys =3D 'riscv32'
> +        else:
> +            logger.error("Unable to determine QEMU PC System emulator
> for %s machine." % mach)
> +            logger.error("As %s is not among valid QEMU machines such
> as," % mach)
> +            logger.error("qemux86-64, qemux86, qemuarm64, qemuarm,
> qemumips64, qemumips64el, qemumipsel, qemumips, qemuppc")
> +            raise RunQemuError("Set qb_system_name with suitable QEMU
> PC System emulator in .*qemuboot.conf.")
>=20
>          return 'qemu-system-%s' % qbsys
>=20
> --
> 1.8.3.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

