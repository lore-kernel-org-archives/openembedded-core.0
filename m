Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2531071A05
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 02:24:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v572OBd6012934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 19:24:11 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([fe80::d894:a649:cd4c:89b7]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Tue, 6 Jun 2017 19:24:10 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] kmscube: add opengl to
	REQUIRED_DISTRO_FEATURES
Thread-Index: AQHS3zCD0vekBu+A30K/T2aeG8+vdKIYq7JQ
Date: Wed, 7 Jun 2017 02:24:10 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7DE644@ALA-MBD.corp.ad.wrs.com>
References: <20170607015032.17363-1-jackie.huang@windriver.com>
In-Reply-To: <20170607015032.17363-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.230]
MIME-Version: 1.0
Subject: Re: [PATCH v2] kmscube: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Jun 2017 02:24:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry I didn't notice that the v1 has been merged, please ignore this.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Wednesday, June 07, 2017 09:51
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] kmscube: add opengl to
> REQUIRED_DISTRO_FEATURES
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> kmscube depends on virtual/libgles2, virtual/egl and gstreamer1.0
> which require opengl in DISTRO_FEATURES.
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-graphics/kmscube/kmscube_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-
> graphics/kmscube/kmscube_git.bb
> index 0ec5b2a7fa..9050671ab1 100644
> --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> @@ -11,4 +11,6 @@ SRC_URI =3D
> "git://anongit.freedesktop.org/mesa/kmscube;branch=3Dmaster;protocol=3Dgi=
t
>=20
>  S =3D "${WORKDIR}/git"
>=20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

