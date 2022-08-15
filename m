Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96594C25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:41:08 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web08.12273.1660531261694907650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U27An+gX;
 spf=pass (domain: gmail.com, ip: 209.85.128.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-31f443e276fso56032997b3.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uh87dFewZDYanpBs6Ie6gU4t0NBP+N6nmAXLef7xd48=;
        b=U27An+gXBYaWebTmntAG6WPd4ZhcFdC0wFcD9iibY2i0czIJBK4mC2iyGJnLFRM03C
         rVZMNGRhSDNb+TlpH4zYFMwfHJ0xWApPgIP7glvvvAqS2m79UVj8NnwTJoCU2vj20G/r
         aDBe3tqcSBl3P6y6s5lk9ws6F19J25/RzeWV5/FQGbsDo4kYn9K8nGAr98cr0RkxpL9N
         wBNIDIORd9vNxFlOaS6NYypjs28UsitEzs3a2OmMui7Go7n9Zc3HzOqMxeH5hb2mQDHh
         UrEfaO7hiI2c/jwuXlWFKF9XF6yOtQyruP7R4mRTiJ9sSp7yfjtawVtSfD+d23kd1grX
         nArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uh87dFewZDYanpBs6Ie6gU4t0NBP+N6nmAXLef7xd48=;
        b=qTKkqkPlKDMbbV7LrLN5nWJKy3ZRHp1JfiXO8BQa5hdUZiS5ObtOA0TPMavC9ZNWvA
         0ySKpWrpdeAnMepjx4d+R08f0ihWbJK/I0hHNHCqrTs9FcAaY2ktmENz1LyQlF9qpmfA
         lQ45GFwSHnfM0FlN/uF3EK0NWEvLS3iWKuc/hdJA5HN9xfe90wP7hgHZlcZ5m/DYAkor
         oOthXUFTSVild7wicChc8wT0fDqoJd7uimE2JSgxtkryUea1OvdrFBDmhJLJLOVYxw5/
         E1SqIU84Bt4JURD7XRfYCDTEskYvBs1dAD1B6qtnT45/Y6kC+vQdseritgKAPLNk79CX
         sPog==
X-Gm-Message-State: ACgBeo3mQasonvg2Ynwr/nf1xRej42f8/9KihlwttVQ44ffPe9dhz+xR
	aZ3PPyDHFtd6aILLyk5pTXWodCB+BDlq7jDsJUo=
X-Google-Smtp-Source: 
 AA6agR4S2qJq64gZyX/GwRCeos/W7J0jnLz9H9HBHy/7YLuQJk6+38s8HLZW0xlS5YhZurbDNOcBxhzYqQnb03Ns0No=
X-Received: by 2002:a81:55c2:0:b0:31f:645b:9858 with SMTP id
 j185-20020a8155c2000000b0031f645b9858mr11922536ywb.296.1660531260758; Sun, 14
 Aug 2022 19:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220814222037.283943-1-raj.khem@gmail.com>
 <20220814222037.283943-3-raj.khem@gmail.com>
 <2841280.e9J7NaK4W3@linc>
In-Reply-To: <2841280.e9J7NaK4W3@linc>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Aug 2022 19:40:49 -0700
Message-ID: 
 <CAMKF1srS-ZN1y7O9m3LUWX76rJ6pMtTsTieUeOBK59Ko01N3Vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/10] zlib: Resolve CVE-2022-37434
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef9def05e63e8fc5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 02:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169347

--000000000000ef9def05e63e8fc5
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 14, 2022 at 7:32 PM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> On Monday, 15 August 2022 10:20:30 NZST Khem Raj wrote:
> > This is only seen in development branch as per [1]
> >
> > [1]
> >
> https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166be
> > ce1#commitcomment-80753451 CVE: CVE-2022-37434
>
> It's a little confusing, but I think that CVE-2022-37434 does affect
> existing
> zlib releases - at least the patch does apply. My reading was that the
> upstream comment was referring to the *fix* (and thus the additional
> segfault
> issue that it introduced) was not yet in any zlib release. A look around
> suggests Ubuntu is treating CVE-2022-37434 as needing to be fixed at least.


Yeah I think I missed the second last and last comments which clears it

So we still need those two fixes to address the CVE


>
> Cheers
> Paul
>
>
>
>
>

--000000000000ef9def05e63e8fc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 14, 2022 at 7:32 PM Paul Eggleton &lt;<a href=
=3D"mailto:bluelightning@bluelightning.org">bluelightning@bluelightning.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Monday, 15 Augus=
t 2022 10:20:30 NZST Khem Raj wrote:<br>
&gt; This is only seen in development branch as per [1]<br>
&gt; <br>
&gt; [1]<br>
&gt; <a href=3D"https://github.com/madler/zlib/commit/eff308af425b67093bab2=
5f80f1ae950166be" rel=3D"noreferrer" target=3D"_blank">https://github.com/m=
adler/zlib/commit/eff308af425b67093bab25f80f1ae950166be</a><br>
&gt; ce1#commitcomment-80753451 CVE: CVE-2022-37434<br>
<br>
It&#39;s a little confusing, but I think that CVE-2022-37434 does affect ex=
isting <br>
zlib releases - at least the patch does apply. My reading was that the <br>
upstream comment was referring to the *fix* (and thus the additional segfau=
lt <br>
issue that it introduced) was not yet in any zlib release. A look around <b=
r>
suggests Ubuntu is treating CVE-2022-37434 as needing to be fixed at least.=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah I think I m=
issed the second last and last comments which clears it=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">So we still need those two fixes to a=
ddress the CVE=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex" dir=3D"auto"><br>
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000ef9def05e63e8fc5--

