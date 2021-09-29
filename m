Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F35C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:39:07 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web08.6200.1632904746766243441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmsdPP+F;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id u11so984056uaw.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qhw6/fOmZUczXbSfD04ifFGMmmmSQpNLTZp2++TGt3M=;
        b=MmsdPP+FPgGqjfKj5kuRvTH7IspKKtO7vgj6uokooucO9ir4OjemvADWXUGCcG3jps
         5r+Yxp4Vymz+ox13cK4qQmYjXrjZrLCsBQ+aT3iwrkxcQZznjhA2NgL873qM1Nkk3qsE
         Nz+LcLpm2qnXzJaIBtJB43mpFDxsoBMD76Ma9Splv6uZl5iHz1N7UGZ5EuXIru4KquLV
         nPTgzRq/J6og83dHjsPqAmgYIIDAXzsbfu+oqk6TjNG1KzP4ddSBBiYUKY8DdIPL3N3+
         BI+Qf9Z0deMhPgSC14XWReOZlVA8hZOoaeKhBo5CC+WfCMQoF+Ikf9PAmtmpWcsTzibH
         8MQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qhw6/fOmZUczXbSfD04ifFGMmmmSQpNLTZp2++TGt3M=;
        b=faCmrxNxWOiFvakJQJp+k1Hen5AfcvRUpGfvbWIvbNjZmxc9E8P7tO1GX6b+fQvFc8
         J6KLALz7jkGen6DantnH138mUonQlBh7jNDD6n0RwgkfGHXalrPtFVeIZgWX+sHNsnLs
         HTCGxgtGsxxfXCqrvkF2SL29kwi+D5XSdwvIRSMPdqP4Lt5uvOJEcLyveYrdNCC4g1xW
         diAlPA2SRPfLcKkV68NTo+HOeXmL/0vw10mQaqGUpR3l2gGJNC6Y/ib2eFPRqm4wxx6N
         tF9ObYL28enuFiq+pojhIVFvQyPx7QzIRxdRag5n80uZyyJz4UNuHdnDG7j3Ke6cdPZv
         TWzA==
X-Gm-Message-State: AOAM5310LW2yxBWI2TxtOu0uzJt6DztkOCikQI2iRTzt5+Xp54LiKllK
	wIZmJhF5ClRvdznOTr8cbN6GS7ObwopYMpl0wHo=
X-Google-Smtp-Source: 
 ABdhPJwlHUgZkyrlTN17WqGfe8WNTM35NJh7yawF5XjEmnh2gC6jKKTm8Hv8X+whHiV7rsKxod4mHkQb6M2tkTAjgpU=
X-Received: by 2002:ab0:3c4c:: with SMTP id u12mr5089416uaw.100.1632904745897;
 Wed, 29 Sep 2021 01:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210929031804.178714-1-matt@codeconstruct.com.au>
 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
In-Reply-To: 
 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Sep 2021 10:38:54 +0200
Message-ID: 
 <CANNYZj9EoCsCAD9q675=Tf6nPv2NKZpJUsqNX=6b1J4wEfPccQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: openssh-dev shouldn't depend on
 openssh
To: Matt Johnston <matt@codeconstruct.com.au>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054d2b305cd1e4324"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:39:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156453

--00000000000054d2b305cd1e4324
Content-Type: text/plain; charset="UTF-8"

I think a better way out may be to make openssh and dropbear coinstallable?

Alex

On Wed, 29 Sept 2021 at 10:36, Matt Johnston <matt@codeconstruct.com.au>
wrote:

> On Wed, 2021-09-29 at 09:24 +0100, Richard Purdie wrote:
> > > +RDEPENDS:${PN}-dev = ""
> >
> > At that point what is the point of the -dev package? I think you could
> make
> > this argument about a lot of the -dev packages and I'm not sure I'd want
> to
> > see every recipe doing this.
> >
> > What are you using the -dev package for and do you need it at all?
>
> The -dev package isn't needed for anything, but it gets pulled in when
> "populate_sdk" is built. That does a glob over all -dev packages for
> any built package.
>
> Cheers,
> Matt
>
> >
> > [As an aside, I do think the -dev package dependencies need rethinking
> but
> > that is a lot more work which nobody seems very interested in]
> >
> > Cheers,
> >
> > Richard
> >
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156452):
> https://lists.openembedded.org/g/openembedded-core/message/156452
> Mute This Topic: https://lists.openembedded.org/mt/85941131/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000054d2b305cd1e4324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think a better way out may be to make openssh and d=
ropbear coinstallable? <br></div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
29 Sept 2021 at 10:36, Matt Johnston &lt;<a href=3D"mailto:matt@codeconstru=
ct.com.au">matt@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, 2021-09-29 at 09:24 +0100, Rich=
ard Purdie wrote:<br>
&gt; &gt; +RDEPENDS:${PN}-dev =3D &quot;&quot;<br>
&gt; <br>
&gt; At that point what is the point of the -dev package? I think you could=
 make<br>
&gt; this argument about a lot of the -dev packages and I&#39;m not sure I&=
#39;d want to<br>
&gt; see every recipe doing this.<br>
&gt; <br>
&gt; What are you using the -dev package for and do you need it at all?<br>
<br>
The -dev package isn&#39;t needed for anything, but it gets pulled in when<=
br>
&quot;populate_sdk&quot; is built. That does a glob over all -dev packages =
for<br>
any built package.<br>
<br>
Cheers,<br>
Matt<br>
<br>
&gt; <br>
&gt; [As an aside, I do think the -dev package dependencies need rethinking=
 but<br>
&gt; that is a lot more work which nobody seems very interested in]<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156452): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156452" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156452</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85941131/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85941131/1686489</a><br>
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

--00000000000054d2b305cd1e4324--

