Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FDDC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 08:57:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6146.1679821047631160034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 01:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MruNZehU;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id d17so5676041wrb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679821046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iq7y0p8hc2KnJwy/lwBtSkp0Ipn0W8i4Mu9bcDlTQ0=;
        b=MruNZehUnal9K2QtL+O9alshvrS8QjdyzPlZRdTgeR3MJmPRcuja14wjVd++f3DEQo
         Pj6WYhC1TbnyLQThSgk8YU+G+jJt4ipUfSTKFxvDy5Mhpei/YtI5Qb97WYxGOnUoxkdE
         Ocs6qv0KqydZjS9yPRcR/74++dLnzNUDqFE1fy3isbB8+Cy+JWVVfk2tCEVxIGMkwnXb
         8H++lrhRZ+UPX10DruzpyqjSMce/fTwccK/8Am4bYrwZ2ufk2pbnli6bGE8XJ5Gd+rW7
         3SnqYnyizTG83kPY803vavz1hTB7LDJ2SXxzn7lMS6pdLG7kcvUE2tpnqhAi3FDhNIim
         i7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679821046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iq7y0p8hc2KnJwy/lwBtSkp0Ipn0W8i4Mu9bcDlTQ0=;
        b=CZx7u+EVt9VTykb3zClaLC3LzRndiYN4RWgyYy1YJ+KFWdzdG+mTHb3KrEl1TjKxMn
         6HG61BOqL+EekILCstbw+8bVWVp4CymgX2JWEPimyy3+jkYqoaYTAG0RZcCxbI9M8EfJ
         zysYQarMTw3cYM7t5sNlcx1vT1uc4vEYW1duoZly9kYirLeObMCoPhVLI8xwv9y7XhbT
         eP95pRPpjcBXAxWbwGnejpQSI5HPcUWsLlmnzLTGE4SuSidDqmxWc5R9yvEciGrsTJkH
         X7t3/yg7vgZ/SLH+WED7ANaWoUBQYR9AxoMHEJSAokRv/0nFNBScGrenT1faoKfR+GoC
         4/aA==
X-Gm-Message-State: AAQBX9c1VtWeRgoy+7RdDg28PWR95JPyLv0In5eNa/gqsK/EEsxokrm9
	O0ZdjRgKUGviqb0pz/r0UyCqBAwLDsZ/vWvKEHM=
X-Google-Smtp-Source: AKy350adCGtuomC438r5gECmQgs9olNG85apuk6pi4Owf/vcQ3pwQ/F43TdPEAUZeZ0gpWUYEvp1bIcep7KxTe7t/NA=
X-Received: by 2002:adf:efc7:0:b0:2d6:6af:4893 with SMTP id
 i7-20020adfefc7000000b002d606af4893mr1287017wrp.1.1679821045959; Sun, 26 Mar
 2023 01:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230324141626.1361740-1-Martin.Jansa@gmail.com> <cf263160e22b4caadd5a5c11f3f4871ede96964d.camel@linuxfoundation.org>
In-Reply-To: <cf263160e22b4caadd5a5c11f3f4871ede96964d.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 26 Mar 2023 10:57:10 +0200
Message-ID: <CA+chaQcgXJSgp8SAT2ynqvvF8vOZJguq0EerQSJC42vK1z1OAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-scons: upgrade to v4.5.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb0eff05f7c9d0b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 08:57:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179113

--000000000000bb0eff05f7c9d0b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, the commit which fixed the issue:
https://github.com/SCons/scons/commit/a4ab466c6df5bd3187e78c36bfa8f68e1fb76=
59e
said #4231 so I went with this less cool number (without noticing that my
other tab has the issue ticket #4321).

Should I send v2?

Cheers,

On Sun, Mar 26, 2023 at 10:20=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-03-24 at 15:16 +0100, Martin Jansa wrote:
> > * fixes:
> >   https://github.com/SCons/scons/issues/4231
> >   which caused e.g. iotifity to fail in do_compile
>
> I think that should be 4321!
>
> Cheers,
>
> Richard
>

--000000000000bb0eff05f7c9d0b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You&#39;re right, the commit which fixed the issue:<div><a=
 href=3D"https://github.com/SCons/scons/commit/a4ab466c6df5bd3187e78c36bfa8=
f68e1fb7659e">https://github.com/SCons/scons/commit/a4ab466c6df5bd3187e78c3=
6bfa8f68e1fb7659e</a><br></div><div>said #4231 so I went with this less coo=
l number (without noticing that my other tab has the issue ticket #4321).</=
div><div><br></div><div>Should I send v2?</div><div><br></div><div>Cheers,<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sun, Mar 26, 2023 at 10:20=E2=80=AFAM Richard Purdie &lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Fri, 2023-03-24 at 15:16 +0100, Martin Jansa wrote:<br>
&gt; * fixes:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/SCons/scons/issues/4231" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/SCons/scons/issues/423=
1</a><br>
&gt;=C2=A0 =C2=A0which caused e.g. iotifity to fail in do_compile<br>
<br>
I think that should be 4321!<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000bb0eff05f7c9d0b4--

