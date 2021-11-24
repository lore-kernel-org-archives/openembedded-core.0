Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA764C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 10:28:36 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.4407.1637749715613193449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fxiHs7La;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id p2so3928732uad.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v8VyP5jsGNRSYIDfgFMSA9wmc2ZFtD4zF+styRRsSNE=;
        b=fxiHs7LaqFpnNsJcz39Hk2/DMmuApqz/ln6O0UccIJVGHMPdCvBkFP7MmLgoMiD++R
         MWbzwEUhXTu+IroD+DzETBCi98J5AY0KaMlJJ6/V6mEeGdvPYao/TVR1bheTLjaO3JdJ
         FraWQ54+wGVSj8Px5CbSGmxeSvpJW+1q3Iv6YsHvNSG/Nixy++NVVLbIKGjhWwwr6Qqj
         k9sFEsOvHLGh8/I6LS+lRUyvKSt7SDOOqXcuS4UoiOT6Z0DegjXZXwDSSEYTcvLRMNkr
         Y9FqHM7qCSD7jVklItYwoHckY5B1MVwkiPP9A/Y64U2qGU+HEM8wrjvSVw2xGEITyo0Y
         +1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v8VyP5jsGNRSYIDfgFMSA9wmc2ZFtD4zF+styRRsSNE=;
        b=q8wIMIwjzSuilhmEVCDXF4tTJoTk/L4HMI+gSETKc1Yh1UKm0XFpwyQTNrbMjPkJRU
         YrO0WEERmy7lKg0jNUpxzLgVBkYxneNQxqIEDm3mXSJB6N6pjBMwD0BfvTz97A0pTjia
         6BT6+7+L5d79mR+6Wdh+ZW+fHtRjr6njgzSJTc1R9HfDv0XUaZYlhk6N+Yhjrq0D8C/a
         drqM6u7Ch3X17GGbRRUBMGrmxwiZgLA2Oz9wFyXTpkKhI2UjK0E7BkozeMRs4bAPS530
         oS+Ye9gXi0nPzcauuUoM0ChnUoqHIbSZ5afBTWDmuy5NoIeOP8Edprqn1krVGxxmwudO
         1CBg==
X-Gm-Message-State: AOAM531oYwjtSPWZ7enV+uMe60dntJLLNGw87/HKCGKdozt4W2ixQJm3
	jzNgmqz3moM8Jrjfj2OuPCbRWLcMuaVD9R3KakA=
X-Google-Smtp-Source: 
 ABdhPJw/t96ORLa8v5e12ceDhT3dyJXpAG3giuxtnuhCcNEf1NU8csIhKLPrBW/k1JiNqOyaRqX1711fKw4KJIx3Tl8=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr21704349vsh.13.1637749714633;
 Wed, 24 Nov 2021 02:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20211123193859.2983287-1-ross.burton@arm.com>
 <4385af73ed16d497a0f066396ffe6baddc92d899.camel@linuxfoundation.org>
 <CAAnfSTup6fCMbnHebYbgEecCZD4fNPRdFVYY351G_jV1QmB9gQ@mail.gmail.com>
 <4676580ce5ca6db84befc3fa6c28dd0e7efa08a9.camel@linuxfoundation.org>
In-Reply-To: 
 <4676580ce5ca6db84befc3fa6c28dd0e7efa08a9.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 11:28:23 +0100
Message-ID: 
 <CANNYZj9WYH8x-=R+J3JHi2TGf7FGfOPKDYpRQf=vqBO+p+_4Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: drop redundant patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f8c86405d1865115"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 10:28:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158686

--000000000000f8c86405d1865115
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Nov 2021 at 11:20, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > Sure, and they pass --libdir.  I did a build of Sato and nothing
> > moved, so I'm struggling to find the actual problem here.
>
> Did we start setting libdir for native builds after that change merged?
>
> I've spent half the last week chasing phantom issues so I'm just not
> feeling
> keen on doing it with yet another issue but I guess we can queue this and
> wait
> for something to break...
>

The actual problem was something entirely different and nothing to do with
libdirs that was added in 0.59.2 and removed in 0.60.x:
https://github.com/mesonbuild/meson/commit/142b741384347dd31ee2008726b3b3d237e2588f

Once again, given that the offending is_debianlike() function is still in
place and upstream may add more (broken) uses of it, I do not want this
patch removed.

Alex

--000000000000f8c86405d1865115
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 24 Nov 2021 at 11:20, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; S=
ure, and they pass --libdir.=C2=A0 I did a build of Sato and nothing<br>
&gt; moved, so I&#39;m struggling to find the actual problem here.<br>
<br>
Did we start setting libdir for native builds after that change merged?<br>
<br>
I&#39;ve spent half the last week chasing phantom issues so I&#39;m just no=
t feeling<br>
keen on doing it with yet another issue but I guess we can queue this and w=
ait<br>
for something to break...<br></blockquote></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">The actual problem was something entir=
ely different and nothing to do with libdirs that was added in 0.59.2 and r=
emoved in 0.60.x:</div><div class=3D"gmail_quote"><a href=3D"https://github=
.com/mesonbuild/meson/commit/142b741384347dd31ee2008726b3b3d237e2588f">http=
s://github.com/mesonbuild/meson/commit/142b741384347dd31ee2008726b3b3d237e2=
588f</a></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">Once again, given that the offending is_debianlike() function is still i=
n place and upstream may add more (broken) uses of it, I do not want this p=
atch removed.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">Alex<br></div></div>

--000000000000f8c86405d1865115--

