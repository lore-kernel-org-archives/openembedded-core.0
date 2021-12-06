Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AE1C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:45:23 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.53264.1638805521925045373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQIKX+Wp;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a14so20559757uak.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eTZLHI5QCYlUByzUFbBpAEVIvyeBEjMtBHkDQqbnNY=;
        b=aQIKX+WpKG4HTFVd2Gs6lIWmv9tIi/bMqtEEuqtbeEt8dLD0ljpziu/5TARg/AvFho
         GBQvRvpeXd17bpRMDhTKovCA1awpLNJMyRwdGxvGBrCqkZTGAIkDpNwkkVWdGgBcz+er
         I8T2SFnGO6kuIH1x5Ox+xJHkxIrQT7KMzyPnXeH9JnSDTWi/BUAP+axCIarj6rEciBoR
         J5egmE2YZWBML5q0pqNUPVjgJJPKLDAHEPb+3iJ5Zr4ca4EaniUAX36Vg1AWr1NDj73E
         VeJAI2fwqGKTQthsFtmph/D2/+lhb1uYTzlpecQRqND0jyCR/0c79h1QNHi/zSC/felH
         9jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eTZLHI5QCYlUByzUFbBpAEVIvyeBEjMtBHkDQqbnNY=;
        b=pHVmZ7helB52JU1uQzdY0AaibFm6wqj7UwTs7IvjwhzJV930Zs0sU4fqZyN9nCTjhp
         SKEj/0yEOznJRbknYGDvfpWdKqtrRSIpEf35ZlLouh5Z06UQ85hR3SSF2/VmO3M0p6a4
         ySBZ32lGRh9DbItJ0gAu5QSA+u1XRMmtIj2dg3PYaPOeoMYoFss9uXI6AfX/GpTU3wE2
         xat+OnpExWY2N7WU2axHPUf7/PpZMUyh1lNhPLxmrl+xWYoh459Q/WDLp1vaIVq2ZEjy
         jSYuEOs8rAYKS+peENqXjM8BcYdHvrzzF9y5LCSAiJy2xijvQZOik4zFQ78cDwwOTXAA
         8jew==
X-Gm-Message-State: AOAM532o0HgdmIdSIf/3X3g99spNxURz3cIS0uiwSKT9dEGbmCyj/iOg
	raCt01y37xv9zmVdKGFW5Rpb1q2gmnzNPx81b00=
X-Google-Smtp-Source: 
 ABdhPJxBunCFhMAbvMS3nleLlgmRNJqQ5ZH+UqLUS71uGbVevdy6sIuUkazONmII4hla0eDsAgCPLJ8GtHSUJqKc+Zo=
X-Received: by 2002:a05:6102:3708:: with SMTP id
 s8mr35947838vst.45.1638805520945;
 Mon, 06 Dec 2021 07:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 16:45:09 +0100
Message-ID: 
 <CANNYZj8MKbXqPkEue5efQVBz7O0ck1kD6VvWeQoR1vp6YP+e4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000eea7b805d27c24b3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:45:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159249

--000000000000eea7b805d27c24b3
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Dec 2021 at 15:08, Ross Burton <ross@burtonini.com> wrote:

> On Mon, 6 Dec 2021 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> > Presumably, that someone would start updating the repo and making
> releases, at which point we can reevaluate the situation with the patches.
> As of today, they are inappropriate.
>
> But how, in two years time, would we know to re-evaluate the patches
> if they're marked as inappropriate for upstream?
>

We should properly, clearly document the reason why they're inappropriate
for upstream right now, just above the upstream-status line which is a
summary. If there is a new release in the future, at that point any upgrade
activity should re-evaluate all existing patches for the old version
anyway, even if they're inappropriate, or submitted or anything else - too
much time would have passed by then.

Alex

--000000000000eea7b805d27c24b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 6 Dec 2021 at 15:08, Ross Burton &lt;<a href=3D"mailto:ross@=
burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 6 Dec 2021 at 11:03, Alexander Kan=
avin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>&gt; wrote:<br>
&gt; Presumably, that someone would start updating the repo and making rele=
ases, at which point we can reevaluate the situation with the patches. As o=
f today, they are inappropriate.<br>
<br>
But how, in two years time, would we know to re-evaluate the patches<br>
if they&#39;re marked as inappropriate for upstream?<br></blockquote></div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">We should p=
roperly, clearly document the reason why they&#39;re inappropriate for upst=
ream right now, just above the upstream-status line which is a summary. If =
there is a new release in the future, at that point any upgrade activity sh=
ould re-evaluate all existing patches for the old version anyway, even if t=
hey&#39;re inappropriate, or submitted or anything else - too much time wou=
ld have passed by then. <br></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">Alex<br></div></div>

--000000000000eea7b805d27c24b3--

