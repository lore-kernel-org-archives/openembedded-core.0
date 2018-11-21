Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95E3C6C4F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 22:19:06 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c126so7251512wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 14:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hzqk7/2mRbEZNJ9K9znLjEb0giiKer0SQluBkx5aIAI=;
	b=rgOfbC3EzbxmQVgXfUxkt8krQcK362kFy4/9XGYQlkqAP5VAOoPZ+OtR5zJLYnQ1UO
	LRNgkAN+plEePFKVo6XYUpoGe52dCkLwkHxKmLnSAqeOudD16LNyHa6facIl3NIN6Gan
	BanqpccOgp3paDL/9aG6L6yKhCPqeulI/Gah+qvU2XGRblCD+yxNl2tBKPGXQoSsiAyp
	Vx56M85GR7CUhE15jOD2VGbUP1WJZ5Yr0E0Jb3oOPE8hohdJIIiHbyabQMFV51Mj35zB
	3WYZj6rHRNubzh27mvMtagNzBIaUbm8DtouSaPXC+uIL3V9SAVP/k5czMmsFM0xKy6Lf
	g9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hzqk7/2mRbEZNJ9K9znLjEb0giiKer0SQluBkx5aIAI=;
	b=pM2GUngR9d7PYK/njea4ofr0ElQ7i6JS11NYNlrHmFEHMrpldNnwKLn7GazEV4upEx
	3XncpZOzKGO7InnNEp3XojzCUsuokC5u7S3YrhQ2dD2E23SjzPjvKt/fMeLreUDmkPxT
	wZ7nK6mRr3730BUdPtA98n+YB6Y2iNAnya7NoH7HEqb3PjJlA7DsINW9cWd7/jMuFUTG
	DE7HoqHVYXp66TvVHN+ghdNtayQVO2zWJnOjPL8yqhIprQDOtzM6y1qB2XK6oKQGDcE/
	VT+1iSgIIQ/188k4lWorx2KoGF4ccHvv+2Y1oBKvGgd/x8/Uqi50N3wyOriWg6pqsepj
	AkBQ==
X-Gm-Message-State: AGRZ1gKd9OkPqqEzHEv5UhTsofZqmNQt7D/5YIq3Zil10Pyim5YLshMw
	XmmXqZMmANZDc0fOS0VXjim0LB1OV4mhyvz1W8g=
X-Google-Smtp-Source: AJdET5eMIjw6rEyzfSvBYNEpNR9+MXvD87hMAJ/O/EH10ZlKypzJ6e3Nxy84wBBMxsn0r97Gmooq/GRIij8KubxT0VU=
X-Received: by 2002:a1c:3489:: with SMTP id b131mr6722963wma.44.1542838747038; 
	Wed, 21 Nov 2018 14:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20181121220731.42722-1-abrodkin@synopsys.com>
In-Reply-To: <20181121220731.42722-1-abrodkin@synopsys.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Nov 2018 23:18:55 +0100
Message-ID: <CA+chaQcWnkWZ1beuyuAojJwF3OgSKaKvGvxjRvU7Mq0--igBRw@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Wed, 21 Nov 2018 22:19:07 -0000
Content-Type: multipart/alternative; boundary="000000000000768a9d057b3423b7"

--000000000000768a9d057b3423b7
Content-Type: text/plain; charset="UTF-8"

You'll need to add:

ALLOW_EMPTY_${PN} = "1"
FILES_${PN} = ""
FILES_${PN}-mkimage = "${bindir}/mkimage"
FILES_${PN}-mkenvimage = "${bindir}/mkenvimage"

RDEPENDS_${PN}-mkimage += "dtc"
RDEPENDS_${PN} += "${PN}-mkimage ${PN}-mkenvimage"

And remove the current  RDEPENDS_${PN} += "dtc".

To package this correctly, right now everything ends in ${PN}, so the
PACKAGES and RREPLACES/RPROVIDES/RCONFLICTS aren't really used.


On Wed, Nov 21, 2018 at 11:07 PM Alexey Brodkin <alexey.brodkin@synopsys.com>
wrote:

> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
>
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
>
> [1]
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>
> Changes v4 -> v5:
>  * Added backward compatibility with "u-boot-mkimage" recipe
>  * Improved handling of nativesdk
>  * Update all references from "u-boot-mkimage" to "u-boot-tools"
>
> Changes v3 -> v4:
>  * Updated maintainer info to make Yocto autobuilder happy again
>
> Changes v2 -> v3:
>  * Recipe renamed to "u-boot-tools" to better match its contents
>    (especially in the future as we add more tools there)
>  * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
>    made avaialble via PROVIDES
>
> Changes v1 -> v2:
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipe
>
>  meta/classes/image_types.bbclass                       |  2 +-
>  meta/classes/kernel-fitimage.bbclass                   |  2 +-
>  meta/classes/kernel-uimage.bbclass                     |  2 +-
>  meta/conf/distro/include/distro_alias.inc              |  2 +-
>  meta/conf/distro/include/maintainers.inc               |  2 +-
>  ...boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} | 18
> +++++++++++++++++-
>  6 files changed, 22 insertions(+), 6 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb =>
> u-boot-tools_2018.07.bb} (66%)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 05e5b0a2e0..5c406481ef 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -308,7 +308,7 @@ CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
> -CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
> +CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
>  CONVERSION_DEPENDS_vmdk = "qemu-native"
>  CONVERSION_DEPENDS_vdi = "qemu-native"
>  CONVERSION_DEPENDS_qcow2 = "qemu-native"
> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 4c4fd99ff4..328bef4069 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -4,7 +4,7 @@ python __anonymous () {
>      kerneltypes = d.getVar('KERNEL_IMAGETYPES') or ""
>      if 'fitImage' in kerneltypes.split():
>          depends = d.getVar("DEPENDS")
> -        depends = "%s u-boot-mkimage-native dtc-native" % depends
> +        depends = "%s u-boot-tools-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>
>          uarch = d.getVar("UBOOT_ARCH")
> diff --git a/meta/classes/kernel-uimage.bbclass
> b/meta/classes/kernel-uimage.bbclass
> index c2de6bb40d..cedb4fa070 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -3,7 +3,7 @@ inherit kernel-uboot
>  python __anonymous () {
>      if "uImage" in d.getVar('KERNEL_IMAGETYPES'):
>          depends = d.getVar("DEPENDS")
> -        depends = "%s u-boot-mkimage-native" % depends
> +        depends = "%s u-boot-tools-native" % depends
>          d.setVar("DEPENDS", depends)
>
>          # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
> diff --git a/meta/conf/distro/include/distro_alias.inc
> b/meta/conf/distro/include/distro_alias.inc
> index 7502542e89..f23db1e8a4 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -354,7 +354,7 @@ DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=
> http://www.xiph.org/vorbis/"
>  DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera
> Ubuntu=ttf-bitstream-vera"
>  DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
>  DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools
> Debian=u-boot-tools"
> -DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage
> Debian=uboot-mkimage"
> +DISTRO_PN_ALIAS_pn-u-boot-tools = "Ubuntu=u-boot-tools Debian=uboot-tools"
>  DISTRO_PN_ALIAS_pn-udev = "Mandriva=udev Fedora=udev"
>  DISTRO_PN_ALIAS_pn-udev-extraconf = "OE-Core"
>  DISTRO_PN_ALIAS_pn-unfs3 = "Debian=unfs3 Fedora=unfs3"
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 0889c1c429..825c24a3f8 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -654,7 +654,7 @@ RECIPE_MAINTAINER_pn-tzcode-native = "Armin Kuster <
> akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-tzdata = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-u-boot = "Marek Vasut <marek.vasut@gmail.com>"
>  RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Marek Vasut <
> marek.vasut@gmail.com>"
> -RECIPE_MAINTAINER_pn-u-boot-mkimage = "Marek Vasut <marek.vasut@gmail.com
> >"
> +RECIPE_MAINTAINER_pn-u-boot-tools = "Marek Vasut <marek.vasut@gmail.com>"
>  RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@intel.com
> >"
>  RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@intel.com>"
>  RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> similarity index 66%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> index 08bff1d161..089b893449 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> @@ -1,8 +1,18 @@
>  require u-boot-common_${PV}.inc
>
> -SUMMARY = "U-Boot bootloader image creation tool"
> +SUMMARY = "U-Boot bootloader tools"
>  DEPENDS += "openssl"
>
> +PROVIDES = "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
> +PROVIDES_class-native = "u-boot-mkimage-native u-boot-mkenvimage-native"
> +
> +PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"
> +
> +# Required for backward compatibility with "u-boot-mkimage-xxx.bb"
> +RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
> +RREPLACES_${PN}-mkimage = "u-boot-mkimage"
> +RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
> +
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
>  EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
> @@ -20,8 +30,14 @@ do_compile () {
>
>  do_install () {
>         install -d ${D}${bindir}
> +
> +       # mkimage
>         install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>         ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +
> +       # mkenvimage
> +       install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> +       ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
>  }
>
>  RDEPENDS_${PN} += "dtc"
> --
> 2.16.2
>
>

--000000000000768a9d057b3423b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;ll need to add:<div><br></div><div>ALLOW_EMPTY_${P=
N} =3D &quot;1&quot;</div><div>FILES_${PN} =3D &quot;&quot;</div><div>FILES=
_${PN}-mkimage =3D &quot;${bindir}/mkimage&quot;</div><div>FILES_${PN}-mken=
vimage=C2=A0=3D &quot;${bindir}/mkenvimage&quot;<br></div><div><br></div><d=
iv>RDEPENDS_${PN}-mkimage=C2=A0+=3D &quot;dtc&quot;</div><div>RDEPENDS_${PN=
} +=3D &quot;${PN}-mkimage ${PN}-mkenvimage&quot;</div><div><br></div><div>=
And remove the current=C2=A0 RDEPENDS_${PN} +=3D &quot;dtc&quot;.</div><div=
><br></div><div>To package this correctly, right now everything ends in ${P=
N}, so the PACKAGES and RREPLACES/RPROVIDES/RCONFLICTS aren&#39;t really us=
ed.</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Wed, Nov 21, 2018 at 11:07 PM Alexey Brodkin &lt;<a href=3D"mailto:al=
exey.brodkin@synopsys.com">alexey.brodkin@synopsys.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">This utility is used for creation of ima=
ges containing<br>
usable in run-time U-Boot environment.<br>
<br>
As of today this utility is added per-board like here [1]<br>
for Intel Edison board.<br>
<br>
[1] <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/=
tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb" rel=
=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi=
/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-too=
ls_2014.04.bb</a><br>
<br>
Given there&#39;re quite some U-Boot tools that we may want to add later<br=
>
this recipe name switch from &quot;u-boot-mkimage&quot; to generic &quot;u-=
boot-tools&quot;<br>
still for compatibility we provide &quot;u-boot-mkimage&quot; with help<br>
of PROVIDES as well as proposed &quot;u-boot-mkenvimage&quot;.<br>
<br>
Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com" =
target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
Cc: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br" target=
=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_b=
lank">martin.jansa@gmail.com</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;<br>
Cc: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_blank">mare=
x@denx.de</a>&gt;<br>
---<br>
<br>
Changes v4 -&gt; v5:<br>
=C2=A0* Added backward compatibility with &quot;u-boot-mkimage&quot; recipe=
<br>
=C2=A0* Improved handling of nativesdk<br>
=C2=A0* Update all references from &quot;u-boot-mkimage&quot; to &quot;u-bo=
ot-tools&quot;<br>
<br>
Changes v3 -&gt; v4:<br>
=C2=A0* Updated maintainer info to make Yocto autobuilder happy again<br>
<br>
Changes v2 -&gt; v3:<br>
=C2=A0* Recipe renamed to &quot;u-boot-tools&quot; to better match its cont=
ents<br>
=C2=A0 =C2=A0(especially in the future as we add more tools there)<br>
=C2=A0* Existing &quot;u-boot-mkimage&quot; and newly introduced &quot;u-bo=
ot-mkenvimage&quot;<br>
=C2=A0 =C2=A0made avaialble via PROVIDES<br>
<br>
Changes v1 -&gt; v2:<br>
=C2=A0* Got rid of a separate recipe and instead added mkenvimage<br>
=C2=A0 =C2=A0to u-boot mkimage recipe<br>
<br>
=C2=A0meta/classes/image_types.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/conf/distro/include/distro_alias.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://boot-mkimage_2018.07.bb" rel=3D"noreferrer" targ=
et=3D"_blank">boot-mkimage_2018.07.bb</a> =3D&gt; <a href=3D"http://u-boot-=
tools_2018.07.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2018.07=
.bb</a>} | 18 +++++++++++++++++-<br>
=C2=A06 files changed, 22 insertions(+), 6 deletions(-)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2018=
.07.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.07.bb</a> =
=3D&gt; <a href=3D"http://u-boot-tools_2018.07.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-boot-tools_2018.07.bb</a>} (66%)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 05e5b0a2e0..5c406481ef 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -308,7 +308,7 @@ CONVERSION_DEPENDS_lzo =3D &quot;lzop-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_zip =3D &quot;zip-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_sum =3D &quot;mtd-utils-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_bmap =3D &quot;bmap-tools-native&quot;<br>
-CONVERSION_DEPENDS_u-boot =3D &quot;u-boot-mkimage-native&quot;<br>
+CONVERSION_DEPENDS_u-boot =3D &quot;u-boot-tools-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_vmdk =3D &quot;qemu-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_vdi =3D &quot;qemu-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_qcow2 =3D &quot;qemu-native&quot;<br>
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fit=
image.bbclass<br>
index 4c4fd99ff4..328bef4069 100644<br>
--- a/meta/classes/kernel-fitimage.bbclass<br>
+++ b/meta/classes/kernel-fitimage.bbclass<br>
@@ -4,7 +4,7 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0kerneltypes =3D d.getVar(&#39;KERNEL_IMAGETYPES&#39;) o=
r &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0if &#39;fitImage&#39; in kerneltypes.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D d.getVar(&quot;DEPENDS&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-native dtc=
-native&quot; % depends<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-tools-native dtc-n=
ative&quot; % depends<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;=
)<br>
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimag=
e.bbclass<br>
index c2de6bb40d..cedb4fa070 100644<br>
--- a/meta/classes/kernel-uimage.bbclass<br>
+++ b/meta/classes/kernel-uimage.bbclass<br>
@@ -3,7 +3,7 @@ inherit kernel-uboot<br>
=C2=A0python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0if &quot;uImage&quot; in d.getVar(&#39;KERNEL_IMAGETYPE=
S&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D d.getVar(&quot;DEPENDS&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-native&quo=
t; % depends<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-tools-native&quot;=
 % depends<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Override KERNEL_IMAGETYPE_FOR_MAKE vari=
able, which is internal<br>
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/i=
nclude/distro_alias.inc<br>
index 7502542e89..f23db1e8a4 100644<br>
--- a/meta/conf/distro/include/distro_alias.inc<br>
+++ b/meta/conf/distro/include/distro_alias.inc<br>
@@ -354,7 +354,7 @@ DISTRO_PN_ALIAS_pn-tremor =3D &quot;OSPDT upstream=3D<a=
 href=3D"http://www.xiph.org/vorbis/" rel=3D"noreferrer" target=3D"_blank">=
http://www.xiph.org/vorbis/</a>&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-ttf-bitstream-vera =3D &quot;Debian=3Dttf-bitstrea=
m-vera Ubuntu=3Dttf-bitstream-vera&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-tzcode =3D &quot;OSPDT&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-u-boot-fw-utils =3D &quot;Ubuntu=3Du-boot-tools De=
bian=3Du-boot-tools&quot;<br>
-DISTRO_PN_ALIAS_pn-u-boot-mkimage =3D &quot;Ubuntu=3Duboot-mkimage Debian=
=3Duboot-mkimage&quot;<br>
+DISTRO_PN_ALIAS_pn-u-boot-tools =3D &quot;Ubuntu=3Du-boot-tools Debian=3Du=
boot-tools&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-udev =3D &quot;Mandriva=3Dudev Fedora=3Dudev&quot;=
<br>
=C2=A0DISTRO_PN_ALIAS_pn-udev-extraconf =3D &quot;OE-Core&quot;<br>
=C2=A0DISTRO_PN_ALIAS_pn-unfs3 =3D &quot;Debian=3Dunfs3 Fedora=3Dunfs3&quot=
;<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 0889c1c429..825c24a3f8 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -654,7 +654,7 @@ RECIPE_MAINTAINER_pn-tzcode-native =3D &quot;Armin Kust=
er &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-tzdata =3D &quot;Armin Kuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER_pn-u-boot =3D &quot;Marek Vasut &lt;<a href=3D"mail=
to:marek.vasut@gmail.com" target=3D"_blank">marek.vasut@gmail.com</a>&gt;&q=
uot;<br>
=C2=A0RECIPE_MAINTAINER_pn-u-boot-fw-utils =3D &quot;Marek Vasut &lt;<a hre=
f=3D"mailto:marek.vasut@gmail.com" target=3D"_blank">marek.vasut@gmail.com<=
/a>&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-u-boot-mkimage =3D &quot;Marek Vasut &lt;<a href=3D"m=
ailto:marek.vasut@gmail.com" target=3D"_blank">marek.vasut@gmail.com</a>&gt=
;&quot;<br>
+RECIPE_MAINTAINER_pn-u-boot-tools =3D &quot;Marek Vasut &lt;<a href=3D"mai=
lto:marek.vasut@gmail.com" target=3D"_blank">marek.vasut@gmail.com</a>&gt;&=
quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-udev-extraconf =3D &quot;Ross Burton &lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-unfs3 =3D &quot;Ross Burton &lt;<a href=3D"mailt=
o:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&qu=
ot;<br>
=C2=A0RECIPE_MAINTAINER_pn-unifdef =3D &quot;Ross Burton &lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;&=
quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.=
07.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.07.bb</a> b=
/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2018.07.bb" rel=3D"=
noreferrer" target=3D"_blank">u-boot-tools_2018.07.bb</a><br>
similarity index 66%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.0=
7.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.07.bb</a><br=
>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2018.07.bb=
" rel=3D"noreferrer" target=3D"_blank">u-boot-tools_2018.07.bb</a><br>
index 08bff1d161..089b893449 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2018.07.bb" =
rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage_2018.07.bb</a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-tools_2018.07.bb" re=
l=3D"noreferrer" target=3D"_blank">u-boot-tools_2018.07.bb</a><br>
@@ -1,8 +1,18 @@<br>
=C2=A0require u-boot-common_${PV}.inc<br>
<br>
-SUMMARY =3D &quot;U-Boot bootloader image creation tool&quot;<br>
+SUMMARY =3D &quot;U-Boot bootloader tools&quot;<br>
=C2=A0DEPENDS +=3D &quot;openssl&quot;<br>
<br>
+PROVIDES =3D &quot;${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage&=
quot;<br>
+PROVIDES_class-native =3D &quot;u-boot-mkimage-native u-boot-mkenvimage-na=
tive&quot;<br>
+<br>
+PACKAGES +=3D &quot;${PN}-mkimage ${PN}-mkenvimage&quot;<br>
+<br>
+# Required for backward compatibility with &quot;<a href=3D"http://u-boot-=
mkimage-xxx.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-mkimage-xxx.bb<=
/a>&quot;<br>
+RPROVIDES_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br>
+RREPLACES_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br>
+RCONFLICTS_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br>
+<br>
=C2=A0EXTRA_OEMAKE_class-target =3D &#39;CROSS_COMPILE=3D&quot;${TARGET_PRE=
FIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BUI=
LD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
=C2=A0EXTRA_OEMAKE_class-native =3D &#39;CC=3D&quot;${BUILD_CC} ${BUILD_CFL=
AGS} ${BUILD_LDFLAGS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BU=
ILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
=C2=A0EXTRA_OEMAKE_class-nativesdk =3D &#39;CROSS_COMPILE=3D&quot;${HOST_PR=
EFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BU=
ILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
@@ -20,8 +30,14 @@ do_compile () {<br>
<br>
=C2=A0do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# mkimage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 tools/mkimage ${D}${bindir}/ubo=
ot-mkimage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# mkenvimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 tools/mkenvimage ${D}${bindir}/=
uboot-mkenvimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimag=
e<br>
=C2=A0}<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;dtc&quot;<br>
-- <br>
2.16.2<br>
<br>
</blockquote></div>

--000000000000768a9d057b3423b7--
