Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E85C76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 12:11:26 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.64597.1680005479924560274
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 05:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dHpCi41n;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id y35so9769737ljq.4
        for <Openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680005478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjAzPPVi2D8UkFaZ1XZG6LKOgaaAv0+mxwSLv+5iry8=;
        b=dHpCi41nTQs/2bWBkQ+UtA6hmG4YYq8uyrPpvF1uxmgD41zBKfkgs3Q7MlHF/KfC2n
         DgiVKHITfFhPa3nziQgGTcLijeNJ89pD//IIqkoE8PLq5P7/edrPKQisudyg4qW42gid
         652HUuq/0APkmmuTe8j/Yu5xZCC3uMC3Ia9HvJHY1q99zOArB+uE8zpFcKpmPlC46YPP
         uTAn2L88kOaA+CGc3Qgq6rdT2TaUBgqALGOcjX3K1A2E5D3CCKh+/HSStZoWO3JKgjNg
         10z4Lu8dBKUY58uN6NgOestQXjwbycZLAeWM0H1JX1ZUpZwsG4EnFKUeCD0v69JaeWX2
         153Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680005478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjAzPPVi2D8UkFaZ1XZG6LKOgaaAv0+mxwSLv+5iry8=;
        b=XHkP8DZPgiSsjdlDMe2fAJdVTF9fu5R8sL62QdeJgkV//Xibj07OAeTXBwMKipVCRv
         +PCiqO7banbB9Nqirp3pAy540oCn2uvGyhzna0WGbCF24kb9rN450heAUq0JWK4YS7Jd
         K0Np1Co0q4db2QfP1kKHoCfAZgJuwkEWOdFiPe8XSBzbijNa2phqWkvslvWdtkbLo8St
         EBwNox3o8N2hBfCfd5/JwJQk3hmCkPHYy5U6VULD+hay69Rtcgi2UNUzpXvNGmD8QeLt
         B7xFV/Iydhd/cz+0EsN5w9VxOrF85UBRMCdjbEy5u7JbtOv+VSTUf60qVKIvtHbT1zsp
         /N/Q==
X-Gm-Message-State: AAQBX9dJ+EcDMgobXQRQ+Qf34Rz4REBcQ5D7KfslfmFVGEND9hmDH8CX
	mGg803Y6MDLulob9Q4dYf0vJfLQqj7eafL4tOdg=
X-Google-Smtp-Source: AKy350YVbqY4m8FkrwYdVHBOCYQa3SxW+spSTqPuOZbm8p0naJWdOgnOvrLtxGgBES2oyBnZIvk6eICkYAkXoXc2vzI=
X-Received: by 2002:a2e:3218:0:b0:29d:a0b4:aa55 with SMTP id
 y24-20020a2e3218000000b0029da0b4aa55mr4671960ljy.10.1680005477847; Tue, 28
 Mar 2023 05:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=SJRjhc5SGEoBYfKb6PkMqRW21ED8Bv1v-+QTSASCsQ4g@mail.gmail.com>
 <9A00276D-E0D8-47DA-AC38-96418BF47388@arm.com> <17461DA243F6D621.15085@lists.openembedded.org>
In-Reply-To: <17461DA243F6D621.15085@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 28 Mar 2023 14:11:04 +0200
Message-ID: <CAApg2=QOKGr_NBAQrMR=ZagDO-vmhvV+5A8GMcot89pRV_THuA@mail.gmail.com>
Subject: Re: [OE-core] Cve fetcher update
To: rybczynska@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <Openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000ba569d05f7f4c1cc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179229

--000000000000ba569d05f7f4c1cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 11:08=E2=80=AFAM Marta Rybczynska via lists.openemb=
edded.org
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Feb 21, 2023 at 2:47 PM Ross Burton <Ross.Burton@arm.com> wrote:
>
>> Hi Marta,
>>
>> > On 21 Feb 2023, at 13:20, Marta Rybczynska <rybczynska@gmail.com>
>> wrote:
>> > I'm finishing the new fetcher for cve check using the 2.0 NVD API. Wil=
l
>> need testers to check as many configurations as possible before we switc=
h
>> the format.
>> >
>> > The current estimate is this week, hoping that the real life doesn't
>> interfere.
>> >
>> > Good news for all users is that nothing changes for you. Results shoul=
d
>> be compatible. The one noticeable thing is that the complete fetch is
>> longer than before.
>>
>> Awesome, thanks Marta.  I=E2=80=99ll happily review and test the code.
>>
>> How long is a complete fetch now?  My very rough testing when I first
>> looked at the new API suggested 30 minutes for a full sync.
>>
>>
> Thanks Ross. The fetcher now has the recommended 6 seconds wait so it is
> long - but a similar time you had (around 30 min). It seems that in
> practice it does not change much - the rate limiting is on the server sid=
e.
> This being said, there is only my instance now, when there will be many
> more, it could change.
>
>
>
Hello Ross,
Have you finished your review? The new version that is under test in my
systems right now is using urllib. I'm wondering what was your other
feedback.

Kind regards,
Marta

--000000000000ba569d05f7f4c1cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 22, 2023 at 11:08=E2=80=
=AFAM Marta Rybczynska via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, Feb 21, 2023 at 2:47 PM Ross Burton &lt;<a href=3D"mailto=
:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Marta,<br>
<br>
&gt; On 21 Feb 2023, at 13:20, Marta Rybczynska &lt;<a href=3D"mailto:rybcz=
ynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt; I&#39;m finishing the new fetcher for cve check using the 2.0 NVD API.=
 Will need testers to check as many configurations as possible before we sw=
itch the format.<br>
&gt; <br>
&gt; The current estimate is this week, hoping that the real life doesn&#39=
;t interfere.<br>
&gt; <br>
&gt; Good news for all users is that nothing changes for you. Results shoul=
d be compatible. The one noticeable thing is that the complete fetch is lon=
ger than before.<br>
<br>
Awesome, thanks Marta.=C2=A0 I=E2=80=99ll happily review and test the code.=
<br>
<br>
How long is a complete fetch now?=C2=A0 My very rough testing when I first =
looked at the new API suggested 30 minutes for a full sync.<br>
<br></blockquote><div><br></div><div>Thanks Ross. The fetcher now has the r=
ecommended 6 seconds wait so it is long - but a similar time you had (aroun=
d 30 min). It seems that in practice it does not change much - the rate lim=
iting is on the server side. This being said, there is only my instance now=
, when there will be many more, it could change.<br></div><div><br></div><b=
r></div></div></blockquote><div><br></div><div>Hello Ross,</div><div>Have y=
ou finished your review? The new version that is under test in my <span cla=
ss=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!import=
ant">systems</span> right now is using urllib. I&#39;m wondering <span clas=
s=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!importa=
nt">what was your</span> other <span class=3D"ng" style=3D"background:rgba(=
0,0,0,0) none repeat scroll 0% 0%!important">feedback</span>.</div><div><br=
></div><div>Kind regards,</div><div>Marta <br></div></div></div>

--000000000000ba569d05f7f4c1cc--

