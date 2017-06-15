Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 56ADD77BE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 022592E5E8;
	Thu, 15 Jun 2017 11:32:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Fq59c3TPtuLe; Thu, 15 Jun 2017 11:32:38 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id E79912E61F;
	Thu, 15 Jun 2017 11:32:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDAF51E075;
	Thu, 15 Jun 2017 11:32:37 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2B231E074;
	Thu, 15 Jun 2017 11:32:37 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 11:32:37 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id A6B2AEBA;
	Thu, 15 Jun 2017 11:32:37 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 11:32:37 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 11:32:37 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 11:32:37 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v5] image.bbclass: create root symlinks in
	nativesdk target sysroot
Thread-Index: AQHS5bIBn8LN11Bfvk+zx1gYLhLldKIlqHkg
Date: Thu, 15 Jun 2017 09:32:37 +0000
Message-ID: <ba4d34ea616f45249fb2bed1c4a4e3a3@XBOX02.axis.com>
References: <c575a866af5f4e5bbf8af4ca2128cecf@XBOX02.axis.com>
	<1497515577-40707-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1497515577-40707-1-git-send-email-amarnath.valluri@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v5] image.bbclass: create root symlinks in	nativesdk target sysroot
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
X-List-Received-Date: Thu, 15 Jun 2017 09:32:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Amarnath Valluri
> Sent: den 15 juni 2017 10:33
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v5] image.bbclass: create root symlinks in
> nativesdk target sysroot
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
> index 2a3c1e3..7c5cfc5 100644
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
> +    install -d $root${base_bindir} $root${base_sbindir} $root${base_libd=
ir}
> +    lnr $root${base_bindir} $root/bin
> +    lnr $root${base_sbindir} $root/sbin
> +    lnr $root${base_libdir} $root/${baselib}
>=20
>      if [ "${nonarch_base_libdir}" !=3D "${base_libdir}" ]; then
> -       install -d ${IMAGE_ROOTFS}${nonarch_base_libdir}
> -       lnr ${IMAGE_ROOTFS}${nonarch_base_libdir} ${IMAGE_ROOTFS}/lib
> +       install -m 0755 -d $root${nonarch_base_libdir}

Meh, missed this the first time, but you reintroduce an unnecessary
-m 0755 here.

> +       lnr $root${nonarch_base_libdir} $root/lib
>      fi
>=20
>      # create base links for multilibs
>      multi_libdirs=3D"${@d.getVar('MULTILIB_VARIANTS')}"
>      for d in $multi_libdirs; do
> -        install -d ${IMAGE_ROOTFS}${exec_prefix}/$d
> -        lnr ${IMAGE_ROOTFS}${exec_prefix}/$d ${IMAGE_ROOTFS}/$d
> +        install -m 0755 -d $root${exec_prefix}/$d

And the same here.

> +        lnr $root${exec_prefix}/$d $root/$d
>      done
>  }
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


