Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1F5C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 01:38:21 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.5677.1647308300536651164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 18:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pg6gEyFX;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id s16so14409671qks.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 18:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PVAYMqhVWWyCMKXTrL5RGWIKgvOhuKpVqtwSexoHii4=;
        b=Pg6gEyFX1xNsiRtc7d1P1xIH0JUPkCCmjha6qB7OjyksLVQ5EYb7RCIOu9sJD8+5dv
         LPEzPYJEvwImTvxJxRKyta+K2oLxVncudxhVbp58McWOkb5ju6l+FYlN9lDQ8sXyQRMN
         2Yrn+XMK354hQq6Xi1uD/qtWJRzRH7fu+0gmOtUAFp4b9iKj1Tw92nSslN7aT/V+ZoeE
         /WA37xzvPzTGiUEiWnmjdjPeHTEL40nUWeFW62aHz7RTPMJloYj3L29xu6gUOo2El4Xg
         Lf8dlxZhaWzYEflfP9p5hnTPAB5/ML9uu1IQFmkC9cNSSBzp7s4Ls3iCPsFw/WavmE8O
         DSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PVAYMqhVWWyCMKXTrL5RGWIKgvOhuKpVqtwSexoHii4=;
        b=lLLYJwf2kjtLARPFGVWk5yf8EWFd60KujNuxFuUyiGA921tQ0c9koD5PUw8zIEPsBc
         QqxdXPraPrTO4WF+4vFO044DeWjte3fGCQKHSagfQfQ9UYlQRcSu/iVMGgRZWpIHw6fG
         OhkZrtsaUM791vALpstD6D5oqfd6ARgzYIp55l6lU29lPAw8yeB4+YiTku/XzGqqLgVZ
         yxH+kxfyJ7LQ7oYBb16z274n3VcOnODf6ZoftOxsMZQAS6Y3+81ceM++6LsNGWH+1hJB
         a5S2B+i5f3IA8d2pj13jyUxjRQeDCyMotLP1X/vcb/s2AvXMJOoVfQ6wMmgP678uTbnE
         /ZDA==
X-Gm-Message-State: AOAM531B7rWOW8pCVUN+sLblZl47FCUUTLOLmPh+oaEY8Jo6MWm2BPK7
	pESj2tRQLARnQAFzfttX09kWdkgyRcXCMhDSsA8=
X-Google-Smtp-Source: 
 ABdhPJwzxmy7msgEKPOevpPWxY7ccPaiF0G13yXUvfWqqv9jf/AM8P0Sjqi3Ba817P5gcxGxHbVB8gHHrOrnlIW3ty0=
X-Received: by 2002:a05:620a:2982:b0:67d:6c77:b427 with SMTP id
 r2-20020a05620a298200b0067d6c77b427mr14450890qkp.149.1647308299574; Mon, 14
 Mar 2022 18:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Co3tLC_7X7hw-E_8cDJ=-Zwtd3rtD5M8f1o6WbMGmBBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 18:38:09 -0700
Message-ID: 
 <CAMKF1soRb2L1y+gB9NnS42VWkaho=UfVtsYmNLRKUXhsuCE9dQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000000821b205da37da8a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 01:38:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163220

--0000000000000821b205da37da8a
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 5:15 PM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Mon, Mar 14, 2022 at 5:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> we need to remove all of them from meta-python too.
>>
>
> Alejandro sent a patch for that, no?
>

Yes but it was not
Comprehensive I have staged couple of more removals which were missed see
master-next however I just want to say that someone should ensure that the
move is clean



>> On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > It is late in the cycle but is has become apparent that the
>> dependencies we're
>> > weaving with layers and meta-arm was reaching a point where it wasn't
>> working
>> > well for anyone. BSPs and hardware layers needing to pull in
>> meta-oe/meta-python
>> > isn't a good situation. Whilst late, it does seem better to sort this
>> now before
>> > the LTS ships rather than live with it for much longer.
>> >
>> > This series brings in python3-cryptography and it's dependencies to
>> OE-Core,
>> > bringing everything to the standard needed (maintainers entries,
>> homepages,
>> > reproducibility), tweaks to match the recent python changes and some
>> ptest
>> > fixes.
>> >
>> > It also namespaces the classes with a python_ prefix since this makes
>> it much
>> > more obvious in core what area of the system the classes belong to.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>> >
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#163218):
>> https://lists.openembedded.org/g/openembedded-core/message/163218
>> Mute This Topic: https://lists.openembedded.org/mt/89786369/924729
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> ticotimo@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--0000000000000821b205da37da8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 14, 2022 at 5:15 PM Tim Orling &lt;<a href=3D"m=
ailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 14, 2022 at 5:10 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">we need to =
remove all of them from meta-python too.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro sent a=
 patch for that, no?</div></div></div></blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">Yes but it was not</div><div dir=3D"auto">Comprehensi=
ve I have staged couple of more removals which were missed see master-next =
however I just want to say that someone should ensure that the move is clea=
n=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto">=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
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
</blockquote></div></div>

--0000000000000821b205da37da8a--

