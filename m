Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.1216.1620240579006695280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gxkq9Yiv;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a12so892868uak.6
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O3phQ5WnH+fjpqqGeLyWt4jMMOe0eKPE4Jb+7JdOf+w=;
        b=gxkq9Yive6Nc9EV21JdnPlaoydN9dIvJLKJ7wJZgLhL/RJGC/yY9lGc2mkZfgIIs14
         9aPqTJ/gXzOdy+dd9ST86V1gDptbdgcduv+fzI6RZoBlqy4x5T/YsBzQ/x/DCB0QWSoW
         R2WeUIsC3Q3BS2kYKL7FWqzwH0z+Z8XkIFl6rgqM2skJREls1WFve6Rhz9wLJb0N8fXO
         Emt/LLVBD8pJDPS2miuC7iJWfzSlHoSYg7l2+D25r1Nnbrlc0DO871nq5AgjiZr0zWLm
         GowOEAGGYG2YIy3aUHGvITajiUbsoNk+5M7Xztb4qDH7P6SlUUlHWt0NVYXwZxqufzmH
         lw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3phQ5WnH+fjpqqGeLyWt4jMMOe0eKPE4Jb+7JdOf+w=;
        b=Zbl+bZiLvz4Ewg/SNFKtA1Zl3eLin4kghDfQqKn1te/NkqJxn7BkIIgLKYCns1h/CI
         Sx3qoyka7ObLNC2FBEd2KTgB0As7b63i5nwdYojrLnitREmQKuUC7kqbUhZ+n0qoHIQT
         Ud5uN7NPncRhGF5GI6OBnTmxuN8r1ce1wTwsO9iBoYG1JlDHjo+UCfBZFx9QZHOltivL
         FSO6SywC7s/HyojGT30MbH2bMVpyxBweO5eENG3C+WVOcCmT7RXv2nE4yQAjgGNMq0sN
         XNgiVDZ4qw1wig5RXoQHQ1YHsMmQHiebV4T3+x3DaYtV59GxgaqyWgbbtKRNxhjC31Mt
         kSgw==
X-Gm-Message-State: AOAM531gj5PiFyyODvs5O8AR9vERnBFQQocjY6IH6L3reTjjM560XOQv
	H8QOF6XjXUt6Pq1vbCu2A4vFttJcTPWqxHTHxb8=
X-Google-Smtp-Source: ABdhPJyA0Lw/auZNGLOZIDLnB1LPyvLlz3CHO9CpgTq+yXEDPxUhbkBSLEs3OJ7ZJ1nj7yHhDWrOIRnclCi+ifq7xHM=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr626240uar.100.1620240578272;
 Wed, 05 May 2021 11:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-50-alex.kanavin@gmail.com> <CAMKF1sqe2_HiA4VBArE0SSGF8fpNUTeZaHh23Uo6P6WJMJAhMg@mail.gmail.com>
In-Reply-To: <CAMKF1sqe2_HiA4VBArE0SSGF8fpNUTeZaHh23Uo6P6WJMJAhMg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 20:49:26 +0200
Message-ID: <CANNYZj9wiSNuQYkMf=bzbyeTCSgDeB65-fJDxb81iCMS0diZbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 50/61] python3-setuptools: upgrade 54.1.1 -> 56.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001e60ce05c199a815"

--0000000000001e60ce05c199a815
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 20:07, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> change does not match the subject. Is something missing here ?
>

Someone else's update merged first, and rebase on top of that left only
these pieces instead of dropping the patch. I'll remove it now locally.

Alex

--0000000000001e60ce05c199a815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 5 May 2021 at 20:07, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
May 5, 2021 at 8:20 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | =
4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
<br>
change does not match the subject. Is something missing here ?<br></blockqu=
ote><div><br></div><div>Someone else&#39;s update merged first, and rebase =
on top of that left only these pieces instead of dropping the patch. I&#39;=
ll remove it now locally.<br></div><div><br></div><div>Alex<br></div></div>=
</div>
</div>

--0000000000001e60ce05c199a815--
