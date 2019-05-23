Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 273BA79980
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 91122185B9;
	Thu, 23 May 2019 22:40:45 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id SW6lUvREqEdo; Thu, 23 May 2019 22:40:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0DCC0185A2;
	Thu, 23 May 2019 22:40:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB171E088;
	Thu, 23 May 2019 22:40:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1CB41E054;
	Thu, 23 May 2019 22:40:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 23 May 2019 22:40:43 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id D538F1F7F;
	Thu, 23 May 2019 22:40:43 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 23 May 2019 22:40:43 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 23 May 2019 22:40:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
	default	init manager
Thread-Index: AQHVEUh28jtg/3pblUmMg2dCp4NCO6Z5Kp2A
Date: Thu, 23 May 2019 20:40:43 +0000
Message-ID: <36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
In-Reply-To: <20190523082558.3805-2-kai.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default	init manager
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
X-List-Received-Date: Thu, 23 May 2019 20:40:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> kai.kang@windriver.com
> Sent: den 23 maj 2019 10:26
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
> default init manager
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Move configurations from local.conf.sample.extended to local.conf.sample
> to make systemd as default init manager for poky.

If we're going to change the default init manager to be systemd, wouldn't=20
it be more appropriate to change the real default values in bitbake.conf=20
and packagegroup-core-boot.bb? And then include an example in=20
local.conf.sample.extended to show how to configure sysvinit as init manage=
r?

>=20
> [YOCTO #13031]
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-poky/conf/local.conf.sample          | 9 +++++++++
>  meta-poky/conf/local.conf.sample.extended | 9 ---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta-poky/conf/local.conf.sample b/meta-
> poky/conf/local.conf.sample
> index 9068e567dc..3a07105e44 100644
> --- a/meta-poky/conf/local.conf.sample
> +++ b/meta-poky/conf/local.conf.sample
> @@ -249,3 +249,12 @@ PACKAGECONFIG_append_pn-nativesdk-qemu =3D " sdl"
>  # track the version of this file when it was generated. This can
> safely be ignored if
>  # this doesn't mean anything to you.
>  CONF_VERSION =3D "1"
> +
> +#
> +# Use systemd for system initialization
> +#
> +DISTRO_FEATURES_append =3D " systemd"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> +VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-
> poky/conf/local.conf.sample.extended
> index 26603debe6..e20fc5dbf3 100644
> --- a/meta-poky/conf/local.conf.sample.extended
> +++ b/meta-poky/conf/local.conf.sample.extended
> @@ -377,12 +377,3 @@ DISTRO_FEATURES_remove =3D "x11"
>  #VIRTUAL-RUNTIME_initscripts =3D "initscripts"
>  #VIRTUAL-RUNTIME_keymaps =3D "keymaps"
>  #DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> -
> -#
> -# Use systemd for system initialization
> -#
> -#DISTRO_FEATURES_append =3D " systemd"
> -#DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> -#VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
> -#VIRTUAL-RUNTIME_init_manager =3D "systemd"
> -#VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> --
> 2.18.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

