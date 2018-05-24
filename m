Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id B529174774
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 01:06:09 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id g9-v6so16066897uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 18:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=m8I5iAXzh5rpgiNQM+Wr4Ngq2RGu9Rv5lAAClCfCWBA=;
	b=a1kywU5vz3aOEcqB5inWwg5OeTjNJEGArRgetYuagPSWAIYlrsoEsrgR6Co8N984B7
	DhT+VjVjyaI9CxU9zGx9eyMw5gY5UdadTKdw53TPpZN/glnaSThThw+MndWbFWksdV6N
	R8B3KKCZNgZx/MIvqIpU7sDFWk1pK2unsEpygZcUqNPX6JS7qeUjggbim/psLTB36mak
	eBuhlwfgYL3J7YyW6X0WQiU57MDFe4qOWWv9nvPjn62wgBRP5aSU5E0+kwiB5LTjHz1R
	cnDSmjx3u3OPJgq03o9H4os6fP0oCridEqehox7Nc1l74Hjd5YwypdGecQxm8UlRH7cI
	//dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=m8I5iAXzh5rpgiNQM+Wr4Ngq2RGu9Rv5lAAClCfCWBA=;
	b=ZqL/6iMSKQxZguM2KnJnGNTk+KMTSWCfsvfQO0aMP5CB+G00WI5UpThf54lW+UaLOv
	zyRBLX4gjHvpjHCHZIhkAth4XvsQm4iwch3NLZTuVGMnwN+vbWnJy9qOGfgwL8Ocuvyb
	kwEOI+Awcsx6kDJjfNsbe/PXxQRjrGj6L/+kt9YG4rhN810WiG/V6/I8z3ktQmskWxZA
	HmAWCFeTVSNUEZ6qNyXYCDm+wYFL6IAyIOKTalIH68MgoRgoeisHDk5kvHFDywM144IW
	Sye8zeo7qWJqzE6excEkk1SLPPPCrNMYtQXFNECvMKm6+M6Bv2ZqxOhrR06DVlyKWBmH
	A/hw==
X-Gm-Message-State: ALKqPwdtGfml7br8/GC1jrs9AwOKiRU+hPAgVHYNRSu3P8hF5plhiiZm
	4syFVa2SpYMrOS5sXehzRQqLDpG4psReBYxZYEM=
X-Google-Smtp-Source: AB8JxZowpmaIn9VHq9yEg1DKGT4Y5jFExfzGUoneAxu+JM3cuAqie8l60cYRZ1NFUj6F+DdZQ4wUP/WdkIubL/wN6Pk=
X-Received: by 2002:ab0:2054:: with SMTP id
	g20-v6mr3785739ual.150.1527123970201; 
	Wed, 23 May 2018 18:06:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Wed, 23 May 2018 18:06:09
	-0700 (PDT)
In-Reply-To: <304c3b9b71c18f44d09a4ce4a1e42e75bbc26e4d.1527114300.git.alejandr@xilinx.com>
References: <cover.1527114300.git.alejandr@xilinx.com>
	<304c3b9b71c18f44d09a4ce4a1e42e75bbc26e4d.1527114300.git.alejandr@xilinx.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 23 May 2018 18:06:09 -0700
Message-ID: <CAJ86T=XO9M42koQBqPmfN3TkLb_TH-gLEb3k1RXuw0gxjdJseQ@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C library
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
X-List-Received-Date: Thu, 24 May 2018 01:06:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 23, 2018 at 4:09 PM, Alejandro Enedino Hernandez Samaniego
<alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> This patch adds the posibility to build using TCLIBC=3Dnewlib.
>
> It allows users to build baremetal applications with the use of a
> C library.
>
> Newlib is a lightweight C library meant to be used on embedded systems,
> it is meant to be easily portable for new platforms and to provide
> basic functionality on them, by design, it provides stubs for some of
> these core functions declared as weak, so they can be built correctly
> and then linked against some other library which provides specifics
> about the platform being used if need be, libgloss takes care of these
> in some cases, but it can also be extended, this patch also allows the
> user to easily add other libraries to it by adding them to
> NEWLIB_EXTENDED for this specific reason.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com=
>
> ---
>  meta/classes/cross-canadian.bbclass         |  2 +-
>  meta/conf/distro/include/tclibc-newlib.inc  | 47 +++++++++++++++++++++++=
++++++
>  meta/recipes-core/newlib/newlib_3.0.0.bb    |  3 ++
>  meta/recipes-devtools/gcc/libgcc-common.inc |  5 +++
>  4 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 meta/conf/distro/include/tclibc-newlib.inc
>
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index ee8aa61..7f9a69b 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -30,7 +30,7 @@ python () {
>      if d.getVar("MODIFYTOS") !=3D "1":
>          return
>
> -    if d.getVar("TCLIBC") =3D=3D "baremetal":
> +    if (d.getVar("TCLIBC") =3D=3D "baremetal") or (d.getVar("TCLIBC") =
=3D=3D "newlib"):

Or maybe:

  if d.getVar("TCLIBC") in [ 'baremetal', 'newlib' ]:

>          return
>
>      tos =3D d.getVar("TARGET_OS")
> diff --git a/meta/conf/distro/include/tclibc-newlib.inc b/meta/conf/distr=
o/include/tclibc-newlib.inc
> new file mode 100644
> index 0000000..a5e63d0
> --- /dev/null
> +++ b/meta/conf/distro/include/tclibc-newlib.inc
> @@ -0,0 +1,47 @@
> +#
> +# Newlib configuration
> +#
> +
> +LIBCEXTENSION =3D "-newlib"
> +
> +# Add newlib libc overrides to the overrides.
> +LIBCOVERRIDE =3D ":libc-newlib"
> +OVERRIDES .=3D "${LIBCOVERRIDE}"

This will need to be updated to align with recent changes in master:

  http://git.openembedded.org/openembedded-core/commit/?id=3Db3598b8f1ed1cd=
c7849e1e4f30d618e87e1bf582

> +PREFERRED_PROVIDER_virtual/libc ?=3D "newlib"
> +PREFERRED_PROVIDER_virtual/libiconv ?=3D "newlib"
> +PREFERRED_PROVIDER_virtual/libintl ?=3D "newlib"
> +PREFERRED_PROVIDER_virtual/nativesdk-libintl ?=3D "nativesdk-glibc"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-glibc"
> +
> +DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig"
> +
> +#USE_NLS ?=3D "no"
> +
> +IMAGE_LINGUAS =3D ""
> +
> +LIBC_DEPENDENCIES =3D "\
> +    newlib-dbg \
> +    newlib-dev \
> +    libgloss \
> +    libgloss-dev \
> +    libgloss-dbg \
> +    libgcc-dev \
> +    libgcc-dbg \
> +    "
> +
> +# compilerlibs defaults to gcc-runtime, but we get runtime from libgloss
> +# we set ASSUME_PROVIDED because we cant set PREFERRED_PROVIDER
> +# for compilerlibs since its overriden by tcmode-default

overriden -> overridden

> +ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}compilerlibs virtual/crypt=
"
> +
> +# Its useful to be able to extend newlib, but we dont provide a native v=
ariant of libgloss
> +NEWLIB_EXTENDED ?=3D  "libgloss libgcc"
> +BASE_DEFAULT_DEPS_append_class-target =3D " ${NEWLIB_EXTENDED}"
> +
> +TARGET_OS =3D "elf"
> +TARGET_OS_arm =3D "eabi"
> +
> +TOOLCHAIN_HOST_TASK ?=3D "packagegroup-cross-canadian-${MACHINE}"
> +TOOLCHAIN_TARGET_TASK ?=3D "${LIBC_DEPENDENCIES}"
> +TOOLCHAIN_NEED_CONFIGSITE_CACHE_remove =3D "zlib ncurses"
> diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core=
/newlib/newlib_3.0.0.bb
> index 3380576..09238fe 100644
> --- a/meta/recipes-core/newlib/newlib_3.0.0.bb
> +++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
> @@ -14,3 +14,6 @@ do_install_append() {
>         # Remove original directory
>         rmdir ${D}${prefix}/${TARGET_SYS}
>  }
> +
> +# No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
> +RDEPENDS_${PN}-dev_libc-newlib =3D ""
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-d=
evtools/gcc/libgcc-common.inc
> index 848a476..d959566 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -47,8 +47,13 @@ do_install () {
>  do_install_append_libc-baremetal () {
>         rmdir ${D}${base_libdir}
>  }
> +do_install_append_libc-newlib () {
> +       rmdir ${D}${base_libdir}
> +}
>
> +# No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
>  RDEPENDS_${PN}-dev_libc-baremetal =3D ""
> +RDEPENDS_${PN}-dev_libc-newlib =3D ""
>
>  BBCLASSEXTEND =3D "nativesdk"
>
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

