Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.2419.1591719848715941394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 09:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ieL9rBYX;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3931; q=dns/txt; s=axis-central1;
  t=1591719849; x=1623255849;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cDTIX3qY1TsXU/+fY25VdDQI2NQYLSSxjNg2wYgIuGU=;
  b=ieL9rBYXNyldhWfsf2fgZBt79K4DBKqUbXUzNltKCP0/gV6zKH6JGTUy
   2gP67RHVd8fI3DW4b5xp2GENtYf563Fjo+Yk0h9+hX3VV/bWeVq+tstX0
   YuP34/LZBH3i7GO6I1mz/6BkxAopCmZldBdfzmybBX7TQDYJm/8oTVvES
   SiEAi8eROtLAX/dP8/EfU1ov5TZDO2IIdudxCvFUDmeyPrPlHN57cwfPa
   mKKh3kRWHfzDkjDZfojj4ijeDxuqKvfXFhTt/Ftb52d6faqOLJeW+McPG
   la108LBFm52P59xXCN1us5vwFfIgE/H1TZuvpPwpveyKsbNHs975UNrpu
   w==;
IronPort-SDR: w9Z/nDPPk9OygzkBhdyTnGZdohuCLacmlKxLs2c+Sr64PJu8CMgzngqkAGYt+d6h8liEcTk8MT
 xrnCiU81q+vRFoA5hdBBeJTicWACWXnNid1wDPmeMrBbE+aA/wh8fMZXFI2EarB11+cWp7L6Ms
 ucZSZitJl3UJizxiYh5VPNF0sYKsZwr9gVxPWps9T55UgP7U/KpI0iZU9rDZd4FY4xixJkqA7C
 Ojt3g3dLZ20ynLPiP+rcYel2fZ1Ut9CLJCksyc9i/rjgDbVJhmcA1waeJndrLMbRFtNfjlKP+2
 ngw=
X-IronPort-AV: E=Sophos;i="5.73,492,1583190000"; 
   d="scan'208";a="9362008"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 34/42] lttng-modules: update to 2.12.1
Thread-Topic: [OE-core] [PATCH 34/42] lttng-modules: update to 2.12.1
Thread-Index: AQHWPWnXJkwLjoZQpkm9Pt/iqUVJQqjQeGpQ
Date: Tue, 9 Jun 2020 16:24:05 +0000
Message-ID: <2129b01748864d44ae689b45fc9c8684@XBOX03.axis.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
 <20200608074659.7051-34-alex.kanavin@gmail.com>
In-Reply-To: <20200608074659.7051-34-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 8 juni 2020 09:47
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> Subject: [OE-core] [PATCH 34/42] lttng-modules: update to 2.12.1
>=20
> Drop backports.
>=20
> devupstream variant was incorrectly updated in a059fc67da4
> (changed to 2.12, but without updating SRCREV), so revert it back
> to 2.11.2.

I don't understand this. If you update the recipe to 2.12.1, why do=20
you not update the devupstream variant to match?

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...l-5.7-use-vmalloc_sync_mappings-on-k.patch | 853 ------------------
>  ...per-rename-to-wrapper_vmalloc_sync_m.patch |  32 -
>  ..._sync_mappings-on-kernel-5.6-as-well.patch |  88 --
>  ...loc_sync_mappings-for-stable-kernels.patch |  67 --
>  ...ules_2.12.0.bb =3D> lttng-modules_2.12.1.bb} |  11 +-
>  5 files changed, 3 insertions(+), 1048 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Update-
> for-kernel-5.7-use-vmalloc_sync_mappings-on-k.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-
> missing-wrapper-rename-to-wrapper_vmalloc_sync_m.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-Use-
> vmalloc_sync_mappings-on-kernel-5.6-as-well.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Update-
> Use-vmalloc_sync_mappings-for-stable-kernels.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.12.0.bb =3D> lttng-
> modules_2.12.1.bb} (75%)

[snip]

> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb b/meta/rec=
ipes-kernel/lttng/lttng-modules_2.12.1.bb
> similarity index 75%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
> index 4a6c42e3bf..8d3fb475c0 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.12.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.1.bb
> @@ -11,14 +11,9 @@ COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips=
|nios2|arm|riscv).*-linux'
>  SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.p=
atch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
> -           file://0001-Update-for-kernel-5.7-use-vmalloc_sync_mappings-o=
n-k.patch \
> -           file://0002-Fix-missing-wrapper-rename-to-wrapper_vmalloc_syn=
c_m.patch \
> -           file://0003-Fix-Use-vmalloc_sync_mappings-on-kernel-5.6-as-we=
ll.patch \
> -           file://0004-Update-Use-vmalloc_sync_mappings-for-stable-kerne=
ls.patch \
>             "
>=20
> -SRC_URI[md5sum] =3D "be252df5013ea03894921d0b493c7b6c"
> -SRC_URI[sha256sum] =3D "efeb2ae60e96dbe9a9b342d3a80dfc7642f06a8c09686089=
d491ad696bb98f4d"
> +SRC_URI[sha256sum] =3D "639c03bf8f0e920567f45c96cc7ef749a8fc29ff7fb3fb97=
263d67f66fb71aef"
>=20
>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>=20
> @@ -37,11 +32,11 @@ python do_package_prepend() {
>  BBCLASSEXTEND =3D "devupstream:target"
>  LIC_FILES_CHKSUM_class-devupstream =3D "file://LICENSE;md5=3D3f882d431dc=
0f32f1f44c0707aa41128"
>  DEFAULT_PREFERENCE_class-devupstream =3D "-1"
> -SRC_URI_class-devupstream =3D "git://git.lttng.org/lttng-modules;branch=
=3Dstable-2.12 \
> +SRC_URI_class-devupstream =3D "git://git.lttng.org/lttng-modules;branch=
=3Dstable-2.11 \
>             file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.p=
atch \
>             file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
>             "
>  SRCREV_class-devupstream =3D "17c413953603f063f2a9d6c3788bec914ce6f955"
> -PV_class-devupstream =3D "2.12.0+git${SRCPV}"
> +PV_class-devupstream =3D "2.11.2+git${SRCPV}"
>  S_class-devupstream =3D "${WORKDIR}/git"
>  SRCREV_FORMAT ?=3D "lttng_git"
> --
> 2.26.2

//Peter

