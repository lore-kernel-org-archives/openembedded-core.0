Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6999FC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 08:11:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8931.1633507864963988276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 01:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aBOrGiCD;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id u18so6808018lfd.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kHKZ7LCTpO0v8HECDiA9XTUqq7HuKRX07kqJhmuAbs=;
        b=aBOrGiCDiThOG//bp9t7FTU/fm/KTXu8sjcCIuZXaUe0qWjFR5fpXd1MSkQqJsGxZq
         l2Am+nURw7sdlJVb7ul72hYSQle7sqR1vtMprVmTQr2CRkex7n7VisdDDP3PdztG7uPR
         PyP36SjchXS5akgHC60EDW6Z6T1SSLpQpGzZ28PvbQ7nEBJhRFIPLLhC51XO2cACxEMV
         pXsYUmWPBolKVL6AzVpa2QibEsEwMhBVa5pTdyo/WV2qTBisbfcuLCVUmKDXzVICefyF
         2g+hTqHZlh0U/zai5i/1XonsdKmXLbpt8Pqe1u7Y8q/SyzSLfnGyu18UfDTQ3AzXEmgt
         DSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kHKZ7LCTpO0v8HECDiA9XTUqq7HuKRX07kqJhmuAbs=;
        b=JfEDwxLMLHUvTVCpKyzeHQQPNsebs236NP8pc/F/SwnAOjL9MPd1FVqdd+5mScy/dL
         3kCGiLmLYUH7pBEfhDCqta9ozo9tqiipc70dZLuQMKDEJ6rOLmB+cCXwwsVbnZ6eAv3P
         tWV/hjUawV0mawWUOEvWvBFoBhEShq6n8OMvu3bSpPo3WbwXJJ5eFKFdttEBLHjqLoAU
         c8F8RoEFfUgEEr6OtXWVL0tQ1paeEwDcyfqco4FCQAAwNjYml7u+TsAH5xgpA4vmqdOJ
         U0ewGDW9RT30aZSqAt+SZg2aUNQk1xVlLuJqSEN9gZ3rE8XcyOv2NQL9Cru+a0tlbXsd
         imng==
X-Gm-Message-State: AOAM531S79EpcoiqokFzNi4p3dRQTpdbaC9ZmVK8+uhrQhq/HUAz5yz0
	dlKcl0D3OfcWQ2jIzKzbPwq9ut8HtB78ILxCOzQ=
X-Google-Smtp-Source: 
 ABdhPJwUCRlXZP+TPQC3sQw1Px3nhpdVX+v4JrzrY15deYecDDoYVZ/2VV26MaYr7ASFGpkBd/2bdwE3VuGWMMrjsLg=
X-Received: by 2002:a2e:87ca:: with SMTP id
 v10mr28530309ljj.369.1633507862990;
 Wed, 06 Oct 2021 01:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211003213834.934065-1-quaresma.jose@gmail.com>
 <c9839c9f3bda2be330b9ee6be281b9bee237411e.camel@linuxfoundation.org>
 <CANPvuR=Gnc=QpXqQkC1=37=93SZC1f_MS8FvfLui8RKmx9r5hQ@mail.gmail.com>
 <42ad79c92bea355abe2d7d7200003f62d6e3a212.camel@linuxfoundation.org>
In-Reply-To: 
 <42ad79c92bea355abe2d7d7200003f62d6e3a212.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 Oct 2021 09:10:51 +0100
Message-ID: 
 <CANPvuRnUJmdT_-aEc290=dSGz4oTtAeR=_Enuc6QaTKdxec-Zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: adds warnings for the
 exceptions of os.utime in siginfo
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e951fa05cdaaaff9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 08:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156675

--000000000000e951fa05cdaaaff9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 4/10/2021 =C3=A0(s) 21:03:

> On Mon, 2021-10-04 at 18:59 +0100, Jose Quaresma wrote:
> > I understand the exception for the use cases but I think it would be
> useful
> > to show this to the users. Will it be more appropriate perhaps to log
> this as
> > debug messages?
>
> The trouble is in the situations that is guarding against, the user canno=
t
> do
> anything about it so warnings definitely aren't appropriate and I'm not
> sure
> debug messages would be welcome either. Those would be less invasive
> though.
>

After your explanation, it is not so useful.


> > I have a final question that I don't understand clearly.
> > Can the omission of these timestamps updates on siginfo invalidate the
> use of
> > the sstate-cache for that task,
> > bitbake-dumpsig can complain about that?
>
> I think there is a misunderstanding here. The timestamps I've been talkin=
g
> about
> are part of reproducible builds and the SOURCE_DATE_EPOCH variable and
> code.
> These aim to make the output identical. If the output is identical, hash
> equivalence is more successful and the more successful hash equivalence
> is, the
> more sstate reuse you get.


> The timestamps in this part of the sstate code are simply there to handle
> sstate
> artefact aging (e.g. delete things which haven't been used in X weeks). T=
he
> timestamp change is therefore "nice" but if it doesn't happen, it isn't a
> problem. Hope that helps clarify.
>

Yes, it is true I have misunderstood that part of the reproducible builds
and SOURCE_DATE_EPOCH.
It's hard for me to figure out all the pieces involved in hash equivalence
and sstate handling.
One more detail that I understand better.
Your opinions and explanations always help a lot.

Thank you very much.


> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e951fa05cdaaaff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 4/10/2021 =C3=A0(s) 21:03:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, 2021-10-04 at 18:59 +0100, =
Jose Quaresma wrote:<br>
&gt; I understand the exception for the use cases but I think it would be u=
seful<br>
&gt; to show this to the users. Will it be more appropriate perhaps to log =
this as<br>
&gt; debug=C2=A0messages?<br>
<br>
The trouble is in the situations that is guarding against, the user cannot =
do<br>
anything about it so warnings definitely aren&#39;t appropriate and I&#39;m=
 not sure<br>
debug messages would be welcome either. Those would be less invasive though=
.<br></blockquote><div><br></div><div>After your explanation, it is not so =
useful.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; I have a final question that I don&#39;t understand clearly.<br>
&gt; Can the omission=C2=A0of these timestamps updates on siginfo invalidat=
e the use of<br>
&gt; the sstate-cache for that task,<br>
&gt; bitbake-dumpsig can complain about that?<br>
<br>
I think there is a misunderstanding here. The timestamps I&#39;ve been talk=
ing about<br>
are part of reproducible builds and the SOURCE_DATE_EPOCH variable and code=
.<br>
These aim to make the output identical. If the output is identical, hash<br=
>
equivalence is more successful and the more successful hash equivalence is,=
 the<br>
more sstate reuse you get.=C2=A0</blockquote><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
The timestamps in this part of the sstate code are simply there to handle s=
state<br>
artefact aging (e.g. delete things which haven&#39;t been used in X weeks).=
 The<br>
timestamp change is therefore &quot;nice&quot; but if it doesn&#39;t happen=
, it isn&#39;t a<br>
problem. Hope that helps clarify.<br></blockquote><div><br></div><div><div>=
Yes, it is true I have misunderstood that part of the reproducible builds a=
nd SOURCE_DATE_EPOCH.</div></div><div>It&#39;s hard for me to figure out al=
l the pieces involved in hash equivalence and sstate=C2=A0handling.</div><d=
iv>One more detail that I understand better.</div><div>Your opinions and=C2=
=A0explanations always help a lot.</div><div><br></div><div>Thank you very=
=C2=A0much.</div><div><br class=3D"gmail-Apple-interchange-newline"></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000e951fa05cdaaaff9--

