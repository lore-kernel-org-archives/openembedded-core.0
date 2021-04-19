Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.4134.1618802662519377028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 20:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: Fu45ubrbL/VsgbzTSCgn/Ak5NPuxE1RsAfWpeZ+xz67lnkyc6he0YcW0O69Mj5CU4aZg4CATf0
 mkzOSyffLZZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="259220181"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="259220181"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2021 20:24:20 -0700
IronPort-SDR: u4Z3vaS5xsDgAHbyMMLj2x2Fwl86Csw2IOb4QuftYlWQ513ERKDNFfc+mQ1ry8drKxeuyALotv
 dU8XvK6esgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="454126512"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2021 20:24:19 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 11:24:18 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.013;
 Mon, 19 Apr 2021 11:24:18 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: wangmy <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
Thread-Topic: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
Thread-Index: AQHXMlIktwfIf6pyk0au1o5kf0kexqq7MFrA
Date: Mon, 19 Apr 2021 03:24:18 +0000
Message-ID: <2044e75fb6ae49a297d7114cc55337c1@intel.com>
References: <1618530602-26607-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1618530602-26607-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[SWAT]
Oe-selftest on fedora failed.=20

RESULTS - virgl.VirglTest.test_kmscube: FAILED (0.30s)

AssertionError: 'renderer: "virgl"' not found in 'Using display 0x55dccc056=
2e0 with EGL version 1.4
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2005

Regards,
Naveen

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of wangmy
> Sent: Friday, April 16, 2021 7:50 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../mesa/{mesa-gl_21.0.1.bb =3D> mesa-gl_21.0.2.bb}               | 0
>  meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
>  meta/recipes-graphics/mesa/{mesa_21.0.1.bb =3D> mesa_21.0.2.bb}   | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-
> graphics/mesa/{mesa-gl_21.0.1.bb =3D> mesa-gl_21.0.2.bb} (100%)  rename
> meta/recipes-graphics/mesa/{mesa_21.0.1.bb =3D> mesa_21.0.2.bb} (100%)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb b/meta/recipes-
> graphics/mesa/mesa-gl_21.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index caf3c62ad8..5705ae0f08 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,7 +21,7 @@ SRC_URI =3D
> "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
>             "
>=20
> -SRC_URI[sha256sum] =3D
> "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
> +SRC_URI[sha256sum] =3D
> "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
>=20
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-
> graphics/mesa/mesa_21.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
> --
> 2.25.1

