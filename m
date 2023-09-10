Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D91EEE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 15:54:39 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.38565.1694361276697666496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 08:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r25G3Ztf;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so62037531fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694361275; x=1694966075; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKsgr3gQAgP3Vibjwu9E7I7HSfnP1HqbGtNCydIDCKI=;
        b=r25G3Ztf9acnSDG1b1xroLC+yrtziLVmPfvinwO5z/8gKAkxV0am2ISyFNhtypfel8
         V/znZjufG0zl+nZdUHpHRjwPxe+zH0v9tlT3SVNDI/gPcR02ZqPkoPwQDfMkKyVfpDE2
         rjtoAJNyi0XmkNwe+HogBN/Y5WMwn756Q/cnivq+RpjJyDBFtEZFmUgDXNvecRRidKyG
         QbkUmms+LlorclrUEzMmoo8tHwK5Ucju7RyJtfPRB9DM0VQnIfeu/WhgHi1yoHqDnwjM
         EZ8NbNSBP7O50Bc6dbve8H925nZH+385dX72IAOkWvYtF97AOQCOGddyYF5bGm7KxVPF
         cXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694361275; x=1694966075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKsgr3gQAgP3Vibjwu9E7I7HSfnP1HqbGtNCydIDCKI=;
        b=i/s/NJkBWK46clnCDtj299sNOrhffsffh/uvtC7Gpoh9/TQX/k0X3HfYHcTt6pdNwO
         ObiavQIjnPus3PtRR4gr0eL4FwL1kFdA5K+J1AT8q5ZPnTlUkydui0hiDafNMUN2seda
         8GWEdVnpSFLx9pM7K3sqpq1UhJlwuQ2rmG/hRE3c38ucwqVUQN6yQl383harP3lmxPVS
         Ns4joY6FSJRXMQzlwJbPW61ilGWSaLIUdOPgEOE0I7syuevsmetVRFKrBRdYWQ1DOVdG
         A9WFEkeIiaafmbaXU61s2ZBZA57/Nb2EcbExSJTpDOkr//d/AqpOO/qIXAPfyxSfbSsm
         pZLA==
X-Gm-Message-State: AOJu0YzvKVfSo7d1Lqkfm3YrCJLcwOD+76B1zEXbgRI3V/szN+eVvHMY
	Ls5GqmpI1qXf67UYH7xZJ2Pdbc+VSk8MzxMuNJY=
X-Google-Smtp-Source: AGHT+IEZedE1SY/Cf09LpK85stHEVNmqdIKXSKa26AKxv/ZFT8pY6vgwFDVr3HYV2foi2C7gUgPE7jN/XAz0tSfI+xA=
X-Received: by 2002:a05:651c:d0:b0:2b6:cb55:72bc with SMTP id
 16-20020a05651c00d000b002b6cb5572bcmr5856716ljr.1.1694361274370; Sun, 10 Sep
 2023 08:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230910111820.F2D05106AA0@builder.sakoman.com> <CAMKF1sp14CrQ=0CntN6wJ6Va+rCBtVY8Je0AQAx8cxQwS1Yg7w@mail.gmail.com>
In-Reply-To: <CAMKF1sp14CrQ=0CntN6wJ6Va+rCBtVY8Je0AQAx8cxQwS1Yg7w@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Sun, 10 Sep 2023 17:54:22 +0200
Message-ID: <CAApg2=TLfbpr_kdms0ONi5Ji8BGm+2hS4xXx=C-5eUbqJxryCw@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 10 Sep 2023
 01:00:01 AM HST
To: Khem Raj <raj.khem@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e14e360605033957"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 15:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187457

--000000000000e14e360605033957
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Sept 2023, 17:14 Khem Raj, <raj.khem@gmail.com> wrote:

> On Sun, Sep 10, 2023 at 4:18=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > Branch: master
> >
> > New this week: 10 CVEs
> > CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563 *
> > CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637 *
>
> These two are addressed in the 5.69 release which is already in
> master. So I wonder how the CVE scanner missed it.


The NVD entry does not include any version numbers, so all bluez versions
are matched as vulnerable. Have you mailed them? Can do it if you haven't.

Kind regards,
Marta

--000000000000e14e360605033957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, 10 Sept 2023, 17:14 Khem Raj, &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Sun, Sep 10, 2023 at 4:18=E2=80=AFAM Steve Sako=
man &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noref=
errer">steve@sakoman.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Branch: master<br>
&gt;<br>
&gt; New this week: 10 CVEs<br>
&gt; CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-3563</a> *<br>
&gt; CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-3637</a> *<br>
<br>
These two are addressed in the 5.69 release which is already in<br>
master. So I wonder how the CVE scanner missed it.</blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">The NVD entry does not includ=
e any version numbers, so all bluez versions are matched as vulnerable. Hav=
e you mailed them? Can do it if you haven&#39;t.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Kind regards,</div><div dir=3D"auto">Marta</div><d=
iv dir=3D"auto"></div></div>

--000000000000e14e360605033957--

