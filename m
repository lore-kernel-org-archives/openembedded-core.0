Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FC6C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:15:41 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.7634.1637054138937276570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ECnBQccc;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1637054139;
  x=1668590139;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UszR451kbfbtp+ENR8K0UphhZeiuT4cWpAw76X4gEDE=;
  b=ECnBQcccyqc/9GYrm3LJxzqAuIX/qDLvoJUpn+PPxY0aUPEmd9JuFMjy
   LxA1L2z2C6YehDFthfQQNyKKgGNsn2n9gvQO2aVnFngeqcfYD0fz7nayR
   KPzGSyCsdkUFWqRV3e6Mv6aWu9CRfUaynhXqgp48iKDKU5tDn3xBgkAhS
   /MPKR0QV01IsC+iSuGi/OgQdwyxyS5FPUNN7XWTLejxgKAzlojVaaAEqK
   EVSqWRhRM421P8ONm8ltCzQ+/k4On5t4Te9aG3J3JkBwhzOjUkMFV82kG
   WmkpBw7BkLSF2CX4kad20NAi5d6noflo9TpoWhJIyoNIin6pOh99kXMsp
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: wangmy <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] systemd-boot: upgrade 249.5 -> 249.6
Thread-Topic: [OE-core] [PATCH v2] systemd-boot: upgrade 249.5 -> 249.6
Thread-Index: AQHX2olw3JUEnywYU0yayLoVkSPm+6wF36WQ
Date: Tue, 16 Nov 2021 09:15:36 +0000
Message-ID: <56e561cd621948cd8d15ab89a45f4c8d@axis.com>
References: <1637026122-80256-1-git-send-email-wangmy@fujitsu.com>
 <1637026122-80256-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1637026122-80256-2-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 09:15:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158342

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of wangmy
> Sent: den 16 november 2021 02:29
> To: openembedded-core@lists.openembedded.org
> Cc: Wang Mingyu <wangmy@fujitsu.com>
> Subject: [OE-core] [PATCH v2] systemd-boot: upgrade 249.5 -> 249.6

Please change the subject to:

systemd, systemd-boot: upgrade 249.5 -> 249.6

//Peter

>=20
> 0001-meson-use-partial_dependency-to-get-include-director.patch
> removed since it is included in 249.6
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...md-boot_249.5.bb =3D> systemd-boot_249.6.bb} |  0
>  meta/recipes-core/systemd/systemd.inc         |  2 +-
>  ...l_dependency-to-get-include-director.patch | 46 -------------------
>  .../{systemd_249.5.bb =3D> systemd_249.6.bb}    |  1 -
>  4 files changed, 1 insertion(+), 48 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_249.5.bb =3D> systemd-
> boot_249.6.bb} (100%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-
> partial_dependency-to-get-include-director.patch
>  rename meta/recipes-core/systemd/{systemd_249.5.bb =3D> systemd_249.6.bb=
}
> (99%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-boot_249.5.bb
> b/meta/recipes-core/systemd/systemd-boot_249.6.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_249.5.bb
> rename to meta/recipes-core/systemd/systemd-boot_249.6.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-
> core/systemd/systemd.inc
> index 4e4cdd2e2f..f3ce32efc2 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,7 +14,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>=20
> file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c"
>=20
> -SRCREV =3D "00b0393e65252bf631670604f58b844780b08c50"
> +SRCREV =3D "deda69dad784f9c4367533555ff4d7bf6308c0ff"
>  SRCBRANCH =3D "v249-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-
> stable.git;protocol=3Dhttps;branch=3D${SRCBRANCH} \
>  "
> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-
> partial_dependency-to-get-include-director.patch b/meta/recipes-
> core/systemd/systemd/0001-meson-use-partial_dependency-to-get-include-
> director.patch
> deleted file mode 100644
> index 51ee5d8623..0000000000
> --- a/meta/recipes-core/systemd/systemd/0001-meson-use-partial_dependency=
-
> to-get-include-director.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 260e871fda979f040c94d2011545e8122bed68ca Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 18 Oct 2021 10:13:07 +0200
> -Subject: [PATCH] meson: use partial_dependency() to get include director=
y
> -
> -Getting the variable directly from pkg-config is prone to host
> -contamination when building in sysroots as the
> -compiler starts looking for the headers on the host in addition to
> -the sysroot.
> -
> -Upstream-Status: Submitted
> [https://github.com/systemd/systemd/pull/21027]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - meson.build | 9 ++++-----
> - 1 file changed, 4 insertions(+), 5 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index df53c6156d..38fb37dd75 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -2618,18 +2618,17 @@ endif
> -
> - if conf.get('ENABLE_LOCALED') =3D=3D 1
> -         if conf.get('HAVE_XKBCOMMON') =3D=3D 1
> --                # logind will load libxkbcommon.so dynamically on its
> own
> --                deps =3D [libdl]
> --                extra_includes =3D
> [libxkbcommon.get_pkgconfig_variable('includedir')]
> -+                # logind will load libxkbcommon.so dynamically on its
> own, but we still
> -+                # need to specify where the headers are
> -+                deps =3D [libdl,
> libxkbcommon.partial_dependency(compile_args: true)]
> -         else
> -                 deps =3D []
> --                extra_includes =3D []
> -         endif
> -
> -         executable(
> -                 'systemd-localed',
> -                 systemd_localed_sources,
> --                include_directories : includes + extra_includes,
> -+                include_directories : includes,
> -                 link_with : [libshared],
> -                 dependencies : deps,
> -                 install_rpath : rootlibexecdir,
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-
> core/systemd/systemd_249.6.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_249.5.bb
> rename to meta/recipes-core/systemd/systemd_249.6.bb
> index 8bdc0ca028..242a53d22a 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.6.bb
> @@ -25,7 +25,6 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
>             file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-
> slash.patch \
>             file://0001-test-parse-argument-Include-signal.h.patch \
> -           file://0001-meson-use-partial_dependency-to-get-include-
> director.patch \
>             "
>=20
>  # patches needed by musl
> --
> 2.25.1


