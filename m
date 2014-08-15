Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79C5F601A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 09:52:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F9qkrt023825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 02:52:47 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.155]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Fri, 15 Aug 2014 02:52:46 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] ghostscript: add missing dependencies on
	libgcrypt and libgpg-error
Thread-Index: AQHPq8uj2/zrFfqpB06952vb66/tNpvRhSvg
Date: Fri, 15 Aug 2014 09:52:46 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCAE0A8A@ALA-MBA.corp.ad.wrs.com>
References: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.138]
MIME-Version: 1.0
Subject: Re: [PATCH] ghostscript: add missing dependencies on	libgcrypt and libgpg-error
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
X-List-Received-Date: Fri, 15 Aug 2014 09:52:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping, could someone help merge this? thanks!

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, July 30, 2014 3:55 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] ghostscript: add missing dependencies on libgc=
rypt and libgpg-error
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Fix error:
> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-lin=
ux/4.9.0/ld: cannot find -
> lgcrypt
> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-lin=
ux/4.9.0/ld: cannot find -
> lgpg-error
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../ghostscript/ghostscript_9.14.bb                |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta=
/recipes-
> extended/ghostscript/ghostscript_9.14.bb
> index e14e656..fbec6ce 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> @@ -15,7 +15,7 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad21ea85123608e6a0a58d54ee23=
567"
>=20
> -DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups"
> +DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups libgcrypt libg=
pg-error"
>  DEPENDS_class-native =3D ""
>=20
>  SRC_URI_BASE =3D "http://downloads.ghostscript.com/public/ghostscript-${=
PV}.tar.gz"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

