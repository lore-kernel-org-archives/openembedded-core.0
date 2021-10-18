Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E728AC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:16:04 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.36876.1634566564342088669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=phXdyy3C;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id f4so810725uad.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Em7OoCtU7hZ2fqqBrwwZ95cI9PiLek36g++ab3Iyfn4=;
        b=phXdyy3C2eGxYdmXQGqJ6eO2d4xgWrIW9rurLf+TjtHJ2eNORYRWOeEtj7ZoumDqZY
         pRoPZgF07bPRxPTYL7NXEjeNewu0Iobi5uXKtbi1dCOFpAW9weWAo2dfc0Rh4FQgszuJ
         WHYqGnJ/Q8og7UqNrS6mkmXL3Csy7ATt39TA+DBXjK2vZ7YHIkBGS4UuQoDBkNR89bm1
         NuLEwO3U9LhHdGI0N09GKyDD0ySCcki7u/TwVQgD4nIrGd7yS0YfeGPadLksiuGRAfiz
         Fdc0Fd9ijc6FXfunbz3M/g6mpEnueTAm9IDOa6nbGchiT+diyHCHkJ5whyGsLqQ9FeWh
         GFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Em7OoCtU7hZ2fqqBrwwZ95cI9PiLek36g++ab3Iyfn4=;
        b=DEdK732HynJuOJZXoiag3fUG9h2Bgx4QoajM7dB4RPeXCaG/dGLL8bd5cU30lSj4ov
         nAuiuMzY9KXcxRy0A54ap4I0HFVB1fiDfXlQBTJ+jYtPnsjvPRb5zs8nqzhcm8B9i4jb
         WMd2I3ZUqk1LCfu+7nyO5m1gNzYFdGxW8kLzpMOP9k8Oe4gP22o6SxJ/32APDChzOEea
         Bw2a/yHzHdEIfbWAl8UssJ8Zf7fAzdtQy9tKs747WGwk5eLWOikXHa9qZydTluBv0MdW
         HNSgcgpNuUH2l+YaWlMALD7QEzqXMtg4Xhg1h5dXEMYMRGCnSfsxdm8LDgGxO4KYO+Ms
         E7FQ==
X-Gm-Message-State: AOAM530uNjca+yTSoaSPT5gKOfQxaUUnxk5SbUahqQf4npqv55XRjp3Q
	4fOJFFp6P2iW/cq+1XJ9OoR0E5oVw300mNyfWSw=
X-Google-Smtp-Source: 
 ABdhPJyzByZH2LvG6MAFD+LIm5OwPFqJm1hVvv38RSlnPGeznolESOcYFM+v0zcaWfJ0ptdT+HW7JGa+BHvQRDcQqzY=
X-Received: by 2002:a67:df18:: with SMTP id s24mr27185434vsk.40.1634566563417;
 Mon, 18 Oct 2021 07:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211018135322.246963-1-Martin.Jansa@gmail.com>
 <CANNYZj-A0eNR=GWz+-xdZQSxmWYNuU=0PGNQA-1d0w2tSp+NiA@mail.gmail.com>
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
In-Reply-To: 
 <CA+chaQf06t-OSB-x321YRUcWTTuooP=E4o1a0C+asiJJmQzn4g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 16:15:52 +0200
Message-ID: 
 <CANNYZj_7uKo5qJSqVq0gfc2yjeiEW=oLh3Xvkk+JXb0bkGAQiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add PACKAGECONFIG for opengl-or-es
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005fd1b205cea12f63"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 14:16:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157067

--0000000000005fd1b205cea12f63
Content-Type: text/plain; charset="UTF-8"

Sorry, but no. If you say 'Pending', the upstreaming is on you - I will
simply drop the patch if it proves to be a pain.

Alex

On Mon, 18 Oct 2021 at 16:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Oct 18, 2021 at 4:06 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Please do send this upstream, the patch looks like a pain to rebase (and
>> there's no AB config to test it).
>>
>
> Feel free to do that, I'm not interested in webkitgtk at all - just wanted
> it to disappear from build failures in world CI.
>

--0000000000005fd1b205cea12f63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, but no. If you say &#39;Pending&#39;, the upst=
reaming is on you - I will simply drop the patch if it proves to be a pain.=
</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 16:14, Marti=
n Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 4:06 PM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Pleas=
e do send this upstream, the patch looks like a pain to rebase (and there&#=
39;s no AB config to test it).</div></div></blockquote><div><br></div><div>=
Feel free to do that, I&#39;m not interested in webkitgtk at all - just wan=
ted it to disappear from build failures in world CI.=C2=A0</div></div></div=
>
</blockquote></div>

--0000000000005fd1b205cea12f63--

