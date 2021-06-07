Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web09.5131.1623106211140472257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 15:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dN74AvKp;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id w127so19666706oig.12
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 15:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xduSrQKE8xoZhIEPZVEcoxRwKl85g+I2b0eSIE0pn28=;
        b=dN74AvKpEseEXpNhAztpK7/901iU0g6g13QQqpMDvvdxO4VzK2Y+YQ6qxYuYVPmmVf
         bqIOhR3t+cvnqXjdRlM/lCDFvokpPwriXY+SaNdD4nfdD5fUUl3hdOHDzgAXJgVH84/r
         lti5NDzfbllHCSVTLlSrFvKaEAwgST8tSQSx031rKgi7JrkbS36cLjHKLmbiR6EqzgnO
         jz9ITyG9XxGz3OlT30/dyT/+cFOrMcyz+UeM9e4mr8moHwPJuGzcrZew3W102R3hhylH
         nveYYL0X7a3UOyDEhYOWlsMvZ2otsNmFDZC551B9kUaAmuUG0j5rZdfTSe35E96+71o5
         nlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xduSrQKE8xoZhIEPZVEcoxRwKl85g+I2b0eSIE0pn28=;
        b=uawYy9wRxA5MxDqODHRjLmSd4Wp9frjHgtE+zb76zFWMVRi02PXGm3VAhM2pHUqtWx
         m24FQnX1aIb+tZPBfz7h3bQ77p2I7FkHQAqRVrVqljob8es7jPGjdyKrvai90hplp9wL
         SCMQhs5frDz7wfEkMo6RiaiVeBL0uWBuELJCVqTUl9IAYWphRVp8SIdyXaX5aZxzPhE+
         ZCkOlU1ledJSDjqgtkfnQmc4MVFieAoep8GbnzQ7C3uzoTKgKVKr32eXKvDhRLLN9AQ0
         BV8fKxXo2DEuaUmus0oSLJfcuv1W0NdSzBxtNNDcnlWTcUZeBce/IzbQtvdr7/ZI5ypZ
         WeFg==
X-Gm-Message-State: AOAM531XuPHNeYtMZgzthMPBhkFm8unwsEbDHjNcNWzbtERV1eYscF+U
	4u6RmMCg0RtYroEpExOu+dMLGa+KfHwBvdGxpa4=
X-Google-Smtp-Source: ABdhPJwtpspLvUpe/w92M0XmgwnEfWpmqaL/OTd1fZ3bNbXwzOHoCQVSW5LNgDijREHpzvvO3Mv+Kss8XKIAzV9yRN8=
X-Received: by 2002:aca:bad5:: with SMTP id k204mr1562oif.122.1623106210342;
 Mon, 07 Jun 2021 15:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210607212558.86624-1-bkylerussell@gmail.com> <dccbc4111daf453cec3f7fe60e4da15d1c3e5306.camel@linuxfoundation.org>
In-Reply-To: <dccbc4111daf453cec3f7fe60e4da15d1c3e5306.camel@linuxfoundation.org>
From: bkylerussell@gmail.com
Date: Mon, 7 Jun 2021 18:49:58 -0400
Message-ID: <CAFrQVPPHw0BpXUOXrhnYOeZHRBd=w=kEthVqbAVucRTyeiz7Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000019acda05c434dd51"

--00000000000019acda05c434dd51
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 5:43 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441
>
> This doesn't look quite right?
>

Yes, that's the one.  I assumed this was what you meant by, "Another option
would be to have multiple uninative feeds based on gcc
version rather than a single uninative one."

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441#c1

This is a huge performance penalty to put onto the build unfortunately and
> I really
> don't want to do that by default on the autobuilder. We haven't seen many
> of these
> errors on the autobuilder and I'm reluctant to take the performance hit on
> our testing.
>

I realize this is not ideal, but I guess the trade-off is dealing with
these issues as they arise on
a case-by-case basis.

There were specific issues with gcc 4.8 and 4.9 which required separate
> sstate. Do we
> know which gcc version switched the default and can we force older gcc's
> to use the
> same default or does it not work? I'm wondering if we could split off a
> "nopic" verison
> of sstate for example for the older gccs?
>

gcc 6 introduced an --enable-default-pie configure option, but I'm not
exactly sure where
between Ubuntu 16.04 and Ubuntu 18.04 they picked that configure option
up.  Since packages
based on the older gcc already exist in sstate, I think we would have to
force the newer
behavior on each affected package.

I realize we can just swizzle the compiler flags on the affected packages
to make things happy,
but it seemed like this approach had at least been considered before, so I
thought I would at least
get some feedback.

--00000000000019acda05c434dd51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jun 7, 2021 at 5:43 PM Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10441" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D10441</a><br>
<br>
This doesn&#39;t look quite right?<br></blockquote><div><br></div><div>Yes,=
 that&#39;s the one.=C2=A0 I assumed this was what you meant by, &quot;Anot=
her option would be to have multiple uninative feeds based on gcc<br>versio=
n rather than a single uninative one.&quot;<br><br><a href=3D"https://bugzi=
lla.yoctoproject.org/show_bug.cgi?id=3D10441#c1">https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D10441#c1</a></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">

This is a huge performance penalty to put onto the build unfortunately and =
I really<br>
don&#39;t want to do that by default on the autobuilder. We haven&#39;t see=
n many of these<br>
errors on the autobuilder and I&#39;m reluctant to take the performance hit=
 on our testing.<br></blockquote><div><br></div><div>I realize this is not =
ideal, but I guess the trade-off is dealing with these issues as they arise=
 on</div><div>a case-by-case basis.<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">

There were specific issues with gcc 4.8 and 4.9 which required separate sst=
ate. Do we<br>
know which gcc version switched the default and can we force older gcc&#39;=
s to use the <br>
same default or does it not work? I&#39;m wondering if we could split off a=
 &quot;nopic&quot; verison<br>
of sstate for example for the older gccs?<br></blockquote><div><br></div><d=
iv>gcc 6 introduced an --enable-default-pie configure option, but I&#39;m n=
ot exactly sure where<br>between Ubuntu 16.04 and Ubuntu 18.04 they picked =
that configure option up.=C2=A0 Since packages</div><div>based on the older=
 gcc already exist in sstate, I think we would have to force the newer</div=
><div>behavior on each affected package.</div><div><br></div>I realize we c=
an just swizzle the compiler flags on the affected packages to make things =
happy,</div><div class=3D"gmail_quote">but it seemed like this approach had=
 at least been considered before, so I thought I would at least</div><div c=
lass=3D"gmail_quote">get some feedback.<br></div></div>

--00000000000019acda05c434dd51--
