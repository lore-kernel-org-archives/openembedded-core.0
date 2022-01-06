Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CD5C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 19:21:52 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.13478.1641496910715040910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 11:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YxiiFA+U;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id i5so6214852uaq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nnw+LtAnUgdLQJx9irhOq45joA2EzU9/R3WUHiqA1RY=;
        b=YxiiFA+U7g/793DV6MuJ15vfJ83OGp0+lu5nkUFTQby/8OK4ZrZj0paevrl5gsGc0x
         Bwbn6e5hGdr5lg8ZkWofB53JQY78GLMdN43jK40sTybzOxVMVNjTttRKlITeJQMh7WPo
         kEvkAGC7kjoDcoYgQM++NxB+Fn5W5d3qWmSS16CYqxUazfCqVHnf1oEl831xuxFeNcbC
         a49YzsO/3eYjCUHmtVDwVe1xQ5+4OJJNBsGLhVgD0tEc7+/3Y3PU3GLsWqy+f6xC78O4
         vsbHsQY3QCrbs6I+7haYeTEsY6qG2D4fPez32VXpEc01XWMnbXmpyNI3O+e9oMShDzdL
         D9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nnw+LtAnUgdLQJx9irhOq45joA2EzU9/R3WUHiqA1RY=;
        b=dxoEm1iAXkLcVxMUufXJHm5RBHihIlG2RxGidFZAjteE4ZBBGpFPgKu6qxnNkEs4s+
         sPhtxX3n3yF/bcUPRK1W969HVz3hVnNI+mxDql2tn9odtpsD4yl1mKm6gsE4NBlnNMOz
         uahe/mTq9hSUCueZxd3dlAQIvxXyEI3l7mvw18azotSO8EquAsNWSWLnhxI3K4o4Whd9
         GGUe6eTbJ0Mqdr9WY5eSIRM349ghZva6loXXLPmuJMWkFcp32DFPS4VGa1McW13W6q/y
         BlmCGGUN/kSVYJmBb4Sy70EMCdqmtYKecHluQrTMNg8pXeIqzAiW9ksxB3Cn9h1upO0g
         dL3w==
X-Gm-Message-State: AOAM530brzvRuy+lFBgrZkNMDSdYfMUY59bDxYg5GhsjL9sxRkdNBEhL
	GxQtnXl1n4kpVOnsVpbcblHxNC4RJynX2qQ/laM=
X-Google-Smtp-Source: 
 ABdhPJylqrw5Ls0XyLmYJdukx4Xl+TAHtJI0LOyUxo8kQA8dUJaLl0lGHpBRCNR1RATSjTD01zL3pMGU7S//L+wM6LM=
X-Received: by 2002:ab0:26d2:: with SMTP id
 b18mr18928892uap.100.1641496909895;
 Thu, 06 Jan 2022 11:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20220106185443.3522510-1-raj.khem@gmail.com>
 <CALbNGRSOFo5MPmRhHyr2azQHg4X6MJcR5BxygiO3P0niO0ehJg@mail.gmail.com>
In-Reply-To: 
 <CALbNGRSOFo5MPmRhHyr2azQHg4X6MJcR5BxygiO3P0niO0ehJg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jan 2022 20:21:38 +0100
Message-ID: 
 <CANNYZj_5BTK8uFXwvgFemU5CMV1twjsnj-S9W0nS6aJ+qHZeuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsdl2: Fix build when libunwind is not used
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000036dafc05d4eec83b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 19:21:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160243

--00000000000036dafc05d4eec83b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wait, why is this inappropriate? It seems quite suitable for sending
upstream.

Alex

On Thu, 6 Jan 2022 at 20:19, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> On Thu, Jan 6, 2022 at 7:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > clang provides libunwind.h and cmake adds a check to
> > find libunwind when this header is detected, which was
> > not the case with automake. The check however is expecting
> > specific unwinder implementation which provides libunwind-generic
> > solib, this is not a standard library that all implementations
> > will provide, therefore make this check optional.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> Had just started to look into before I saw this. Thanks for taking care.
>
> Cheers
>
> Andreas
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160242):
> https://lists.openembedded.org/g/openembedded-core/message/160242
> Mute This Topic: https://lists.openembedded.org/mt/88245006/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000036dafc05d4eec83b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, why is this inappropriate? It seems quite suita=
ble for sending upstream.</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 6 =
Jan 2022 at 20:19, Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@=
gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, Jan 6, 2022 at 7:54 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; clang provides libunwind.h and cmake adds a check to<br>
&gt; find libunwind when this header is detected, which was<br>
&gt; not the case with automake. The check however is expecting<br>
&gt; specific unwinder implementation which provides libunwind-generic<br>
&gt; solib, this is not a standard library that all implementations<br>
&gt; will provide, therefore make this check optional.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.com"=
 target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
Had just started to look into before I saw this. Thanks for taking care.<br=
>
<br>
Cheers<br>
<br>
Andreas<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160242): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160242" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160242</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88245006/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88245006/1686489</a><br>
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

--00000000000036dafc05d4eec83b--

