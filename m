Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F96C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 19:06:39 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.10570.1647716798788449861
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D1l/oxJl;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id v14so9271766qta.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsNCDQd7lsErajIJBft1JlfOypS7MWd2b0wgpuDqASg=;
        b=D1l/oxJlcBb1412P0LojkXAmpwBvbmo2y1lgAiLe5BgtRViNZ0ZJ/oQbDw1mQ7cQwR
         x8Yb70EdRzVSqMrAUQrtZXU+f2oue2fSuuwPDbXDwDtU+sRppav7QkRPbLFtREwwkWPR
         iYo/fuOs6jxYq3Vvl30wrMaGv2sOrFNRysAcl5c3mFiBYCe+djsKqoSjWtvNG0Ig4xeR
         FYLFYiFn3dhBLK68xknPqKElXdO1bQIJP7NyOPHfcVgXX4ANGOQBdiOYaGflERnKEUBo
         72LINY937vrgVF8+zyzcl95J5K3/m5x2IOTXfr3gRE+SU/0aCGTpz0r7r4C7CUUkz8ve
         zDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsNCDQd7lsErajIJBft1JlfOypS7MWd2b0wgpuDqASg=;
        b=trVYr9Vd9cMxEw93P5/Er18Dr/qjWfuzyKljrILa514ZlGoc235MUP05vWqL8EyB0X
         1t5+mAHoMfJAfcEB0gZs2jXQxx6btkcKVJClCfPx08r1Tc5kGzjeQmQ/p7+rANwfoUhf
         XhfYdzgqO54CWUgSMt0nQJn35lV+cJxJPpx9v4xK+f7U9HPhX/NesnJpkbUKU9neXhSS
         E1qBkBawr2/8cQVILcI1a7sh62Gd9ODB6o1lf1jOvZro7Qr3GrLxnYJriEYINBU4JWx9
         ls5z0r8Flf36KvSq2A0T43gpRj3qmq6ysD3JRY8xFlLYrL0ar8ltGDqDuElcyZsbmOQS
         RRzA==
X-Gm-Message-State: AOAM530+OcnVQaF0UeMLaFO5bxhuF+JoHGsJVfdh+A5HrI1XxJnRGDwW
	EbD+gcA4icr0ENTG7VcpmXDIvF9qMbW4TTHs2CA=
X-Google-Smtp-Source: 
 ABdhPJzJ67w26gzS4UguGEVuyjRUdYHxvn1zwzaEjwFvhPAwTNPmDNowTgM/K+GMlSqB27fEJ1G9fCcdtGv0rA2uNws=
X-Received: by 2002:ac8:7dd1:0:b0:2e1:c708:12fa with SMTP id
 c17-20020ac87dd1000000b002e1c70812famr11349109qte.532.1647716797862; Sat, 19
 Mar 2022 12:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <2a0122-6235d000-5-7996a200@202814967>
In-Reply-To: <2a0122-6235d000-5-7996a200@202814967>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Mar 2022 12:06:27 -0700
Message-ID: 
 <CAMKF1soA7qK5c7pyqxQ22CVG5Tvebyy_BkOk3ZB6Mz5ovEGxQg@mail.gmail.com>
Subject: Re: [OE-core] gcc 12 support
To: bero@lindev.ch
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d561c05da96f68a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 19:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163474

--0000000000006d561c05da96f68a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 19, 2022 at 5:44 AM Bernhard Rosenkr=C3=A4nzer via
lists.openembedded.org <bero=3Dlindev.ch@lists.openembedded.org> wrote:

> Hi,
> with gcc 12 likely being released next month, I thought it's a good idea
> to get started on supporting it -- I've submitted a patch that fixes
> building ovmf, will submit a few more as I run into more failures.
> If anyone is interested in gcc 12 itself, I've uploaded a recipe for the
> current 12 snapshot to https://lindev.ch/gcc12.tar.xz
> (Probably not worth submitting until gcc 12 is released upstream...)
>

I usually keep a version locally around here once gcc is into final phases
of development

Can you post a git patch somewhere

>
> ttyl
> bero
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163469):
> https://lists.openembedded.org/g/openembedded-core/message/163469
> Mute This Topic: https://lists.openembedded.org/mt/89887595/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006d561c05da96f68a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 19, 2022 at 5:44 AM Bernhard Rosenkr=C3=A4nzer =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;bero=3D<a href=3D"mailto:lindev.ch@lists.openembedded.org">lindev.ch@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">H=
i,<br>
with gcc 12 likely being released next month, I thought it&#39;s a good ide=
a to get started on supporting it -- I&#39;ve submitted a patch that fixes =
building ovmf, will submit a few more as I run into more failures.<br>
If anyone is interested in gcc 12 itself, I&#39;ve uploaded a recipe for th=
e current 12 snapshot to <a href=3D"https://lindev.ch/gcc12.tar.xz" rel=3D"=
noreferrer" target=3D"_blank">https://lindev.ch/gcc12.tar.xz</a><br>
(Probably not worth submitting until gcc 12 is released upstream...)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I usually keep a=
 version locally around here once gcc is into final phases of development=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you post a gi=
t patch somewhere=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
ttyl<br>
bero<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163469): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163469" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163469</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89887595/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89887595/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006d561c05da96f68a--

