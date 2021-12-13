Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73026C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:15:22 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web08.11401.1639404921694327383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AcVRkpYp;
 spf=pass (domain: gmail.com, ip: 209.85.221.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id m19so10453687vko.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4jUjcSURCbb3ifxQq3NPSI/81kn8pj51Kx2NOLvDTT4=;
        b=AcVRkpYpol842zsMcLrro7dLEyDmOo0EI2pwQaY0iLjSy1kVrvNEfXkgOOBIFY0Trk
         vk+4IgfvaA0ynJ2p5ZsmW2wotfCmxJGn9VQE5HuRR9p2OExW6EFWl+Htf6Q16c/h30Tj
         E+wVShqsKQoh5HYTki/a88ZNoTxfDC06SUmhbu4V4eGI16i6iNefu1Ms3DB7ET2B/JHQ
         xJWr3cainjDD9bmo+N0C9dEAmo13/YTJJFyuIInonMjE/0MckqaqUVWnF0+jOq9ZKlW+
         WmmpfI8GsaJuftE8N5OIyh4nq1L5kZ8Hdy/lmq1wpDc7/Ol70fcfS4+C9nzodOO44bGu
         YFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4jUjcSURCbb3ifxQq3NPSI/81kn8pj51Kx2NOLvDTT4=;
        b=WmANr2Tjx5Xl/PGWVvzDpfK0N00yLTCoJjnK3DSe+jELo2g42GIgjGBRuYQmSgdKKn
         tRnltKre7GTbAfPhaKtw0niloq0BFgtp/KAIa2AEA2u42/a+AigET26svEs6ctEwryDq
         MXUliyQm9CpKrubJ/sY4iswgg31ybHqg2jnsrvPhNbW2XR6TRgl6GZLCEsxyOWjVKvLY
         Kk1j1JWPRTcHVAa8DsLCL0CGVxTbDabouJMD5kNfm73+PuPru16PbSTDHAtMDgZfkajH
         FqGcRMKuCTh3JmVtHkZHwKacHE/eFMLCihvENd+yCFMmKM0yRnZ0OJxdoOs3MHsOThY2
         xF/w==
X-Gm-Message-State: AOAM530SXsoWZ/tzJCjqBg9UKund/Yd/GluBcFfybitHsYfwRv2hhhQD
	kT4samETvcE+C986OnAqJOG3o+EZz45aFf8xF2Y=
X-Google-Smtp-Source: 
 ABdhPJwhwmhV6PFq+Q6ILwFiBmNsYwy6Nq4intpGPINfovXfbOUMCA7/DXgLm/RYgCPWWFg/Fy5w8VeY/0J/RFaBJL8=
X-Received: by 2002:a05:6122:c6f:: with SMTP id
 i47mr31726551vkr.20.1639404920829;
 Mon, 13 Dec 2021 06:15:20 -0800 (PST)
MIME-Version: 1.0
References: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Dec 2021 15:15:09 +0100
Message-ID: 
 <CANNYZj86jyYyk418mdFt8B_LyH-gOzSLcN60zoEquAdQ_fO7bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libcap: upgrade 2.61 -> 2.62
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f2fb5d05d307b37e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 14:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159639

--000000000000f2fb5d05d307b37e
Content-Type: text/plain; charset="UTF-8"

No need to remove: it can be replaced with USE_GPERF, as the error message
is saying.

Alex

On Mon, 13 Dec 2021 at 14:20, wangmy <wangmy@fujitsu.com> wrote:

> Remove set of BUILD_GPERF since it is now reserved.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb}
> (95%)
>
> diff --git a/meta/recipes-support/libcap/libcap_2.61.bb
> b/meta/recipes-support/libcap/libcap_2.62.bb
> similarity index 95%
> rename from meta/recipes-support/libcap/libcap_2.61.bb
> rename to meta/recipes-support/libcap/libcap_2.62.bb
> index a3a6e10b89..7492ad816d 100644
> --- a/meta/recipes-support/libcap/libcap_2.61.bb
> +++ b/meta/recipes-support/libcap/libcap_2.62.bb
> @@ -16,7 +16,7 @@ SRC_URI =
> "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
>  SRC_URI:append:class-nativesdk = " \
>
> file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
>             "
> -SRC_URI[sha256sum] =
> "c1e29680f8bcc51b172e9a8eb9a7a4d7255a00a14301a7c2cf96d1febf7449a5"
> +SRC_URI[sha256sum] =
> "190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2"
>
>  UPSTREAM_CHECK_URI = "
> https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
>
> @@ -32,7 +32,6 @@ EXTRA_OEMAKE = " \
>    lib='${baselib}' \
>    RAISE_SETFCAP=no \
>    DYNAMIC=yes \
> -  BUILD_GPERF=yes \
>  "
>
>  EXTRA_OEMAKE:append:class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159628):
> https://lists.openembedded.org/g/openembedded-core/message/159628
> Mute This Topic: https://lists.openembedded.org/mt/87697026/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f2fb5d05d307b37e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No need to remove: it can be replaced with USE_GPERF,=
 as the error message is saying.</div><div><br></div><div>Alex<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, 13 Dec 2021 at 14:20, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Remove set of BUILD_GPERF since it is now reserved.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/libcap/{<a href=3D"http://libcap_2.61.bb" rel=3D=
"noreferrer" target=3D"_blank">libcap_2.61.bb</a> =3D&gt; <a href=3D"http:/=
/libcap_2.62.bb" rel=3D"noreferrer" target=3D"_blank">libcap_2.62.bb</a>} |=
 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/libcap/{<a href=3D"http://libcap_2.61.bb"=
 rel=3D"noreferrer" target=3D"_blank">libcap_2.61.bb</a> =3D&gt; <a href=3D=
"http://libcap_2.62.bb" rel=3D"noreferrer" target=3D"_blank">libcap_2.62.bb=
</a>} (95%)<br>
<br>
diff --git a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.61.bb" =
rel=3D"noreferrer" target=3D"_blank">libcap_2.61.bb</a> b/meta/recipes-supp=
ort/libcap/<a href=3D"http://libcap_2.62.bb" rel=3D"noreferrer" target=3D"_=
blank">libcap_2.62.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-support/libcap/<a href=3D"http://libcap_2.61.bb" r=
el=3D"noreferrer" target=3D"_blank">libcap_2.61.bb</a><br>
rename to meta/recipes-support/libcap/<a href=3D"http://libcap_2.62.bb" rel=
=3D"noreferrer" target=3D"_blank">libcap_2.62.bb</a><br>
index a3a6e10b89..7492ad816d 100644<br>
--- a/meta/recipes-support/libcap/<a href=3D"http://libcap_2.61.bb" rel=3D"=
noreferrer" target=3D"_blank">libcap_2.61.bb</a><br>
+++ b/meta/recipes-support/libcap/<a href=3D"http://libcap_2.62.bb" rel=3D"=
noreferrer" target=3D"_blank">libcap_2.62.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/libs/security=
/linux-privs/${BPN}2/${BPN}-${<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-nativesdk-libcap-Rais=
e-the-size-of-arrays-containing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;c1e29680f8bcc51b172e9a8eb9a7a4d7255a00a14301a=
7c2cf96d1febf7449a5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;190c5baac9bee06a129eae20d3e827de62f664fe3507f=
0bf6c50a9a59fbd83a2&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.kernel.org/pub/li=
nux/libs/security/linux-privs/$%7BBPN%7D2/" rel=3D"noreferrer" target=3D"_b=
lank">https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/</=
a>&quot;<br>
<br>
@@ -32,7 +32,6 @@ EXTRA_OEMAKE =3D &quot; \<br>
=C2=A0 =C2=A0lib=3D&#39;${baselib}&#39; \<br>
=C2=A0 =C2=A0RAISE_SETFCAP=3Dno \<br>
=C2=A0 =C2=A0DYNAMIC=3Dyes \<br>
-=C2=A0 BUILD_GPERF=3Dyes \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE:append:class-target =3D &quot; SYSTEM_HEADERS=3D${STAGIN=
G_INCDIR}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159628" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87697026/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87697026/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f2fb5d05d307b37e--

