Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.3153.1616109593924745375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 16:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGgPe/08;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q3so1089419qkq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JpbO99pNfqVAJgiH2P5bxFgTiunxxO8r+ZVNRYoj7Tg=;
        b=pGgPe/082oGAaaeNOAWYSugU040M6StiO7UAaOOvYgGPe6uep3k3B51DwsnMxrkTdW
         6qXVPqVCENRVIpzwP6tMVaV+fm/B/2hOXB1V83XKqADrIycds6ZnW9Iak2A28ZrLNLY0
         7+qD0EO0J/48it7A4mhw9bOPJspeaNKD3q0m5DBtG8O92wJB/YIHXbw+A0AB7n0eS8Tk
         f9NNEOQq4RwviNnotGhTTdCmDPBkHCpEMcMJ3HGyA5dL+rJzI+qYSxsT+kjFNh802HA/
         7zLTV1QqilSassKDvFcOZgTu/0Ffes/TfdIE/sXgybT0mKL5KC3tdT+Kt08ogrs41v0/
         p/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JpbO99pNfqVAJgiH2P5bxFgTiunxxO8r+ZVNRYoj7Tg=;
        b=cMmVR6zSI20SS8wNXHJ7eX7BhhbK9ORwHKhPcOdJSD42ZzsgznCdloz65WcWFDU6RU
         AzZnTV0y3wDP+byNq6ALtrDQSun+0YdQqewp/uNEDOF+UcyfWqH2rF5a4gbP/9ss7InJ
         y7YrjCov6SCyazkzTbyQFdmZYeo/YsqHNX7xw2uiyvBXvB413Oen+y0ZeTo/OaoPj9pE
         LTHwyixyj26+VfZ0C0Ba6FIBuBhhs7V0NsyqdM+2jNJoP5wJEsyLeCU9eEHSeOGAel3h
         fu48A7HzuWINs4pqxMM7GPigPMbXfmYu3eqPpzegwstAgtQQhqiiP1zsY1NqnVtxinM2
         /iHQ==
X-Gm-Message-State: AOAM5303Mm6lXUYw0yF9NSlGHSN35BP1k4LdqL2HzJvO6/C02W8sOseJ
	E01+tGyPcEGr3dBdhUUzjmBuabnHh+0OQRnOwVQ=
X-Google-Smtp-Source: ABdhPJzzxhWDxN7pJjHJMKfRwQJchhbinp3ia4dqpz5Vv2MoP5LN+Xi3+vhKjFggNbsTSh9zhMp5s8yTFRb2DqJuRlE=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr6875957qka.119.1616109592964;
 Thu, 18 Mar 2021 16:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
In-Reply-To: <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 18 Mar 2021 16:19:27 -0700
Message-ID: <CAMKF1soRpr0h6_q4kF-3tnfYNEUuEvoSMO9hkPYjdD4_tct4uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 2:35 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-03-18 at 06:27 +0000, wangmy@fujitsu.com wrote:
> > > Doesn't that mean we should clarify "BSD" in the LICENSE field then?
> >
> > I use spdx-tool to find out the following licenses. Do I need to clarify them all:
> >
> > BSD
> > BSD-2-Clause
> > BSD-3-Clause
> > BSD-4-Clause
> > SSH-OpenSSH
> > Beerware
> > MIT
> > MIT-style
> > ISC
>
> I found it hard to answer this without knowing what had changed. I went and
> looked at the difference between the license file in 8.4p1 and 8.5p1 and the
> difference is an algorithm was removed in 8.5 and the associated license section
> was dropped. This doesn't change the license situation so LICENSE is unchanged.
>
> We probably do separately need to update LICENSE so show that BSD-2-Clause,
> BSD-3-Clause and BSD-4-Clause are all present.
>

Right. I think we had this not captured in recipe before this,

> Cheers,
>
> Richard
>
>
>
>
>
>
>
>
> 
>
