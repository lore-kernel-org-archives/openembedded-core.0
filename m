Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3EBC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 20:01:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.2937.1636056056735518922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RuxKIgun;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id y26so14197048lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9PCvSzIEmZfqa97OvJInmKxwtk4g/BcPh1U67VjOpYU=;
        b=RuxKIgunucxmdtsGSgpsNO4bmY9COeuMFM+f2lXqDQirdXUziwgKQhXNyeQIYYX/Cu
         SULhckoKB7nrR1/Amo1fpmierWcTylqE3HXbKwhTpDT9Vj9rrBQZa/uPHjza1pb3szHa
         Ea46UiDC5CcVdP0EBvInBygVH11y8oQmsRr7mGgf+WCUdf6ZpPrF0epEAC7dEjiMZULN
         +/HZnslPLGottE208Gixs6ipXCGhSDa2RZ1+t1pXkcr0UZ5TwoprPgESWnR+KXv+GLda
         PvuaIF/aRxZnEXQk6E3BLPEMWML6NU7mnkA5jP1nzov4myFTaTp0PtTVvbFcxz7tXADn
         IJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9PCvSzIEmZfqa97OvJInmKxwtk4g/BcPh1U67VjOpYU=;
        b=PLNoPiHm8mQjJh/ipfu6Ua6ZvgA+UDBceXZK6MZYAnZgHrDQuhjFh3C8iUHfYh4ski
         FjbJPV4QbE/BQSTvjvsjM5xzSYtHzmfU0OCJYKgIjo6zWaG0Pk+duVCVksru4WVVOAM6
         B3uAgUMF/N0wMqidXwSJMF46rDKCPG/C2rV3iCW07rr2q69zKpa015FJoYIAKCemfJto
         KZD5sUW09RzV/qpZcb6QE+OM7e2XdCNGSCLKUnAHHnPsGSTc10aip4omGL/Q5pW/Lp31
         jLNLU9nEt92p9ErHYLIGcrX8HmvH2IwYEpUlJd+hqNgGaGrfzU9FXr2oCX6bN45kbUF1
         ab0Q==
X-Gm-Message-State: AOAM530FKwy/BPa92+gb+HAYGmNTVynzFtmweqCH3clcU1rGFlsoJP43
	3qfFtmDTQMLcjNka3LsZkpMtMPnyU23Cb5UDgQw=
X-Google-Smtp-Source: 
 ABdhPJwmdb3QaXIm9mVy2LRo3TkeNPMxCetS11ZXPaWoWUvPvcOzZDsnx2Sv/FBd1HIS105yNb1Z3nCIyW7XoEopxWI=
X-Received: by 2002:a19:ad0d:: with SMTP id
 t13mr49876854lfc.161.1636056055140;
 Thu, 04 Nov 2021 13:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <CANPvuRkxEFt7LHO_BAnQpEWU=T9ctFh45d+SzFfe=jBHUOH1aQ@mail.gmail.com>
 <CAGDS+nkJ4en5JjLGSMuePSQUY+mvLiek4X67q5Go+LA8307ApQ@mail.gmail.com>
 <5a8c05846279f160ee2d5fe7ef7502c29e1bfee1.camel@linuxfoundation.org>
In-Reply-To: 
 <5a8c05846279f160ee2d5fe7ef7502c29e1bfee1.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 20:00:44 +0000
Message-ID: 
 <CANPvuRnT027cnayyR=2XO_VtjhKd27rhXG=ieX4KZmDFC2yuCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <sakoman@gmail.com>, Saul Wold <Saul.Wold@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ffd36b05cffbfba3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 20:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157870

--000000000000ffd36b05cffbfba3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
28/10/2021 =C3=A0(s) 21:58:

> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
> > On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma <quaresma.jose@gmail.com=
>
> wrote:
> > >
> > > Hi all,
> > >
> > > There are any plans or is it possible to backport the SBOM/SPDX to th=
e
> dunfell branch?
> >
> > I'm going to yield to Saul as to whether he thinks this is
> > desirable/possible or not.
>
> The packagedata changes are pretty invasive unfortunately and likely not
> something you're going to want in dunfell sadly.
>

Thanks for the clarification.


>
> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ffd36b05cffbfba3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 28/10/2021 =C3=A0(s) 21:58:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, 2021-10-28 at 08:47 -1000, =
Steve Sakoman wrote:<br>
&gt; On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma &lt;<a href=3D"mailto:q=
uaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt; <br>
&gt; &gt; Hi all,<br>
&gt; &gt; <br>
&gt; &gt; There are any plans or is it possible to backport the SBOM/SPDX t=
o the dunfell branch?<br>
&gt; <br>
&gt; I&#39;m going to yield to Saul as to whether he thinks this is<br>
&gt; desirable/possible or not.<br>
<br>
The packagedata changes are pretty invasive unfortunately and likely not<br=
>
something you&#39;re going to want in dunfell sadly.<br></blockquote><div><=
br></div><div>Thanks for the clarification.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000ffd36b05cffbfba3--

