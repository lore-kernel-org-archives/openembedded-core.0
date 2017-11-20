Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51AF5785CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 23:27:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 15:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="4586513"
Received: from ttorling-mac01.jf.intel.com ([10.24.15.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2017 15:27:08 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <CAJTo0LYv_iq0m=JDk6PEAxiLhxiVYzzUsSKwDKg+JNJupL+2ug@mail.gmail.com>
Date: Mon, 20 Nov 2017 15:27:09 -0800
Message-Id: <9D60BDDF-70BD-4583-8B88-D8FA166D8069@linux.intel.com>
References: <1510823468-63055-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LaH1N4+rUCeKuzZtHhoUOFqCPLJe+YXs-Q=iECUa9oodw@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA29B8@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LYv_iq0m=JDk6PEAxiLhxiVYzzUsSKwDKg+JNJupL+2ug@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools: update to 36.7.2
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
X-List-Received-Date: Mon, 20 Nov 2017 23:27:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have an upgrade to 36.8.0 (for both python2 and python3) in my branch =
(which is also introducing the pypi.bbclass to oe-core):
=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dttorling/py=
pi
and
https://github.com/moto-timo/openembedded-core/tree/ttorling/pypi

I will be submitting this to the mailing list soon (tonight or =
tomorrow).

> On Nov 20, 2017, at 2:18 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Please update both at the same time as otherwise there will be a =
series of commits which won't build.
>=20
> Ross
>=20
> On 20 November 2017 at 08:02, Zheng, Ruoqin =
<zhengrq.fnst@cn.fujitsu.com> wrote:
> Hi Ross
>=20
> =20
>=20
> Is it means that I should make a new patch for python3-setuptools?
>=20
> =20
>=20
> --------------------------------------------------
>=20
> Zheng Ruoqin
>=20
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
>=20
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>=20
>        Nanjing, 210012, China
>=20
> MAIL : zhengrq.fnst@cn.fujistu.com
>=20
> =20
>=20
> From: Burton, Ross [mailto:ross.burton@intel.com]=20
> Sent: Friday, November 17, 2017 7:18 AM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 =
<zhengrq.fnst@cn.fujitsu.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] python-setuptools: update to 36.7.2
>=20
> =20
>=20
> python3-setuptools includes this file too, so this patch breaks that =
recipe.
>=20
> =20
>=20
> Ross
>=20
> =20
>=20
> On 16 November 2017 at 09:11, zhengrq <zhengrq.fnst@cn.fujitsu.com> =
wrote:
>=20
> 1) Upgrade python-setuptools from 36.5.0 to 36.7.2.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc                    =
| 4 ++--
>  .../{python-setuptools_36.5.0.bb =3D> python-setuptools_36.7.2.bb}    =
  | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_36.5.0.bb =3D> =
python-setuptools_36.7.2.bb} (100%)
>=20
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc =
b/meta/recipes-devtools/python/python-setuptools.inc
> index 1eae0b6..56b17ad 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -9,8 +9,8 @@ SRCNAME =3D "setuptools"
>=20
>  SRC_URI =3D =
"https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${=
PV}.zip"
>=20
> -SRC_URI[md5sum] =3D "704f500dd55f4bd0be905444f3ba892c"
> -SRC_URI[sha256sum] =3D =
"ce2007c1cea3359870b80657d634253a0765b0c7dc5a988d77ba803fc86f2c64"
> +SRC_URI[md5sum] =3D "1874983171af0f7b16b5ec48558e6e55"
> +SRC_URI[sha256sum] =3D =
"ad86fd8dd09c285c33b4c5b82bbc21d21883637faef78b0ab58fa9984847220d"
>=20
>  UPSTREAM_CHECK_URI =3D "https://pypi.python.org/pypi/setuptools"
>=20
> diff --git a/meta/recipes-devtools/python/python-setuptools_36.5.0.bb =
b/meta/recipes-devtools/python/python-setuptools_36.7.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_36.5.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_36.7.2.bb
> --
> 2.7.4
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> =20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


