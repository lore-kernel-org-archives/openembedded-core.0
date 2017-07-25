Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D44AB78339
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:38:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6P8cK2v011893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:38:21 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 25 Jul 2017 01:38:20 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] debianutils: set higher priority than
	busybox for	run-parts
Thread-Index: AQHTBRz+lomBcJvUrU6HvTCe8s9fJKJkOFAQ
Date: Tue, 25 Jul 2017 08:38:19 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B83D406@ALA-MBD.corp.ad.wrs.com>
References: <20170725080612.422-1-jackie.huang@windriver.com>
In-Reply-To: <20170725080612.422-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.95]
MIME-Version: 1.0
Subject: Re: [PATCH] debianutils: set higher priority than busybox for	run-parts
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
X-List-Received-Date: Tue, 25 Jul 2017 08:38:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I will rebase and send v2 since debianutils is already updated to 4.8.1.1

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Tuesday, July 25, 2017 16:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] debianutils: set higher priority than busybox =
for run-
> parts
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> debianutils-run-parts should have higher priority than
> busybox (which is 50), so set the priority to 60 for
> debianutils-run-parts.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-support/debianutils/debianutils_4.8.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
> b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
> index 54c345ea25..0529a50983 100644
> --- a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
> +++ b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
> @@ -38,6 +38,8 @@ RDEPENDS_${PN} +=3D "${PN}-run-parts"
>=20
>  ALTERNATIVE_PRIORITY=3D"30"
>  ALTERNATIVE_${PN} =3D "add-shell installkernel remove-shell savelog temp=
file
> which"
> +
> +ALTERNATIVE_PRIORITY_${PN}-run-parts =3D "60"
>  ALTERNATIVE_${PN}-run-parts =3D "run-parts"
>=20
>  ALTERNATIVE_${PN}-doc =3D "which.1"
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

