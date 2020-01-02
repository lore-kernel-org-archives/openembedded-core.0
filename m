Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id A67E97FA0A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 16:45:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id t17so39591767eds.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jan 2020 08:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CmUdskpxH9rW/5v+hBs5PibQFRPtBb++x7T1GjYiTro=;
	b=OsLdO88/uD96EPkGEVW4TP6Jg5tMcXV/bs2i5Rcd8Z3ZBl9JyhpFpCU/WU3Vd2n3yj
	NeUtqOj5AqWgOHeDICucVfAMWQJpFK/Hi/HFwHaoqwavFOPxbIB3HS0Qi/DKrj68J8ls
	VubUd9lO+y3BdwZ1KCC3zOsQOsB2HSIKjGt4F8MB/X6S2K0AXTsAnpH/jj0K1c2vZxeL
	LYpALP9PAMGbvIYPBGMfZACOLbfS15HwHSHF+UyePIW4l3uHpAe5yK08/AbB9ge02E0f
	l7vupda0HJj1WMbjEEmUwvbWHgYOxVTqVxT3rLTbj5jl7kAR7LYHnjaiSWhtC/AUnL+d
	3Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CmUdskpxH9rW/5v+hBs5PibQFRPtBb++x7T1GjYiTro=;
	b=aJgl/j/wS6yTYnBTUmu2KHtFRH8XnbvZl91B9oduXL18IFMGTb7mqbCqjdQSGkGqc/
	yfXH2FY8TD19AvbaObpgWvhHRcm8GQTn0iILW4lhbx+q98b7hjF5ysjAGHARmVWhzYrV
	bWYoCPJu/p76bs/d9YLK8/K1IXfxEim2mBc7gP6ljWdZ9njadJ5yHDc1UOjKthUqmrgB
	s1EOWc8+ga3ATgmpn9mn6RQ1T1jcqytXILZzBcf7m5cBAxi8MTPJsR5EJbjOYHYyeXAn
	P6OrtMe8EQVyor4hkDc5QrdF8l3T6K61mkLih+5y2FynJmCFkrKmqWInlQ/TXZPyRmZG
	BAFA==
X-Gm-Message-State: APjAAAUysO+idWmWbkzgk6SlunaRDHyiA8c8UQMvk/G6pETCc0qipf1Y
	/TdpaeLePLEJhTvKySLiDI4WiWh0ZgXyOEM3gQRNRfqpwgs=
X-Google-Smtp-Source: APXvYqzB2YNOS6K+4ElEnCzCqrXgZDL4GbECXlGXqI0AKQ8UcmSXoJmMNbmf80ZrQtrNVfvwtkqMuuC23gdTOzl7nmA=
X-Received: by 2002:a17:906:5399:: with SMTP id
	g25mr90619814ejo.121.1577983506544; 
	Thu, 02 Jan 2020 08:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20200102131609.31991-1-sbabic@denx.de>
In-Reply-To: <20200102131609.31991-1-sbabic@denx.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Jan 2020 16:45:11 +0100
Message-ID: <CA+chaQden8D7wJr_yg4WWQsBDP4J59RoFe=gSVsYsZBWx43LGQ@mail.gmail.com>
To: Stefano Babic <sbabic@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Thu, 02 Jan 2020 16:45:07 -0000
Content-Type: multipart/alternative; boundary="0000000000005e7eb0059b2aea1c"

--0000000000005e7eb0059b2aea1c
Content-Type: text/plain; charset="UTF-8"

The summary says it's hardware independent and then the recipe sets:
PACKAGE_ARCH = "${MACHINE_ARCH}"

why is that?

On Thu, Jan 2, 2020 at 2:18 PM Stefano Babic <sbabic@denx.de> wrote:

> libubootenv is a replacement for u-boot-fw-utils. It is
> hardware-independent and provides fw_printenv and fw_setenv tools that
> are full compatible with the ones provided by U-Boot. A library is
> provided to access the environment from an own application.
> License is LGPL-2.1 and this allow to link the library to proprietary
> code. The user of the tools should install the configuration file
> "fw_env.config", as he is already used to with u-boot-fw-utils. The
> configuration file is compatible with u-boot-fw-utils.
>
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
>  meta/recipes-bsp/u-boot/libubootenv.inc    | 27 ++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/libubootenv_0.2.bb |  2 ++
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/libubootenv.inc
>  create mode 100644 meta/recipes-bsp/u-boot/libubootenv_0.2.bb
>
> diff --git a/meta/recipes-bsp/u-boot/libubootenv.inc
> b/meta/recipes-bsp/u-boot/libubootenv.inc
> new file mode 100644
> index 0000000000..87e15e5d79
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/libubootenv.inc
> @@ -0,0 +1,27 @@
> +SUMMARY = "U-Boot libraries and tools to access environment"
> +DEPENDS += "mtd-utils"
> +
> +DESCRIPTION = "This package contains tools and libraries to read \
> +and modify U-Boot environment. \
> +It provides a hardware-independent replacement for fw_printenv/setenv
> utilities \
> +provided by U-Boot"
> +
> +HOMEPAGE = "https://github.com/sbabic/libubootenv"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM =
> "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "libs"
> +
> +SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PROVIDES += "u-boot-fw-utils"
> +RPROVIDES_${PN} += "u-boot-fw-utils"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> new file mode 100644
> index 0000000000..96a60cbc4b
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
> @@ -0,0 +1,2 @@
> +require libubootenv.inc
> +SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005e7eb0059b2aea1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The summary says it&#39;s hardware independent and then th=
e recipe sets:<div>PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br></div><d=
iv><br></div><div>why is that?</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 2, 2020 at 2:18 PM Stefano =
Babic &lt;<a href=3D"mailto:sbabic@denx.de">sbabic@denx.de</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">libubootenv is a =
replacement for u-boot-fw-utils. It is<br>
hardware-independent and provides fw_printenv and fw_setenv tools that<br>
are full compatible with the ones provided by U-Boot. A library is<br>
provided to access the environment from an own application.<br>
License is LGPL-2.1 and this allow to link the library to proprietary<br>
code. The user of the tools should install the configuration file<br>
&quot;fw_env.config&quot;, as he is already used to with u-boot-fw-utils. T=
he<br>
configuration file is compatible with u-boot-fw-utils.<br>
<br>
Signed-off-by: Stefano Babic &lt;<a href=3D"mailto:sbabic@denx.de" target=
=3D"_blank">sbabic@denx.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/libubootenv.inc=C2=A0 =C2=A0 | 27 +++++++++++=
+++++++++++<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> |=C2=A0 2 ++<br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-bsp/u-boot/libubootenv.inc<br>
=C2=A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://libuboot=
env_0.2.bb" rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
<br>
diff --git a/meta/recipes-bsp/u-boot/libubootenv.inc b/meta/recipes-bsp/u-b=
oot/libubootenv.inc<br>
new file mode 100644<br>
index 0000000000..87e15e5d79<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/libubootenv.inc<br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;U-Boot libraries and tools to access environment&quot;<b=
r>
+DEPENDS +=3D &quot;mtd-utils&quot;<br>
+<br>
+DESCRIPTION =3D &quot;This package contains tools and libraries to read \<=
br>
+and modify U-Boot environment. \<br>
+It provides a hardware-independent replacement for fw_printenv/setenv util=
ities \<br>
+provided by U-Boot&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/sbabic/libubootenv" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/sbabic/libubootenv</a>=
&quot;<br>
+LICENSE =3D &quot;LGPL-2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://Licenses/lgpl-2.1.txt;md5=3D4fbd65380cdd=
255951079008b364516c&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/libubootenv;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/sbabic/libu=
bootenv;protocol=3Dhttps</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+EXTRA_OECMAKE =3D &quot;-DCMAKE_BUILD_TYPE=3DRelease&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+PROVIDES +=3D &quot;u-boot-fw-utils&quot;<br>
+RPROVIDES_${PN} +=3D &quot;u-boot-fw-utils&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libubootenv_0.2.bb</a> b/meta/recipes-=
bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libubootenv_0.2.bb</a><br>
new file mode 100644<br>
index 0000000000..96a60cbc4b<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://libubootenv_0.2.bb" rel=3D"=
noreferrer" target=3D"_blank">libubootenv_0.2.bb</a><br>
@@ -0,0 +1,2 @@<br>
+require libubootenv.inc<br>
+SRCREV =3D &quot;bf6ff631c0e38cede67268ceb8bf1383b5f8848e&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005e7eb0059b2aea1c--
