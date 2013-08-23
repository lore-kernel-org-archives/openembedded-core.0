Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 799856065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 16:57:54 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf1so903496pab.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=RIBkFTyU+HB0x6Lu0X2lkgD3/O/1yS74JXeuDdAFoAo=;
	b=NJ6u0S9MMS+F3tQwuJMzYWH+ejeefyiU6WIMZL89VMm/i7rFy3z4bVRynar5OGstZv
	WgoNkB/8s0XVuoRGhQ3wzaEQXh6eH2QF/G34hl7WTWYdRBaaixQg5QlHuNKek3Dw35wy
	o+C2s1N3vX36Lz4to/ZeV0YfUHKXh3wLPsCcWUUdmPIWP0bAAANRjS3pCg9OA/wg+Zyg
	5HxIy73vHBY0tHReyJHv5ewT4OY6NL3UQoUFnm608GfJQc9aVZTpt3r8tYUrzGl44FzJ
	9g+jlkr1J7ntIoFm0cks6SVK+30Y/f94MCngVWFixK/bhdy+2orMFdrmknWhYDdb53hp
	8wfw==
X-Gm-Message-State: ALoCoQkhmQmmw8bltUM9UFpKVJcKP1as0jOKbJKS3HngMgx4jbDleSqXV2mJbjUXjzX3GkUEu+1k
MIME-Version: 1.0
X-Received: by 10.66.118.204 with SMTP id ko12mr3028852pab.184.1377277074888; 
	Fri, 23 Aug 2013 09:57:54 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Fri, 23 Aug 2013 09:57:54 -0700 (PDT)
In-Reply-To: <1377251290-4290-1-git-send-email-lpapp@kde.org>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
Date: Fri, 23 Aug 2013 17:57:54 +0100
X-Google-Sender-Auth: essAaoJEY0fayeUBUorMZtDsTXs
Message-ID: <CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Fri, 23 Aug 2013 16:57:55 -0000
Content-Type: multipart/alternative; boundary=e89a8ffbaa2bce6cfb04e4a04e2a

--e89a8ffbaa2bce6cfb04e4a04e2a
Content-Type: text/plain; charset=ISO-8859-1

Any update? It would be nice not to miss the freeze ... ;-)


On Fri, Aug 23, 2013 at 10:48 AM, Laszlo Papp <lpapp@kde.org> wrote:

> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27
> +++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23
> +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bbb/meta/recipes-bsp/u-boot/
> u-boot-mkimage_2013.07.bb
> new file mode 100644
> index 0000000..0108e00
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "U-boot bootloader mkimage tool"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +
>  file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +SECTION = "bootloader"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
> +SRC_URI[sha256sum] =
> "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}"
> HOSTSTRIP=true'
> +
> +do_compile () {
> +  oe_runmake tools
> +}
> +
> +do_install () {
> +  install -d ${D}${bindir}
> +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +}
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bbb/meta/recipes-bsp/u-boot/
> u-boot_2013.07.bb
> new file mode 100644
> index 0000000..f3f4b62
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> @@ -0,0 +1,23 @@
> +require u-boot.inc
> +
> +# To build u-boot for your machine, provide the following lines in your
> machine
> +# config, replacing the assignments as appropriate for your machine.
> +# UBOOT_MACHINE = "omap3_beagle_config"
> +# UBOOT_ENTRYPOINT = "0x80008000"
> +# UBOOT_LOADADDRESS = "0x80008000"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +
>  file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> +
> +# This revision corresponds to the tag "v2013.07"
> +# We use the revision in order to avoid having to fetch it from the repo
> during parse
> +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> +
> +PV = "v2013.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> --
> 1.8.3.4
>
>

--e89a8ffbaa2bce6cfb04e4a04e2a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any update? It would be nice not to miss the freeze ... ;-=
)</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri=
, Aug 23, 2013 at 10:48 AM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<b=
r>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">Signed-off-by: Laszlo Papp=
 &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt;<br>
---<br>
</div>=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.b=
b" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> | 27 +++++++++++++++++++=
++++<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=3D"_=
blank">u-boot_2013.07.bb</a> =A0 =A0 =A0 =A0 | 23 +++++++++++++++++++<br>
=A02 files changed, 50 insertions(+)<br>
=A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkim=
age_2013.07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
=A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013=
.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.=
07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> b/meta/recipes-bsp/u=
-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" target=3D"_blank">u-boot=
-mkimage_2013.07.bb</a><br>

new file mode 100644<br>
index 0000000..0108e00<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" =
target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
@@ -0,0 +1,27 @@<br>
+DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
+SECTION =3D &quot;bootloader&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar=
.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2</=
a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;8445162690052e6afd4b8f87af2bb557&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2bbd440c1b29928d230604eac372fda5152d3ae23f52b=
1910c77fc5bf531250b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}&quot=
; HOSTLDFLAGS=3D&quot;${LDFLAGS}&quot; HOSTSTRIP=3Dtrue&#39;<br>
+<br>
+do_compile () {<br>
+ =A0oe_runmake tools<br>
+}<br>
+<br>
+do_install () {<br>
+ =A0install -d ${D}${bindir}<br>
+ =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
+ =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
+}<br>
+<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">diff --git a/meta/recip=
es-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=3D"_blank">u-boot=
_2013.07.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.=
bb" target=3D"_blank">u-boot_2013.07.bb</a><br>

new file mode 100644<br>
index 0000000..f3f4b62<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=
=3D"_blank">u-boot_2013.07.bb</a><br>
@@ -0,0 +1,23 @@<br>
+require u-boot.inc<br>
+<br>
+# To build u-boot for your machine, provide the following lines in your ma=
chine<br>
+# config, replacing the assignments as appropriate for your machine.<br>
+# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
+# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
+# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
+<br>
+# This revision corresponds to the tag &quot;v2013.07&quot;<br>
+# We use the revision in order to avoid having to fetch it from the repo d=
uring parse<br>
+SRCREV =3D &quot;62c175fbb8a0f9a926c88294ea9f7e88eb898f6c&quot;<br>
+<br>
+PV =3D &quot;v2013.07+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
--<br>
1.8.3.4<br>
<br>
</div></div></blockquote></div><br></div>

--e89a8ffbaa2bce6cfb04e4a04e2a--
