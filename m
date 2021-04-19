Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.4284.1618803510655463607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 20:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: WLtVq1Lx1+/La3GQPHMaZjbkBF59T78BouwuBgKpYtTtJHS7txFrWAO6cnOc+2hUaWEXN/JwWl
 p1RM5E3h+mBg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="182393784"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="182393784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2021 20:38:26 -0700
IronPort-SDR: 8Hipx/BM//fmR7RCCnFfQw3848S9RoKP8XYGfeIOUvF/Vz2LsSOGJ3b6y5vZS1eME+EdoJks2V
 VDXNVBHB0rDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="454130263"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2021 20:38:25 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 11:38:24 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.013;
 Mon, 19 Apr 2021 11:38:24 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] btrfs-tools: Update to 5.11.1
Thread-Topic: [OE-core] [PATCH v2 1/3] btrfs-tools: Update to 5.11.1
Thread-Index: AQHXNATyFLhDiWQzlUSs2gvqZQIegKq7Mhjw
Date: Mon, 19 Apr 2021 03:38:24 +0000
Message-ID: <cc9a601cb41a48c5b6b0f325bfb049d2@intel.com>
References: <20210418034041.108754-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20210418034041.108754-1-robert.joslyn@redrectangle.org>
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

[SWAT}
It causing util-linux build failure on non-gpl3 build.

ERROR: Nothing RPROVIDES 'btrfs-tools' (but /home/pokybuild/yocto-worker/no=
n-gpl3/build/meta/recipes-core/util-linux/util-linux_2.36.2.bb RDEPENDS on =
or otherwise requires it)
btrfs-tools was skipped: it has incompatible license(s): LGPL-3.0-or-later
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3312


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Robert Joslyn
> Sent: Sunday, April 18, 2021 11:41 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
> Subject: [OE-core] [PATCH v2 1/3] btrfs-tools: Update to 5.11.1
>=20
> Update licensing, as libtrfsutil is under LGPLv3+. Note that libtrfsutil =
is in the
> process of being relicensed to LGPLv2.1+:
> 	https://github.com/kdave/btrfs-progs/issues/323
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../{btrfs-tools_5.10.1.bb =3D> btrfs-tools_5.11.1.bb}     | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)  rename meta/recipes-
> devtools/btrfs-tools/{btrfs-tools_5.10.1.bb =3D> btrfs-tools_5.11.1.bb} (=
88%)
>=20
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
> b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> similarity index 88%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> index fca010d4ae..2ab476a88e 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> @@ -7,14 +7,17 @@ btrfs and an utility (btrfs-convert) to make a btrfs
> filesystem from an ext3."
>=20
>  HOMEPAGE =3D "https://btrfs.wiki.kernel.org"
>=20
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dfcb02dc552a041dee27e4b85c7396067"
> +LICENSE =3D "GPLv2 & LGPLv3+"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Dfcb02dc552a041dee27e4b85c7396067 \
> +
> +file://libbtrfsutil/COPYING.LESSER;md5=3D3000208d539ec061b899bce1d9ce94
> 04 \ "
>  SECTION =3D "base"
>  DEPENDS =3D "util-linux attr e2fsprogs lzo acl"
>  DEPENDS_append_class-target =3D " udev"
>  RDEPENDS_${PN} =3D "libgcc"
>=20
> -SRCREV =3D "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
> +SRCREV =3D "8d5051f279f7994fb80536ef8f846f06d121d898"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-
> progs.git \
>             file://0001-Add-a-possibility-to-specify-where-python-modules=
-
> ar.patch \
>             "
> --
> 2.26.3

