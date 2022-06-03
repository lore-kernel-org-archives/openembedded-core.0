Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835D3C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 06:44:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.4509.1654238671368107425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 23:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/ZwOuFz;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u3so9158380wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M24uq53zgLLizDOKuZHevP0+6rXR/jM5WhH0/K9gTO8=;
        b=o/ZwOuFzDkSQdrbBnkAkTfl6376iYRbonh9vY+kDJ/7XlrWGhywTTnILozRQ4n5B1l
         sF6tWxXBevEOXn3UUZuNNOqe+v/INpmzHplXax7JfBBl/lrKlatEcOEnWIcN87v9uWYW
         zv2rZ4jInWskvsZJVxirv0atKkx/ElPJkSJIwYMgufiRKhip9n7jAzTd/qgSr0IpWULZ
         Bg1/oPoXVTGSgyA28PE/ERIiUrel9plSK0w+hINyoZoBFJswnMQ6RFPUeUzxYqZVu1f3
         K5Y1OO4Wd+LZFuEoBmoLZ1izEO2PXT1DvuTvo6S0T8Deab84RhDgQpaNVkdemRIpxWsq
         68Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M24uq53zgLLizDOKuZHevP0+6rXR/jM5WhH0/K9gTO8=;
        b=NyFrk2rld1bW5x4toUUkg+U+SKZo6uhHA7Hr3wkakhjmY4A+nTRu0hgW7DtV7KivFo
         s1IR0aWOZ0n6tHemA93PpA77JR5bY8iQWsYVtJlRKStom/+3wsqVlye8dhchfe3kR1QL
         JjBymLnr9B4XvHyMSOclN0wVZrDQ2YelOhxUiNtO/4dxMnduiJgS0Vh8a9Ov2eQq46Iq
         7xqQYXPmekh187ExAVr/wKuQK7p+KjMQLnYAeZkEaLpDv0+Igwan7PAJOiKlwuplTliY
         69fYGz6yjMcijiB4hU7dBZfPFGucKzmMJHmTbny3f4xsViWgHXroF6k0YF0dv2E7tHWI
         Ty7w==
X-Gm-Message-State: AOAM530yVXB/qU/SLJbAS/qGmSiLE7XZIgpd56MpzKqum2vH4DKG+Nht
	viCn46hPd+isAy4LCotdZVeq2KXlPjyzFKnHcGA=
X-Google-Smtp-Source: 
 ABdhPJzuwtrYw+OcODKqMnlA2saOqniBXjt8+do9wSg8SkfdOSAWYpV5osJlRnXCpWWr7W0XjxDr1PhZjQiV1AZCnQ4=
X-Received: by 2002:a5d:6c64:0:b0:20f:f413:8af8 with SMTP id
 r4-20020a5d6c64000000b0020ff4138af8mr6564189wrz.129.1654238669767; Thu, 02
 Jun 2022 23:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220603064121.7395-1-pavel@zhukoff.net>
In-Reply-To: <20220603064121.7395-1-pavel@zhukoff.net>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Jun 2022 08:44:18 +0200
Message-ID: 
 <CA+chaQdbUFZ3KgZsgFJCa7ZRMku8wkj6+Ddnaj06nEFTMPyxPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Make TCLIBC and TCMODE lazy
 assigned
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Content-Type: multipart/alternative; boundary="00000000000049089305e0857489"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 06:44:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166510

--00000000000049089305e0857489
Content-Type: text/plain; charset="UTF-8"

You can always override it from local.conf with an override, right? That
always worked for me and I don't see why this change is needed.

On Fri, Jun 3, 2022 at 8:42 AM Pavel Zhukov <pavel@zhukoff.net> wrote:

> This allows two level of overriding (distro level and local.conf/shell
> variable). Previous settings blocked shell variables overring
> if it was overriden on distro level.
>
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0e939aca4f..2a3cf6f8aa 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if
> oe.types.boolean(d.getVar
>  # General work and output directories for the build system.
>  ##################################################################
>
> -TCMODE ?= "default"
> -TCLIBC ?= "glibc"
> +TCMODE ??= "default"
> +TCLIBC ??= "glibc"
>  TMPDIR ?= "${TOPDIR}/tmp"
>
>  CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' +
> str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' +
> str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166509):
> https://lists.openembedded.org/g/openembedded-core/message/166509
> Mute This Topic: https://lists.openembedded.org/mt/91516557/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000049089305e0857489
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You can always override it from local.conf with an overrid=
e, right? That always worked for me and I don&#39;t see why this change is =
needed.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jun 3, 2022 at 8:42 AM Pavel Zhukov &lt;<a href=3D"mailto:pa=
vel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">This allows two level of overriding (dist=
ro level and local.conf/shell<br>
variable). Previous settings blocked shell variables overring<br>
if it was overriden on distro level.<br>
<br>
Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel.zhukov@huawei.com" =
target=3D"_blank">pavel.zhukov@huawei.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 0e939aca4f..2a3cf6f8aa 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?=3D &quot;${@&#39;files/fs-per=
ms.txt&#39; if oe.types.boolean(d.getVar<br>
=C2=A0# General work and output directories for the build system.<br>
=C2=A0##################################################################<br=
>
<br>
-TCMODE ?=3D &quot;default&quot;<br>
-TCLIBC ?=3D &quot;glibc&quot;<br>
+TCMODE ??=3D &quot;default&quot;<br>
+TCLIBC ??=3D &quot;glibc&quot;<br>
=C2=A0TMPDIR ?=3D &quot;${TOPDIR}/tmp&quot;<br>
<br>
=C2=A0CACHE =3D &quot;${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@[&#39;&#39;, &#=
39;/&#39; + str(d.getVar(&#39;MACHINE&#39;))][bool(d.getVar(&#39;MACHINE&#3=
9;))]}${@[&#39;&#39;, &#39;/&#39; + str(d.getVar(&#39;SDKMACHINE&#39;))][bo=
ol(d.getVar(&#39;SDKMACHINE&#39;))]}&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166509): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166509" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166509</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91516557/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91516557/3617156</a><br>
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

--00000000000049089305e0857489--

