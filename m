Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A62A601A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 03:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s473Yb93024614
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 20:34:37 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.52]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Tue, 6 May 2014 20:34:36 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] setserial: package depends on groff-native to build
Thread-Index: AQHPSMgxL62sAtcjdE+Zs5vepFH3dJs0uGkg
Date: Wed, 7 May 2014 03:34:35 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB64778E0@ALA-MBB.corp.ad.wrs.com>
References: <1395820331-20426-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1395820331-20426-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.200]
MIME-Version: 1.0
Subject: Re: [PATCH] setserial: package depends on groff-native to build
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
X-List-Received-Date: Wed, 07 May 2014 03:34:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping, can someone merge this?

Thanks,
Jackie

> -----Original Message-----
> From: jackie.huang@windriver.com [mailto:jackie.huang@windriver.com]
> Sent: Wednesday, March 26, 2014 3:52 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Huang, Jie (Jackie)
> Subject: [PATCH] setserial: package depends on groff-native to build
>=20
> From: Yue Tao <Yue.Tao@windriver.com>
>=20
> Signed-off-by: Jonas Zetterberg <jonas.zetterberg@windriver.com>
> Signed-off-by: Yue Tao <yue.tao@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-bsp/setserial/setserial_2.17.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-
> bsp/setserial/setserial_2.17.bb
> index 65d6068..f1e8cd3 100644
> --- a/meta/recipes-bsp/setserial/setserial_2.17.bb
> +++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
> @@ -8,6 +8,8 @@ LICENSE =3D "GPLv2.0"
>  LIC_FILES_CHKSUM =3D
> "file://version.h;beginline=3D1;endline=3D6;md5=3D2e7c59cb9e57e356ae81f50=
f4e4dfd99"
>  PR =3D "r3"
>=20
> +DEPENDS +=3D "groff-native"
> +
>  inherit autotools-brokensep
>=20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
> --
> 1.7.9.5


