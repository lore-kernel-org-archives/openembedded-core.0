Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6421BC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:51:12 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.53358.1638805871745692998
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=neKQ2Plc;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id t13so20430759uad.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WidBBKZaWQ7T3F/XIF9bpe7VjYAKgkQUeSyErKGtqqY=;
        b=neKQ2PlcxMK1p6kGm3YBax+PUrUKqqxsr1gWSB3ykX4PPNTaWdWn4xlESH7bz7hPmp
         HjLVpKGcOR+/M6pxxw48+wgEQq+pRcblZdqmUgOjQq5/BIhnF2kIirPp6nVi8JJ1ebeC
         KZVQSwfr9Xa9wygYbH3coDiuDenmBYOjT3i1w+Ke2FyhXyZNZ22/MAP80fT66WHfK67z
         BHtISXDr0q/vBf6WEZjsG4VKe71tpcb2JJEAF73z02b46wF3R4eHYIr3VhysgWr7oQlK
         SKrRnz+RDdNolcUsCNkOM39nZYbm2fBhCF8QKNudSmir6S1v/M++lsFTFz/QN+GRg5Yx
         Rk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WidBBKZaWQ7T3F/XIF9bpe7VjYAKgkQUeSyErKGtqqY=;
        b=xIZnUQCKhSuPXmDoC3KWFnXtptNxiqznZ/No3mILmp+y79+MYxZVMoNLos1NXYWz25
         pfUn9tuax9I3+pxr7gXczxMuF9C+c2mBG+HZJRy9kMjP2KcLLFWBzAifOVUuEIy0TMH7
         Jn/6ESG+Dh9FXd9DudZQcde+kYfPQwEpHiUaqGZhtVSbG3qjhIcc9sTiuwMaQrn8BBhI
         f8g1uJ58YttGx8gltFF516s5IjBPdtwlSwYeZro2AjKxJuFGamc8LMoHp8E+Vjw4fd5a
         +2hn9zwKINHXCvJ9lPHh9lsmwthdGfHaogtcgmgTRS6vfEeniK9zrpvfftDf/q6L2PXf
         FddA==
X-Gm-Message-State: AOAM530i4cvcvvWE+qDozZsYPlKsD6UwsUbJV0I6iHBRROdqsS7y403I
	B7AQyH76PT/kwV7wUp4EKJO637CR8aNkcXVUDfM=
X-Google-Smtp-Source: 
 ABdhPJwLlBd+I48QjHHDfp68qVg7vWS5DE/2EvxiKEUb2tKqgzKopPhE36ayUABtiE6fqy0LKyj7Hbp8HoWtwo+1apw=
X-Received: by 2002:a67:7105:: with SMTP id m5mr37213256vsc.81.1638805870909;
 Mon, 06 Dec 2021 07:51:10 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
 <16BE34F09726DD19.18170@lists.openembedded.org>
In-Reply-To: <16BE34F09726DD19.18170@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 16:50:59 +0100
Message-ID: 
 <CANNYZj-B7LY5egzLTb8h4ApXVe_d0XdUJQjM8tfH+Q6KSfiOCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000ca9ab705d27c39d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159250

--000000000000ca9ab705d27c39d2
Content-Type: text/plain; charset="UTF-8"

I mean, if you insisit, we can add Upstream-Status: Defunct, but I do not
think keeping patches in Pending state when there is no upstream is right
either.

Alex

On Mon, 6 Dec 2021 at 16:45, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Mon, 6 Dec 2021 at 15:08, Ross Burton <ross@burtonini.com> wrote:
>
>> On Mon, 6 Dec 2021 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>> > Presumably, that someone would start updating the repo and making
>> releases, at which point we can reevaluate the situation with the patches.
>> As of today, they are inappropriate.
>>
>> But how, in two years time, would we know to re-evaluate the patches
>> if they're marked as inappropriate for upstream?
>>
>
> We should properly, clearly document the reason why they're inappropriate
> for upstream right now, just above the upstream-status line which is a
> summary. If there is a new release in the future, at that point any upgrade
> activity should re-evaluate all existing patches for the old version
> anyway, even if they're inappropriate, or submitted or anything else - too
> much time would have passed by then.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159249):
> https://lists.openembedded.org/g/openembedded-core/message/159249
> Mute This Topic: https://lists.openembedded.org/mt/87494788/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ca9ab705d27c39d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I mean, if you insisit, we can add Upstream-Status: D=
efunct, but I do not think keeping patches in Pending state when there is n=
o upstream is right either.</div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
6 Dec 2021 at 16:45, Alexander Kanavin via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, 6 Dec 2021 at 15:08, Ross Burton &lt;<a href=3D"mailto:ross@burtonin=
i.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Mon, 6 Dec 2021 at 11:03, Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; wrote:<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159249): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159249" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159249</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87494788/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87494788/1686489</a><br>
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

--000000000000ca9ab705d27c39d2--

