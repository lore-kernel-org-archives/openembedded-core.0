Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CC0C77B73
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 17:25:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.38537.1683393937576869639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 10:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SSCYJEG+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-304935cc79bso2780671f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683393936; x=1685985936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1UgnUqudUIaQqH2pWIzbno8PuvqPH2FKl/sv5YakUXs=;
        b=SSCYJEG+I8MEAulDzNyItf84B699ngCZrs59ikxK8XlV5PSJf9sA9XBjjlFVKzlL4P
         TglKZMQMiYNQMmS+8gtvXc89UpVLw0K0NsdnZK6zv3wVDl5cQTam92qFCph4qn+4v12N
         p91OrTeUPSgMNOq1rPyZjaUtqKf0H6+M2panJ3vlKjAI7YEp/JtEeOF+0m7tBtxf9uUF
         JmfK+YEKo9znjpKpEjbSMOF6IbBFjwSYPPzWDSNb4PGiEq6DxcktWiMnByrPmAf4kMcf
         fhS5IoyNT4dNpYvdjjDJ9vbMNPzyu8QVSy4KOaYo0VsmQeFQE45czzLHTlvdL39/Wba2
         /GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683393936; x=1685985936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UgnUqudUIaQqH2pWIzbno8PuvqPH2FKl/sv5YakUXs=;
        b=EnM2Yf2+w7vroJM6Sezh64xY2l9g9YABxbESLYHatas4x7uWkNnT78qFEB9CYRe7LJ
         Kdax6N/ovVmX3sWg1h+u+7+o9/flJxQZA0Bu58lGLL1EQXEPOndEwHXVmkYNgsRaHZvS
         NyIFDImRWYjW0RcrNQFkMnf8+thPD0hK6HEb9wE6Pjj9YQknLMT7l0BeH+BcwRgAuAwh
         o0q4aSYf2pPOAZHEowta8SBV+WAYRdJN7NFmyA9F429AplLJKgBp1XlegdJzuSWUMUTP
         kWqNo781XsXnjlu61V9mYcVB5Jfbh1yqFEOZujW9HdHz9fPFbfmO3dF/AOVQtmNs6ppX
         LVrA==
X-Gm-Message-State: AC+VfDyAnffCYGMOghadON/2WK7EdWWqL2e8QeL9BbGGH95QsyDeHviN
	4qRdAYeL6SyoF/Ex2urOJxBCtCrOGsbrougVjjc=
X-Google-Smtp-Source: ACHHUZ6hTm4NrQ+ELVeBc/ed99/eVc3lobicrUuD56GxhAZMRKFaXfKqr9sbdXAZh5ipf/5PU64FcypGeD63Zjry9uA=
X-Received: by 2002:a5d:4fcb:0:b0:304:75b1:4dff with SMTP id
 h11-20020a5d4fcb000000b0030475b14dffmr4019472wrw.48.1683393935542; Sat, 06
 May 2023 10:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683386547.git.steve@sakoman.com> <e0409bbd3df158b773b779bd1d7f7ea36af95558.1683386547.git.steve@sakoman.com>
In-Reply-To: <e0409bbd3df158b773b779bd1d7f7ea36af95558.1683386547.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 May 2023 19:25:17 +0200
Message-ID: <CA+chaQemuZz26aHyzoeEvbLkgX48Uf3dqSuDXQBrgedvpLqzaQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 13/15] kernel-devicetree: allow specification
 of dtb directory
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008b8bb105fb09b19c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 17:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180999

--0000000000008b8bb105fb09b19c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This one doesn't work correctly, maybe better to postpone this until a fix
is in master, see:
https://lists.openembedded.org/g/openembedded-core/message/180981
and possible fix:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3De2a6da5202a6671113758f9746ddbd8141a75757

Regards,

On Sat, May 6, 2023 at 5:25=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> From: Randolph Sapp <rs@ti.com>
>
> Fedora/Redhat and Arch are somewhat standardized on their dtb directory
> structure. Let's add some flags to configure yocto to mimic that
> behavior.
>
> Add the following variables to the kernel class:
>         - KERNEL_DTBDEST (controls the destination directory for dtbs)
>         - KERNEL_DTBVENDORED (controls if vendor subdirectories are to
>           be respected)
>
> Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST
> and KERNEL_DTBVENDORED is expected to be "true"/"false". This only
> applies to the package directory structure. The deploydir structure is
> purposely left untouched for compatibility with existing recipes.
>
> By default this is configured to behave the same as the current recipe
> and produce a flat dtb directory at KERNEL_IMAGEDEST.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 22 +++++++++++++++++-----
>  meta/classes/kernel.bbclass            |  2 ++
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> index b4338da1b1..11b57adc92 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -6,7 +6,12 @@ python () {
>              d.appendVar("PACKAGES", "
> ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
>  }
>
> -FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D "/${KERNEL_IMAGEDEST}/*.dtb
> /${KERNEL_IMAGEDEST}/*.dtbo"
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D " \
> +    /${KERNEL_DTBDEST}/*.dtb \
> +    /${KERNEL_DTBDEST}/*.dtbo \
> +    /${KERNEL_DTBDEST}/*/*.dtb \
> +    /${KERNEL_DTBDEST}/*/*.dtbo \
> +"
>  FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle =3D
> "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>
>  # Generate kernel+devicetree bundle
> @@ -67,12 +72,16 @@ do_compile:append() {
>  }
>
>  do_install:append() {
> +       install -d ${D}/${KERNEL_DTBDEST}
>         for dtbf in ${KERNEL_DEVICETREE}; do
>                 dtb=3D`normalize_dtb "$dtbf"`
> -               dtb_ext=3D${dtb##*.}
> -               dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 dtb_path=3D`get_real_dtb_path_in_kernel "$dtb"`
> -               install -m 0644 $dtb_path
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
> +                       dtb_ext=3D${dtb##*.}
> +                       dtb_base_name=3D`basename $dtb .$dtb_ext`
> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
>         done
>  }
>
> @@ -82,7 +91,10 @@ do_deploy:append() {
>                 dtb_ext=3D${dtb##*.}
>                 dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 install -d $deployDir
> -               install -m 0644
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>                 if [ "${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
>                         ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> $deployDir/$dtb_base_name.$dtb_ext
>                 fi
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index b315737fd2..3e3ac2d47d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -210,6 +210,8 @@ KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
>  # The directory where built kernel lies in the kernel tree
>  KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"
>  KERNEL_IMAGEDEST ?=3D "boot"
> +KERNEL_DTBDEST ?=3D "${KERNEL_IMAGEDEST}"
> +KERNEL_DTBVENDORED ?=3D "false"
>
>  #
>  # configuration
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180996):
> https://lists.openembedded.org/g/openembedded-core/message/180996
> Mute This Topic: https://lists.openembedded.org/mt/98726684/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008b8bb105fb09b19c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This one doesn&#39;t work correctly, maybe better to postp=
one this until a fix is in master, see:<div><a href=3D"https://lists.openem=
bedded.org/g/openembedded-core/message/180981">https://lists.openembedded.o=
rg/g/openembedded-core/message/180981</a><br></div><div>and possible fix:</=
div><div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/=
commit/?h=3Djansa/master&amp;id=3De2a6da5202a6671113758f9746ddbd8141a75757"=
>https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/m=
aster&amp;id=3De2a6da5202a6671113758f9746ddbd8141a75757</a><br></div><div><=
br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, May 6, 2023 at 5:25=E2=80=AFPM Steve =
Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ran=
dolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank">rs@ti.com</a>=
&gt;<br>
<br>
Fedora/Redhat and Arch are somewhat standardized on their dtb directory<br>
structure. Let&#39;s add some flags to configure yocto to mimic that<br>
behavior.<br>
<br>
Add the following variables to the kernel class:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBDEST (controls the destination dire=
ctory for dtbs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBVENDORED (controls if vendor subdir=
ectories are to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be respected)<br>
<br>
Currently KERNEL_DTBDEST is expected to be a subdir of KERNEL_IMAGEDEST<br>
and KERNEL_DTBVENDORED is expected to be &quot;true&quot;/&quot;false&quot;=
. This only<br>
applies to the package directory structure. The deploydir structure is<br>
purposely left untouched for compatibility with existing recipes.<br>
<br>
By default this is configured to behave the same as the current recipe<br>
and produce a flat dtb directory at KERNEL_IMAGEDEST.<br>
<br>
Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-devicetree.bbclass | 22 +++++++++++++++++-----<br=
>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 ++<br>
=C2=A02 files changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-d=
evicetree.bbclass<br>
index b4338da1b1..11b57adc92 100644<br>
--- a/meta/classes/kernel-devicetree.bbclass<br>
+++ b/meta/classes/kernel-devicetree.bbclass<br>
@@ -6,7 +6,12 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;PACKAGES&=
quot;, &quot; ${KERNEL_PACKAGE_NAME}-image-zimage-bundle&quot;)<br>
=C2=A0}<br>
<br>
-FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D &quot;/${KERNEL_IMAGEDEST}/*.d=
tb /${KERNEL_IMAGEDEST}/*.dtbo&quot;<br>
+FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D &quot; \<br>
+=C2=A0 =C2=A0 /${KERNEL_DTBDEST}/*.dtb \<br>
+=C2=A0 =C2=A0 /${KERNEL_DTBDEST}/*.dtbo \<br>
+=C2=A0 =C2=A0 /${KERNEL_DTBDEST}/*/*.dtb \<br>
+=C2=A0 =C2=A0 /${KERNEL_DTBDEST}/*/*.dtbo \<br>
+&quot;<br>
=C2=A0FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle =3D &quot;/${KERNEL_=
IMAGEDEST}/zImage-*.dtb.bin&quot;<br>
<br>
=C2=A0# Generate kernel+devicetree bundle<br>
@@ -67,12 +72,16 @@ do_compile:append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${KERNEL_DTBDEST}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dtbf in ${KERNEL_DEVICETREE}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb=3D`normalize_dt=
b &quot;$dtbf&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ext=3D${dtb##*.=
}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=3D`ba=
sename $dtb .$dtb_ext`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path=3D`get_rea=
l_dtb_path_in_kernel &quot;$dtb&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 $dt=
b_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KERNEL_DTBVE=
NDORED} =3D=3D &quot;false&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb_ext=3D${dtb##*.}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb_base_name=3D`basename $dtb .$dtb_ext`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm 0644 $d=
tb_path ${D}/${KERNEL_DTBDEST}/$dtb<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
@@ -82,7 +91,10 @@ do_deploy:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_ext=3D${dtb##*.=
}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_base_name=3D`ba=
sename $dtb .$dtb_ext`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d $deployD=
ir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext $deployDir/$dtb_base_name-${K=
ERNEL_DTB_NAME}.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KERNEL_DTBVE=
NDORED} =3D=3D &quot;false&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${D=
}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_=
ext<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${KERNEL=
_IMAGETYPE_SYMLINK}&quot; =3D &quot;1&quot; ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext $deployDir/$dt=
b_base_name.$dtb_ext<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index b315737fd2..3e3ac2d47d 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -210,6 +210,8 @@ KERNEL_RELEASE ?=3D &quot;${KERNEL_VERSION}&quot;<br>
=C2=A0# The directory where built kernel lies in the kernel tree<br>
=C2=A0KERNEL_OUTPUT_DIR ?=3D &quot;arch/${ARCH}/boot&quot;<br>
=C2=A0KERNEL_IMAGEDEST ?=3D &quot;boot&quot;<br>
+KERNEL_DTBDEST ?=3D &quot;${KERNEL_IMAGEDEST}&quot;<br>
+KERNEL_DTBVENDORED ?=3D &quot;false&quot;<br>
<br>
=C2=A0#<br>
=C2=A0# configuration<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180996): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180996" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180996</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98726684/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98726684/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008b8bb105fb09b19c--

