Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA6BC19F2B
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 18:15:15 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web09.5644.1659204913679903149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 11:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbV0rkDb;
 spf=pass (domain: gmail.com, ip: 209.85.219.180,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id i62so11182826yba.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=qAeiX91tv/DSogOxjst9qM+LKFyiunldi/FCl2bIlO4=;
        b=gbV0rkDbQRofzcpH0bgUXzgMHOKfYNANi4uqfUNQYYuyaI+gPCmQlkRfdW6lPlX50v
         fvKiKcbNe3ajIKrDxD7RYtQCKqmjU3K27eAvf8w+2PmVROdDSwp9q2vwRwlD1YTPD5Zy
         Td7fLLAKSJNbNG3nwMmkuC2pcLgVFIoJ7cQblErXY5gV1MtU7cq/350RfohhdaxNWxXm
         frRkSIHKTzgptpyRVoJQjzPTbgW7ebrL0xVP9GOYVC9AD8mkUZlFc2D595ixjW6avN6M
         btBMwhZTKiKVnuCoiZP01KeaAPeMc9LTzEcIdmrQsjUHzNIesr50az93RGwss4sAkRv5
         tYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qAeiX91tv/DSogOxjst9qM+LKFyiunldi/FCl2bIlO4=;
        b=00TZoGF2wiAdt1gOUYW1dzMRNYJkI8eO1rDD7lBlvP/kX4bdlHvZlPhq6ZALavdpC8
         C+nxKgnbhYlJTs2vv/lLQ0B6bZePl+nVuwk+0cYANHB34iVAatgOheADOHhvqfz3IWQK
         HriulwiDf/n7Lm1wmpebmPG4Hc5wa/Bxx2ibFSFOtqQ+0THFiSlFMD/60Idm++w5Vnh2
         lwKnjRoaFDO+KJrC2SfRYMQYp5UN0mdEoUFgb92N6uJh1F2f8WkuC+XgpTvKBQ8laOdx
         77R6hwjApAegdlx9yXwU7FpXw00xZklunGaVW5DLDMb8n0Kozzjkb8ja0iX1y0CwIjXo
         VEHA==
X-Gm-Message-State: ACgBeo0V821NDgF3eK9zy2nG4xgtPpVwqz0ed38VB7FURtxW/phptJJ5
	1WrOlSaixRdO770zUkt7TXbq5+nbYNMuv8xz+4A=
X-Google-Smtp-Source: 
 AA6agR7lpRdf4tYbhTYcSt9a5UbRWiUI2MvxLYeHsekIqIHcpk4h8wH1vMczmoJB5loIWEYN7wTXtU26v71/AW2vtbo=
X-Received: by 2002:a25:198b:0:b0:676:bd41:eb45 with SMTP id
 133-20020a25198b000000b00676bd41eb45mr5127386ybz.312.1659204912801; Sat, 30
 Jul 2022 11:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220729141049.835733-1-alex@linutronix.de>
 <57a6142f5c2f444288e16632839dc647@axis.com>
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Sat, 30 Jul 2022 11:15:02 -0700
Message-ID: 
 <CAB=6tBQzdzvgsD-tWQ9nz7C2-Smn0SDSqeveYus57zW98SkHsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006feb3a05e509bfb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 18:15:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168682

--0000000000006feb3a05e509bfb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2022 at 13:12 Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

I can do that, but I'm curious about this 80 character limit. Who
> cares, in 2022, and why?


I care :)

Why? It is an expectation built into a lot of tools for one thing.

The git commit log is one notable example. Wrapping commit messages at 72
characters and keeping code width to (generally) 80 characters has
non-trivial benefits that are (hopefully) reasonably obvious to anyone who
has had a lot of windows up at one time.

We also have to have *some* sort of limit and it *should* be consistently
applied. The human ability to mentally =E2=80=9Ccarriage return=E2=80=9D dr=
ops off as lines
get longer and minds get fatigued.

Finally, looking back at my own learning curve and having mentored new
developers, line length guidelines force developers to write code that is
more readable in the long run.

..Ch:W..


> --
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--0000000000006feb3a05e509bfb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 29, 2022 at 13:12 Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=
=3D"auto">I can do that, but I&#39;m curious about this 80 character limit.=
 Who<br>
cares, in 2022, and why?</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)" dir=3D"auto"></blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">I care :)=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Why? It is an expectation built into a lot of tools for one thin=
g.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The git commit log is=
 one notable example. Wrapping commit messages at 72 characters and keeping=
 code width to (generally) 80 characters has non-trivial benefits that are =
(hopefully) reasonably obvious to anyone who has had a lot of windows up at=
 one time.</div><div dir=3D"auto"><br></div><div dir=3D"auto">We also have =
to have *some* sort of limit and it *should* be consistently applied. The h=
uman ability to mentally =E2=80=9Ccarriage return=E2=80=9D drops off as lin=
es get longer and minds get fatigued.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Finally, looking back at my own learning curve and having men=
tored new developers, line length guidelines force developers to write code=
 that is more readable in the long run.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">..Ch:W..</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br></blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><=
b><span style=3D"font-family:monospace">&quot;Perfection must be reached by=
 degrees; she requires the slow hand of time.&quot; - Voltaire</span></b></=
div></div></div>

--0000000000006feb3a05e509bfb5--

