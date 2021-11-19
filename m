Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C092C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:03 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.7763.1637321642362406561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQSKFKlO;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id b17so20670151uas.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YCuD4brtDSyayqRXTawWLXE91fEY6QCF5UmvxGlfXo0=;
        b=NQSKFKlO5KQ5U2kztHBrJzH3HMdWBBdKIeJP+DBoLrKxGNw/tvUhbyKdYYsX7+6yoi
         ggQeOSM4MUUiKsyEkwqz4ZZIk20ipFlfZ3JCbzbVupnejtf0vNQy1fRbPJgU53OwycFN
         TI30NI4G4fAQl7OGb8Ix9+TjFnttFXpR7KOOS5rp4LRDPsJwYzZA/Zh3VuTTThE6XdfO
         /N9hW1TbOXbjt1bTX54ntmzd7/Aha8yMpybdQ+7aKma1AM1GxBBICNx+DlyeNKPpjbHx
         FuKOwx7IPaiZn8t+FPt1nQ2+OM5nvj57EtTGHWJH2VLwKuxc0sBDCdodQVgXWUqJqtcV
         zAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YCuD4brtDSyayqRXTawWLXE91fEY6QCF5UmvxGlfXo0=;
        b=qYyRdwjMD/q3DdcRJ0x5UiZYlUFlLtKNqn2lq/TC6Egp1CFUAbuXOizfkx/KlV9qHa
         BV9dwOasYGZtEG4OtuGa9OhPosHZMCBicEQUTsaHOpaonbu3w/haCMtHQ3w3+19Xd5J7
         4bVw42ZQxao9etG4hDivAU8bqGgzQMHOwP4zOyWOGkKFvwGyQqxg5L5o4J2bjhPmPVJA
         A17rSRZfcvY9p7X5GPeEEuaC096quHyTt1vZMD8csTKM7ZXU+jZpHkBpwPQ3eF+q6icb
         1Kxnfb6xDpdmWMreqpf4W3JwlLSIshUimEuR10DipSFt7bWY5/KuUjzdGX4VOHmD0TZ8
         0f8w==
X-Gm-Message-State: AOAM5315WwSfzy7SlljyxX5ylT20fC8w5jTjjrIgo+FW8zeaMcE60HBe
	hGBNSV5093gSDEMzkeWx6LXA/DazWphlXL7l4Lw=
X-Google-Smtp-Source: 
 ABdhPJwXXe7nn9LOGAlVBW2TwXvkZfFHwaRnaMqby+yq1fAhPgGnRDcJ6IYEqUWJxvKo0h3Effa5P4G+69kj1pIVskc=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr48303440uai.89.1637321641491;
 Fri, 19 Nov 2021 03:34:01 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-2-alex@linutronix.de>
 <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
In-Reply-To: 
 <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Nov 2021 12:33:50 +0100
Message-ID: 
 <CANNYZj_mojQ+ai3uX7upkJxjgrk0gcJwb0qAP8et4ruB3Jf-1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/36] groff: mark patch as non-upstreamable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d301c405d122a6a5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158506

--000000000000d301c405d122a6a5
Content-Type: text/plain; charset="UTF-8"

This is the upstream fix:
https://git.savannah.gnu.org/cgit/groff.git/commit/?id=979f3f4266151c7681a68a40d2c4913842a7271d

I can backport that, rebase the existing patch on top and see what's left,
sure.

Alex
On Fri, 19 Nov 2021 at 12:15, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-11-17 at 16:34 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-extended/groff/files/0001-Include-config.h.patch | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> > index 46065bc513..34fca1eb2f 100644
> > --- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> > +++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
> > @@ -20,7 +20,7 @@ In file included from
> TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
> >  We delete eqn.cpp and qen.hpp in do_configure
> >  to ensure they're regenerated and deterministic.
> >
> > -Upstream-Status: Pending
> > +Upstream-Status: Inappropriate [issue fixed upstream with a similar
> patch]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   src/libs/libgroff/assert.cpp  |   4 +
>
>
> Should we replace this with the upstream patch? That way we'd have a clean
> backport which would help at upgrade time?
>
> Is the upstream patch exactly functionally equivalent?
>
> Sometimes it can be good to test the upstream version so we know come
> upgrade
> time we're ok and we don't need to ask upstream to make any further tweaks.
>

--000000000000d301c405d122a6a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is the upstream fix:<br></div><div><a href=3D"ht=
tps://git.savannah.gnu.org/cgit/groff.git/commit/?id=3D979f3f4266151c7681a6=
8a40d2c4913842a7271d">https://git.savannah.gnu.org/cgit/groff.git/commit/?i=
d=3D979f3f4266151c7681a68a40d2c4913842a7271d</a></div><div><br></div><div>I=
 can backport that, rebase the existing patch on top and see what&#39;s lef=
t, sure.</div><div><br></div><div>Alex<br></div></div><div dir=3D"ltr"><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 19 Nov=
 2021 at 12:15, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2=
021-11-17 at 16:34 +0100, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/groff/files/0001-Include-config.h.patch | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.p=
atch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br>
&gt; index 46065bc513..34fca1eb2f 100644<br>
&gt; --- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br=
>
&gt; +++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch<br=
>
&gt; @@ -20,7 +20,7 @@ In file included from TOPDIR/build/tmp/work/aarch64-=
yoe-linux-musl/groff/1.22.4-<br>
&gt;=C2=A0 We delete eqn.cpp and qen.hpp in do_configure<br>
&gt;=C2=A0 to ensure they&#39;re regenerated and deterministic.<br>
&gt;=C2=A0 <br>
&gt; -Upstream-Status: Pending<br>
&gt; +Upstream-Status: Inappropriate [issue fixed upstream with a similar p=
atch]<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/libs/libgroff/assert.cpp=C2=A0 |=C2=A0 =C2=A04 +<br>
<br>
<br>
Should we replace this with the upstream patch? That way we&#39;d have a cl=
ean<br>
backport which would help at upgrade time?=C2=A0<br>
<br>
Is the upstream patch exactly functionally equivalent?<br>
<br>
Sometimes it can be good to test the upstream version so we know come upgra=
de<br>
time we&#39;re ok and we don&#39;t need to ask upstream to make any further=
 tweaks.<br></blockquote></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote"><br></div></div>

--000000000000d301c405d122a6a5--

