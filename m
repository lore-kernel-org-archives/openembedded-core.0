Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 489666AECB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:49:27 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so2136941pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=g0tRZe98dPJEWI/+v+e+96+dLqEpcE0l7SDZtL5qG8Q=;
	b=hw9TDymf3iUJcolQs1P8Z7XZhJ+j1ZDyASAjgDfNakTI3TqUiAmnJ7jzMz9uV9UWSs
	35pLZCRfZGhRHytLnpLTo6Q0MbehKcb4DHzu6L88SGdsGS+qw1oUWv3042dy25JC9Il+
	9VLe15o2rmHbb4W5TUOa2n4rUDnj11n+8b00ZbMmwLsQ7oHKw34U8AU4teFQBr9Zul2Q
	fWADXZEB/XReKNX+VHRwE27DJ9dgvRXt37ra76P9Z0BD36wNJFW6ybJZYEO1ZP1qc5uW
	9q5z4usa/KrS+pk1h1rExNI71V10gXXtqjpds+cBaVBjoanJDlC2lsBVz5E4aqol5IVv
	8ScQ==
X-Received: by 10.66.2.101 with SMTP id 5mr885571pat.82.1372405768276;
	Fri, 28 Jun 2013 00:49:28 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id y9sm6887292pbb.46.2013.06.28.00.49.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 00:49:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1372043405-22668-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 28 Jun 2013 00:49:25 -0700
Message-Id: <9D7D34D4-8134-4B01-8C5A-B4C36C9FE734@gmail.com>
References: <1372043405-22668-1-git-send-email-raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [PATCH] libbsd: Add recipes for libbsd - utility functions from BSD systems
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
X-List-Received-Date: Fri, 28 Jun 2013 07:49:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping ?

On Jun 23, 2013, at 8:10 PM, Khem Raj <raj.khem@gmail.com> wrote:

> When building BSD programs this library provides common
> BSD functions that are missing on other OSes e.g. Linux
>=20
> This library is elemental for porting large set of BSD applications
> current consumer of this are in meta-networking/openbsd-netcat
> but once we have it in OE-Core more recipes depending on it in =
different layers
> can be added.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-support/libbsd/libbsd_0.5.2.bb |   19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 meta/recipes-support/libbsd/libbsd_0.5.2.bb
>=20
> diff --git a/meta/recipes-support/libbsd/libbsd_0.5.2.bb =
b/meta/recipes-support/libbsd/libbsd_0.5.2.bb
> new file mode 100644
> index 0000000..952f212
> --- /dev/null
> +++ b/meta/recipes-support/libbsd/libbsd_0.5.2.bb
> @@ -0,0 +1,19 @@
> +# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "This library provides useful functions commonly =
found on BSD systems, \
> +               and lacking on others like GNU systems, thus making it =
easier to port \
> +               projects with strong BSD origins, without needing to =
embed the same \
> +               code over and over again on each project."
> +
> +HOMEPAGE =3D "http://libbsd.freedesktop.org/wiki/"
> +LICENSE =3D "BSD-4-Clause & MIT"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D98a015f07e71239b058398054f506f07"
> +SECTION =3D "libs"
> +DEPENDS =3D ""
> +
> +SRC_URI =3D =
"http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "be8b2e0dc4614699834c49693574fd1a"
> +SRC_URI[sha256sum] =3D =
"5340cf67555a8d92e7652d96540a47986a26eeafb9a0a3e22d3b3e5701ebe23f"
> +
> +inherit autotools pkgconfig
> --=20
> 1.7.9.5
>=20


