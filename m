Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.9352.1609227940637011589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 23:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: St8/t3DC8ziZp0kVEeg/jhxxbGnEptWOIfrK8xzPebgkTeYnt6X1JGB0H6t7OOConKK5FBFbJd
 oT0fZwTmvpeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="176623159"
X-IronPort-AV: E=Sophos;i="5.78,457,1599548400"; 
   d="scan'208";a="176623159"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2020 23:45:39 -0800
IronPort-SDR: uUDAgAA1UYB/anWWAB47bTVztD6ev1AA2hBs+NA+w28OPMXxUOjncJb2T97sLpNbZ/kxH4Zjfg
 J2oqC8QNvAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,457,1599548400"; 
   d="scan'208";a="395342150"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2020 23:45:30 -0800
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Dec 2020 15:45:30 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.1713.004;
 Tue, 29 Dec 2020 15:45:30 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
Thread-Topic: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
Thread-Index: AQHW22l8fYmzh6EFwUGBAEmcWjIqNaoNtP5Q
Date: Tue, 29 Dec 2020 07:45:29 +0000
Message-ID: <ed57b85896d24aeb9446840ea1a03062@intel.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
 <20201226092732.52323-36-alex.kanavin@gmail.com>
In-Reply-To: <20201226092732.52323-36-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ptest failure observed on qemux86-64 machine.

AssertionError: Failed ptests:
{'glib-2.0': ['glib/codegen.py.test']}

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1711=20

Regards,
Naveen

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: Saturday, December 26, 2020 5:27 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 36/48] glib-2.0: update 2.66.2 -> 2.66.4
>=20
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../glib-2.0/{glib-2.0_2.66.2.bb =3D> glib-2.0_2.66.4.bb}         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)  rename meta/recipes-core/=
glib-
> 2.0/{glib-2.0_2.66.2.bb =3D> glib-2.0_2.66.4.bb} (95%)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb b/meta/recipes=
-
> core/glib-2.0/glib-2.0_2.66.4.bb
> similarity index 95%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
> index 01ed54d06a..70e8aa8785 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
> @@ -21,7 +21,7 @@ SRC_URI =3D
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>=20
>  SRC_URI_append_class-native =3D " file://relocate-modules.patch"
>=20
> -SRC_URI[sha256sum] =3D
> "ec390bed4e8dd0f89e918f385e8d4cfd7470b1ef7c1ce93ec5c4fc6e3c6a17c4"
> +SRC_URI[sha256sum] =3D
> "97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984"
>=20
>  # Find any meson cross files in FILESPATH that are relevant for the curr=
ent  #
> build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.29.2

