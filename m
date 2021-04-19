Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.3808.1618800709082808139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 19:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: +cm3J3MabYb3tATMxCufVo6VNWsgYmoLxNH8pxu+EN/T/CopVuEFID34WggA1CWDx2d+IeYVdj
 1QIOBwDRpyXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="259217960"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="259217960"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2021 19:51:47 -0700
IronPort-SDR: Wk8OXPjvr2LRVZJ6UQ/3Oog2LylcCxmiiw4gesHwBkaf7s0/kzP+zdAmBeKVOs1EJYM/+/drF2
 Egz2dqOfEryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="384839269"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2021 19:51:46 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 10:51:45 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.013;
 Mon, 19 Apr 2021 10:51:45 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] epiphany: Add missing dependency on gnutls
Thread-Topic: [OE-core] [PATCH] epiphany: Add missing dependency on gnutls
Thread-Index: AQHXNJpMvCLgcGNokU6pB9y1GVAZDqq7I7FA
Date: Mon, 19 Apr 2021 02:51:45 +0000
Message-ID: <470e6ec7142c4202b7aaa5be3201f9ce@intel.com>
References: <20210418213207.1591440-1-raj.khem@gmail.com>
In-Reply-To: <20210418213207.1591440-1-raj.khem@gmail.com>
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

[SWAT]=20

Configuration failure:=20

Run-time dependency hogweed found: NO (tried pkgconfig)

../epiphany-3.38.3/meson.build:92:0: ERROR: Dependency "hogweed" not found,=
 tried pkgconfig

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3317

Does this patch fix it ?

Regards,
Naveen



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: Monday, April 19, 2021 5:32 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH] epiphany: Add missing dependency on gnutls
>=20
> This was being pulled in by other dependencies thus far
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_3.38.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> index 889de16d00..ce24336ace 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
> @@ -6,7 +6,7 @@ BUGTRACKER =3D
> "https://gitlab.gnome.org/GNOME/epiphany"
>  LICENSE =3D "GPLv3+"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>=20
> -DEPENDS =3D "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
> +DEPENDS =3D "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr g=
nutls
> \
>  	   gsettings-desktop-schemas libxml2-native \
>  	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
>=20
> --
> 2.31.1

