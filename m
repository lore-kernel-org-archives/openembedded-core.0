Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E444C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 16:50:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.40857.1702486205575182907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 08:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFIlvsLu;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso73490305e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486204; x=1703091004; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6puiAbxqv2NHeNZ4cWJy2KRAP1M8UxM0xgcZvyvTfUE=;
        b=mFIlvsLufs0p4VHI4PLhLdLFDORduX/c6LwYp/pASz/Yk+0IvmQaIgcD/vs3YfJwH7
         TPC784tdkExwlkqxkigZ22FyJQ/dsZmbcKmrOQ6bKhq4OB21c/pgnI/1g9SN5MxUH6rm
         cYkULy0NjIF5V+kznW/KWDlJ5JTt3v5Aok+mfXlBycnmiRAXgbjgRXlimqD8rKwMc9Uq
         pbjSYJvmeRHS0TxmZfFytAekCtBSL93LghjDs4vTbfbbqlTexeM1MzLY2cX/BablWr7+
         GO6MNGlI307CGeH9c/eFwMwVokw+PTeEQi1TmGB7PlZ8Yzz+eFyNaK9yYDS5/y+uLB6s
         Xr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486204; x=1703091004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6puiAbxqv2NHeNZ4cWJy2KRAP1M8UxM0xgcZvyvTfUE=;
        b=RT5jaUROVIExoapWhTBIvcyLZbFoeCecVSPai+zf1FuAMogfFzfQH2uiIhfPucfJuO
         tVZZ9Bhw9UPfB54oV1y/+xYbQkoG/W4aIZUqYKYreoWAO1hQLvaKLdCQbYjZnnI5nMJ+
         /Es3oCyg9pr0yzPEygl4N/zoLYk0vsacRwDPhwaKUpzq+DDcdWr4OQrK1MMl/D6j5ue4
         VcqAeICDBB5SO1A5ZLfjzMmhaEzJRNxMkI8zNfu2ZtqDOCsv7LAGakJN2CMqirPgpSIw
         akZ+ns6SeO/LNsw8eEZNEAZEMoSl3BniuWLNYop0z7B0Ynx6flNZN5FBFbAB9FEvJhT3
         SNqA==
X-Gm-Message-State: AOJu0YwkaO2bzeq/R8cxcNeQncejug8DekqzBSHE9KY/hq50ncZ8OUEO
	JSTVBwIuEMLjDauN0+HVvEB09hepAdbG8kxcAo8=
X-Google-Smtp-Source: AGHT+IFboJzMHZVBKmAG8aA9RM3xO3tgbzLNlD4Py16eWShHX9LUmP+JMAx4egui8H/0jFaAfqV79Y1RhR4oG+98/TI=
X-Received: by 2002:a7b:cb4d:0:b0:40c:50d5:f7ac with SMTP id
 v13-20020a7bcb4d000000b0040c50d5f7acmr1706631wmj.60.1702486203822; Wed, 13
 Dec 2023 08:50:03 -0800 (PST)
MIME-Version: 1.0
References: <68402d42-2ab-a052-3f2f-bee4a87382ed@crashcourse.ca>
In-Reply-To: <68402d42-2ab-a052-3f2f-bee4a87382ed@crashcourse.ca>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Dec 2023 17:49:51 +0100
Message-ID: <CA+chaQfbXLoZvrk-Ogxez+JMCu1RrOTDkq5nUn7v4_51H_8VKw@mail.gmail.com>
Subject: Re: [OE-core] why does using ${AUTOREV} with kernel recipe rebuild
 every time?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000069f79d060c66f508"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192308

--00000000000069f79d060c66f508
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You didn't say which Yocto release that WRL build was using, maybe your
deploy artifacts are changing due to package_get_auto_pr calls or not
excluded DATETIME in your filenames as described in:
https://patchwork.yoctoproject.org/project/oe-core/patch/932d980fb4fcfd3b78=
183d5bd51adb4f038eee47.1700600804.git.martin.jansa@gmail.com/

unfortunately this whole series
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D19541 was
rejected:
https://lists.openembedded.org/g/openembedded-core/message/191101

On Wed, Dec 13, 2023 at 4:54=E2=80=AFPM Robert P. J. Day <rpjday@crashcours=
e.ca>
wrote:

>
>   i *know* i should know the answer to this, but someone just showed
> me a build (WRLinux-based, but still relevant) where the linux kernel
> recipe uses:
>
>   SRCREV_machine =3D ${AUTOREV}
>
> which is what one reads in the WRL version of linux-yocto-custom.bb,
> but also makes it clear in that recipe file that that is discouraged.
>
>   in any event, this appears to be forcing an entire rebuild of the
> kernel every time, even in the presence of sstate-cache, so the
> obvious question is, what is it about using ${AUTOREV} that defeats
> the use of sstate-cache? apologies if this should be obvious.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192303):
> https://lists.openembedded.org/g/openembedded-core/message/192303
> Mute This Topic: https://lists.openembedded.org/mt/103151800/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069f79d060c66f508
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You didn&#39;t say which Yocto release that WRL build was =
using, maybe your deploy artifacts are changing due to=C2=A0package_get_aut=
o_pr calls or not excluded DATETIME in your filenames as described in:<div>=
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/932d980=
fb4fcfd3b78183d5bd51adb4f038eee47.1700600804.git.martin.jansa@gmail.com/" t=
arget=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/9=
32d980fb4fcfd3b78183d5bd51adb4f038eee47.1700600804.git.martin.jansa@gmail.c=
om/</a><br></div><div><br></div><div>unfortunately this whole series <a hre=
f=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D1954=
1" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/lis=
t/?series=3D19541</a> was rejected:</div><div><a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/191101">https://lists.openembedded=
.org/g/openembedded-core/message/191101</a><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 13, 2023=
 at 4:54=E2=80=AFPM Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcour=
se.ca" target=3D"_blank">rpjday@crashcourse.ca</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 i *know* i should know the answer to this, but someone just showed<b=
r>
me a build (WRLinux-based, but still relevant) where the linux kernel<br>
recipe uses:<br>
<br>
=C2=A0 SRCREV_machine =3D ${AUTOREV}<br>
<br>
which is what one reads in the WRL version of <a href=3D"http://linux-yocto=
-custom.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-custom.bb</a>,=
<br>
but also makes it clear in that recipe file that that is discouraged.<br>
<br>
=C2=A0 in any event, this appears to be forcing an entire rebuild of the<br=
>
kernel every time, even in the presence of sstate-cache, so the<br>
obvious question is, what is it about using ${AUTOREV} that defeats<br>
the use of sstate-cache? apologies if this should be obvious.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192303): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192303" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192303</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103151800/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103151800/3617156</a><br>
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

--00000000000069f79d060c66f508--

