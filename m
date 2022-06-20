Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8353C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:07:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.30781.1655734050476334457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V/cXDtA7;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id w20so17415425lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cZJrp+kYyX4h5JaBXqJ3XRb8cnHEgqzLPjZ2k0Z94HE=;
        b=V/cXDtA7e76OgRPoF6iDk+/NajdqXUJHueDz1cvmQlU7UtPbdvfl2UFjxYelZpqWjD
         1xRgw6AV9rYTfjIcGUbcSO0PUq/Gf440IBH/nuTv5bWjyITuNJi8Sj6RNNaypMt/DJQy
         Lt44jXr+TeiJ5dMV0MeEuGC1mz0t4rHaVd+7P7bJTcRibH13M8nT5xmF5pLs3Bt52wi2
         /WJAcz4yPcaJ7Gi/qq2QylRBxjQU85N+/WeJw3gbNqmZshCErMMM/cJuvqDJLFB3SWBn
         5ZraYRcIW46hVY84U3juKRDmYs6YKr4psY80HkssFC+iGSu4pHIU2LkHZyOmyrX4pX4t
         /7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cZJrp+kYyX4h5JaBXqJ3XRb8cnHEgqzLPjZ2k0Z94HE=;
        b=41jevrs1yq5tfHlrFPWb4dRsEWZhgR4+2+VOXsEoA0ZdbQXkERrpmIz5qbof5C7cx1
         xHnslNEQOxHErFee7fwR4dIGf4pIrrourwcaoWT7UJvEKBbNkL+6wVQBjpJXofKgvqLp
         NuEj6aVEQ5vA/AqalKMxc0YxNqOAksdcwDFXk3l5npG1DhnVIWvIrV+kPwJmmnmkQBu+
         LFt24d7hfYooWHOuItUFSXXeEsZhrIGlEdkCw9Obht8CuQrwNDN+dXn1PX0c7CwqfLZs
         oQAFcYBk4+pZgtE70ftxWLI6D7Q0ghXXMIyqlxsWqW89KYV8Tgj/HxOGe6fmn2mXSm8m
         ojeg==
X-Gm-Message-State: AJIora8RqXQ9YneI8Rp599RjP9P+me2DfxgOLFwJ3XxVHQ0oZLOKG+QZ
	IxgB5jMWfjtghBPZbabYrMUvhYlRsR+uysR9zpc=
X-Google-Smtp-Source: 
 AGRyM1vz0US0XIYWb/D+9TUmMOpAKxxYxZBzl2S5/vmZEWAhwM1e2sY1+qkQCxcQNZ0P0rh4T60X7w7MmT/W0TsBE9M=
X-Received: by 2002:a05:6512:b9b:b0:47f:6aae:ecc5 with SMTP id
 b27-20020a0565120b9b00b0047f6aaeecc5mr4191322lfv.412.1655734048236; Mon, 20
 Jun 2022 07:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
In-Reply-To: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 Jun 2022 15:07:16 +0100
Message-ID: 
 <CANPvuRke=akoArFnXD9zZhtw3EAO6o3ye9rhaW2FCpBLaxDang@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-uboot.bbclass: Use vmlinux.initramfs when
 INITRAMFS_IMAGE_BUNDLE set
To: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c9ab9605e1e19fb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:07:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167111

--000000000000c9ab9605e1e19fb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raju,

Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com> escreveu no dia
segunda, 20/06/2022 =C3=A0(s) 14:40:

> vmlinux file doesnot have the initramfs image when INITRAMFS_IMAGE_BUNDLE
> was set.
> Use vmlinux.initramfs in uboot_prep_kimage when INITRAMFS_IMAGE_BUNDLE se=
t
> based on the implementation in kernel.bbclass do_bundle_initramfs functio=
n,
>
> https://github.com/openembedded/openembedded-core/blob/master/meta/classe=
s/kernel.bbclass#L316-L317
> to be able to use proper linux.bin file in creation of fitImage.
>
> Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> ---
>  meta/classes/kernel-uboot.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/kernel-uboot.bbclass
> b/meta/classes/kernel-uboot.bbclass
> index 2daa068298..180e7cf066 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -15,6 +15,12 @@ uboot_prep_kimage() {
>                 linux_comp=3D"none"
>         else
>                 vmlinux_path=3D"vmlinux"
> +               # Use vmlinux.initramfs for linux.bin when
> INITRAMFS_IMAGE_BUNDLE set
> +               # As per the implementation in kernel.bbclass.
> +               # See do_bundle_initramfs function
> +               if [ x"${INITRAMFS_IMAGE_BUNDLE}" =3D x1 ]; then
>

Maybe a check to see if the file exists is better aligned with the reminder
in the bbclass.
[ -e arch/${ARCH}/boot/vmlinux.initramfs ]

Jose


> +                       vmlinux_path=3D"vmlinux.initramfs"
> +               fi
>                 linux_suffix=3D"${FIT_KERNEL_COMP_ALG_EXTENSION}"
>                 linux_comp=3D"${FIT_KERNEL_COMP_ALG}"
>         fi
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167108):
> https://lists.openembedded.org/g/openembedded-core/message/167108
> Mute This Topic: https://lists.openembedded.org/mt/91876695/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c9ab9605e1e19fb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Raju,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Raju Kumar Pothuraju &lt;<a href=3D"mailto:ra=
ju.kumar-pothuraju@xilinx.com">raju.kumar-pothuraju@xilinx.com</a>&gt; escr=
eveu no dia segunda, 20/06/2022 =C3=A0(s) 14:40:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">vmlinux file doesnot have the initramfs im=
age when INITRAMFS_IMAGE_BUNDLE was set.<br>
Use vmlinux.initramfs in uboot_prep_kimage when INITRAMFS_IMAGE_BUNDLE set<=
br>
based on the implementation in kernel.bbclass do_bundle_initramfs function,=
<br>
<a href=3D"https://github.com/openembedded/openembedded-core/blob/master/me=
ta/classes/kernel.bbclass#L316-L317" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openembedded/openembedded-core/blob/master/meta/classes/k=
ernel.bbclass#L316-L317</a><br>
to be able to use proper linux.bin file in creation of fitImage.<br>
<br>
Signed-off-by: Raju Kumar Pothuraju &lt;<a href=3D"mailto:raju.kumar-pothur=
aju@xilinx.com" target=3D"_blank">raju.kumar-pothuraju@xilinx.com</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/kernel-uboot.bbclass | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.=
bbclass<br>
index 2daa068298..180e7cf066 100644<br>
--- a/meta/classes/kernel-uboot.bbclass<br>
+++ b/meta/classes/kernel-uboot.bbclass<br>
@@ -15,6 +15,12 @@ uboot_prep_kimage() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_comp=3D&quot;=
none&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmlinux_path=3D&quo=
t;vmlinux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Use vmlinux.initr=
amfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# As per the implem=
entation in kernel.bbclass.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# See do_bundle_ini=
tramfs function<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ x&quot;${INITR=
AMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br></blockquote><div><br></div>Mayb=
e a check to see if the file exists is better aligned with the reminder in =
the bbclass.<br>[ -e arch/${ARCH}/boot/vmlinux.initramfs ]</div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Jose<br><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=
=3D&quot;vmlinux.initramfs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_suffix=3D&quo=
t;${FIT_KERNEL_COMP_ALG_EXTENSION}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux_comp=3D&quot;=
${FIT_KERNEL_COMP_ALG}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167108): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167108" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167108</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91876695/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91876695/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000c9ab9605e1e19fb2--

