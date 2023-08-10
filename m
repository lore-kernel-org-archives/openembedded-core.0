Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676B6C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:42:46 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.16087.1691671360541064997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qRqAQ9mH;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63d48c3d242so5135876d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691671359; x=1692276159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbPBKitcEnqnka41I0vxns9DD/K7Xkj5wlKwr4Ei8V4=;
        b=qRqAQ9mHbJ8kdL9xeH6WYyaevOAxS+mzVG2h91HcetZCcknwDTUsbHP1FKYEh/ozlZ
         WoZw9C84r8TnrP+wUqbJYZo8wHbUoN13QxauKNxLm/dfGQCSqPnKhn95gKZBtJg6hBea
         BkUeJLuBVlylBjKbIVVCaUYo/GGfOPWm/x4VtcR3sdNNxos3XS94pYnTBMHnQk41umw5
         Qr9mJwdfpWouaEfcxOrZ2X2WcGx7e8U05UMnDc836OOLe0bit41YMvhuo7O2rGHuVt+c
         ESEPOg7B04j5L4UvHWlyUKqynuFqn47iinsBkR13KJBsSh/V38jMjMPqCur7GY7AAGIz
         XyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691671359; x=1692276159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbPBKitcEnqnka41I0vxns9DD/K7Xkj5wlKwr4Ei8V4=;
        b=eqhR88dbWxGYkvJ3I9PhP5aShMqH4EDlVCRSLTpVpGYVcGbpFCza1pcGw8HJCBDtcn
         /cfAVVrLfYkr6VI7ruWCxxcA0wlZSG6i2rCungIGUAz3vq4MNgud+S1rZEkDw/6mPMHb
         3un0/OWppY0Vr0evDrgGhFJNFFKigy1n1JIs0wxMuS731hzDSqfEP+8QrpSPtGqwslXr
         BSnvfsg4BTEO/SnqtbizeHzjHMmQQPMaJaJ5+95D+3e5nFeP1vjQP8g8jQf2jYWVfB9k
         9sdEJAqho1ohvVkOH0GmIMpsteufABUWiM2t312ULuxz4ItAp2hNiWFJuCR7OHUtnfwp
         Y6QA==
X-Gm-Message-State: AOJu0YxKcgwDlP83s3wygs1G/FleTxlvXZ8QN5UJZcrAcIphZdmcaYeA
	uBUPGI8a6dD42yHgkxVOLwNA+zypFpci0diM6grcGdWuees=
X-Google-Smtp-Source: AGHT+IF/c/xnbKdM6s1tzEgP6/R9KUrfZKsNOoj+WPwjT7vFYKSuhTBJZEbfC7SwDPLPoL3V6UVyTA7p+RTaBLme2+0=
X-Received: by 2002:a0c:c391:0:b0:63f:65bc:2622 with SMTP id
 o17-20020a0cc391000000b0063f65bc2622mr1874610qvi.56.1691671359592; Thu, 10
 Aug 2023 05:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <177A05F8392C5386.12117@lists.openembedded.org>
In-Reply-To: <177A05F8392C5386.12117@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 10 Aug 2023 14:42:28 +0200
Message-ID: <CA+cAkeoqka1D4OJUzS_nY7RkV_UHzKLPrL6x849a0czYO311vw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]] kernel: skip installing fitImage when using
 Initramfs bundles
To: frederic.martinsons@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000007724aa060290eef1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185742

--0000000000007724aa060290eef1
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Aug 2023 at 14:39, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
>
> When including an initramfs bundle inside a FIT image, the fitImage is
> created
> after the install task by do_assemble_fitimage_initramfs.
>
> This happens after the generation of the initramfs bundle
> (done by do_bundle_initramfs).
>
> So, at the level of the install task we should not try to install the
> fitImage.
> The fitImage is still not generated yet.
>
> After the generation of the fitImage, the deploy task copies the fitImage
> from
> the build directory to the deploy folder.
>
> Change-Id: I3eaa6bba1412f388f710fa0f389f66631c1c4826
> Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1b67fd9ac74935fa41e960478c54e45422339138)
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index c6310d8de7..5d8b3b062a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -417,12 +417,26 @@ kernel_do_install() {
>         #
>         install -d ${D}/${KERNEL_IMAGEDEST}
>         install -d ${D}/boot
> +
> +       #
> +       # When including an initramfs bundle inside a FIT image, the
> fitImage is created after the install task
> +       # by do_assemble_fitimage_initramfs.
> +       # This happens after the generation of the initramfs bundle (done
> by do_bundle_initramfs).
> +       # So, at the level of the install task we should not try to
> install the fitImage. fitImage is still not
> +       # generated yet.
> +       # After the generation of the fitImage, the deploy task copies the
> fitImage from the build directory to
> +       # the deploy folder.
> +       #
> +
>         for imageType in ${KERNEL_IMAGETYPES} ; do
> -               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> -               if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> -                       ln -sf ${imageType}-${KERNEL_VERSION}
> ${D}/${KERNEL_IMAGEDEST}/${imageType}
> +               if [ $imageType != "fitImage" ] || [
> "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> +                       install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> +                       if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> +                               ln -sf ${imageType}-${KERNEL_VERSION}
> ${D}/${KERNEL_IMAGEDEST}/${imageType}
> +                       fi
>                 fi
>         done
> +
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>         install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> --
> 2.34.1
>
>
>
You can know more about the reason of this submission for dunfell backport
into https://lists.openembedded.org/g/openembedded-core/topic/100638982

-=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185741):
> https://lists.openembedded.org/g/openembedded-core/message/185741
> Mute This Topic: https://lists.openembedded.org/mt/100662341/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007724aa060290eef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 10 Aug 2023 at 14:39, Frederi=
c Martinsons via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Abdellatif El Khlifi &l=
t;<a href=3D"mailto:abdellatif.elkhlifi@arm.com" target=3D"_blank">abdellat=
if.elkhlifi@arm.com</a>&gt;<br>
<br>
When including an initramfs bundle inside a FIT image, the fitImage is crea=
ted<br>
after the install task by do_assemble_fitimage_initramfs.<br>
<br>
This happens after the generation of the initramfs bundle<br>
(done by do_bundle_initramfs).<br>
<br>
So, at the level of the install task we should not try to install the fitIm=
age.<br>
The fitImage is still not generated yet.<br>
<br>
After the generation of the fitImage, the deploy task copies the fitImage f=
rom<br>
the build directory to the deploy folder.<br>
<br>
Change-Id: I3eaa6bba1412f388f710fa0f389f66631c1c4826<br>
Signed-off-by: Abdellatif El Khlifi &lt;<a href=3D"mailto:abdellatif.elkhli=
fi@arm.com" target=3D"_blank">abdellatif.elkhlifi@arm.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 1b67fd9ac74935fa41e960478c54e45422339138)<br>
Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinson=
s@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 20 +++++++++++++++++---<br>
=C2=A01 file changed, 17 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index c6310d8de7..5d8b3b062a 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -417,12 +417,26 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${KERNEL_IMAGEDEST}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/boot<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# When including an initramfs bundle inside a F=
IT image, the fitImage is created after the install task<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# by do_assemble_fitimage_initramfs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# This happens after the generation of the init=
ramfs bundle (done by do_bundle_initramfs).<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# So, at the level of the install task we shoul=
d not try to install the fitImage. fitImage is still not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# generated yet.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# After the generation of the fitImage, the dep=
loy task copies the fitImage from the build directory to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# the deploy folder.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for imageType in ${KERNEL_IMAGETYPES} ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${K=
ERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERN=
EL_VERSION}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${KERNEL=
_PACKAGE_NAME}&quot; =3D &quot;kernel&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${=
imageType}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $imageType !=
=3D &quot;fitImage&quot; ] || [ &quot;${INITRAMFS_IMAGE_BUNDLE}&quot; !=3D =
&quot;1&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_I=
MAGEDEST}/${imageType}-${KERNEL_VERSION}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ &quot;${KERNEL_PACKAGE_NAME}&quot; =3D &quot;kernel&quot; ];=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${imageType}-${KERNEL_VERSION}=
 ${D}/${KERNEL_IMAGEDEST}/${imageType}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 System.map ${D}/boot/System.map=
-${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 .config ${D}/boot/config-${KERN=
EL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 vmlinux ${D}/boot/vmlinux-${KER=
NEL_VERSION}<br>
-- <br>
2.34.1<br>
<br>
<br></blockquote><div><br></div><div>You can know more about the reason of =
this submission for dunfell backport=C2=A0 into=C2=A0<a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/topic/100638982">https://lists.open=
embedded.org/g/openembedded-core/topic/100638982</a></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185741): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185741" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185741</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100662341/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100662341/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007724aa060290eef1--

