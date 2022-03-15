Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDDFC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 00:15:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.4441.1647303357901746497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 17:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=feVPh1oz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: ticotimo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so506155wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 17:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oks6MJMvmmfCs/s0m9PSqo1Df9J6XCpfZjXrHoCLESk=;
        b=feVPh1ozl9OZv+Eg1uNeflmUrU62cnWe8WTU8RADMmVn1TXonkDEiGWkRK4FEpo0eq
         8tLRfWRQaoaVdM1G4YZRR9qN6JutCHOYTASSHicMWf84i2Cme9TKL/2MqrNUvUBP20NL
         hjKq67IijYuJNKIIgHJkcJcWPSbBiNS1UJ1FXgQ62PNsYWkQapYBI2SJNKdTlAX3/8tg
         BprUMaKGL9khOqujyl/si2SoUQEBLik0t2ABGiorIzuPKfwDb94+P+AQICSsaEMSWyP1
         POrKU0hPYYLAZ7lv3n0woyHNMYB/5s+cbHRSem/FCPWD0tWvSzNn0JEsTuymIZMoMK90
         EZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oks6MJMvmmfCs/s0m9PSqo1Df9J6XCpfZjXrHoCLESk=;
        b=78BMJS/CbsuSJYaAfBC9YVudrJuxDLw5SE0bnTSZGuIbXAlF9jFlwWGdHkn/wYrJ82
         JSbcY78N6hrKy6xY8ZBVc7nAdkUBDOrD0NvxWJKUxRT9TDmMxMFKLA6BZVCtrrx6foyA
         ZBI81rvfIv0i6jbbPDlRuVzeI7Sxs2uzZHG4bPxFd8glOQ9QB+EjigQAU89PVytEDEig
         ocpBBij8t9iJMkpZF/XliZRbE93EAO8ameQoHw6rE/7DhjGtKjXJmcGGF9yqkhEkU45w
         sNyQNEyQZwtUnpsyFV4uk2hafa1WYvDjUwY1OPFgdtLN5DM52AaSIfFueHRYUQIZr/ox
         8D/w==
X-Gm-Message-State: AOAM533Dwp7paZtpdr6+Vt9tHpS5iGFRydD2bSiuFEApKBhNctu8Z9rK
	8IPrmwE/gTNKWnk3g0P4XW05b9De1ATrVCyL3pw=
X-Google-Smtp-Source: 
 ABdhPJz/ghnp6ISdnJXVhquIeOpiOJxvc2aVklQkyf+a9jLj2ZBCog6bwJ50DmtBkZ8h9HcFGKDEB7KtjqKOtQn7xgY=
X-Received: by 2002:a05:600c:54a:b0:389:90f7:1b15 with SMTP id
 k10-20020a05600c054a00b0038990f71b15mr1178084wmc.156.1647303356291; Mon, 14
 Mar 2022 17:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 14 Mar 2022 17:15:45 -0700
Message-ID: 
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="000000000000639d5505da36b3cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 00:15:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163219

--000000000000639d5505da36b3cb
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:

> we need to remove all of them from meta-python too.
>

Alejandro sent a patch for that, no?

>
> On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > It is late in the cycle but is has become apparent that the dependencies
> we're
> > weaving with layers and meta-arm was reaching a point where it wasn't
> working
> > well for anyone. BSPs and hardware layers needing to pull in
> meta-oe/meta-python
> > isn't a good situation. Whilst late, it does seem better to sort this
> now before
> > the LTS ships rather than live with it for much longer.
> >
> > This series brings in python3-cryptography and it's dependencies to
> OE-Core,
> > bringing everything to the standard needed (maintainers entries,
> homepages,
> > reproducibility), tweaks to match the recent python changes and some
> ptest
> > fixes.
> >
> > It also namespaces the classes with a python_ prefix since this makes it
> much
> > more obvious in core what area of the system the classes belong to.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163218):
> https://lists.openembedded.org/g/openembedded-core/message/163218
> Mute This Topic: https://lists.openembedded.org/mt/89786369/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000639d5505da36b3cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 14, 2022 at 5:10 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">we need to remove all of them from meta-python too.<=
br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro sent a=
 patch for that, no?</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; It is late in the cycle but is has become apparent that the dependenci=
es we&#39;re<br>
&gt; weaving with layers and meta-arm was reaching a point where it wasn&#3=
9;t working<br>
&gt; well for anyone. BSPs and hardware layers needing to pull in meta-oe/m=
eta-python<br>
&gt; isn&#39;t a good situation. Whilst late, it does seem better to sort t=
his now before<br>
&gt; the LTS ships rather than live with it for much longer.<br>
&gt;<br>
&gt; This series brings in python3-cryptography and it&#39;s dependencies t=
o OE-Core,<br>
&gt; bringing everything to the standard needed (maintainers entries, homep=
ages,<br>
&gt; reproducibility), tweaks to match the recent python changes and some p=
test<br>
&gt; fixes.<br>
&gt;<br>
&gt; It also namespaces the classes with a python_ prefix since this makes =
it much<br>
&gt; more obvious in core what area of the system the classes belong to.<br=
>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163218): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163218" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163218</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89786369/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89786369/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000639d5505da36b3cb--

