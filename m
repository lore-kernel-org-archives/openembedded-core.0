Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033E6C43219
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:31:26 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web12.25094.1664983880953218353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d4gqofXP;
 spf=pass (domain: gmail.com, ip: 209.85.166.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id h19so2470118iof.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+D11JQqvxGxyW53BIndfDVszmtS1z6Mzw+Kgl+bfo9E=;
        b=d4gqofXP3bnRplsCrHg1WWNrquVlTiyIqKEDMViSm86Tz0Nvltna5RgTypPXBK1Dt8
         hgb0rbTSjm+QosvxemHW68ak1jz8Tv9LcC/obHvtK1Z6AO7OqP3RvrpEq9NeYWJey9/8
         mMvicJGzdgvo78AbQOb1RyBMXLfH0GpaGmTMLyu3LrrF5bDhT9qrGd6Gh+Ao5zqLjApf
         kmMxLFjnSwqgbJEA9ztYgJSBMeTvwB45Ci4oPmV6+bCs5HOEEe39DceERsH4ebtLfesa
         4Ct1QlE0zqSMoD7S9izJw706LuOdSeJSxPQajZE+m46+gEg4lCYpEjpD6FXlAI12zAJ0
         NwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+D11JQqvxGxyW53BIndfDVszmtS1z6Mzw+Kgl+bfo9E=;
        b=WkXxkjeYHPzeVAzpUDbLa6F5lZzgmmASeKlgcg5MOduKKkHXnYgwAacEQSM6lht/EV
         leZ1agPTAslCyfVZdOpSEa22+FLXnCsV+MG+pChCHNplm7ivxS3w5J0daY5ftsyd8lMb
         kYSyDo5XY8dx1OFj80TMVnc8aUiCYDzRxL7gGtMJqZ62c7HE9QQBIivNwmsJRo4w686f
         VUSwOEP3xq+zRqKUoBdTPXoJj/bicmAbgR4czgsQhJSLbstkMTMcIAnR/OAe3c/VeSjS
         1FYcHx91UdlCw+nEf5dWyXJofkvGjrmmOtKU/egkEdES/Ul2cS8T+WBxPLM9DlVoAVXZ
         yqRQ==
X-Gm-Message-State: ACrzQf0PLVrtdoKn1kMCCKMk+GT1B7X+qiNj0ck8sPAOxW3Ktg9o/y75
	10R138V2I5dREIIzoWS8e2/G3QBuKyPFlYZdpo+Fim6O
X-Google-Smtp-Source: 
 AMsMyM7esAVyP7KAPvEzb3AImeYPrFr+e/vqY2gzno6pW4bHMyYL3KF0iLRjpxrsExqSnmxY6KmJlzTX9yNHoys579Y=
X-Received: by 2002:a05:6602:14c1:b0:689:34d0:a0ef with SMTP id
 b1-20020a05660214c100b0068934d0a0efmr192366iow.69.1664983880087; Wed, 05 Oct
 2022 08:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
In-Reply-To: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Oct 2022 17:31:09 +0200
Message-ID: 
 <CANNYZj9zy23Vud+41johxrg6MTvx-rZAWQbKmB52NMYBjgYp4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000babdbe05ea4b4400"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 15:31:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171465

--000000000000babdbe05ea4b4400
Content-Type: text/plain; charset="UTF-8"

Has this regressed at some point? Why was it not needed before?

Alex

On Wed 5. Oct 2022 at 17.01, Thomas Perrot via lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:

> Otherwise, it isn't possible to interact with the UI.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-sato/images/core-image-sato.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb
> b/meta/recipes-sato/images/core-image-sato.bb
> index e63a229d1257..0e37c15097b3 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -12,6 +12,8 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool
> nativesdk-glib-2.0"
>
> +IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
> +
>  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m
> 256", d)}'
>  QB_MEM:qemuarmv5 = "-m 256"
>  QB_MEM:qemumips = "-m 256"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171461):
> https://lists.openembedded.org/g/openembedded-core/message/171461
> Mute This Topic: https://lists.openembedded.org/mt/94137249/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000babdbe05ea4b4400
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Has this regressed at some point? Why was it not needed b=
efore?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 5=
. Oct 2022 at 17.01, Thomas Perrot via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;thomas.perrot=3D<a href=3D"mailto:boot=
lin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)">Otherwise, it isn&#39;t possible to intera=
ct with the UI.<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D=
"noreferrer" target=3D"_blank">core-image-sato.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb"=
 rel=3D"noreferrer" target=3D"_blank">core-image-sato.bb</a> b/meta/recipes=
-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D"noreferrer" targe=
t=3D"_blank">core-image-sato.bb</a><br>
index e63a229d1257..0e37c15097b3 100644<br>
--- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D=
"noreferrer" target=3D"_blank">core-image-sato.bb</a><br>
+++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato.bb" rel=3D=
"noreferrer" target=3D"_blank">core-image-sato.bb</a><br>
@@ -12,6 +12,8 @@ inherit core-image<br>
=C2=A0TOOLCHAIN_HOST_TASK:append =3D &quot; nativesdk-intltool nativesdk-gl=
ib-2.0&quot;<br>
=C2=A0TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext =3D &quot; nativesdk=
-intltool nativesdk-glib-2.0&quot;<br>
<br>
+IMAGE_INSTALL:append:qemuall =3D &quot; kernel-module-virtio-input&quot;<b=
r>
+<br>
=C2=A0QB_MEM =3D &#39;${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &qu=
ot;opengl&quot;, &quot;-m 512&quot;, &quot;-m 256&quot;, d)}&#39;<br>
=C2=A0QB_MEM:qemuarmv5 =3D &quot;-m 256&quot;<br>
=C2=A0QB_MEM:qemumips =3D &quot;-m 256&quot;<br>
-- <br>
2.37.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171461): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171461" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171461</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94137249/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94137249/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000babdbe05ea4b4400--

