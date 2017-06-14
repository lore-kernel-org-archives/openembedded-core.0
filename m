Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4877838D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 13:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5315E184D5;
	Wed, 14 Jun 2017 15:37:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BQwTaqlSi_vx; Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7EDAE182B3;
	Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6501A1E0A2;
	Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A08A1E09A;
	Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 4E01543D;
	Wed, 14 Jun 2017 15:37:13 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 14 Jun 2017 15:37:13 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 14 Jun 2017 15:37:12 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Wed, 14 Jun 2017 15:37:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v4 7/7] image.bbclass: create root symlinks in
	nativesdk target sysroot
Thread-Index: AQHS5QIUqZno/Qjl70qVUueWKUTp5qIkW/LQ
Date: Wed, 14 Jun 2017 13:37:12 +0000
Message-ID: <c575a866af5f4e5bbf8af4ca2128cecf@XBOX02.axis.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
	<1497439848-29967-8-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497439848-29967-8-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v4 7/7] image.bbclass: create root symlinks in	nativesdk target sysroot
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
X-List-Received-Date: Wed, 14 Jun 2017 13:37:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 14 juni 2017 13:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v4 7/7] image.bbclass: create root symlinks
> in nativesdk target sysroot
>=20
> To match with the target image, the generated nativesdk's target sysroot =
also
> should have the root symlinks(/lib*, /bin/, /sbin). So, extended the
> 'create_merged_usr_symlinks' to reuse symlink creation part even for nati=
vesdk
> using POPULATE_SDK_PRE_TARGET_COMMAND.
>=20
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/classes/image.bbclass | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2a3c1e3..b6c3866 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -620,21 +620,32 @@ addtask bundle_initramfs after do_image_complete
>=20
>  # Prepare the root links to point to the /usr counterparts.
>  create_merged_usr_symlinks() {
> -    install -d ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}${base_sbind=
ir} ${IMAGE_ROOTFS}${base_libdir}
> -    lnr ${IMAGE_ROOTFS}${base_bindir} ${IMAGE_ROOTFS}/bin
> -    lnr ${IMAGE_ROOTFS}${base_sbindir} ${IMAGE_ROOTFS}/sbin
> -    lnr ${IMAGE_ROOTFS}${base_libdir} ${IMAGE_ROOTFS}/${baselib}
> +    root=3D"$1"
> +    install -d ${root}${base_bindir} ${root}${base_sbindir} ${root}${bas=
e_libdir}
> +    lnr ${root}${base_bindir} ${root}/bin
> +    lnr ${root}${base_sbindir} ${root}/sbin
> +    lnr ${root}${base_libdir} ${root}/${baselib}
>=20
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> -       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
> -       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
> +       install -m 0755 -d ${root}${nonarch_base_libdir}
> +       lnr ${root}${nonarch_base_libdir} ${root}/lib
>      fi
>=20
>      # create base links for multilibs
>      multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
>      for d in $multi_libdirs; do
> -        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
> -        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
> +        install -m 0755 -d ${root}${exec_prefix}/$d
> +        lnr ${root}${exec_prefix}/$d ${root}/$d
>      done
>  }

Change all references to "${root}" to "$root" in the above code.=20
It is a shell variable, not a bitbake variable.

> -ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks; ', '',d)}"
> +
> +create_merged_usr_symlinks_rootfs() {
> +    create_merged_usr_symlinks ${IMAGE_ROOTFS}
> +}
> +
> +create_merged_usr_symlinks_sdk() {
> +    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
> +}
> +
> +ROOTFS_PREPROCESS_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'usrmerge', 'create_merged_usr_symlinks_rootfs; ', '',d)}"
> +POPULATE_SDK_PRE_TARGET_COMMAND +=3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
> --
> 2.7.4

//Peter


