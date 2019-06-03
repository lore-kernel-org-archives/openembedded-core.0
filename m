Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B741E7D67C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 06:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1178018393;
	Mon,  3 Jun 2019 08:40:00 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lMzEJi3f5h9S; Mon,  3 Jun 2019 08:39:58 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 314B918136;
	Mon,  3 Jun 2019 08:39:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED9D21E16D;
	Mon,  3 Jun 2019 08:39:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E16611E16C;
	Mon,  3 Jun 2019 08:39:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  3 Jun 2019 08:39:57 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id D4F692722;
	Mon,  3 Jun 2019 08:39:57 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 3 Jun 2019 08:39:57 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 3 Jun 2019 08:39:57 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 3 Jun 2019 08:39:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [meta-poky][PATCH v6 1/2] poky.conf: make systemd as
	default init manager
Thread-Index: AdUZ1yeS2wEVaZecR3+LkzThJkTiqg==
Date: Mon, 3 Jun 2019 06:39:57 +0000
Message-ID: <ae276d97fd3b41b196889655d80dc417@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-poky][PATCH v6 1/2] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Mon, 03 Jun 2019 06:40:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of kai.kang@windriver.com
> Sent: den 2 juni 2019 16:55
> To: richard.purdie@linuxfoundation.org
> Cc: poky@yoctoproject.org; openembedded-core@lists.openembedded.org
> Subject: [OE-core] [meta-poky][PATCH v6 1/2] poky.conf: make systemd as d=
efault init manager
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> Introduce a new variable POKY_INIT_MANAGER and create 4 .inc files to
> configure init manager settings. Var POKY_INIT_MANAGER accepts 4 values:
> sysvinit, systemd, systemd-compat and mdev-busybox. Set systemd by
> default for DISTRO poky.  And set mdev-busybox for DISTRO poky-tiny
> which doesn't change its init manger settings.
>=20
> [YOCTO #13031]
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../conf/distro/include/init-template-mdev-busybox.inc    | 7 +++++++
>  .../conf/distro/include/init-template-systemd-compat.inc  | 7 +++++++
>  meta-poky/conf/distro/include/init-template-systemd.inc   | 5 +++++
>  meta-poky/conf/distro/include/init-template-sysvinit.inc  | 6 ++++++
>  meta-poky/conf/distro/poky-tiny.conf                      | 8 +-------
>  meta-poky/conf/distro/poky.conf                           | 6 ++++++
>  6 files changed, 32 insertions(+), 7 deletions(-)
>  create mode 100644 meta-poky/conf/distro/include/init-template-mdev-busy=
box.inc
>  create mode 100644 meta-poky/conf/distro/include/init-template-systemd-c=
ompat.inc
>  create mode 100644 meta-poky/conf/distro/include/init-template-systemd.i=
nc
>  create mode 100644 meta-poky/conf/distro/include/init-template-sysvinit.=
inc
>=20
> diff --git a/meta-poky/conf/distro/include/init-template-mdev-busybox.inc=
 b/meta-poky/conf/distro/include/init-template-mdev-busybox.inc
> new file mode 100644
> index 0000000000..b07d9de5b4
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/init-template-mdev-busybox.inc
> @@ -0,0 +1,7 @@
> +# enable mdev/busybox for init
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append =3D " systemd sysvinit"
> +VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
> +VIRTUAL-RUNTIME_init_manager =3D "busybox"
> +VIRTUAL-RUNTIME_initscripts =3D "initscripts"
> +VIRTUAL-RUNTIME_keymaps =3D "keymaps"
> +VIRTUAL-RUNTIME_login_manager =3D "busybox"
> diff --git a/meta-poky/conf/distro/include/init-template-systemd-compat.i=
nc b/meta-poky/conf/distro/include/init-template-systemd-compat.inc
> new file mode 100644
> index 0000000000..22151f8866
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/init-template-systemd-compat.inc
> @@ -0,0 +1,7 @@
> +# Don't append sysvinit to DISTRO_FEATURES here because it has been set
> +# in DISTRO_FEATURES_BACKFILL. And then this .inc file could be used by
> +# init-template-systemd.inc
> +DISTRO_FEATURES_append =3D " systemd"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> +VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
> diff --git a/meta-poky/conf/distro/include/init-template-systemd.inc b/me=
ta-poky/conf/distro/include/init-template-systemd.inc
> new file mode 100644
> index 0000000000..d04847028c
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/init-template-systemd.inc
> @@ -0,0 +1,5 @@
> +# Use systemd for system initialization
> +
> +require init-template-systemd-compat.inc
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append =3D " sysvinit"
> diff --git a/meta-poky/conf/distro/include/init-template-sysvinit.inc b/m=
eta-poky/conf/distro/include/init-template-sysvinit.inc
> new file mode 100644
> index 0000000000..7725b30e1e
> --- /dev/null
> +++ b/meta-poky/conf/distro/include/init-template-sysvinit.inc
> @@ -0,0 +1,6 @@
> +# Use sysvinit for system initialization
> +DISTRO_FEATURES_append =3D " sysvinit"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append =3D " systemd"
> +VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
> +VIRTUAL-RUNTIME_initscripts =3D "initscripts"
> +VIRTUAL-RUNTIME_login_manager =3D "busybox"
> diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
> index 1f8b6e8ff3..8ba0b9a4bb 100644
> --- a/meta-poky/conf/distro/poky-tiny.conf
> +++ b/meta-poky/conf/distro/poky-tiny.conf
> @@ -81,13 +81,7 @@ DISTRO_FEATURES_append_libc-musl =3D " largefile"
>  DISTRO_FEATURES_class-native =3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFA=
ULT_DISTRO_FEATURES}"
>  DISTRO_FEATURES_class-nativesdk =3D "${DISTRO_FEATURES_DEFAULT} ${POKY_D=
EFAULT_DISTRO_FEATURES}"
>=20
> -# enable mdev/busybox for init
> -VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
> -VIRTUAL-RUNTIME_login_manager =3D "busybox"
> -VIRTUAL-RUNTIME_init_manager =3D "busybox"
> -VIRTUAL-RUNTIME_initscripts =3D "initscripts"
> -VIRTUAL-RUNTIME_keymaps =3D "keymaps"
> -DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
> +POKY_INIT_MANAGER ?=3D "mdev-busybox"
>=20
>  # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
>  # packagegroup-core-base to select modutils-initscripts or not. Similar =
with "net" and
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
> index 78621e6dbf..e544f7e52c 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -84,3 +84,9 @@ require conf/distro/include/no-static-libs.inc
>  require conf/distro/include/yocto-uninative.inc
>  require conf/distro/include/security_flags.inc
>  INHERIT +=3D "uninative"
> +
> +# Make systemd as default init manager for poky
> +# and set sysvinit for musl consider security
> +POKY_INIT_MANAGER ??=3D "systemd"
> +POKY_INIT_MANAGER_libc-musl =3D "sysvinit"
> +require conf/distro/include/init-template-${POKY_INIT_MANAGER}.inc
> --
> 2.20.0

Nice, I like this solution. One thing though: why do you call the files=20
"init-template-*.inc"? Why not "init-manager-*.inc"? They are not really=20
some kind of template files.

//Peter


