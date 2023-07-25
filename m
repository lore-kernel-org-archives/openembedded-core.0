Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCB4C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 15:09:34 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.22887.1690297773227129921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 08:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mU39xSCs;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3a5ac84718dso2215768b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690297772; x=1690902572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uy2LLDu0RJzzxW0mUIIOgi/YQqGdrHFFKSbXyXWKexg=;
        b=mU39xSCsTbB/g/beQojGlnFXe0/i/vFZ4iba0+GA8pP2mYoGnYNxV7vnBeUFwkfB5+
         JBg0knsgIrJhAKNyP+Caw1mgJu175z0ORmJK/Qmva6raYmDKU79niQaN0a1SQKFLdTM6
         DOiOUBkPQx/c0JZhuVMGVBfdp8G+z6ocnYm1X4wh+P3dm+ACGiRGjsZrFnmc1IoM216o
         FQSBXUfBlnBIPEnDsbc9BFYMNxcpN29i6gEE95e7bi9Dhn4TscvnzU8Rl2jsBwTUZeVo
         U5CrRDifB8pajdtbt0BvLv6+L96164K2MdPdy4zFG5pMNcOKhxXyBwzSlcXt27DJLIMd
         l+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690297772; x=1690902572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uy2LLDu0RJzzxW0mUIIOgi/YQqGdrHFFKSbXyXWKexg=;
        b=hFSeMDOnVF45rCudjY237YemUbFqfXFVg67SWtOWEbHOFiR1CsoPv9NUPAI/261YgQ
         Yx1ooKbLZDSKJaQAzXfUZaNcbD5w3gP7zNX6F9vhxXmYOHWVrmNHKaxtjmViYxps5SPc
         CHr3f62vjdGBipwdPrkdjU+5akeowRh7kfRouJDEaBT7TKP+YI37uQgLc7jP7rqHncjw
         Funs9EP+HvD+wgcdK0h7uyhf4hgqo5iXh1VrtuXQgyVHC+S+QdS7Y1Vg5qtgj3Va1ll1
         ZWSeMI4YKdJ4+XdAFdF7TkMPcLKkEmk432ueFoGetEq1Ej7HgGeEYoS6+amcs53IhWVS
         ZkkQ==
X-Gm-Message-State: ABy/qLZk8avTXVAveUmSojLJ2ng1Dsz1AG/2cP6izy2aRwCDpLj6Y9Vg
	i2b8pC7YUHgkBDbwRwrj/dyxkHEWnoRP8lptUkM=
X-Google-Smtp-Source: APBJJlFbYhZKHqNfVMtFxpXbGLa+fFS3OtjGdHsF4+2bB2WmhFXq8Et9ST/xPSq7VDN/sayIXUTaSNOEIV+qXPGYlHA=
X-Received: by 2002:a05:6808:1786:b0:3a1:e282:8405 with SMTP id
 bg6-20020a056808178600b003a1e2828405mr16958114oib.13.1690297772314; Tue, 25
 Jul 2023 08:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230725065258.2203988-1-raj.khem@gmail.com> <CA+chaQfK48AnB5cOnCr6qfGkADoHMcf-gqAjNpOiMnk0gEB8-w@mail.gmail.com>
In-Reply-To: <CA+chaQfK48AnB5cOnCr6qfGkADoHMcf-gqAjNpOiMnk0gEB8-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jul 2023 08:09:21 -0700
Message-ID: <CAMKF1srU5BnCXYO-J4U7v0C9W+1s_yCmbLogjKWbGd3Q=YqVJg@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH] binutils: Upgrade to 2.41 release
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004896eb0601511e58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 15:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184848

--0000000000004896eb0601511e58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 1:24 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> On Tue, Jul 25, 2023 at 8:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> Detailed changes [1]
>>
>> [1] https://sourceware.org/pipermail/binutils/2023-August/122246.html
>
>
>  Release announcement from future? Now we know your secret! :).
>

Look at RFT tag it=E2=80=99s not yet released but that=E2=80=99s the templa=
te I need to
fill in later :)

>

--0000000000004896eb0601511e58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 25, 2023 at 1:24 AM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Tue=
, Jul 25, 2023 at 8:53=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">De=
tailed changes [1]<br>
<br>
[1] <a href=3D"https://sourceware.org/pipermail/binutils/2023-August/122246=
.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermai=
l/binutils/2023-August/122246.html</a></blockquote><div><br></div><div>=C2=
=A0Release announcement from future? Now we know your secret! :).</div></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Look at =
RFT tag it=E2=80=99s not yet released but that=E2=80=99s the template I nee=
d to fill in later :)</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><div dir=3D"auto"></div></div></div>
</blockquote></div></div>

--0000000000004896eb0601511e58--

