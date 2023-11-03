Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8683DC4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:52:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.47878.1699005147270779511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 02:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIFS8tsL;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32ded3eb835so1255501f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699005145; x=1699609945; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MKNKXSfIV6Y15sp+/566Xg2ikEZXwFWjfHevY6/URzA=;
        b=QIFS8tsLypTECi+Ko59ovhFXkbP9gfzxVakQY4LPlbwd3064ltFqArZJ8uHpWpdXNA
         mNmYj5/8S9NHi0yFVyCJtOE0x+TM4vteyxSlq+OgLo6lFKKBTGy6BvXKfqihOlKSmijY
         hxPGPaFCzx3tK7LMeu95L3x5dkePCXgfM2hm6z8b0HIURO6zpNpCK+V7+KFgFrKNkoxJ
         E9hNHi/nj8hE95wP4e0YYNJKnVV4c/djJjFTjPZKZVNUCaCZDXgd/M0S1pIwx9S4e9Mt
         1XkczD2Mo7Q2JFI+BRkHY6gD/kNRFosF58QRYhk4iymaUeNByjupwndv886OXX3W2kt/
         TCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699005145; x=1699609945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKNKXSfIV6Y15sp+/566Xg2ikEZXwFWjfHevY6/URzA=;
        b=VFEVDCH7FL6Xh93DeRwkKTawQvOrQsE/U6fkg0oCAt40H5Ahkrwn6fnvpKGMuzD6Dv
         EDYhC3dH+S1Z2e//A3bqzRWirUrlHgKGckj2BiGqnzzMw7aKw4ZMbni4p7DhoLTew6TJ
         jp3soB6CqKmFpEx3xkLtm+wdUHTTIu/MkHh/xWSERmsTCRNlsRJxvpmjgT/J5iH5cLRT
         SERj57CpJnCf6fVDAwg224opAp9Q4Wv+V07oJOKOOpeK5n4vU11onp+/JhX6+ZWVgnsd
         NuRjNOyCsPWlCsNhkkHB8mbF3pX3BspAim4byqAZl616D292UNHa/3HL9vLryDXU/468
         mdgA==
X-Gm-Message-State: AOJu0YwlxsDheZV7LjhcorJYlE1maB/wQbT7zz9t+IY1ccpjL16/CmCT
	yun+ZyBxS+rcaDAzZzHKiypszYNCDG56ww9ij70=
X-Google-Smtp-Source: AGHT+IES0nItAp0IziosBocfHVp6w8cBVNKq+o5tkrfAbbyR33cCpiFsQ4R69YZT9keifZ5XSa//KBgvKZYGk/S0SIU=
X-Received: by 2002:adf:d1e3:0:b0:32f:7cb7:f66 with SMTP id
 g3-20020adfd1e3000000b0032f7cb70f66mr18341098wrd.20.1699005145206; Fri, 03
 Nov 2023 02:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <b42f4bae-5096-4a99-ac85-8750396580b8@bootlin.com>
In-Reply-To: <b42f4bae-5096-4a99-ac85-8750396580b8@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 Nov 2023 10:52:12 +0100
Message-ID: <CA+chaQc+cEQxc+HjyRBqXVL0m7718Ffb=XXtaKO2DiShE18dGg@mail.gmail.com>
Subject: Re: [OE-core] Meaning of the name of the "cml1" class?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000026db1e06093c7655"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 09:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190146

--00000000000026db1e06093c7655
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The answer from 2022-07-18 on #yocto channel:

20:20 < hushmoney> what does clm1 stand for as in clm1.bbclass?
20:20 < hushmoney> s/clm1/cml1/g
20:31 < JaMa> hushmoney: interesting question, the bbclass was introduced
very long time ago (already included in 2004
https://git.openembedded.org/openembedded/commit/?h=3Dmaster&id=3Da780643c4=
b6aa11e1a36965a69df7116477c7b4c)
and it was very small until
https://git.openembedded.org/openembedded/commit/?h=3Dmaster&id=3Df6433e75a=
047a2d38ab60efea8a7ab7cc3dcd822
Don't know what it really stands for
20:35 < hushmoney> yes that's what i saw too
20:37 < hushmoney> i grepped the linux source for cml1 and only found
references to some clock in modules and device trees, don't think that's
related
20:45 < JaMa> http://www.catb.org/~esr/cml2/ANNOUNCEMENT
20:48 < hushmoney> wow, good find! still doesn't answer what cml stands
for, but at least i know now to what it refers and that more answers lie
outside of yocto history
20:50 < hushmoney> here it is. cml =3D Configuration Menu Language
20:50 < hushmoney> JaMa: thanks!
20:51 < hushmoney> sort of an odd choice for that bbclass name, but at
least now i know where it came from
20:56 < kergoth> hushmoney: it's named based on the ocnifguration language
it interacts with, as it's common to more than just kernels, it's used by
busybox, buildroot, and other projects as well

On Fri, Nov 3, 2023 at 10:43=E2=80=AFAM Michael Opdenacker via
lists.openembedded.org <michael.opdenacker=3D
bootlin.com@lists.openembedded.org> wrote:

> Greetings
>
> I'd like to explain the meaning of the name of the "cml1" class in the
> documentation. This would help to remember this name.
>  From what I've seen, it has this name since the beginning of the git
> history.
>
> Do those of you who are veterans remember what the name originally meant?
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190145):
> https://lists.openembedded.org/g/openembedded-core/message/190145
> Mute This Topic: https://lists.openembedded.org/mt/102360721/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000026db1e06093c7655
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The answer from=C2=A02022-07-18 on #yocto channel:</d=
iv><div><br></div>20:20 &lt; hushmoney&gt; what does clm1 stand for as in c=
lm1.bbclass?<br>20:20 &lt; hushmoney&gt; s/clm1/cml1/g<br>20:31 &lt; JaMa&g=
t; hushmoney: interesting question, the bbclass was introduced very long ti=
me ago (already included in 2004 <a href=3D"https://git.openembedded.org/op=
enembedded/commit/?h=3Dmaster&amp;id=3Da780643c4b6aa11e1a36965a69df7116477c=
7b4c">https://git.openembedded.org/openembedded/commit/?h=3Dmaster&amp;id=
=3Da780643c4b6aa11e1a36965a69df7116477c7b4c</a>) and it was very small unti=
l <a href=3D"https://git.openembedded.org/openembedded/commit/?h=3Dmaster&a=
mp;id=3Df6433e75a047a2d38ab60efea8a7ab7cc3dcd822">https://git.openembedded.=
org/openembedded/commit/?h=3Dmaster&amp;id=3Df6433e75a047a2d38ab60efea8a7ab=
7cc3dcd822</a> Don&#39;t know what it really stands for<br>20:35 &lt; hushm=
oney&gt; yes that&#39;s what i saw too<br>20:37 &lt; hushmoney&gt; i greppe=
d the linux source for cml1 and only found references to some clock in modu=
les and device trees, don&#39;t think that&#39;s related<br>20:45 &lt; JaMa=
&gt; <a href=3D"http://www.catb.org/~esr/cml2/ANNOUNCEMENT">http://www.catb=
.org/~esr/cml2/ANNOUNCEMENT</a><br>20:48 &lt; hushmoney&gt; wow, good find!=
 still doesn&#39;t answer what cml stands for, but at least i know now to w=
hat it refers and that more answers lie outside of yocto history<br>20:50 &=
lt; hushmoney&gt; here it is. cml =3D Configuration Menu Language <br>20:50=
 &lt; hushmoney&gt; JaMa: thanks!<br>20:51 &lt; hushmoney&gt; sort of an od=
d choice for that bbclass name, but at least now i know where it came from<=
br>20:56 &lt; kergoth&gt; hushmoney: it&#39;s named based on the ocnifgurat=
ion language it interacts with, as it&#39;s common to more than just kernel=
s, it&#39;s used by busybox, buildroot, and other projects as well<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Nov 3, 2023 at 10:43=E2=80=AFAM Michael Opdenacker via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;michael.opdenacker=
=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Greetings<br>
<br>
I&#39;d like to explain the meaning of the name of the &quot;cml1&quot; cla=
ss in the <br>
documentation. This would help to remember this name.<br>
=C2=A0From what I&#39;ve seen, it has this name since the beginning of the =
git <br>
history.<br>
<br>
Do those of you who are veterans remember what the name originally meant?<b=
r>
Thanks in advance<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190145): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190145" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190145</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102360721/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102360721/3617156</a><br>
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

--00000000000026db1e06093c7655--

