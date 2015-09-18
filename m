Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFFB7680E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:41:42 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so34832420pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=b5E7cQ9XYQ7G/9CqPeh+SUuIG+MuAAkQp4xD5Cgnr3I=;
	b=gaG39ANNT6UoFOWISvWwrdRUkbuZ+4qvWavgvAKwNyIk+D/sXRAUPp9mEHphxbxGYb
	ymbtV//V0DCqREslDbDW6ANwgS+bx5onqPj9UGuG+RP4pgW/8vgvxT0BkgnQTpJKGOkN
	xErAenE3r0gA9PY8nsVMF6t9VMYFQMP0URlnYIJnN83QRMj47a1zAqTQXQ6CqLcXgymQ
	p+2ZEuqhLG0qdLm3xnHpXuPr02FJkARJwOcf5Oj9LxZb7WI1RVXOQissNj9mYyjZ7M25
	tqbz7c315DxRby0pbBc8A8Ij8Gf9INEuDOevz5CKL5ptKL03zIispjDRvhaROOhSpOVq
	OHvQ==
X-Received: by 10.66.254.201 with SMTP id ak9mr3875682pad.151.1442540502487;
	Thu, 17 Sep 2015 18:41:42 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	d13sm5665233pbu.17.2015.09.17.18.41.41
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 18:41:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442500317-9064-9-git-send-email-marex@denx.de>
Date: Thu, 17 Sep 2015 18:41:40 -0700
Message-Id: <ED902330-8DA9-4BA5-B910-81AD6C64B86C@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<1442500317-9064-9-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/8] libgpg-error: Add support for nios2
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
X-List-Received-Date: Fri, 18 Sep 2015 01:41:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>=20
> Add a patch which adds a configuration for the nios2 processor.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> .../0001-libgpg-error-Add-nios2-support.patch      | 45 =
++++++++++++++++++++++
> .../libgpg-error/libgpg-error_1.19.bb              |  4 +-
> 2 files changed, 48 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2=
-support.patch
>=20
> diff --git =
a/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nio=
s2-support.patch =
b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nio=
s2-support.patch
> new file mode 100644
> index 0000000..8362c69
> --- /dev/null
> +++ =
b/meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nio=
s2-support.patch
> @@ -0,0 +1,45 @@
> +=46rom b2af652f43991e4ce6297917da542a9eb5135939 Mon Sep 17 00:00:00 =
2001
> +From: Marek Vasut <marex@denx.de>
> +Date: Thu, 17 Sep 2015 03:28:06 +0200
> +Subject: [PATCH] libgpg-error: Add nios2 support
> +
> +Add configuration for the NIOS2 processor.
> +
> +Signed-off-by: Marek Vasut <marex@denx.de>
> +---
> + src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h | 23 =
+++++++++++++++++++++++
> + 1 file changed, 23 insertions(+)
> + create mode 100644 src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> +
> +diff --git a/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h =
b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> +new file mode 100644
> +index 0000000..3a24571
> +--- /dev/null
> ++++ b/src/syscfg/lock-obj-pub.nios2-unknown-linux-gnu.h
> +@@ -0,0 +1,23 @@
> ++## lock-obj-pub.nios2-unknown-linux-gnu.h
> ++## File created by gen-posix-lock-obj - DO NOT EDIT
> ++## To be included by mkheader into gpg-error.h
> ++


how was this file generated ?=20

> ++typedef struct
> ++{
> ++  long _vers;
> ++  union {
> ++    volatile char _priv[24];
> ++    long _x_align;
> ++    long *_xp_align;
> ++  } u;
> ++} gpgrt_lock_t;
> ++
> ++#define GPGRT_LOCK_INITIALIZER {1,{{0,0,0,0,0,0,0,0, \
> ++                                    0,0,0,0,0,0,0,0, \
> ++                                    0,0,0,0,0,0,0,0}}}
> ++##
> ++## Local Variables:
> ++## mode: c
> ++## buffer-read-only: t
> ++## End:
> ++##
> +--=20
> +2.5.1
> +
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb =
b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
> index 39dbbcf..c69930a 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.19.bb
> @@ -12,7 +12,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
> SECTION =3D "libs"
>=20
> SRC_URI =3D =
"ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
> -           file://pkgconfig.patch"
> +           file://pkgconfig.patch \
> +	   file://0001-libgpg-error-Add-nios2-support.patch \
> +	  "
> SRC_URI[md5sum] =3D "c04c16245b92829281f43b5bef7d16da"
> SRC_URI[sha256sum] =3D =
"53120e1333d5c5d28d87ff2854e9e98719c8e214152f17ad5291704d25c4978b"
>=20
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


