Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0693AC41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 20:42:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.3471.1702759332820213987
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 12:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dlB6T7r2;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5de93b677f4so14747437b3.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 12:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702759332; x=1703364132; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sGzbX4w9W+geaiGXQgcS1O7jV4mckPnczNvRCdKuJXk=;
        b=dlB6T7r2YnsTlgmXBaACAAkme2lTzXjDjyRmYxwyvugbzDnvP51TLcxNdpXopxWqWG
         WhncV+4G/k5uP4hDFPGfeckMFg6FSDN4D+xmD0qlEZiu+mmQftVdujxUhdVqdiXUk+PA
         leKKglham/IYnjgoUCC+b873g8+C44MiE1KwMvUPh1/YLlZlHJIjP2looWOOkkM5hT8U
         BFckFKwHBKL6EnrouVaWXojVGoqkihK8K7fmVsh9dna48ekOdhBVRFHf7jRfvCezuxR/
         pbWLNkK9HIUL5ynYmZacmBTSQSlQ16CYs2N6j2oO2AFadgQoDKu+WTPXm0nkOoSR5330
         ifwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702759332; x=1703364132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGzbX4w9W+geaiGXQgcS1O7jV4mckPnczNvRCdKuJXk=;
        b=l9ZdScoEWomB92BE/x8VoCmeso9Ba3Hmg3acQ9KaPPe8j+7uQaIocS8MpHilx9ofeJ
         tOBqN/PHmx12oW7zdRQL7JlUo/cZJ050qLQyO12iaRJ689pcJdFsBy8ViJ0Wh0he7bAw
         JA5iq5/5zwEzGvWbcdSnGbde3AH+zo1PA6RSK284WGPd3c4nBmdwMmZgszCwLdcFPerJ
         yfg0/2ShlDR5JJzCFS1Q3syI8LfGQztpz1SAtaWxGX4eKki0euaoLVed30zaS3jaG/3/
         VD3SA5UnNmR2kdq8YBZJbQRMI7XnYlI9QIDzPkFELsURasbQDLMITRwUs+4biRoYyQvQ
         3mZA==
X-Gm-Message-State: AOJu0Yy+7gf82vIfkCvzveNeWTfHtOQWBOk3D1zkO1CGlVAaJIwGxmtP
	5ysaCOPG3qRjInPsY4L2n2j7VRGHMNowZEHY87c=
X-Google-Smtp-Source: AGHT+IE+JQ6XEnIyuW+cpl0QwjGSMhCZP6n4Ypbed/CUKRSzNdPPRYDh+qvooLzDvN5jc2UYutM04ZwgNYvfC+hiBbE=
X-Received: by 2002:a81:5b85:0:b0:5de:96ec:6f35 with SMTP id
 p127-20020a815b85000000b005de96ec6f35mr11199108ywb.11.1702759331774; Sat, 16
 Dec 2023 12:42:11 -0800 (PST)
MIME-Version: 1.0
References: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
 <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
In-Reply-To: <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 16 Dec 2023 12:42:00 -0800
Message-ID: <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com>
Subject: Re: [OE-core] mdns on musl
To: mattwood2000@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001bc64f060ca68d56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 20:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192570

--0000000000001bc64f060ca68d56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 12:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> is this issue specific to musl systems?
> Maybe try to reproduce it with glibc on qemu or something?
>

You might also search for mdns issues/solutions in Alpine Linux which is
always musl.

>
> On Sat, Dec 16, 2023 at 9:11=E2=80=AFAM <mattwood2000@gmail.com> wrote:
> >
> > Hi all,
> >
> > I'm working on an embedded system and it needs mDNS in order to interac=
t
> with .local hostnames.
> >
> > The image is based on musl so it cannot use the libnss-mdns library.
> >
> > From what I've read the mdns recipe is supposed to support mDNS on
> non-glibc systems.
> >
> > The recipe takes care of modifying /etc/nsswitch.conf and appends mdns
> to the hosts line.
> >
> > When the system boots it runs mdnsd and I can see it join the multicast
> group in wireshark, but I cannot ping any .local addresses.
> >
> > Is there some other configuration that needs to be done?
> >
> > Has anyone successfully done this with a musl system?
> >
> > Thanks, Matt.
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192569):
> https://lists.openembedded.org/g/openembedded-core/message/192569
> Mute This Topic: https://lists.openembedded.org/mt/103211493/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001bc64f060ca68d56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><div class=3D"gmail_quote"></div></div></div><div>=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 16, 2023 at 12:16=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">is this issue s=
pecific to musl systems?<br>
Maybe try to reproduce it with glibc on qemu or something?<br>
</blockquote><div dir=3D"auto"><br></div></div><div><div dir=3D"auto">You m=
ight also search for mdns issues/solutions in Alpine Linux which is always =
musl.</div></div><div><div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
On Sat, Dec 16, 2023 at 9:11=E2=80=AFAM &lt;<a href=3D"mailto:mattwood2000@=
gmail.com" target=3D"_blank">mattwood2000@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m working on an embedded system and it needs mDNS in order to in=
teract with .local hostnames.<br>
&gt;<br>
&gt; The image is based on musl so it cannot use the libnss-mdns library.<b=
r>
&gt;<br>
&gt; From what I&#39;ve read the mdns recipe is supposed to support mDNS on=
 non-glibc systems.<br>
&gt;<br>
&gt; The recipe takes care of modifying /etc/nsswitch.conf and appends mdns=
 to the hosts line.<br>
&gt;<br>
&gt; When the system boots it runs mdnsd and I can see it join the multicas=
t group in wireshark, but I cannot ping any .local addresses.<br>
&gt;<br>
&gt; Is there some other configuration that needs to be done?<br>
&gt;<br>
&gt; Has anyone successfully done this with a musl system?<br>
&gt;<br>
&gt; Thanks, Matt.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192569): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192569" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192569</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103211493/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103211493/924729</a><br>
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
</div>

--0000000000001bc64f060ca68d56--

