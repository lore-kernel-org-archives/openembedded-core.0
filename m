Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC8577C81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:43:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 20:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,188,1488873600"; d="scan'208";a="88018584"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by fmsmga006.fm.intel.com with ESMTP; 11 Apr 2017 20:43:39 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.175]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.249]) with mapi id
	14.03.0319.002; Wed, 12 Apr 2017 11:43:38 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] ed: 1.14.1 -> 1.14.2
Thread-Index: AQHSszpcfScfKohjLE6w5snUKTpKVqHBFtnw
Date: Wed, 12 Apr 2017 03:43:38 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D194F2393@PGSMSX103.gar.corp.intel.com>
References: <1491966552-782-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
In-Reply-To: <1491966552-782-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH] ed: 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 12 Apr 2017 03:43:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Upgrade ed from 1.14.1 to 1.14.2.
>=20
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/ed/{ed_1.14.1.bb =3D> ed_1.14.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-
> extended/ed/{ed_1.14.1.bb =3D> ed_1.14.2.bb} (84%)
>=20
> diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-
> extended/ed/ed_1.14.2.bb
> similarity index 84%
> rename from meta/recipes-extended/ed/ed_1.14.1.bb
> rename to meta/recipes-extended/ed/ed_1.14.2.bb
> index 5d89a87..8cd9392 100644
> --- a/meta/recipes-extended/ed/ed_1.14.1.bb
> +++ b/meta/recipes-extended/ed/ed_1.14.2.bb
> @@ -13,8 +13,8 @@ bindir =3D "${base_bindir}"
>=20
>  SRC_URI =3D "${GNU_MIRROR}/ed/ed-${PV}.tar.lz"
>=20
> -SRC_URI[md5sum] =3D "7f4a54fa7f366479f03654b8af645fd0"
> -SRC_URI[sha256sum] =3D
> "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
> +SRC_URI[md5sum] =3D "273d04778b2a51f7c3cbfcd2001876bf"
> +SRC_URI[sha256sum] =3D
> "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"

Similar patch has been submitted by Maxim.
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135256=
.html

Quoted from Jussi:
Feature freeze is in effect: version upgrades should either wait until
after release or come with a very good reason.

Maxin sent a patch earlier to use the yocto mirror as SRC_URI: not ideal
but probably the best we can do if upstream really wants to delete old
releases...
Reference: http://lists.openembedded.org/pipermail/openembedded-core/2017-A=
pril/135486.html=20

Thanks,
Rebecca

