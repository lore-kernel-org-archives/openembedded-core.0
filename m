Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A09CC433EF
	for <webhook@archiver.kernel.org>; Sat,  8 Jan 2022 19:28:02 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.9705.1641670080887735845
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 11:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LmZ+Fc0x;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 30so34446106edv.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jan 2022 11:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C7IgHyA3Rrp8SujFdLWVX2WJrGOid2hujQfHXvHBMMg=;
        b=LmZ+Fc0xWlxj/Q/CoM5fNH6GQQ4fKhooPj85RdaQvZZ9tXX0nObRDTbffHFtXGMyln
         Gb5CJCTETI1SvX7P0Qnh+bfIKrrDaVm4R5q0qDstpaC19/Bf26dpdG1WxAJV4FYROKPH
         jyXDyGa2Qmms99jzYeWIWslO8BjcpKvMFjBTjhiVV+v4SAxui1N8Y2krv+nhDwP3+T3H
         oBbI9iZMCpCaNSKH0xO7kFtYRL4gC2C4FFo9+w2fIWMPYRnnq1Zls5ThGf837cm1gGar
         vkimei7M8IgwGuz2ronUAqynwjIUMaTlWd7iLLBl5Dpi6gw1JdPtQKEV30e7z/JyvJqN
         9Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C7IgHyA3Rrp8SujFdLWVX2WJrGOid2hujQfHXvHBMMg=;
        b=HbP5dJ880DpSAxjCZa90sXvVB6R4U/O751dE8iLYjLXZef3MeKbqIfWu2ZOAlfZBXF
         KwDAMkHidc5FjXQYL2OjvLwVMqcb9HViN5hS52FB6NtRRa1D0Yeoe3HmN+9ynEwrXAaE
         0E19l7bVamDifMB49b4jHMlC7kyLM+L+5oFO8sqFmA8aEmCTA/umBC/nW2dfaHlG6hh1
         a69PUA859iSuixn+lxSD8cupis2yEnF/lFumO5AsIlcrm9i7eegaY99rR6GMr/mFodvd
         lUwK4bJPpCb6TZGoH9VI7Hj5xY6vsGMLxQ8NqUMoVxrv/bf1l0EjMRxJmxqr7qlKeEmU
         z3Dw==
X-Gm-Message-State: AOAM531Qa3YiA+BJHsmv3hrqSNNcglIdTZPOMZngc8+/VqwKhCub9ckX
	ypV+jj1zR3KdwQfQqCrvZGg+ryzm2u+oYR1uobw=
X-Google-Smtp-Source: 
 ABdhPJyyMd8iBgVacycd/58JOSx77kKt8O1G5Ltd4QS5dTnINoot1f/tFc3i+RQxBQ3MQMcAlWeMYPGdn/qK+MehMVI=
X-Received: by 2002:a17:907:b13:: with SMTP id
 h19mr1113492ejl.391.1641670079361;
 Sat, 08 Jan 2022 11:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20220107212446.132386-1-saul.wold@windriver.com>
 <20220107212446.132386-3-saul.wold@windriver.com>
 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
In-Reply-To: 
 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 8 Jan 2022 14:27:48 -0500
Message-ID: 
 <CADkTA4NYGboThC2b5=R6vw13HeGKOu93raMbgUk9iPUmwPSX+Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kernel.bbclass: remove do_strip()
 method
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Saul Wold <Saul.Wold@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000eb357705d51719af"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jan 2022 19:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160278

--000000000000eb357705d51719af
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 6:19 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:
> > Move the do_strip() functionality to a more common location in the
> > package split_and_strip_files() flow. This makes it possible for the
> > extended packaging data to be generated correctly for the kernel and
> > kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused in
> > the runstrip() part of package stripping.
> >
> > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > ---
> >  meta/classes/kernel.bbclass | 35 +++--------------------------------
> >  1 file changed, 3 insertions(+), 32 deletions(-)
>
> As I mentioned in previous mails, I think this will mean the do_deploy
> output
> will change and become unstripped which may cause a problem for some
> platforms.
>
> We likely need to keep a strip task but call the new strip function from
> it?
>
> I personally think this is a reasonable direction apart from that though,
> at
> least in principle.
>

Agreed. It looks ok to me as well, with us making sure that do_deploy can
remain as it was.

Bruce



>
> Cheers,
>
> Richard
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000eb357705d51719af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 6:19 PM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:<br>
&gt; Move the do_strip() functionality to a more common location in the<br>
&gt; package split_and_strip_files() flow. This makes it possible for the<b=
r>
&gt; extended packaging data to be generated correctly for the kernel and<b=
r>
&gt; kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused in <br=
>
&gt; the runstrip() part of package stripping.<br>
&gt; <br>
&gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver.com=
" target=3D"_blank">saul.wold@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel.bbclass | 35 +++----------------------------=
----<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 32 deletions(-)<br>
<br>
As I mentioned in previous mails, I think this will mean the do_deploy outp=
ut<br>
will change and become unstripped which may cause a problem for some platfo=
rms.<br>
<br>
We likely need to keep a strip task but call the new strip function from it=
?<br>
<br>
I personally think this is a reasonable direction apart from that though, a=
t<br>
least in principle.<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Agreed. It looks ok to me as well, with=
 us making sure that do_deploy can remain as it was.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000eb357705d51719af--

