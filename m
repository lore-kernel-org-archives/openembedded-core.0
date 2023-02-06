Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3901C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 21:13:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.66716.1675718001045454135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 13:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aJly9Qa7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1332956wmb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 13:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYxPyjtnxJqa1Qj25DU+H+klchfrb2X2mnlGSuMu74M=;
        b=aJly9Qa7DBxLoRlUYRxcR7i/cDB4i9oMpna9uQdvW+AB47Yv8VZw17/6ahftPAqFd6
         d1JvOIPXoJpTxgSzB6fXvm8zmayGhop0I+gS3YgW+79PeOgqhPybbKisqCaQwty9IXcx
         hFDDKbqdoo2l8NlEhaBWxQ7L4UIcX3TtqJRhEkfot6SBzl3dwFI4lyjxns/baRweP0s7
         76ia8g7BYVLU2P1Ld3zOdyhVzIJE81qSy2GMQp9sMrv5KbHMqNuOeTdPVNxLiUyXuxpa
         37V+f9pLKH3U3wUVnEX9u0HwuP+sqxcgoF7O8+u9JoFl4eFZRCLKO8r2UodwbMGCiM+H
         VQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYxPyjtnxJqa1Qj25DU+H+klchfrb2X2mnlGSuMu74M=;
        b=w48X8buZToXXt347LWWq5W8m7HsqdYQBrnEhuXg639z6TUmloohkiMxC4fa1QWUfEi
         0H0+xxUQjZ1ME+SsWg+JKdMD22Rjdcdj7YojaZ3KfJk8h5luLcP4vrceKtAdCS1xOYQ2
         uJrWtDz6/SnTXvGy50+82Bl9oYXKa/HdL2X0mYdOPq3giC7RYqxrfl3jYCB5k7fcXRyw
         LVzH9g4OSUIUQCcNI43ffR8QsZETLw3pltC6+6SMessQuQFjkZrJzVIC0hvs3QUyf2tS
         gXdRwE4xLZGT2jGtdOi5QDkuYqZpjiONPAv6pdOvSWte5hOhLSAb7OruSB9Db58uK595
         2EiQ==
X-Gm-Message-State: AO0yUKXR9YEByLgrkZqMUNRE6hYlE3LEwLUycnuttHHtw4yILniVRqoE
	mjIjwZPhF6rUx/2YFFfiCb5zwz+4EGEhDz0NO04=
X-Google-Smtp-Source: AK7set9gU28uDzGBIQ6ROT1XNdigdXcl4kneFMdnT6WkEFHzcRMKBAJQqd5Ho7UlpOpWfSWG5+sgVB4L4cxYyFr5Emg=
X-Received: by 2002:a05:600c:384a:b0:3df:fc66:254 with SMTP id
 s10-20020a05600c384a00b003dffc660254mr407104wmr.2.1675717999377; Mon, 06 Feb
 2023 13:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20230206210911.2074894-1-tom.hochstein@nxp.com>
In-Reply-To: <20230206210911.2074894-1-tom.hochstein@nxp.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 6 Feb 2023 22:13:08 +0100
Message-ID: <CA+chaQcNJc+k_SGvbzOAQPPHdf=6M3397qyiSV49v2eAiRf+ZQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] nlohmann-json: Allow empty main
 package for SDK
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018c07c05f40e80b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 21:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176798

--00000000000018c07c05f40e80b5
Content-Type: text/plain; charset="UTF-8"

Wrong ML and why do you want to install empty package? Add
nlohmann-json-dev to imx-gpu-sdk recipe instead.

On Mon, Feb 6, 2023 at 10:09 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:

> The header-only package cannot be included in the SDK without marking
> the main package with ALLOW_EMPTY.
>
> Fixes rootfs problem:
> ```
> The following packages have unmet dependencies:
>  imx-gpu-sdk : Depends: nlohmann-json but it is not installable
> E: Unable to correct problems, you have held broken packages.
> ```
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/
> nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/
> nlohmann-json_3.11.2.bb
> index 502262820..6cf27755e 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> @@ -18,7 +18,7 @@ inherit cmake
>  EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
>
>  # nlohmann-json is a header only C++ library, so the main package will be
> empty.
> -
> +ALLOW_EMPTY:${PN} = "1"
>  RDEPENDS:${PN}-dev = ""
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176797):
> https://lists.openembedded.org/g/openembedded-core/message/176797
> Mute This Topic: https://lists.openembedded.org/mt/96793459/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000018c07c05f40e80b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong ML and why do you want to install empty package? Add=
 nlohmann-json-dev to imx-gpu-sdk recipe instead.</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 6, 2023 at 10:=
09 PM Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com">tom.hochst=
ein@nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The header-only package cannot be included in the SDK without ma=
rking<br>
the main package with ALLOW_EMPTY.<br>
<br>
Fixes rootfs problem:<br>
```<br>
The following packages have unmet dependencies:<br>
=C2=A0imx-gpu-sdk : Depends: nlohmann-json but it is not installable<br>
E: Unable to correct problems, you have held broken packages.<br>
```<br>
<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.com" t=
arget=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://nlohmann-jso=
n_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_3.11.2.bb</=
a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://nlohm=
ann-json_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_3.11=
.2.bb</a> b/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://nlohma=
nn-json_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_3.11.=
2.bb</a><br>
index 502262820..6cf27755e 100644<br>
--- a/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://nlohmann-jso=
n_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_3.11.2.bb</=
a><br>
+++ b/meta-oe/recipes-devtools/nlohmann-json/<a href=3D"http://nlohmann-jso=
n_3.11.2.bb" rel=3D"noreferrer" target=3D"_blank">nlohmann-json_3.11.2.bb</=
a><br>
@@ -18,7 +18,7 @@ inherit cmake<br>
=C2=A0EXTRA_OECMAKE +=3D &quot;-DJSON_BuildTests=3DOFF&quot;<br>
<br>
=C2=A0# nlohmann-json is a header only C++ library, so the main package wil=
l be empty.<br>
-<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
=C2=A0RDEPENDS:${PN}-dev =3D &quot;&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176797): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176797" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176797</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96793459/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96793459/3617156</a><br>
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

--00000000000018c07c05f40e80b5--

