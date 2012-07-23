Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1StJBw-0006oV-Ud
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 16:00:57 +0200
Received: by bkcik5 with SMTP id ik5so4133304bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 06:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ya6BdcYm+BVyH3jFJa7V1oEnYLSPzKtjKhhUBRMNzjs=;
	b=CWvLl7nvAcSzADboba2LU19aD38/IJMnFHwXy1WFLpZcKjtZ7CaUzCZU+4q/LjUDXX
	UwrHMwfhb7WxKrvlnxFP4gy6QW8WaQSV/NWdXioh5+dkOaWo4L/ZAIEjZAebC26ipt4v
	AHM0HsQ0hWPRCF1C6enyLwnt9Lx2BqFrY0w0MLkNZatfVim1X2IH/JduIf74aPwCDOBs
	4+1f4bqDOsY7Ozf36jyRTTmf3yqRRNG5UhRE4uxWS4H9luW/LN3enPFE/J9yfCU6O0+v
	3kTZCq2r2m7fK1M3yC7w/sBfEOuT3L2Q7hbnTSYjdij6r8B0znJPA5u9wgtexRCc+G8a
	rI7A==
Received: by 10.205.33.136 with SMTP id so8mr7573788bkb.1.1343051369640;
	Mon, 23 Jul 2012 06:49:29 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 25sm7612883bkx.9.2012.07.23.06.49.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 06:49:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343050270-3641-1-git-send-email-radu.moisan@intel.com>
Date: Mon, 23 Jul 2012 15:49:22 +0200
Message-Id: <6B48C674-C3F4-44BE-A8EE-24AEB9AE84E1@dominion.thruhere.net>
References: <1343050270-3641-1-git-send-email-radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlU0QYtpmyy4vOlgf8WZE7vQXFuVfNbhN6jZqoHxjORNjSMxqFeCeloGzayAIcD+SkosYWI
Subject: Re: [PATCH] Handle undefined O_CLOEXEC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 14:00:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Please update the commit message to adhere to the commit policy. At =
least mention the recipe name in the first line.

Op 23 jul. 2012, om 15:31 heeft Radu Moisan het volgende geschreven:

> Close-on-exec seems to be unsuported on some architectures like CentOS =
5.8
> and thus causing some packages to fail to build successfully. Future =
kernel
> version will probably fix this, but for now this patch works around =
this
> problem.
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
> meta/recipes-kernel/kmod/kmod.inc                  |    3 +-
> .../Handle-unsupported-close-on-exec-flag.patch    |   60 =
++++++++++++++++++++
> 2 files changed, 62 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patch
>=20
> diff --git a/meta/recipes-kernel/kmod/kmod.inc =
b/meta/recipes-kernel/kmod/kmod.inc
> index adba4d4..c992ad8 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> LICENSE_libkmod =3D "LGPL-2.1+"
> SECTION =3D "base"
> PV =3D "8"
> -INC_PR =3D "r1"
> +INC_PR =3D "r2"
>=20
> DEPENDS +=3D "pkgconfig-native"
>=20
> @@ -20,6 +20,7 @@ inherit autotools gtk-doc
> SRC_URI =3D =
"git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=3Dmaster \
>            file://depmod-search.conf \
>            =
file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
> +           file://Handle-unsupported-close-on-exec-flag.patch \
>           "
>=20
> SRCREV =3D "819f79a24d58e3c8429f1631df2f8f85a2f95d4a"
> diff --git =
a/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patc=
h =
b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patc=
h
> new file mode 100644
> index 0000000..f0820d9
> --- /dev/null
> +++ =
b/meta/recipes-kernel/kmod/kmod/Handle-unsupported-close-on-exec-flag.patc=
h
> @@ -0,0 +1,60 @@
> +Index: git/libkmod/libkmod-config.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/libkmod/libkmod-config.c	2012-07-23 =
16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-config.c	2012-07-23 16:15:53.000000000 =
+0300
> +@@ -33,6 +33,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +=20
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + struct kmod_alias {
> + 	char *name;
> + 	char modname[];
> +Index: git/libkmod/libkmod-file.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/libkmod/libkmod-file.c	2012-07-23 16:13:44.000000000 =
+0300
> ++++ git/libkmod/libkmod-file.c	2012-07-23 16:15:57.000000000 =
+0300
> +@@ -31,6 +31,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +=20
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + #ifdef ENABLE_XZ
> + #include <lzma.h>
> + #endif
> +Index: git/libkmod/libkmod-index.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/libkmod/libkmod-index.c	2012-07-23 16:13:44.000000000 =
+0300
> ++++ git/libkmod/libkmod-index.c	2012-07-23 16:16:00.000000000 =
+0300
> +@@ -31,6 +31,10 @@
> + #include "libkmod-index.h"
> + #include "macro.h"
> +=20
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + /* index.c: module index file shared functions for modprobe and =
depmod */
> +=20
> + #define INDEX_CHILDMAX 128
> +Index: git/libkmod/libkmod-module.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/libkmod/libkmod-module.c	2012-07-23 =
16:13:44.000000000 +0300
> ++++ git/libkmod/libkmod-module.c	2012-07-23 16:16:04.000000000 =
+0300
> +@@ -40,6 +40,10 @@
> + #include "libkmod.h"
> + #include "libkmod-private.h"
> +=20
> ++#ifndef O_CLOEXEC
> ++#define O_CLOEXEC 0
> ++#endif
> ++
> + /**
> +  * SECTION:libkmod-module
> +  * @short_description: operate on kernel modules
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



