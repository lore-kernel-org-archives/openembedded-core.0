Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DCDC77B75
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 09:10:24 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.30685.1683364216710336437
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 02:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NCYOpNMu;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f315712406so122011665e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 02:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683364214; x=1685956214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghihj0Z6h8GWZtRlPnKUtI+Uz5mEIR5rVvRBQhsD6PQ=;
        b=NCYOpNMugrbmRlIVibCSRssfu7Us1TH4mRdJYqlJ77G4N0Vq9mkhYlJ7vxR763LobX
         kGtaRSPiYy4KHhxqOe6d7gA4wV1ofi5v3wmj2CY60sWAZN5uvHql6VopMHir0Lk4V18R
         R20gfFcxlrYiFn+m6c1LiwovTlnyXDjdFhJZT+C4SMQqB/dlK0F3vXOi4Nyn2DGbYsfY
         rq+9HdWlUhFo1K9gy95xz/zmjY+7TLpEQ6IsEdSR/xQ2lI+5qO5QUS7BfYaHeWmoPK46
         czqA8xASHCWUaqpcNRfxHVGPwq1cP0fT5oF2HdRsIrMZiGsTcKiXkTaksXB9N/PEokC1
         ExxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683364214; x=1685956214;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ghihj0Z6h8GWZtRlPnKUtI+Uz5mEIR5rVvRBQhsD6PQ=;
        b=EEihvEGmmq83cN/veVgDjreurbFmiKYv4ksq2hug2zkWcf7movEDXLFc267iRCJQt2
         zaYbr2MRBZ6Sj5g0y4xTp9TlEep3bvKME8DQBCnHMrHV0JRGDBuVGXcYLOIX5bSJ7pg4
         ub23NOtqObWmSBuZeuj0+urnQZlL2cWNVFe59vEdexyfDiFtBhzhHlQ10HmYgN4w9hR+
         Gg6AQnssKlHaSZIN0tnJYJ6tFWgAczGqXkTAEzZnylCYKX5KIshOSV6SXptc0nXxS0lZ
         0BSXDQ2i5SLEL5uH6HCYt57dink1IrWf4h4ADj3/VqUylkm+9Ib3R5Kd+q0de3dBfF4b
         zEJg==
X-Gm-Message-State: AC+VfDwf2pWytpb34xxq8n92bOmia6OsbIT+EmBlO5ph3HCJpa1YvvLX
	KYtgm//4gsmc9UTUYRjyF7UT9FMGvrod4WxWDvE=
X-Google-Smtp-Source: ACHHUZ4b2CX1B2BC4vK+IpiJsed25xcr27szBn9OE6+jBPBx5ic/POgRtYEvNWUTUH03ImsJeNst2bWmFxKge96gUpE=
X-Received: by 2002:a5d:4b0f:0:b0:2cf:e313:2860 with SMTP id
 v15-20020a5d4b0f000000b002cfe3132860mr2637237wrq.33.1683364214373; Sat, 06
 May 2023 02:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230505163601.6708-1-rs@ti.com>
In-Reply-To: <20230505163601.6708-1-rs@ti.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 May 2023 11:09:57 +0200
Message-ID: <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devicetree: allow specification of dtb directory
To: rs@ti.com
Cc: afd@ti.com, detheridge@ti.com, reatmon@ti.com, denis@denix.org, 
	alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006828205fb02c6b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 09:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180981

--00000000000006828205fb02c6b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 6:38=E2=80=AFPM Randolph Sapp via lists.openembedded=
.org <rs=3D
ti.com@lists.openembedded.org> wrote:

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
> ---
>
> Well, suppose I was breaking things by submitting this to kirkstone
> first. This is just the master version of the following patchset:
> https://lists.openembedded.org/g/openembedded-core/message/180754
>
> I'd love to get that series merged as well if this patch is acceptable.
>
>  meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++-----
>  meta/classes-recipe/kernel.bbclass            |  2 ++
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass
> b/meta/classes-recipe/kernel-devicetree.bbclass
> index 4d0ecb1032..a6c6c5f227 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> ...



> -               dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 dtb_path=3D`get_real_dtb_path_in_kernel "$dtb"`
> -               install -m 0644 $dtb_path
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>

dash doesn't like this:

 /bin/dash -c "if [ false =3D=3D "false" ]; then echo foo; fi"

add quotes or use single '=3D'.

+                       dtb_ext=3D${dtb##*.}
> +                       dtb_base_name=3D`basename $dtb .$dtb_ext`
> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -Dm 0644 $dtb_path ${D}/${KERNEL_DTBDEST}/$dtb
>         done
>  }
>
> @@ -88,7 +97,10 @@ do_deploy:append() {
>                 dtb_ext=3D${dtb##*.}
>                 dtb_base_name=3D`basename $dtb .$dtb_ext`
>                 install -d $deployDir
> -               install -m 0644
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> +               if [ ${KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>

Same here


> +                       dtb=3D$dtb_base_name.$dtb_ext
> +               fi
> +               install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb
> $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>                 if [ "${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
>                         ln -sf $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> $deployDir/$dtb_base_name.$dtb_ext
>                 fi
>

--00000000000006828205fb02c6b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, May 5, 2023 at 6:38=E2=80=AFPM Ra=
ndolph Sapp via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Randolph Sapp &lt;<a=
 href=3D"mailto:rs@ti.com" target=3D"_blank">rs@ti.com</a>&gt;<br>
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
---<br>
<br>
Well, suppose I was breaking things by submitting this to kirkstone<br>
first. This is just the master version of the following patchset:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18075=
4" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/180754</a><br>
<br>
I&#39;d love to get that series merged as well if this patch is acceptable.=
<br>
<br>
=C2=A0meta/classes-recipe/kernel-devicetree.bbclass | 22 ++++++++++++++----=
-<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A02 files changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-r=
ecipe/kernel-devicetree.bbclass<br>
index 4d0ecb1032..a6c6c5f227 100644<br>
--- a/meta/classes-recipe/kernel-devicetree.bbclass<br>
+++ b/meta/classes-recipe/kernel-devicetree.bbclass<br>...</blockquote><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">-=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=3D`basename $dtb=
 .$dtb_ext`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path=3D`get_rea=
l_dtb_path_in_kernel &quot;$dtb&quot;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 $dt=
b_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KERNEL_DTBVE=
NDORED} =3D=3D &quot;false&quot; ]; then<br></blockquote><div><br></div><di=
v>dash doesn&#39;t like this:</div><div><br></div><div>=C2=A0/bin/dash -c &=
quot;if [ false =3D=3D &quot;false&quot; ]; then echo foo; fi&quot;</div><d=
iv><br></div><div>add quotes or use single &#39;=3D&#39;.</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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
@@ -88,7 +97,10 @@ do_deploy:append() {<br>
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
NDORED} =3D=3D &quot;false&quot; ]; then<br></blockquote><div><br></div><di=
v>Same here</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
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
</blockquote></div></div>

--00000000000006828205fb02c6b7--

