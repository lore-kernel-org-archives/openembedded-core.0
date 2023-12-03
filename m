Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB77C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 11:35:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.37137.1701603338917233665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 03:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RP+y/4dY;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33339d843b9so976709f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701603337; x=1702208137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8nsP5eW5OAHiljsI7l/vDrE4kSRXwQOcd1W7EIFKd+g=;
        b=RP+y/4dYBJ+KEsW6aIDGClCQLBBW/pUXyIBK+J8sQy/2jetKugGwOMKv8PGpy5NfTu
         tB6UhgDVMHglNiaY2sy+zyRPQDptgRcDaAqq3av8q6oTy61UleSxwC15yJKgIvKMkSYT
         JR8vx/xxxZWwQPvJ3pFhPFJH9IN4H6p5qWBu/ZydCXmsBQhDaHTv5/zTxGj9Lj1AgAI5
         sCiKrkNlgBXlseuBKGtOhhA+5kCUr6jxGVe49xYxw8BZ6Vu9CUBK9cf7h2c+rW7D8X94
         Q/iijAj1o/lDMv9bq39f9B+85d7C8mbpRyJcSGKomo8XTs3VqZJdYWGPyajpaHm7qldK
         8evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701603337; x=1702208137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nsP5eW5OAHiljsI7l/vDrE4kSRXwQOcd1W7EIFKd+g=;
        b=VRdy4gHZiCK1ObdiFkJFxtSycaf9x8gqbS/YlR0f9/KW1DmUqUvJHqYcfF7M9H25K7
         VcJryl0Zt34xHf9x/4H6uHooPE0QfMJ05onYyKXqQ4ZKG0uAAXMKws3IeaB5CVarfUhH
         x4LIxXlnHsBHAQtw44z1tfcoDK5jLpFaX3/AZxHzgNYsd1zJuiP0g++vt4bE0ScxplGh
         4bAY9m3xssqJeCbGUgarBJ6dZPrdwiHz+NE1Nfb76Qf1ZgtfSdp93rtqv9HPKnz2s47o
         pkO0s/Pq8YjgErszuNJrCv7Rvm7F4c0XMo2CFiYTZW1WmqCLZJW7CtBaKBLucT0nY4zE
         YHtw==
X-Gm-Message-State: AOJu0YzSjBHPYCf+3o1fLYr6wAr5LLlo4wL/Rq+B0i84zC/+lpKi1Trs
	S/HHvdeH6S4BC5EZajBrvs/hCOQpkMMoDdm7hQ4=
X-Google-Smtp-Source: AGHT+IHnhWJdQwZIP61GUOCZkr2hH8yHcUacFYrc67GaIKkpKbZrwaDwdrEevVV7HwEEbtUO2BVBR3onxUPhRM6x77c=
X-Received: by 2002:adf:f452:0:b0:333:135f:a7f4 with SMTP id
 f18-20020adff452000000b00333135fa7f4mr2345143wrp.56.1701603337012; Sun, 03
 Dec 2023 03:35:37 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9c1Lyk+vsVvQKWq9VL_5=jw1CyRtFvxZ7rn_-uzohaJA@mail.gmail.com>
In-Reply-To: <CAB2nKc9c1Lyk+vsVvQKWq9VL_5=jw1CyRtFvxZ7rn_-uzohaJA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Dec 2023 12:35:25 +0100
Message-ID: <CA+chaQdhpR5PNJKoDGKLre29pjC_FLajH4pA2a83z29c_zpErw@mail.gmail.com>
Subject: Re: [OE-core] packagegroup-base.bb override syntax
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000738b8e060b9966ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 11:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191711

--000000000000738b8e060b9966ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Because this line is wrong and should be removed completely. Please send a
patch removing it.

On Sun, Dec 3, 2023 at 12:24=E2=80=AFPM Vincent Prince <vincent.prince.fr@g=
mail.com>
wrote:

> Hello,
>
> I just came back to Yocto after several years of pause, I see that
> there is a new override syntax, and I'm wondering why the following
> line is not changed ?
>
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/pac=
kagegroups/packagegroup-base.bb?h=3Dmaster-next#n125
>
> DEPENDS_packagegroup-distro-base =3D "${DISTRO_EXTRA_DEPENDS}"
>
> (and not DEPENDS:packagegroup-distro-base)
>
> Sorry by advance if this question has trivial response
>
> Best regards,
> Vincent
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191710):
> https://lists.openembedded.org/g/openembedded-core/message/191710
> Mute This Topic: https://lists.openembedded.org/mt/102949698/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000738b8e060b9966ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Because this line is wrong and should be removed completel=
y. Please send a patch removing it.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 3, 2023 at 12:24=E2=80=AFPM =
Vincent Prince &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com">vincent.p=
rince.fr@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello,<br>
<br>
I just came back to Yocto after several years of pause, I see that<br>
there is a new override syntax, and I&#39;m wondering why the following<br>
line is not changed ?<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-core/packagegroups/packagegroup-base.bb?h=3Dmaster-next#n125" rel=3D"noref=
errer" target=3D"_blank">https://git.openembedded.org/openembedded-core/tre=
e/meta/recipes-core/packagegroups/packagegroup-base.bb?h=3Dmaster-next#n125=
</a><br>
<br>
DEPENDS_packagegroup-distro-base =3D &quot;${DISTRO_EXTRA_DEPENDS}&quot;<br=
>
<br>
(and not DEPENDS:packagegroup-distro-base)<br>
<br>
Sorry by advance if this question has trivial response<br>
<br>
Best regards,<br>
Vincent<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191710): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191710" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191710</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102949698/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102949698/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000738b8e060b9966ae--

