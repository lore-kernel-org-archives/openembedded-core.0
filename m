Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id A6FF26076F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 10:27:35 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id z20so24877610itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 02:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dITHKxbxnVZAwq+O6sU0G+2oO+3voDYxKuTRBrbtoZA=;
	b=w7fwteIe5P5mY+tV65tuI6lXesTnY5GjYMRXLrW24bxwjtU1wLc3/zY09m0SHgv4OY
	eFF6DL/M2shaiN2fJUbFfQJoyTuoCVVWCzyweu5l/O2wG49hViSQIVo90T8fRCRhVAO/
	xmGRfyKFJrccOdvbVpMYUKyncsbtT7xm3uyipFWyyzIt2DwqKSk7ROwcmL5Por/had90
	WGNbS1bMqOtxfI2Ps49Gwie36l/+LtRn8yREWpWdAT3OGKuxE2srPWt37fR0zmO1vv/K
	LTj+nShaZB1B22ZSlB/YrldmCmWyHuNzvP/t8R0vxTVc05I/P6+hf3Aitrl8vL9q380D
	3aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dITHKxbxnVZAwq+O6sU0G+2oO+3voDYxKuTRBrbtoZA=;
	b=KqR0jcShFMSS3b+UgznzH0UncP6iQnnc+cCyPmcWCRQFQ+3aS0wgedHgH5b//rMut7
	095qgIKuzv6Ial3kOYHE6bQk1CWq0YzYjfNYz42UpZFnoiO5hBkPoeZyXipCx/LAmsf9
	4Ms2VKFl0m4yDNk1vC3vUFDCGP5r+st1UIHPA9jeScenvaaXOTs6iFD+mFviMyTFUzn7
	91j4m/UQNT4UeuZWv2gQyb1mkB9dtFqf9cI7wZ+s/BJtyoLMDaIfxxBZFiZj8w28nthF
	1V0Xnz9b6sWh7RDY9lkgs350m6R2MOOwP7YPNM4kZG2bdDZbE+XSSW6JFZHJFOi0bjhd
	Kh3g==
X-Gm-Message-State: AHQUAubDw70FwoRtjF8PedeKatPjAEt4bwtpT4tsZRh4P5+NpPVtb7Cz
	tICx56gv8hVjqsEXj0r7qHQD8ZJjnBzI7fQjiXdELQ==
X-Google-Smtp-Source: AHgI3IbLdqIKtf7Ei0pV6HwWGgWpCTfBM82grYiZiB2PqGiNsFMGra9bZPNBe9BNOORZ3ZMSUBdjq+hMrJlH72i1uVg=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr4815946itj.62.1549880856412;
	Mon, 11 Feb 2019 02:27:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549821635.git.silvio.fricke@gmail.com>
	<4c3dabb9814914747119a28172f38e2a32c0bd36.1549821635.git.silvio.fricke@gmail.com>
In-Reply-To: <4c3dabb9814914747119a28172f38e2a32c0bd36.1549821635.git.silvio.fricke@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Feb 2019 10:27:25 +0000
Message-ID: <CAJTo0Laft-Z97PmWL8G4i-qrHxQUmurL6dYz_fp1PJjkwmS2hw@mail.gmail.com>
To: Silvio Fricke <silvio.fricke@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1 1/1] image_types: add base64 conversion
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
X-List-Received-Date: Mon, 11 Feb 2019 10:27:35 -0000
Content-Type: multipart/alternative; boundary="000000000000e4102f05819bc141"

--000000000000e4102f05819bc141
Content-Type: text/plain; charset="UTF-8"

Is it?  I'm genuinely curious when a base64 encoded image is useful.

Ross

On Mon, 11 Feb 2019 at 06:03, Silvio Fricke <silvio.fricke@gmail.com> wrote:

> Sometimes it is useful to have a base64 representation of an image.
>
> Signed-off-by: Silvio Fricke <silvio.fricke@gmail.com>
> ---
>  meta/classes/image_types.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 70bd315306..ddca5b624e 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -280,7 +280,7 @@ IMAGE_TYPES = " \
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
> ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
> sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64
> ${COMPRESSIONTYPES}"
>  CONVERSION_CMD_lzma = "lzma -k -f -7
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_gz = "pigz -f -9 -n -c
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD_bz2 = "pbzip2 -f -k
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -300,6 +300,7 @@ CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O
> linux -T ramdisk -C none -n
>  CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
>  CONVERSION_CMD_vdi = "qemu-img convert -O vdi
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
>  CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
> +CONVERSION_CMD_base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
> > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
>  CONVERSION_DEPENDS_lzma = "xz-native"
>  CONVERSION_DEPENDS_gz = "pigz-native"
>  CONVERSION_DEPENDS_bz2 = "pbzip2-native"
> @@ -313,6 +314,7 @@ CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
>  CONVERSION_DEPENDS_vmdk = "qemu-native"
>  CONVERSION_DEPENDS_vdi = "qemu-native"
>  CONVERSION_DEPENDS_qcow2 = "qemu-native"
> +CONVERSION_DEPENDS_base64 = "coreutils-native"
>
>  RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
>  RUNNABLE_MACHINE_PATTERNS ?= "qemu"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e4102f05819bc141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it?=C2=A0 I&#39;m genuinely curious when a base64 encod=
ed image is useful.=C2=A0<div><br></div><div>Ross</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Feb 2019 =
at 06:03, Silvio Fricke &lt;<a href=3D"mailto:silvio.fricke@gmail.com">silv=
io.fricke@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Sometimes it i=
s useful to have a base64 representation of an image.<br>
<br>
Signed-off-by: Silvio Fricke &lt;<a href=3D"mailto:silvio.fricke@gmail.com"=
 target=3D"_blank">silvio.fricke@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image_types.bbclass | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bb=
class<br>
index 70bd315306..ddca5b624e 100644<br>
--- a/meta/classes/image_types.bbclass<br>
+++ b/meta/classes/image_types.bbclass<br>
@@ -280,7 +280,7 @@ IMAGE_TYPES =3D &quot; \<br>
=C2=A0# CONVERSION_CMD/DEPENDS.<br>
=C2=A0COMPRESSIONTYPES ?=3D &quot;&quot;<br>
<br>
-CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sh=
a224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESS=
IONTYPES}&quot;<br>
+CONVERSIONTYPES =3D &quot;gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sh=
a224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${C=
OMPRESSIONTYPES}&quot;<br>
=C2=A0CONVERSION_CMD_lzma =3D &quot;lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME=
_SUFFIX}.${type}&quot;<br>
=C2=A0CONVERSION_CMD_gz =3D &quot;pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAM=
E_SUFFIX}.${type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz&quot;<b=
r>
=C2=A0CONVERSION_CMD_bz2 =3D &quot;pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_S=
UFFIX}.${type}&quot;<br>
@@ -300,6 +300,7 @@ CONVERSION_CMD_u-boot =3D &quot;mkimage -A ${UBOOT_ARCH=
} -O linux -T ramdisk -C none -n<br>
=C2=A0CONVERSION_CMD_vmdk =3D &quot;qemu-img convert -O vmdk ${IMAGE_NAME}$=
{IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk&=
quot;<br>
=C2=A0CONVERSION_CMD_vdi =3D &quot;qemu-img convert -O vdi ${IMAGE_NAME}${I=
MAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi&quo=
t;<br>
=C2=A0CONVERSION_CMD_qcow2 =3D &quot;qemu-img convert -O qcow2 ${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qco=
w2&quot;<br>
+CONVERSION_CMD_base64 =3D &quot;base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} &gt; ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64&quot;<br>
=C2=A0CONVERSION_DEPENDS_lzma =3D &quot;xz-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_gz =3D &quot;pigz-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_bz2 =3D &quot;pbzip2-native&quot;<br>
@@ -313,6 +314,7 @@ CONVERSION_DEPENDS_u-boot =3D &quot;u-boot-tools-native=
&quot;<br>
=C2=A0CONVERSION_DEPENDS_vmdk =3D &quot;qemu-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_vdi =3D &quot;qemu-native&quot;<br>
=C2=A0CONVERSION_DEPENDS_qcow2 =3D &quot;qemu-native&quot;<br>
+CONVERSION_DEPENDS_base64 =3D &quot;coreutils-native&quot;<br>
<br>
=C2=A0RUNNABLE_IMAGE_TYPES ?=3D &quot;ext2 ext3 ext4&quot;<br>
=C2=A0RUNNABLE_MACHINE_PATTERNS ?=3D &quot;qemu&quot;<br>
-- <br>
2.20.1<br>
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

--000000000000e4102f05819bc141--
