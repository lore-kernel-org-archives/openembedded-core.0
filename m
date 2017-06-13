Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74968782DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A029718491;
	Tue, 13 Jun 2017 10:05:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Bn7X-lZ3fcbL; Tue, 13 Jun 2017 10:05:20 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1197418165;
	Tue, 13 Jun 2017 10:05:20 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBF6D1E068;
	Tue, 13 Jun 2017 10:05:19 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E10081E04F;
	Tue, 13 Jun 2017 10:05:19 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Jun 2017 10:05:19 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id D55EA2218;
	Tue, 13 Jun 2017 10:05:19 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 10:05:19 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 10:05:19 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 13 Jun 2017 10:05:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 7/8] image: create symlinks needed for
	merged	/usr
Thread-Index: AQHS5BJAij38a2i4dk2hxjahdSoP2KIibRag
Date: Tue, 13 Jun 2017 08:05:19 +0000
Message-ID: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
	<1497336760-36835-8-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497336760-36835-8-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 7/8] image: create symlinks needed for merged	/usr
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
X-List-Received-Date: Tue, 13 Jun 2017 08:05:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 13 juni 2017 08:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 7/8] image: create symlinks needed for
> merged /usr
>=20
> Prepare the symlinks required for merged /usr at the time of rootfs creat=
ion.
>=20
> The links created in rootfs are:
> /bin --> /usr/sbin
> /sbin --> /usr/sbin
> /lib --> /usr/lib
> /lib64 --> /usr/lib64
>=20
> We cannot make these symlinks as part of 'base-files' or some other packa=
ge.
> Because at rootfs creation, installation of the package(say kernel) that =
depends
> on these root folders/links fails, if package manager installs this packa=
ge
> prior to base-files.
>=20
> These symbolic links in top level folder should present as long as

Change "should" to "should be".

>  - kerenl tools use /lib/{module,firmware}

Change "kerenl" to "kernel".

>  - shell scripts uses "#!/bin/sh"
>=20
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/image.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 85f6b9a..f08e3e1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -617,3 +617,26 @@ do_bundle_initramfs () {
>  	:
>  }
>  addtask bundle_initramfs after do_image_complete
> +
> +# Prepare the root links to point to the /usr counterparts.

In the function below:
* You do not need to specify -m 0755 to install, it is the default.
* Change all "/${var}" to "${var}".

> +create_merged_usr_symlinks() {
> +    install -m 0755 -d ${IMAGE_ROOTFS}/${base_bindir}
> +    install -m 0755 -d ${IMAGE_ROOTFS}/${base_sbindir}
> +    install -m 0755 -d ${IMAGE_ROOTFS}/${base_libdir}

You can combine these three installs into one. Saves two forks.

> +    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
> +    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
> +    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
> +
> +    if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then

Why do you check "${nonarch_base_libdir}" !=3D "${base_libdir}" when you=20
do not check the other three above?

> +       install -m 0755 -d ${IMAGE_ROOTFS}/${nonarch_base_libdir}
> +       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
> +    fi
> +
> +    # create base links for multilibs
> +    multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
> +    for d in $multi_libdirs; do
> +        install -m 0755 -d ${IMAGE_ROOTFS}/${exec_prefix}/$d
> +        lnr ${IMAGE_ROOTFS}/${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
> +    done
> +}
> +ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks; ', '',d)}"
> --
> 2.7.4

//Peter


