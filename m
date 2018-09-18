Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9EE74573
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 02:51:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Sep 2018 19:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,388,1531810800"; d="scan'208";a="263482468"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by fmsmga005.fm.intel.com with ESMTP; 17 Sep 2018 19:51:42 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.186]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.177]) with mapi id
	14.03.0319.002; Tue, 18 Sep 2018 10:51:41 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
Thread-Index: AQHUTESw5rMdXaaS50iw3cAw707s0qT1W8aA
Date: Tue, 18 Sep 2018 02:51:41 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F302037BC6@PGSMSX105.gar.corp.intel.com>
References: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTI1OTA5NzUtZjJjOS00Yjg3LTgzZTUtMzE1NTc4Nzc2OGY5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSXJLTlF4TkZJbnppRmdzb2hYb0hDNnVoNFBFYU1GNnUwZXBjK3ErNCt4Q0VtdGpoQzJDdWpMVTFnODBFYjVcL0UifQ==
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
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
X-List-Received-Date: Tue, 18 Sep 2018 02:51:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-
> core-bounces@lists.openembedded.org] On Behalf Of Armin Kuster
> Sent: Saturday, September 15, 2018 12:04 AM
> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
>=20
> removed included patch
>=20
> Refresh 0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC
> Remove 0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...NULL-value-detection-for-ID_INPUT-being-u.patch | 40 ----------------=
---
> ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++----  ...003=
-
> modesetting-Fix-16-bit-depth-bpp-mode.patch | 46 ----------------------
>  .../xorg-xserver/xserver-xorg_1.19.6.bb            | 33 ----------------
>  .../xorg-xserver/xserver-xorg_1.20.1.bb            | 31 +++++++++++++++
>  5 files changed, 40 insertions(+), 129 deletions(-)  delete mode 100644 =
meta/recipes-
> graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-f=
or-
> ID_INPUT-being-u.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-
> modesetting-Fix-16-bit-depth-bpp-mode.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.=
6.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.=
1.bb
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-=
fix-NULL-
> value-detection-for-ID_INPUT-being-u.patch b/meta/recipes-graphics/xorg-
> xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-be=
ing-
> u.patch
> deleted file mode 100644
> index 964d5dd..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NUL=
L-value-
> detection-for-ID_INPUT-being-u.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From a309323328d9d6e0bf5d9ea1d75920e53b9beef3 Mon Sep 17 00:00:00 2001
> -From: Peter Hutterer <peter.hutterer@who-t.net>
> -Date: Fri, 5 Jan 2018 11:58:42 +1000
> -Subject: [PATCH] config: fix NULL value detection for ID_INPUT being uns=
et
> -
> -Erroneous condition caused us to keep going with all devices that didn't=
 have -
> ID_INPUT set.
> -
> -Fixes: 5aad81445c8c3d6
> -Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D104382
> -Reviewed-by: Adam Jackson <ajax@redhat.com>
> -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> -
> -Upstream-status: Backport
> -https://patchwork.freedesktop.org/patch/196090/
> -Affects: < 1.20.0
> -[Yocto # 12899]
> -
> -Signed-off-by: Armin Kuster <akuser808@gmail.com>
> -
> ----
> - config/udev.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/config/udev.c b/config/udev.c -index e198e8609..3a73189e2 1=
00644
> ---- a/config/udev.c
> -+++ b/config/udev.c
> -@@ -135,7 +135,7 @@ device_added(struct udev_device *udev_device)
> - #endif
> -
> -     value =3D udev_device_get_property_value(udev_device, "ID_INPUT");
> --    if (value && !strcmp(value, "0")) {
> -+    if (!value || !strcmp(value, "0")) {
> -         LogMessageVerb(X_INFO, 10,
> -                        "config/udev: ignoring device %s without "
> -                        "property ID_INPUT set\n", path);
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configu=
re.ac-Fix-
> check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-
> xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patc=
h
> index 16ec3ed..020a1cf 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-F=
ix-check-
> for-CLOCK_MONOTONIC.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-
> +++ Fix-check-for-CLOCK_MONOTONIC.patch
> @@ -1,12 +1,13 @@
> -Discover monotonic clock using compile-time check
> +From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Mon, 12 Dec 2016 12:11:39 +0200
> +Subject: [PATCH] Discover monotonic clock using compile-time check
>=20
>  monotonic clock check does not work when cross-compiling.
>=20
>  Upstream-Status: Denied [Does not work on OpenBSD]
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>=20
> -
> -
>  Original patch follows:
>=20
>  When xorg-xserver is being cross-compiled, there is currently no way @@ =
-21,15
> +22,16 @@ monotonic clock is available. This check can run just fine when=
 we are
> cross-compiling.
>=20
>  Signed-off-by: David James <davidjames at google.com>
> +
>  ---
>   configure.ac | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
>=20
>  diff --git a/configure.ac b/configure.ac -index f7ab48c..26e85cd 100644
> +index 2b21667..786e002 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" =3D xno; then
> +@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" =3D xno; then
>           CPPFLAGS=3D"$CPPFLAGS -D_POSIX_C_SOURCE=3D200112L"
>       fi
>=20
> @@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
>  -       [MONOTONIC_CLOCK=3D"cross compiling"])
>  +]])],[MONOTONIC_CLOCK=3Dyes], [MONOTONIC_CLOCK=3Dno])
>=20
> -     LIBS=3D"$LIBS_SAVE"
> -     CPPFLAGS=3D"$CPPFLAGS_SAVE"
> ---
> -2.1.4
> -
> +     if test "$MONOTONIC_CLOCK" =3D "cross compiling"; then
> +
> AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK=3D"guessing
> + yes"],[MONOTONIC_CLOCK=3Dno],[#include <time.h>])


Do we still need this patch after this change in 1.20:

https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=3Dserver-1.=
20-branch&id=3Dc601c8faf54ff9e3bcbc653421828d71042deef7

Thanks,
Anuj

