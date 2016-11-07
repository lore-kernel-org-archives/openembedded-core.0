Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B74171988
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 20:43:56 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 51so130188419uai.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 12:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rIpe+c1Z64QkyZZgD01HqZP77FhT2j0MeYe2T77aLwA=;
	b=X7h12BjWOeIcr+gHuc18gr761+fO8LOfXIIoa9XvPRjj9Oe4QLya7tb/IEbkSN0tku
	CLDWnEk+MHCxIA5p9QOEjpGSn7fDdahUb2RcpOJd/19yh9IoRt8WtECB4zteFxepYviS
	PlNUWmMBH79SdlUqtYuhP2Tl5RwO6LlSGqU2f4/yNRDO5RbT+dmYyZGaDy90EyG7Fa+M
	SuQJoQONLKb3L4YhaITI9ksfYPMBvoZCJMPS52YpPRkfS5WynFEq0zOnxzPTEG/fvhpb
	3tjD3aN2u3KjycHDco3mE4gIFjdVHN9rag6bHC1imSzkjPLvC80bpYhbsElckwGHe7cB
	RkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rIpe+c1Z64QkyZZgD01HqZP77FhT2j0MeYe2T77aLwA=;
	b=EH4TQgGXnyaatqWuG/m2TxqmsPXflm0mV6UVljjssYoXNa+rHrvHyOriJb5RnQgLik
	A+MJduehAHCY8icb67cOmP4gb/8aoNJZemcfe8WS6VsgYy0m0KIiXRlqIWQinSJOEpVS
	B0e26x9CaR8NrSW0yUEuC53U6jhVyxvKfLKhQY3txuF3Pwb4FxReV8c4e5oqmveU/B/I
	KT5N8oRrxosfVM13Jj1XwU1iyez60FbxtCJUPhexRW+4PKFaHoR8C5q5Y7rUNd0hnNr8
	24Nd+wh8Mni75271/mnHNDCIOswoQGjjj37mry8sG0nJKC98/ZbsChENqzGuxQhDHas7
	J2tA==
X-Gm-Message-State: ABUngvdgu6RhlJ4A+MBE4CNN3XvwcKw3kKTBGzAWmNxO0bnI0B0BoY8NILKdrzt4TlKPHFGArgQ+AUezP9Y1PEEr
X-Received: by 10.159.38.52 with SMTP id 49mr5188400uag.14.1478551438360; Mon,
	07 Nov 2016 12:43:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.87.91 with HTTP; Mon, 7 Nov 2016 12:43:28 -0800 (PST)
In-Reply-To: <20161107182006.4207-1-marex@denx.de>
References: <20161107182006.4207-1-marex@denx.de>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 7 Nov 2016 22:43:28 +0200
Message-ID: <CAHiDW_Gynj2f6ByeSwYe61S8kQ_q8BiAG9Ng2d8BzQ-KNwH=EA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Mon, 07 Nov 2016 20:43:58 -0000
Content-Type: multipart/alternative; boundary=001a1141b912441aec0540bc1590

--001a1141b912441aec0540bc1590
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 20:20, Marek Vasut <marex@denx.de> wrote:

> The build failed on qemux86-64 because it couldn't execute
> tools/bin2header on a host due to it being compiled with target
> toolchain. Drop the incorrect EXTRA_OEMAKE, U-Boot Kbuild/Kconfig
> respects the flags from OE. Moreover, since U-Boot buildsystem
> already strips the tools, add INSANE_SKIP = "already-stripped" .
>

The INSANE_SKIP mentioned here is no longer included in the patch.


Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> index 5025961..8adc1e6 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
> @@ -3,10 +3,19 @@ require u-boot-common_${PV}.inc
>  SUMMARY = "U-Boot bootloader image creation tool"
>  DEPENDS = "openssl"
>
> -EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS}
> ${LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> +EXTRA_OEMAKE_append_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}"
> CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_append_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_append_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" STRIP=true V=1'
>
>  do_compile () {
>         oe_runmake sandbox_defconfig
> +
> +       # Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
> +       # generating it requires bin2header tool, which for target build
> +       # is built with target tools and thus cannot be executed on host.
> +       sed -i "s/CONFIG_CMD_LICENSE.*/# CONFIG_CMD_LICENSE is not set/"
> .config
> +
>         oe_runmake cross_tools NO_SDL=1
>  }
>
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141b912441aec0540bc1590
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7=
 November 2016 at 20:20, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">The build failed on qemux86-64 because it cou=
ldn&#39;t execute<br>
tools/bin2header on a host due to it being compiled with target<br>
toolchain. Drop the incorrect EXTRA_OEMAKE, U-Boot Kbuild/Kconfig<br>
respects the flags from OE. Moreover, since U-Boot buildsystem<br>
already strips the tools, add INSANE_SKIP =3D &quot;already-stripped&quot; =
.<br></blockquote><div><br></div><div>The INSANE_SKIP mentioned here is no =
longer included in the patch.</div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.=
de</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@in=
tel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.09.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.01.bb</=
a> | 11 ++++++++++-<br>
=C2=A01 file changed, 10 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.=
09.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.=
01.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.0=
9.01.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.0=
1.bb</a><br>
index 5025961..8adc1e6 100644<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.09.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.01.bb</=
a><br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2016.09.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2016.09.01.bb</=
a><br>
@@ -3,10 +3,19 @@ require u-boot-common_${PV}.inc<br>
=C2=A0SUMMARY =3D &quot;U-Boot bootloader image creation tool&quot;<br>
=C2=A0DEPENDS =3D &quot;openssl&quot;<br>
<br>
-EXTRA_OEMAKE =3D &#39;CROSS_COMPILE=3D&quot;${TARGET_<wbr>PREFIX}&quot; CC=
=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
+EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_L=
DFLAGS}&quot;&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>target =3D &#39;CROSS_COMPILE=3D&quot;${TAR=
GET_<wbr>PREFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; STRIP=3D=
true V=3D1&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>native =3D &#39;CC=3D&quot;${BUILD_CC} ${BU=
ILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>nativesdk =3D &#39;CC=3D&quot;${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
<br>
=C2=A0do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake sandbox_defconfig<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Disable CONFIG_CMD_LICENSE, license.h is not =
used by tools and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# generating it requires bin2header tool, which=
 for target build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# is built with target tools and thus cannot be=
 executed on host.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s/CONFIG_CMD_LICENSE.*/# CONFIG_CM=
D_LICENSE is not set/&quot; .config<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake cross_tools NO_SDL=3D1<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.9.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a1141b912441aec0540bc1590--
