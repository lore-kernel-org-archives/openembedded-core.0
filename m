Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865DACCF2C5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:44:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31719.1768812254398559643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tuIDRpF3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7EDC74E42178;
	Mon, 19 Jan 2026 08:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F68B60731;
	Mon, 19 Jan 2026 08:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D15310B69795;
	Mon, 19 Jan 2026 09:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768812251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=liWe0RBBb6muNjtjBaRkSuQ3uBuWhQkfk/p2Fu8xWlM=;
	b=tuIDRpF3IrSLZsFCZ7dHnPgWgx2ZI6Ya7udDohvn4S84gzUBDWuhbEesn7FtbjwGW5BvyR
	HHnENONIReIbvAKWOSUDLDRbr7PdLSEoPHieZSqMPMFCnTJ/7cV8WzysWHhTFCe9qeG+wi
	MgVO70IK02eaHa8vijwNBnS/f3YBI4U1SlNaC89XSuk9hS4zdpx0ds+t4z9uyv9d+rydKK
	oYeBM/n70p8kRWI8/yBfRHuYpO0ML9ZAbh50Bk4MElwqpgPDHBJCqZj/RojKWp+7bftJPX
	EQHa08ygjRD02eeHuUJyH8oZBgPlpDvn2uh4ZOqYtxoMxgIIkWapbKEoWS0izw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 09:44:09 +0100
Message-Id: <DFSFM1N0VE78.3VSI0XQ6PSXXJ@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2 v2] blueprint-compiler: add recipe
Cc: <liuyd.fnst@fujitsu.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <yi.zhao@eng.windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20260116090121.2432867-1-yi.zhao@windriver.com>
In-Reply-To: <20260116090121.2432867-1-yi.zhao@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 08:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229595

Hi,

On Fri Jan 16, 2026 at 10:01 AM CET, Yi Zhao via lists.openembedded.org wro=
te:
> Blueprint-compiler is a markup language and compiler for GTK 4 user
> interfaces.
>
> Move it from meta-openembedded to openembedded-core as it is required by
> epiphany 49.2.
>
> The original author Liu Yiding, is willing to continue maintaining the
> recipe. Add him as maintainer for this.
>
> CC: Liu Yiding <liuyd.fnst@fujitsu.com>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/conf/distro/include/maintainers.inc         |  1 +
>  .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compi=
ler_0.18.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index e830648945..b231daf485 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <=
raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
>  RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
> +RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <liuyd.fnst@fuji=
tsu.com>"
>  RECIPE_MAINTAINER:pn-bluez5 =3D "Unassigned <unassigned@yoctoproject.org=
>"
>  RECIPE_MAINTAINER:pn-bmaptool =3D "Trevor Woerner <twoerner@gmail.com>"
>  RECIPE_MAINTAINER:pn-boost =3D "Unassigned <unassigned@yoctoproject.org>=
"
> diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.1=
8.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
> new file mode 100644
> index 0000000000..10ac93d452
> --- /dev/null
> +++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A markup language for GTK user interface files."
> +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/blueprint-compiler"
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
> +
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=3D=
https;branch=3Dmain;tag=3D${PV}"
> +SRCREV =3D "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
> +
> +inherit meson pkgconfig
> +
> +PACKAGES +=3D "${PN}-python"
> +
> +FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
> +RDEPENDS:${PN}-python =3D "python3-pygobject"
> +
> +BBCLASSEXTEND =3D "native"

This failed to build:

ERROR: blueprint-compiler-0.18.0-r0 do_package: QA Issue: blueprint-compile=
r: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.14
  /usr/lib/python3.14/site-packages
  /usr/lib/python3.14/site-packages/blueprintcompiler
  /usr/lib/python3.14/site-packages/blueprintcompiler/formatter.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/decompiler.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/interactive_port.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/__init__.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/errors.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/gir.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/main.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/ast_utils.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/utils.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/reference_docs.json
  /usr/lib/python3.14/site-packages/blueprintcompiler/completions_utils.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/parse_tree.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/tokenizer.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/typelib.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/lsp_utils.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/parser.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/completions.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/xml_reader.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/lsp.py

Log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4986196/raw_=
inline
Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/b=
uilds/2884

It only seemed to happen with the qemux86-64 builds.

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


