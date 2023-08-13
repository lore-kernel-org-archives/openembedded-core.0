Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70BBC001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 05:56:14 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.81046.1691906172872509856
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 22:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=itTFFFyh;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6471744acb6so1016596d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691906172; x=1692510972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oUxKOfJY210zL3CGlWRs2jcPr0Co9kRuUAXnOg3mTD0=;
        b=itTFFFyhpBtUEsE6VqsNmzCx55o6vQNWqQCcGtJWdNSuvHc0eD/gHFTGY1zAs24gHr
         FX4cbJ4UgfXud5tjo2ah4U0fV14v7x1U3O6l13SA9pGuOMq4TPn43CwxbiqpoV5Va6Fr
         QIFWifVFJ1DrcdeSOoeS/BY7/rYVFF0Yq+t7MwEaD9QLlmSDFLaQxlUcZpEBjSjfSzxi
         TT5YnYt6IxVnpQQaLv3K4+imxlRWZiVzuHklosNjLJPwa60kPHOYSVb3sZMmLc0meQK7
         VoFoGkb7MUie9vu4Re46EDOrZOWRa6HptiwkZ6M5xv10bTLlD3mt+KpUd0H22GI9iqYP
         6CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691906172; x=1692510972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUxKOfJY210zL3CGlWRs2jcPr0Co9kRuUAXnOg3mTD0=;
        b=e0cBtmbxzBUFzeJTL2DPtzCSfOCcZQYt25zCOTK7z3QnT8x1pD7TfYEIb0tzZJH5yX
         +jwjgUpcUwACDqLFOV++yuKrbuEZrqIfPji/DeBgJ2Mu5tkgGxT0iHVRUNrIYI7s5m9/
         nekPKUwMBzO/1pCzAADTq3QNH1ELIMrXrobH6QSCYntfP0zdlFhm4WSWCCKTqPBYKg0C
         F47rpfGSgUtZvHI0X706NHzWpQ7kyS2CT6Zzhwv1iZcrrvmSp8ocZ5haFKrMJPwTo22O
         3ptrDEdVAj2RtNKa+V/vryX1yRx1oPRPJCN/9z4AECz5tnBoRscBTiCad1c3ojDBbnpE
         lJwQ==
X-Gm-Message-State: AOJu0YyKpHdBvGcnxtX9IJx+BktywubznVJhhZjzoL8U77tbnRLbMuh5
	WZZruf8dpB73Rtjfe29ryNE76IhgOQcq+YbAhOM=
X-Google-Smtp-Source: AGHT+IH3yjOhW4rhq/CmrtsaIxH+bK7/3iM5KDuiPDactVGPDTWZ+x5DD+Oy2sPUctdXp+sBVGqsyYSwRujXFJ5FEDU=
X-Received: by 2002:a0c:e092:0:b0:63c:f4d9:4ab4 with SMTP id
 l18-20020a0ce092000000b0063cf4d94ab4mr5646685qvk.44.1691906171850; Sat, 12
 Aug 2023 22:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691851365.git.frederic.martinsons@gmail.com> <8755eee162bd115e370593e5b5901ccc13f12cc5.camel@linuxfoundation.org>
In-Reply-To: <8755eee162bd115e370593e5b5901ccc13f12cc5.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 13 Aug 2023 07:56:00 +0200
Message-ID: <CA+cAkerRsY01O41sMMtahJVW9fv2iYqzuJYG6HqTuYCWjgtodg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 0/3] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005dd3410602c79ad3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 05:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185862

--0000000000005dd3410602c79ad3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 ao=C3=BBt 2023, 00:53, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Sat, 2023-08-12 at 16:49 +0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This is an RFC for introducing a new class and recipes that
> > help building C-ABI compatible header and library around
> > rust code.
> >
> > The third patch is not meant to be merged (at least I'm
> > wondering if this is really usefull in oe-core) but
> > this could help the review and comment since it
> > demonstrat how to use the class and for what
> > purpose.
>
> We do have meta-selftest in oe-core where it could be added. It is
> really helpful to have something to build tests around, at least
> initially until we get real world examples and it is no longer
> needed...
>

OK thanks Richard, I'll move these examples in meta-selftest and implement
a oeqa runtime test case (like the rust-hello-world that I removed two
weeks ago)

Cheers,
>
> Richard
>

--0000000000005dd3410602c79ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le dim. 13 ao=C3=BBt 2023, 00:53, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Sat, 2023-08-12 at 16:49 +0200, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; <br>
&gt; This is an RFC for introducing a new class and recipes that<br>
&gt; help building C-ABI compatible header and library around<br>
&gt; rust code.<br>
&gt; <br>
&gt; The third patch is not meant to be merged (at least I&#39;m<br>
&gt; wondering if this is really usefull in oe-core) but<br>
&gt; this could help the review and comment since it<br>
&gt; demonstrat how to use the class and for what<br>
&gt; purpose.<br>
<br>
We do have meta-selftest in oe-core where it could be added. It is<br>
really helpful to have something to build tests around, at least<br>
initially until we get real world examples and it is no longer<br>
needed...<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">OK thanks Richard, I&#39;ll move these examples in meta-selftest =
and implement a oeqa runtime test case (like the rust-hello-world that I re=
moved two weeks ago)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--0000000000005dd3410602c79ad3--

