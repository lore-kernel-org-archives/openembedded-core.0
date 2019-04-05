Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 130147D5B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 07:39:55 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id q14so4610198edr.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 00:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=n0wnSAqhU3pqF9dx7W9ROMDsr10G8aJvbFEE+DvIQhI=;
	b=mseNbmg7ZWrjgvBxziBjMCscUw8Sw1TkUN1LnFGuaXdRFzZ/vt2p+NcenetJpxj72a
	hhrf7tE5vXeOEL8VNbzJL23KzOV5XWuIGkQPMNotNlmZ8BWs8GZ+cICgLIqs39zDzhwX
	PqWoST3tqUIU0zJcrpV2/scJHfR+6BjxtfCTTqHB8glGJkovGf1IZzlLxippuCcd7GaK
	DuUnsjJYct3E6+oXSaIHCC67JkCLoUDvOGZdp1VUSJFZTSUfMcYa3/Xqwe3Q6Md7aYwF
	fgmMx6b4adEINkemrizVKo0/rhV1o1GqTrK1WRDA4Tvu1KqMqZn4Wih/Z674bSMM3c4W
	Zplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=n0wnSAqhU3pqF9dx7W9ROMDsr10G8aJvbFEE+DvIQhI=;
	b=asxtnVDzUHSTYshFaPXgadzP10N8lgamxnqsQQsj2OsipfXaQPY0osjfm2sAAYdCE1
	HSQeffSHZZs4stxW+cPMd7+n2FB0OZNk1O8pg1xasN3xP5AAtPuGe0x+WoV1/pEAr9tb
	WqGoUxq2PH1B1Nby4DarjzXgxWsi1ralmGr0j0T/M6tKhn3befrfYWJ8uPW08OjeP4ZQ
	19UddlYFZW8P7wv7GoB3E77so9MHQy7UrKJtOLBInxZQaloUQd7gPTtlTRhjArxUJ4c3
	ZRer1IuFYr9DczQhOQ6odsDAGboTganlDcBEEckYtVe2UJmUzT7d5jOPx1my54Vkm7rJ
	ol9w==
X-Gm-Message-State: APjAAAUkW9Hyfz4xdAun18+CUSt/qEjkf+iB53EH18qa4mLr5Uoki3jl
	sfgFU3/SMBSWiNku/+NMHPA=
X-Google-Smtp-Source: APXvYqzKbjiSopAu0rLyS8wU4MqV6+hkSwofw3xnaF729JgBLLnv0j+YY8dEwhhYh7pJb8GbcaiKPQ==
X-Received: by 2002:aa7:dcca:: with SMTP id w10mr6887526edu.73.1554449996758; 
	Fri, 05 Apr 2019 00:39:56 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:e553:6a15:e853:9078?
	([2a02:8109:b5c0:1267:e553:6a15:e853:9078])
	by smtp.gmail.com with ESMTPSA id
	t31sm6387837edb.52.2019.04.05.00.39.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Apr 2019 00:39:55 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190405063736.29750-14-schnitzeltony@gmail.com>
Date: Fri, 5 Apr 2019 09:39:54 +0200
Message-Id: <B6580F15-9E30-4926-95F1-FB1906E9EEFC@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
	<20190405063736.29750-14-schnitzeltony@gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/13] gst-plugins: move 'inherit gobject-introspection' to recipes supporting GI
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
X-List-Received-Date: Fri, 05 Apr 2019 07:39:56 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks, looks good!

Alex

> On 5 Apr 2019, at 8.37, Andreas M=C3=BCller <schnitzeltony@gmail.com> wrot=
e:
>=20
> Now that whitelisting for unknown configure options was removed in
> gobject-introspection.bbclass gstreamer1.0-plugins-ugly/-good start compla=
ining
>=20
> | ERROR: gstreamer1.0-plugins-ugly-1.14.4-r0 do_configure: QA Issue: gstre=
amer1.0-plugins-ugly: configure was passed unrecognised options: --enable-in=
trospection [unknown-configure-option]
> | ERROR: gstreamer1.0-plugins-good-1.14.4-r0 do_configure: QA Issue: gstre=
amer1.0-plugins-good: configure was passed unrecognised options: --enable-in=
trospection [unknown-configure-option]
>=20
> So let only those gst-plugin recipes inherit gobject-introspection whose s=
ources
> support GI.
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> .../gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb                | 2 +-
> .../gstreamer/gstreamer1.0-plugins-base_1.14.4.bb               | 2 +-
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
> 3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.=
14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.=
bb
> index 4987be865b..23d093d47c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb=

> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb=

> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73a5855a8119d=
eb017f5f13cf327095d \
>=20
> DEPENDS +=3D "gstreamer1.0-plugins-base"
>=20
> -inherit gettext bluetooth
> +inherit gettext bluetooth gobject-introspection
>=20
> PACKAGECONFIG ??=3D " \
>     ${GSTREAMER_ORC} \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.=
4.bb
> index 12c9bbce9d..f3e6daf564 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14.4.b=
b
> @@ -28,7 +28,7 @@ S =3D "${WORKDIR}/gst-plugins-base-${PV}"
>=20
> DEPENDS +=3D "iso-codes util-linux"
>=20
> -inherit gettext
> +inherit gettext gobject-introspection
>=20
> PACKAGES_DYNAMIC =3D+ "^libgst.*"
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> index 5906e4ad36..bc24b05fec 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> @@ -7,7 +7,7 @@ DEPENDS =3D "gstreamer1.0 glib-2.0-native"
>=20
> SRC_URI_append =3D " file://gtk-doc-tweaks.patch"
>=20
> -inherit autotools pkgconfig upstream-version-is-even gobject-introspectio=
n gtk-doc
> +inherit autotools pkgconfig upstream-version-is-even gtk-doc
>=20
> acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
>=20
> --=20
> 2.20.1
>=20

