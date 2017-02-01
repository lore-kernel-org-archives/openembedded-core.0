Return-Path: <raltherr@google.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB5DD600E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 17:05:05 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id c7so21116086itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 09:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9T/bzcLdvHwVyEfXggeTgSNwkIUkGNOgAHRDEnebJjU=;
	b=fIU3OLiQt1RDLT15I+j0L6j5Vz0djsnJEgIsnFd7mUhkw0fCsExv3Nzo2xyIcdueZM
	NOLGPc7IITxPAMG4F5sqfsRqQJ95Csi4UiLV6P2NrICISJxkWhj94XEZ8YBVkW3064iP
	tsbULWOIQxAByV8DbO9RURU0syZ/8RaG4XMbWkxlZb1YlDl2Tp+2czbHzPqM2ek3Dde9
	xV6y6t6cCWh3i/NtR35TKhN6rR1U4lQufgRlV1C9WIhIbzKFS3RuaRYRuKf1gChHKBNO
	a0DtVheDAZuL/8lMefE3Jmaf92nPU34//j6cPmUPRtlvtZTg50tqfjol4R0UcIVbdZyF
	e5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9T/bzcLdvHwVyEfXggeTgSNwkIUkGNOgAHRDEnebJjU=;
	b=LaPn6rVfX2QHHzVh6/T+YWk1L0ZgJc4GZfQlfbRtdlwZPl4PNcG1EweQHGNZVXcKF8
	WgVioJ+kboC9GAct4LkuFnTcSB4Wwpe1csV1SO4MUw7pUW0BNCDisDPd7/BDaPhj/uE8
	rIWllegNNlZOtagTsSxmhDulQAVyrZaYJr5P5SDWxQxtXPxdf4kWKW9emn2u3Ov+EUtw
	ynsYejxEVacURZiWBJe5hevq5283AOvmKiUXCI8bEeCx5GJB0Wq54SgNrR1r2Y81/t0j
	LEmKV+em5uZ9yz8aXC5ymk0DxJGMbfi8D3R8eM7EWbE68HrapCt2cBhWfrgB/vi3gxGK
	r0Fg==
X-Gm-Message-State: AIkVDXKP8RVEUWvWak+I1t2hHhtevJYLkcru4K0cjD5UP9N3BiURqaNuSd3ccPufteGi15/ZbpNoO7B4jWDDHr2e
X-Received: by 10.36.53.210 with SMTP id k201mr2900312ita.21.1485968705544;
	Wed, 01 Feb 2017 09:05:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.133.226 with HTTP; Wed, 1 Feb 2017 09:05:05 -0800 (PST)
In-Reply-To: <1485962869-11868-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1485962869-11868-1-git-send-email-ed.bartosh@linux.intel.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Feb 2017 09:05:05 -0800
Message-ID: <CAPLgG=nZaHjaS-6mJ9OwQeoUZmsixc0TMkzQSOibdaMrZN3w5Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: rename image-wic -> image_types_wic
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
X-List-Received-Date: Wed, 01 Feb 2017 17:05:06 -0000
Content-Type: multipart/alternative; boundary=001a114a8ac4d7cdc705477b0cc6

--001a114a8ac4d7cdc705477b0cc6
Content-Type: text/plain; charset=UTF-8

Reviewed-by: Rick Altherr <raltherr@google.com>

On Wed, Feb 1, 2017 at 7:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Make name of the wic image type class consistent with
> existing naming scheme for image types.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/classes/image.bbclass                                  | 5 +++--
>  meta/classes/{image-wic.bbclass => image_types_wic.bbclass} | 0
>  2 files changed, 3 insertions(+), 2 deletions(-)
>  rename meta/classes/{image-wic.bbclass => image_types_wic.bbclass} (100%)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 613cd92..b5a4fb4 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -151,6 +151,9 @@ def build_uboot(d):
>  IMAGE_TYPE_uboot = "${@build_uboot(d)}"
>  inherit ${IMAGE_TYPE_uboot}
>
> +IMAGE_TYPE_wic = "image_types_wic"
> +inherit ${IMAGE_TYPE_wic}
> +
>  python () {
>      deps = " " + imagetypes_getdepends(d)
>      d.appendVarFlag('do_rootfs', 'depends', deps)
> @@ -187,8 +190,6 @@ python () {
>  IMAGE_CLASSES += "image_types"
>  inherit ${IMAGE_CLASSES}
>
> -inherit image-wic
> -
>  IMAGE_POSTPROCESS_COMMAND ?= ""
>
>  # some default locales
> diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image_types_
> wic.bbclass
> similarity index 100%
> rename from meta/classes/image-wic.bbclass
> rename to meta/classes/image_types_wic.bbclass
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a8ac4d7cdc705477b0cc6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Reviewed-by: Rick Altherr=
 &lt;</span><a href=3D"mailto:raltherr@google.com" target=3D"_blank" style=
=3D"font-size:12.8px">raltherr@google.com</a><span style=3D"font-size:12.8p=
x">&gt;</span><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Wed, Feb 1, 2017 at 7:27 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Make n=
ame of the wic image type class consistent with<br>
existing naming scheme for image types.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 5 +++--<br>
=C2=A0meta/classes/{image-wic.<wbr>bbclass =3D&gt; image_types_wic.bbclass}=
 | 0<br>
=C2=A02 files changed, 3 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/classes/{image-wic.<wbr>bbclass =3D&gt; image_types_wic.b=
bclass} (100%)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 613cd92..b5a4fb4 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -151,6 +151,9 @@ def build_uboot(d):<br>
=C2=A0IMAGE_TYPE_uboot =3D &quot;${@build_uboot(d)}&quot;<br>
=C2=A0inherit ${IMAGE_TYPE_uboot}<br>
<br>
+IMAGE_TYPE_wic =3D &quot;image_types_wic&quot;<br>
+inherit ${IMAGE_TYPE_wic}<br>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0deps =3D &quot; &quot; + imagetypes_getdepends(d)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_rootfs&#39;, &#39;depends&#39;,=
 deps)<br>
@@ -187,8 +190,6 @@ python () {<br>
=C2=A0IMAGE_CLASSES +=3D &quot;image_types&quot;<br>
=C2=A0inherit ${IMAGE_CLASSES}<br>
<br>
-inherit image-wic<br>
-<br>
=C2=A0IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
<br>
=C2=A0# some default locales<br>
diff --git a/meta/classes/image-wic.<wbr>bbclass b/meta/classes/image_types=
_<wbr>wic.bbclass<br>
similarity index 100%<br>
rename from meta/classes/image-wic.bbclass<br>
rename to meta/classes/image_types_wic.<wbr>bbclass<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
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

--001a114a8ac4d7cdc705477b0cc6--
