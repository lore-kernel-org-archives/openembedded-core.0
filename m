Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039F6C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:09:39 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.13124.1642691378394185622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=muI4DXCS;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id n15so9864680uaq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nmcJaJ84w4+/W7aJ3Mtm3G2CLflwUIaW4p9WTJZt2sI=;
        b=muI4DXCS1cwEHEDhB9FOehCJ4vEh+RjszSZY1x9AmuQMNDj8j6A3hoZu7/fkQG5Biv
         OHf0RVbgSwbJAA2LeZkg4JLNLKRXpqkj/4WIETqc1/QvjHQP1/eiKlP40dzIfiDA1MVq
         6Nc1fxpdNst0LNtCsP15YtAI9jOzbzbavO63X1x/9jvzdma1LeHse4REJaLzc+SBx3nM
         eBhgzT23Xc0Pvl3L6hLDOBqPkWd5FigxRnowQO+O9GgkDNvNtb7NzEqIBTuu/OZbaKkh
         cynne5uetMHQeEXTDVdLBTH4lfo/vyE/d9/UEgajBGtDdoo1BLdDMyaMGg4CP79LfDJV
         cvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nmcJaJ84w4+/W7aJ3Mtm3G2CLflwUIaW4p9WTJZt2sI=;
        b=H7WClZ97g/g9uAPgr71BBmINZzWVOO/VDbJsY0KAF2ZxYSh/lshV9RMRf3ohicPHpE
         5uoYEVdj8BrJluQu1Cnchl00ad/HS+D8yGV7n+beC3wza7Vz+tw1a4yoYvsdjD+gFf1N
         sPL0UzLQTAjvzUAXvHK1nYKUNAEOpBMFdWNEjgz68egySPQ9dtUDlgrySzeOTfnleZwd
         KH0H3Q48zrXGrqyBls2bKEUf2cvUuPWYSUEWI2YBuqvXZpZ28fdeIQ/3ozfPTfsy1FdQ
         WHna04+U2jp46SFmMVG5lqSQKtNTXLUG7r9m8Rvkudh59y6tqxsGsICLqjB8ZzECJCuh
         9LKQ==
X-Gm-Message-State: AOAM532QSrBVQsQ64qZ0tLNYvle+GVQk3W7Y68QIEs4W7KpPqmTdXa3p
	4gCGHh2OKKsKfBwbwLC5zUbFmQIVmsIAAyadWrc=
X-Google-Smtp-Source: 
 ABdhPJzHeArYfefctCXrUZDAOf3OCrr9gsaMwnasox/b/lgxLpFEzeKL7k2V2tIFbMwZpH50qPvpZ5RlEVmy0lulC1E=
X-Received: by 2002:ab0:8b:: with SMTP id 11mr6460793uaj.22.1642691377382;
 Thu, 20 Jan 2022 07:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20220120143242.35930-1-kory.maincent@bootlin.com>
 <CANNYZj8iOcC6TLkOW2Bt6G+Ey=h5zwxrEUNQC8E7v8yXz0GFpg@mail.gmail.com>
 <20220120160339.4f21c216@kmaincent-XPS-13-7390>
In-Reply-To: <20220120160339.4f21c216@kmaincent-XPS-13-7390>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 16:09:25 +0100
Message-ID: 
 <CANNYZj-oOAz2A_2v8ysopd_TaZA8qM42hhZbgutA1AO5qi90_g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] icu: fix make_icudata dependencies
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 thomas.petazzoni@bootlin.com,
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000006496705d604e454"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160766

--00000000000006496705d604e454
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Jan 2022 at 16:03, K=C3=B6ry Maincent <kory.maincent@bootlin.com=
>
wrote:

> Hello Alexander,
>
> On Thu, 20 Jan 2022 15:37:26 +0100
> Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> > Can we rather make a dependency on the task that prepares the sysroot,
> > instead of listing the dependencies one by one (with anonymous python
> too!)?
>
> Thanks for the review,
> I do not understand your comments as the make_icudata is before the
> configuration task.
> Could you be more explicit or use an example?
>

I think you need something like

do_make_icudata[deptask] =3D "do_prepare_recipe_sysroot"

Alex

--00000000000006496705d604e454
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Jan 2022 at 16:03, K=C3=B6ry Maincent &lt;<a href=3D"mail=
to:kory.maincent@bootlin.com">kory.maincent@bootlin.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Alexander,<br>
<br>
On Thu, 20 Jan 2022 15:37:26 +0100<br>
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Can we rather make a dependency on the task that prepares the sysroot,=
<br>
&gt; instead of listing the dependencies one by one (with anonymous python =
too!)?<br>
<br>
Thanks for the review,<br>
I do not understand your comments as the make_icudata is before the<br>
configuration task.<br>
Could you be more explicit or use an example?<br></blockquote></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I think you need s=
omething like</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">do_make_icudata[deptask] =3D &quot;do_prepare_recipe_sysroot&quot;<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<b=
r></div></div>

--00000000000006496705d604e454--

