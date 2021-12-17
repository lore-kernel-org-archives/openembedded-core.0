Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E38BC433FE
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 16:37:55 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web11.8449.1639759073875772971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 08:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MfW6hbkB;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id h67so996432vkh.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hkjv9JaCRChl6zBTX9wbMS48BAPgmb/CxzDkMG3Nf8=;
        b=MfW6hbkBhGdEiF4JXpVyGYIznMDtrunvq0iHVR0UGsuzspP8T8ZzNK9ADEL+YX+ksk
         mlrA8O3T7aEPULhV085yBppczj7N4vHN25babGbBpqSHfCcF4XoeNnVg1WwqqbD5Y1q7
         1pOb2NBdOpm0L50nAVjhBdjoTPzIhp6OC7PH8ZFIiEcWpfL4ZKcXB/HOY3KrmJhMC1B6
         XSJGA1ktUD12JyGXK8OrJiKKJH7lvjDd4lY4IaLrXl3PbaoW3dJQrPgD1hE0I2F43R/V
         o6D98mgH1UTMjwyI3WP7Ipy7TDe6I1hRd0I/AIxOxFdSoVCTZ56ux5ZEsVy2aTL+xkfs
         NcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hkjv9JaCRChl6zBTX9wbMS48BAPgmb/CxzDkMG3Nf8=;
        b=2tbyvo5/VXtOkz+NW/WWjxpf7nsIu3e+r9nJrFDVXA55ZsIuaOFRBkI77dqsmmGpag
         brtfo+ON0VgSOEfJsmLzQlZoz12DIrZHMHPszT6IYfS1X8iRCuereRqaqvOvr/3N1ASG
         1ZLZwIDDT3SEO1EQsG10AoBGHIne0f5FdUdJleKyQs2/b0Fo3o6YGPKWbgAeACtr0cJb
         bQ1buax3tgP30y3qIPYaS/26PYvWETHb+bL+IAIKufq9wnBZuYu4zdKzteueF5Y1Ry+3
         fLtZ+zI3v2SXu+AiD2taCJ7Z3kjNpgbQLQGZ7SNVLnVFp1V7YdSCql1cf1xKbEzlfKTi
         +SUw==
X-Gm-Message-State: AOAM5309oNJT8Sl1kfEL+t1mmQz3DrbwDUr3CTB040/doR0jnpVlfEUv
	7dUznj+8FYqsHD7UIrmcXFEA2Nv9PFe+HKRZJ3k=
X-Google-Smtp-Source: 
 ABdhPJzAofhWAnjxenD1quM7H7T58D0O3LgjRHQfeAtay1cEkB/My2aRZEeaaQZG+I1a6kfdKQ1MpyFwZyH9L33PS78=
X-Received: by 2002:a05:6122:2005:: with SMTP id
 l5mr1637030vkd.4.1639759073077;
 Fri, 17 Dec 2021 08:37:53 -0800 (PST)
MIME-Version: 1.0
References: <20211217153630.1746217-1-matt@madison.systems>
 <20211217153630.1746217-3-matt@madison.systems>
In-Reply-To: <20211217153630.1746217-3-matt@madison.systems>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Dec 2021 19:37:40 +0300
Message-ID: 
 <CANNYZj9T6Mgcytg11VXDc2_3vqvkJnREpd9cPfjfqF7X3yB_4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/4] base.bbclass: add crate to OE_IMPORTS
To: Matt Madison <matt@madison.systems>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000116dd105d35a2992"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 16:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159834

--000000000000116dd105d35a2992
Content-Type: text/plain; charset="UTF-8"

Should this be named oe.crate for consistency and avoiding potential
clashes?

Alex

On Fri, 17 Dec 2021 at 18:37, Matt Madison <matt@madison.systems> wrote:

> to install the crate:// fetch handler.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b709777f24..ee9950f207 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -12,7 +12,7 @@ inherit logging
>
>  OE_EXTRA_IMPORTS ?= ""
>
> -OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa
> oe.reproducible ${OE_EXTRA_IMPORTS}"
> +OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package
> oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa
> oe.reproducible crate ${OE_EXTRA_IMPORTS}"
>  OE_IMPORTS[type] = "list"
>
>  PACKAGECONFIG_CONFARGS ??= ""
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159830):
> https://lists.openembedded.org/g/openembedded-core/message/159830
> Mute This Topic: https://lists.openembedded.org/mt/87791269/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000116dd105d35a2992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Should this be named oe.crate for consistency and avoiding=
 potential clashes?<div><br></div><div>Alex</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 17 Dec 2021 at 18:=
37, Matt Madison &lt;matt@madison.systems&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">to install the crate:// fetch handler.=
<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/classes/base.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index b709777f24..ee9950f207 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -12,7 +12,7 @@ inherit logging<br>
<br>
=C2=A0OE_EXTRA_IMPORTS ?=3D &quot;&quot;<br>
<br>
-OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.package oe.=
packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license <a href=3D"http:/=
/oe.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a> oe.reproducible ${OE=
_EXTRA_IMPORTS}&quot;<br>
+OE_IMPORTS +=3D &quot;os sys time oe.path oe.utils oe.types oe.package oe.=
packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license <a href=3D"http:/=
/oe.qa" rel=3D"noreferrer" target=3D"_blank">oe.qa</a> oe.reproducible crat=
e ${OE_EXTRA_IMPORTS}&quot;<br>
=C2=A0OE_IMPORTS[type] =3D &quot;list&quot;<br>
<br>
=C2=A0PACKAGECONFIG_CONFARGS ??=3D &quot;&quot;<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159830): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159830" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159830</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87791269/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87791269/1686489</a><br>
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

--000000000000116dd105d35a2992--

