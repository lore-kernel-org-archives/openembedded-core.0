Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9AE6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DB34B180FF;
	Mon, 20 Jun 2016 12:42:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id JCcJfLAai1h6; Mon, 20 Jun 2016 12:42:31 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id A95B5180EF;
	Mon, 20 Jun 2016 12:42:30 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 799AC1AA3;
	Mon, 20 Jun 2016 12:42:30 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 6EC3815BF;
	Mon, 20 Jun 2016 12:42:30 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 6CBD9D82;
	Mon, 20 Jun 2016 12:42:30 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Mon, 20 Jun 2016 12:42:30 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Mon, 20 Jun 2016 12:42:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Stephen Arnold <sarnold@vctlabs.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Minimum host gcc version? (was: [OE-core] [PATCH] qemu-native:
	set ld.bfd, fix cflags,	and set some environment vars)
Thread-Index: AdHK4G7+WGCxcJxSSfS4glbf0hFpeQ==
Date: Mon, 20 Jun 2016 10:42:30 +0000
Message-ID: <dec522d1a7c74a3e90b5e97300a46aef@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.107]
MIME-Version: 1.0
Cc: Stephen Arnold <nerdboy@gentoo.org>
Subject: Minimum host gcc version? (was: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars)
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
X-List-Received-Date: Mon, 20 Jun 2016 10:42:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Stephen Arnold
> Sent: den 19 juni 2016 21:40
> To: openembedded-core@lists.openembedded.org
> Cc: Stephen Arnold; Stephen Arnold
> Subject: [OE-core] [PATCH] qemu-native: set ld.bfd, fix cflags, and set
> some environment vars
>=20
> The main thing is build failures with gold linker, but qemu is also
> a little too aggressive at finding random tools on the build host, so
> we also set the build env for qemu-native and make sure it doesn't
> reset its own (hard-coded) cflags when we don't want it to.
>=20
> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>=20
> The cflags patch was imported from Gentoo Portage and has been
> manitained over several versions; this version was rebased against
> upstream qemu git.
>=20
> Upstream-Status: Inappropriate
>  - Patch addresses distribution maintenance and build environment
>    sanity.
>=20
> Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                | 13 +++++++--
>  .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31
> ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
>  3 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.6.0-
> cflags.patch
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index bf689bb..d5925fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,8 +30,12 @@ SRC_URI_append_class-native =3D "\
>=20
>  EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --disable=
-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cf=
lags=3D'${CFLAGS}'"
>=20
> -EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${@get_qemu_target_lis=
t(d)} --disable-werror \
> -				"
> +EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${@get_qemu_target_lis=
t(d)} --disable-werror"
> +
> +EXTRA_OEMAKE_append_class-native =3D " LD=3D'${LD}' AR=3D'${AR}' OBJCOPY=
=3D'${OBJCOPY}' LDFLAGS=3D'${LDFLAGS}'"
> +
> +LDFLAGS_append_class-native =3D " -fuse-ld=3Dbfd"

The use of -fuse-ld=3Dbfd causes a build a failure with gcc 4.7.2=20
that I still use as host compiler. Was it intentional to increase=20
the minimum required host compiler version? If not, can this=20
option be made conditional for compilers that do not support it?

//Peter


