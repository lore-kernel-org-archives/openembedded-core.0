Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81917C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:04:55 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.3377.1637741094046419940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:04:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TNQ2xOO2;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id t13so3294795uad.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xs01/F7chXI9HeskRL38+5qxhrNYrDEfaHkWXgX4Ctg=;
        b=TNQ2xOO2RZJdB+fcyGC4jvYNLYnW0A8qwNVrNjw8G4kIMTSvkJaL13Yw/zYvaE3+WL
         Qi7DDql/LbSJNRTL/M+hUysIgI7j6r2wJ3OwkFYLT3gjjORXW5wNlh47ZHZch0A+Y4L2
         ITEa6NLi2+w1qliMxPm7kqpihdz7VG4hfoDVGww+jUDOfrSA/ynfFEzuWOnyAmh9DPi6
         3oF6v7c+4dQoJxU7BGEkC0QQFdXr1yKDxJlHJdXK53b7VdngKSDfP8/OYkuyUERee9op
         cvkyb5TC+bcn3pg/ng8P4+yFdd3DfJkKhdu6xHS0+1GQCBPXiYXrwiutDTqZJ6Encttw
         v3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xs01/F7chXI9HeskRL38+5qxhrNYrDEfaHkWXgX4Ctg=;
        b=r96mAHfnQk+CmyxKaAqUDyIGbbOLrRGsGz46wz7CknwC3hRivId6bJA4DwkpuQiJAR
         GHu3QxdH/3CLi3w/VMTKnATH7SF3VznvjKxYuxR75Vz5MVAgqe0w5twL9bOhnsOxwy39
         lSye9TlNHIdAT419hxIYbGM+QvQAfZwLEFpWJrzk1OuQKeedBUzy7vHmzL+aZrDsKuN0
         XlPo8GoQYjY19enTcIcAMSUsneHYIpI3hPeE7nFvzO/4yURqpBLRNV9ci2nPziO0h4Dr
         vjpIvow8rM+tUs99F+NJBDTgxhPrdQUgP0lFxvFYjF+wf30opcTsto7lcOIy/S06tjfE
         hVNg==
X-Gm-Message-State: AOAM531JN2pfKnUMuuxC0CD8ipvemfuUyAj6nWfXxmA0ASiKNU58qpGM
	bLCpfzDr+rI2XVpELKmX0KCeokhbxB6N+1fU/He3lHwmCZg=
X-Google-Smtp-Source: 
 ABdhPJzrfJMZ1K/C2h3D13krh5H6fWIIwM5KTZfI1+p2bKM21zML7PgsB1QDmjPlgs9QPVb6Y7LF+CP6jIzZkMN3Wvo=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr20331116vsh.13.1637741093013;
 Wed, 24 Nov 2021 00:04:53 -0800 (PST)
MIME-Version: 1.0
References: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
In-Reply-To: <b92810a3-656a-8ad2-a8d9-960ec64cc616@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 09:04:41 +0100
Message-ID: 
 <CANNYZj_qUME7wgpfra73y4WbQ67wY79Xb0aXu9Lj4VJpuTwkMQ@mail.gmail.com>
Subject: Re: [OE-core] rust in SDK
To: Peter Bergin <peter@berginkonsult.se>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000154cae05d18450c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:04:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158656

--000000000000154cae05d18450c0
Content-Type: text/plain; charset="UTF-8"

Yocto is what you make it, and you shouldn't expect things to magically
happen if you wait for them.

If you are able to make rust work in SDK, adjust the docs, the readmes, add
the tests and examples, and send the patches, and then that's the new
status.

Alex

On Wed, 24 Nov 2021 at 08:59, Peter Bergin <peter@berginkonsult.se> wrote:

> Hi,
>
> I'm looking for information about how mature and tested it is to have
> rust tools in the SDK. In README-rust.md [1] there is a phrase "Once the
> Rust SDK support is added to oe-core..." which can be read that it is
> not ready yet. In the first bullet "What works:" it states "-buildsdk
> and -crosssdk" which I can't connect to oe-core terms.
>
> I have suceeded to add rust tools to a SDK by adding
> 'TOOLCHAIN_HOST_TASK:append = "
> packagegroup-rust-cross-canadian-${MACHINE}"' to my config. With this I
> have succeeded to cross-compile the simplest hello-world example for
> aarch64. Is this the way to go or is there work to do (reffering to
> README info)?
>
> Any information around rust and the status in oe-core are appreciated.
>
> Thanks,
> /Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158655):
> https://lists.openembedded.org/g/openembedded-core/message/158655
> Mute This Topic: https://lists.openembedded.org/mt/87277113/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000154cae05d18450c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yocto is what you make it, and you shouldn&#39;t expe=
ct things to magically happen if you wait for them. <br></div><div><br></di=
v><div>If you are able to make rust work in SDK, adjust the docs, the readm=
es, add the tests and examples, and send the patches, and then that&#39;s t=
he new status.<br></div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 20=
21 at 08:59, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">pet=
er@berginkonsult.se</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi,<br>
<br>
I&#39;m looking for information about how mature and tested it is to have <=
br>
rust tools in the SDK. In README-rust.md [1] there is a phrase &quot;Once t=
he <br>
Rust SDK support is added to oe-core...&quot; which can be read that it is =
<br>
not ready yet. In the first bullet &quot;What works:&quot; it states &quot;=
-buildsdk <br>
and -crosssdk&quot; which I can&#39;t connect to oe-core terms.<br>
<br>
I have suceeded to add rust tools to a SDK by adding <br>
&#39;TOOLCHAIN_HOST_TASK:append =3D &quot; <br>
packagegroup-rust-cross-canadian-${MACHINE}&quot;&#39; to my config. With t=
his I <br>
have succeeded to cross-compile the simplest hello-world example for <br>
aarch64. Is this the way to go or is there work to do (reffering to <br>
README info)?<br>
<br>
Any information around rust and the status in oe-core are appreciated.<br>
<br>
Thanks,<br>
/Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158655): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158655" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158655</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87277113/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87277113/1686489</a><br>
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

--000000000000154cae05d18450c0--

