Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9F0782D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 14:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F064B184AA;
	Tue, 13 Jun 2017 16:16:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id eBU8Sir4p46U; Tue, 13 Jun 2017 16:16:59 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id F406C184A7;
	Tue, 13 Jun 2017 16:16:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA7921E08C;
	Tue, 13 Jun 2017 16:16:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEB7F1E08A;
	Tue, 13 Jun 2017 16:16:58 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Jun 2017 16:16:58 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id C2BCE302F;
	Tue, 13 Jun 2017 16:16:58 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 16:16:58 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 13 Jun 2017 16:16:58 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 13 Jun 2017 16:16:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 7/8] image: create symlinks needed for
	merged	/usr
Thread-Index: AQHS5Eg4IOAtSg0ALk+PA+n1d7c4z6Ii1ouQ
Date: Tue, 13 Jun 2017 14:16:58 +0000
Message-ID: <288f60b6952d42c6b8e80819dfe90571@XBOX02.axis.com>
References: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
	<1497360213-27709-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497360213-27709-1-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v4 7/8] image: create symlinks needed for merged	/usr
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
X-List-Received-Date: Tue, 13 Jun 2017 14:17:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 13 juni 2017 15:24
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v4 7/8] image: create symlinks needed for
> merged /usr
>=20
> Prepare the symlinks required for merged /usr at the time of rootfs
> creation.
>=20
> The links created in rootfs are:
> /bin --> /usr/sbin
> /sbin --> /usr/sbin
> /lib --> /usr/lib
> /lib64 --> /usr/lib64
>=20
> We cannot make these symlinks as part of 'base-files' or some other
> package.
> Because at rootfs creation, installation of the package(say kernel)
> that depends
> on these root folders/links fails, if package manager installs this
> package
> prior to base-files.
>=20
> These symbolic links in top level folder should be present as long as
>  - kernel tools use /lib/{module,firmware}
>  - shell scripts uses "#!/bin/sh"
>=20
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/image.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 85f6b9a..2a3c1e3 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -617,3 +617,24 @@ do_bundle_initramfs () {
>  	:
>  }
>  addtask bundle_initramfs after do_image_complete
> +
> +# Prepare the root links to point to the /usr counterparts.
> +create_merged_usr_symlinks() {
> +    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbind=
ir} ${IMAGE_ROOTFS}${base_libdir}
> +    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
> +    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
> +    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}

You missed one. Change "/${baselib}" to "${baselib}".

> +
> +    if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> +       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
> +       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
> +    fi
> +
> +    # create base links for multilibs
> +    multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
> +    for d in $multi_libdirs; do
> +        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
> +        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
> +    done
> +}
> +ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks; ', '',d)}"
> --
> 2.7.4

//Peter


