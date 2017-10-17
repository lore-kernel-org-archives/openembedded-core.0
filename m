Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1213178306
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:56:58 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 97so3003011iok.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GrhEzf16eW9lLINvC7Gyn6ZoWkJZSy3GLxltBlPGrbE=;
	b=vyulfzU8RQv+R6etTq56fgr/0EpnIoL8n69kkZjObcPY0DMwJSCc4E3qSBxaSrTSO9
	Np1CyVYgsFYlgv3KmFG1n4ziRAaLxPZdaanfKyL7SsYRQrRJzz2+rlELhy6fpojQkFce
	G0tvqfFmLahHv/gKNC+iQXjhqChJNqu/SKn1p1deeCVVshlXN63RHNH/ZA+WBXvNe6u2
	8+KIE0FgpDa5mweUtcQIteFc7Y1bhKjR/JiZJ0QgCIwzLPKq/KKfRyRaqGdtXdX/UlWg
	DmtnaqNiTMDsINTdPtbeT3Irls9IGXcM++W//kcn96LUEEDjXHq+y3P63ZK2nf+bpOBe
	u3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GrhEzf16eW9lLINvC7Gyn6ZoWkJZSy3GLxltBlPGrbE=;
	b=QqyoA0IQUGmoQHPvA+G2zhTAYLEtLQ20nL0ZqOXxDWHbNQ2CHx8/kpclf6jT+DmON3
	279HQTsKHCj4dUyEZsxUednd/KpoUVGCimji5vafnK24KQAPa0p9G2QVrIJD36hHIdH6
	xhWo8cTk3ym+lmOJ+7ZINsY1kaGaykuDcyDS1FgAScyn8pAQHIaBRyNOFZ0bm26MIL3W
	dKARuJm026AytSNsFS4bFitG9BV29T70LVU1rBM70XGzi4bAA939Gv0lRwAm61Im6xH/
	Tyo8SlVLPLlPDM1+9mIRulyqRfUPZuDZjsNopwT3KC46KbsrAlqK5S7f1PJZ9tubu0lT
	EPJA==
X-Gm-Message-State: AMCzsaUB3Xudfkznpx/VQt+zRTJ4EolKQ6YFfDG20R51m2xvb2FOoDJQ
	YtYJfP0BCmzQoAjJ7vndPYGV9mGBadY/eDvk852YcQ==
X-Google-Smtp-Source: ABhQp+Tv0dtc0pu0GfK/I3iw5BpMZvEvkEPqlgwXEGBexsj2atGypGfVtc202kBGfFC2YKoGtvq1uTaa4DK9K8gxrCY=
X-Received: by 10.107.18.67 with SMTP id a64mr19280622ioj.165.1508259420043;
	Tue, 17 Oct 2017 09:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:56:39 -0700 (PDT)
In-Reply-To: <20171017165424.22887-1-thomas.perrot@tupi.fr>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:56:39 +0100
Message-ID: <CAJTo0LY0hxvo2=2HaTHCJRyA9b9Y_V1SFBOFf0tAZaH2ySWTEg@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Tue, 17 Oct 2017 16:56:59 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b2f61aaf055bc102e8"

--001a113ee9b2f61aaf055bc102e8
Content-Type: text/plain; charset="UTF-8"

Is this *only* for Pyro or should it be applied to master too?

Ross

On 17 October 2017 at 17:54, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its
> - Ignore fitImage type during the packaging of the initramfs
>
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass | 6 +++++-
>  meta/classes/kernel.bbclass          | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 2630b47316..abbc309b09 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,8 +7,11 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>
> -        if d.getVar("UBOOT_ARCH") == "x86":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"
>          else:
>              replacementtype = "zImage"
>
> @@ -351,6 +354,7 @@ fitimage_assemble() {
>                                 DTB_PATH="arch/${ARCH}/boot/${DTB}"
>                         fi
>
> +                       DTB=$(echo "${DTB}" | tr '/' '_')
>                         DTBS="${DTBS} ${DTB}"
>                         fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
>                 done
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce2cab65ae..a8b0d0a061 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -219,7 +219,9 @@ do_bundle_initramfs () {
>                 # Backing up kernel image relies on its type(regular file
> or symbolic link)
>                 tmp_path=""
>                 for type in ${KERNEL_IMAGETYPES} ; do
> -                       if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +                       if [ "$type" == "fitImage" ] ; then
> +                               continue
> +                       elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
>                                 linkpath=`readlink -n
> ${KERNEL_OUTPUT_DIR}/$type`
>                                 realpath=`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$type`
>                                 mv -f $realpath $realpath.bak
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ee9b2f61aaf055bc102e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this *only* for Pyro or should it be applied to master =
too?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 17 October 2017 at 17:54, Thomas Perrot <span dir=
=3D"ltr">&lt;<a href=3D"mailto:thomas.perrot@tupi.fr" target=3D"_blank">tho=
mas.perrot@tupi.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
- Bad image type replacement for aarch64<br>
- Fix DTB path in fitimage.its<br>
- Ignore fitImage type during the packaging of the initramfs<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">t=
homas.perrot@tupi.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.<wbr>bbclass | 6 +++++-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++=
-<br>
=C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/kerne=
l-<wbr>fitimage.bbclass<br>
index 2630b47316..abbc309b09 100644<br>
--- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
+++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
@@ -7,8 +7,11 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0depends =3D &quot;%s u-boot-mkimage-nativ=
e dtc-native&quot; % depends<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;DEPENDS&quot;, depends)<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;UBOOT_ARCH&quot;) =3D=3D &qu=
ot;x86&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uarch =3D=3D &quot;x86&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replacementtype =3D &quot;b=
zImage&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;arm64&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &quot;Image&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0replacementtype =3D &quot;z=
Image&quot;<br>
<br>
@@ -351,6 +354,7 @@ fitimage_assemble() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DTB_PATH=3D&quot;arch/${ARCH}/boot/$=
{<wbr>DTB}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DTB=3D$(echo &quot;${DTB}&quot; | tr &#39;/&#39; &#39;_&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DTBS=3D&quot;${DTBS} ${DTB}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index ce2cab65ae..a8b0d0a061 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -219,7 +219,9 @@ do_bundle_initramfs () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Backing up kernel=
 image relies on its type(regular file or symbolic link)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_path=3D&quot;&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for type in ${KERNE=
L_IMAGETYPES} ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ &quot;$type&quot; =3D=3D &quot;fitImage&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linkpath=3D`readlink -n ${KERNEL_OUT=
PUT_DIR}/$type`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 realpath=3D`readlink -fn ${KERNEL_OU=
TPUT_DIR}/$type`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f $realpath $realpath.bak<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.6<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113ee9b2f61aaf055bc102e8--
