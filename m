Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07F9178BCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4262218464;
	Tue, 31 Jul 2018 23:37:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id pUzUxsSSf6uY; Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8233D18470;
	Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2367C1A07B;
	Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 170991A077;
	Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 0A0B2236D;
	Tue, 31 Jul 2018 23:37:36 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 31 Jul 2018 23:37:35 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 31 Jul 2018 23:37:35 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 31 Jul 2018 23:37:35 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongzhi.Song <hongzhi.song@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH] poky-lsb: security_flags.inc
Thread-Index: AQHUKL6Rx+6alnq1xEq66MFkm7odQaSp2Nrw
Date: Tue, 31 Jul 2018 21:37:35 +0000
Message-ID: <443971bdffff44fd8272097bf7d90742@XBOX02.axis.com>
References: <20180731110634.29361-1-hongzhi.song@windriver.com>
In-Reply-To: <20180731110634.29361-1-hongzhi.song@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] poky-lsb: security_flags.inc
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
X-List-Received-Date: Tue, 31 Jul 2018 21:37:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Hongzhi.Song
> Sent: den 31 juli 2018 13:07
> To: openembedded-core@lists.openembedded.org; raj.khem@gmail.com
> Subject: [OE-core] [oe-core][PATCH] poky-lsb: security_flags.inc

This is not only limited to poky-lsb. security_flags.inc is used=20
by many directly.

> To fix the following error, we append '-O' to the defination of
> _FORTIFY_SOURCE
>=20
> recipe-sysroot/usr/include/features.h:381:4: error: #warning
> _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=3Dcpp]
>  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>      ^~~~~~~
>=20
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index 6245e89ada..1c32fd3165 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -10,7 +10,7 @@ GCCPIE ?=3D "--enable-default-pie"
>=20
>  # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as =
they use
>  # -O0 which then results in a compiler warning.
> -lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_=
FORTIFY_SOURCE=3D2',d)}"
> +lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_=
FORTIFY_SOURCE=3D2 -O',d)}"

This is not the correct way to solve this problem. It should be fixed on=20
a per recipe basis. There is probably a reason why the code is being built=
=20
with -O0, so then changing it here without an investigation of which is=20
correct, to build with fortification and enabling optimization or to build=
=20
without fortification and without enabling optimization.

Changing it as per above could also have an impact on some packages by=20
actually lowering the optimization level.

>  # Error on use of format strings that represent possible security proble=
ms
>  SECURITY_STRINGFORMAT ?=3D "-Wformat -Wformat-security -Werror=3Dformat-=
security"
> --
> 2.11.0

//Peter


