Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QDIJM-0007iB-7y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 17:30:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 08:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,254,1301900400"; d="scan'208";a="632686452"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 08:27:57 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 22 Apr 2011 23:27:39 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 22 Apr 2011 23:27:38 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 22 Apr 2011 23:27:38 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Apr 2011 23:27:37 +0800
Thread-Topic: [PATCH 12/33] util-macros: upgrade from 1.11.0 to 1.13.0
Thread-Index: AcwAvluQ7a3R4HOPQembcwDcP/r3QgAQznAg
Message-ID: <1865303E0DED764181A9D882DEF65FB6911CBC166B@shsmsx502.ccr.corp.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<28d135771bcfa88a48a56696c82aaf3400b20abf.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <28d135771bcfa88a48a56696c82aaf3400b20abf.1303453279.git.sgw@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 12/33] util-macros: upgrade from 1.11.0 to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2011 15:30:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> From: Dexuan Cui <dexuan.cui@intel.com>
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  ...util-macros_1.11.0.bb =3D> util-macros_1.13.0.bb} |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb =3D>
> util-macros_1.13.0.bb} (79%)=20
>=20
> diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb similarity
> index 79%=20
> rename from meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> rename to meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> index 765a577..a708ed0 100644
> --- a/meta/recipes-graphics/xorg-util/util-macros_1.11.0.bb
> +++ b/meta/recipes-graphics/xorg-util/util-macros_1.13.0.bb
> @@ -20,5 +20,5 @@ RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPV})"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> -SRC_URI[md5sum] =3D "8580021f3a9e242ab09d23d62e475d53"
> -SRC_URI[sha256sum] =3D
> "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
> +SRC_URI[md5sum] =3D "31e9ddcbc1d8bc8c09ab180443974dd1"
> +SRC_URI[sha256sum] =3D
> "7bff944fb120192e7fe1706e9c0b7e41666e7983ce3e2bdef0b7734392d9e695" =20

Hi Saul,
As you reminded me before,   the file xaw.patch is not needed now since no =
recipe uses it.
I made a new commit for the upgrading of util-macros:
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/master=
_util_macros&id=3D3cfb9f508b11c4a33aace97d306956f36b137992

Please use this new commit (the commit is in a new branch dcui/master_util_=
macros)

Thanks!

-- Dexuan=


