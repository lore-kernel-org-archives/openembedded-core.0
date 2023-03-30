Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52CDC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:49:21 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.24046.1680180553232314269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=md3PrrOQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id a44so818614ljr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680180551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nJXwTStjWjflEFXg9xOq+t8l7nAlDKMr/2mnd7+SXm8=;
        b=md3PrrOQFZcL97cxAMmAAtTI1UVGU/yJxrfsyMNZqtBVII5xflN5o5b5WAcjJ37V+o
         FNiZtwLDd/5e4fsFQ7jy5aY5IqxdMsAg4ZYZM2cacrjS0K0CPJa4LzLe+xjC1JDL3sfL
         jdl52EChZ0B1Sl77VDON6Bp/m58yg5AJaS1F81HDI0dVOauVyIzwCtPxW9benRI2749W
         Wzx7uA8U5d+EWl2cc4U8xssz/r1AJtUbXCWr5sHKXysnTbyuO3gUByPV+76a6cnwedpf
         7HBcAsLNvaenL+M0ZgajVelyxDk6nl160f2xDNPYB5Ys9KOE5lw+Hhm+jRMsHuJ1EjmX
         sntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJXwTStjWjflEFXg9xOq+t8l7nAlDKMr/2mnd7+SXm8=;
        b=wtnmdyV0qyAqqug2byN79LF1tNCl4QUBHChdc9iDQ3ylS5zks59AFeyoy+gOU+G2I3
         O5Z++8Hz0E7/BMX6nm091g7Xidz600vRN/Tiuv2/EVGtwsM1oXaUlLBQYg18ee7FkJEP
         V2Txnh94UWpMxaXcFaeq2C7ciA4pqvBXWwXCzQyjh7J1SrIypjf7/4oBiyZ/G0Ixdy0n
         u5CgZeVe5GoIPsNoI56cHDYAvWqcgKLS02MXj2yd3XKs1+AOPgH7NPnbOcAzTD/qFojP
         2bbNK52bC7UBnp4araT+D54RhhbknY/wfpaWOWV5jqgbKdhKzYcJmPolUbRUvXhBzO5W
         ldwA==
X-Gm-Message-State: AAQBX9ctGfYsmLbXVI8uTPRmjlKeoU6AQu88opPiL8tRLsFwoFGmTzLU
	GKkLL6Kr+mfQ5Wi9lYI9GLeNVTT/6/fx0rTQcws=
X-Google-Smtp-Source: AKy350bjcOhejl9i77Eohq9WakcRn9m8dFQSlDsh1+82/IgVGj9AftuHjAMk/o5s89gDBEm9GrQ5y0s1bgjZGwcouNE=
X-Received: by 2002:a2e:90d7:0:b0:2a6:16b4:a554 with SMTP id
 o23-20020a2e90d7000000b002a616b4a554mr912658ljg.3.1680180550934; Thu, 30 Mar
 2023 05:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
 <8d69fe1e3f390a7e8fa568abdc20e5d0ee634fc1.1680103647.git.frederic.martinsons@gmail.com>
 <20230330090324705e693e@mail.local> <2023033009145701b67168@mail.local>
 <CA+cAker5pJUBoOSEVZtk++394xGgXqcDDD9eFJpu07+Ai5PaWg@mail.gmail.com>
 <d83c8058e83e33d02e4650c2d29c1a03a6db739f.camel@linuxfoundation.org> <1751320CE5466FC4.12651@lists.openembedded.org>
In-Reply-To: <1751320CE5466FC4.12651@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 30 Mar 2023 14:48:59 +0200
Message-ID: <CA+cAkepAz3Wgj5uEgY9LOanHaSnuH3A66DCGoo=xyV9k9twxSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 5/5] meta-selftest: provide a recipe for zvariant
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e5a22b05f81d8493"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 12:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179318

--000000000000e5a22b05f81d8493
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, when trying to update the checksum, I encounter an issue in
do_update_crates (specific to the zvariant recipe structure), I'll add
another patch for that.

Le jeu. 30 mars 2023, 14:26, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> Ok,  I'll do this rebase in the coming hours.
>
>
> On Thu, 30 Mar 2023 at 13:35, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2023-03-30 at 11:47 +0200, Frederic Martinsons wrote:
>> > What version of bitbake you had pulled ?
>> > Because "mandatory checksum on crates" is a patch I submitted two
>> > weeks ago
>> > (https://patchwork.yoctoproject.org/project/bitbake/patch/20230317081
>> > 916.1857201-2-frederic.martinsons@gmail.com/))
>> > and it is not yet merged in bitbake master nor in poky master.
>> >
>> > So I construct the present series without these patches in mind since
>> > it is not related.
>> > I you plan to merge the previous series, I can update the zvariant
>> > for this recipe of course
>> > it can be done by issuing "bitbake -c update_crates zvariant" if this
>> > patch
>> > (https://patchwork.yoctoproject.org/project/bitbake/patch/20230316121
>> > 249.28209-1-frederic.martinsons@gmail.com/) is present
>> >
>> > I'm sorry, I must admit that I'm kinda lost with the patch submission
>> > process when it impacts multiple different
>> > projects.
>> > Can you advise on the way of doing this?
>>
>> I've merged the other series now so could you rebase this one on master
>> please?
>>
>> Usually if there are two related series you'd base one on the other and
>> note it in the 0/X of the series. We'd work on the assumption the
>> earlier patches would merge first.
>>
>> The holdup was that I wanted to check something in the bitbake patch,
>> which turned out to be fine, I just needed to do it as part of review
>> due diligence.
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179316):
> https://lists.openembedded.org/g/openembedded-core/message/179316
> Mute This Topic: https://lists.openembedded.org/mt/97931116/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e5a22b05f81d8493
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ah, when trying to update the checksum, I encounter an is=
sue in do_update_crates (specific to the zvariant recipe structure), I&#39;=
ll add another patch for that.=C2=A0</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Le jeu. 30 mars 2023, 14:26, Frederic M=
artinsons via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ok,=C2=A0 I&#39;ll do=
 this rebase in the coming hours.<div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Mar 2023 at 13:3=
5, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, 2023-03-30 at 11:47 +0200, Frederic Martinsons wrote:<br>
&gt; What version of bitbake you had pulled ?<br>
&gt; Because &quot;mandatory checksum on crates&quot; is a patch I submitte=
d two<br>
&gt; weeks ago<br>
&gt; (<a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/2=
0230317081" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwo=
rk.yoctoproject.org/project/bitbake/patch/20230317081</a><br>
&gt; <a href=3D"http://916.1857201-2-frederic.martinsons@gmail.com/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">916.1857201-2-frederic.martinsons=
@gmail.com/</a>))<br>
&gt; and it is not yet merged in bitbake master nor in poky master.<br>
&gt; <br>
&gt; So I construct the present series without these patches in mind since<=
br>
&gt; it is not related.<br>
&gt; I you plan to merge the previous series, I can update the zvariant<br>
&gt; for this recipe of course<br>
&gt; it can be done by issuing &quot;bitbake -c update_crates zvariant&quot=
; if this<br>
&gt; patch<br>
&gt; (<a href=3D"https://patchwork.yoctoproject.org/project/bitbake/patch/2=
0230316121" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwo=
rk.yoctoproject.org/project/bitbake/patch/20230316121</a><br>
&gt; <a href=3D"http://249.28209-1-frederic.martinsons@gmail.com/" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">249.28209-1-frederic.martinsons@gma=
il.com/</a>) is present<br>
&gt; <br>
&gt; I&#39;m sorry, I must admit that I&#39;m kinda lost with the patch sub=
mission<br>
&gt; process when it impacts multiple different<br>
&gt; projects.<br>
&gt; Can you advise on the way of doing this?<br>
<br>
I&#39;ve merged the other series now so could you rebase this one on master=
<br>
please?<br>
<br>
Usually if there are two related series you&#39;d base one on the other and=
<br>
note it in the 0/X of the series. We&#39;d work on the assumption the<br>
earlier patches would merge first.<br>
<br>
The holdup was that I wanted to check something in the bitbake patch,<br>
which turned out to be fine, I just needed to do it as part of review<br>
due diligence.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#179316): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/179316" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/179316</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97931116/6213=
388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/97931116/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martin=
sons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gm=
ail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e5a22b05f81d8493--

