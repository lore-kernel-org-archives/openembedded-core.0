Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.572.1590082645363951374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 10:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sbWhUhaA;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id f13so6612913edr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2LK92I+L7oYEfTOdp/e+zgnSj4zk2h7Sg4blmz7/1ZQ=;
        b=sbWhUhaAsqfT7J/ghd82/Ylgv0ZivOW3FFqTw52aXA75VIqj/sjVQqAwu0TBMPZqtA
         fvEc2FEM1IG/0zmbIZUFUXU2OkUa1VQWBK8YV9M2PLjVi8aTraQeSG2zqwViV4d5S+b+
         fprqnLxh5zG5He//Keaai23Kz+EZ3VSK5Je6C21C6+UQsvSCUonnqmJiDbUKnmbTmqfP
         dekE3iTN6wJ9WrGSbH31XgjJeZS8ai9/JzuVInnfR1PABZC0+/o2DQmFAq39tNS9mpEh
         57089y1PJFgtym8WxJJvKTeRxsYPpko6o6BBQKDERBDovVMp6RAdhnt7FFBw8VEu5tvB
         2nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2LK92I+L7oYEfTOdp/e+zgnSj4zk2h7Sg4blmz7/1ZQ=;
        b=EQPNrtQUP6HAprJoJEDCs/Bg8HnzyPIC4ZVNboVAh7b+ekkFas6kbl0rOmh38x2Rjo
         h4u7jBYiOftrOMtNWv5/P/37uyTBw95ES+NeVyZX2SbTUFjVWoVOBiYxwrSbsvu1yz5Y
         tiJSZh8JhByDwGgENHJZfT7kDyXklGnRQ7Pt+xJQt+gy7x6mAmrMQeMIo8f0tLwDdhRC
         cFHB29BW4frzoeHj6NmuRQcwf4+n+qVie9AFYZsDMJjWpBNoHWGIwd+E5TsHMrJYHB9c
         AkzZr8wU8NEgQtivIKtW+IDg6V1RYrypijDx29FtBmxV/cjb4FDkOAdpc+ZMNJLubZ/h
         Mw9g==
X-Gm-Message-State: AOAM532UvPWO3hKWo5R47kdebGymNJ7jSF6KfpMvTP/a7sYb/JEtjCF/
	0ldFOIiygRTh9bgNeSztE61eH7JEV5+kst3e1OU=
X-Google-Smtp-Source: ABdhPJzKNXoDmgF8XTul1vTDtI7S0/KGP2667knrOVthptmyOljMrDlwXXdYezjUmi2xEaJ5VZ+deO7tObQbcgXOit0=
X-Received: by 2002:a05:6402:357:: with SMTP id r23mr8467499edw.230.1590082643886;
 Thu, 21 May 2020 10:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200521161543.3273063-1-raj.khem@gmail.com> <20200521161543.3273063-8-raj.khem@gmail.com>
In-Reply-To: <20200521161543.3273063-8-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 21 May 2020 19:37:12 +0200
Message-ID: <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000027080e05a62bf713"

--00000000000027080e05a62bf713
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 6:16 PM Khem Raj <raj.khem@gmail.com> wrote:

> Now that they uses -mcpu, its better to have tune specific build
> directories, since aarch64 wont be appropriate any longer
>

I agree with Steve that this is a bit invasive for stable branch, but on
the other hand it's long overdue and if we don't improve it in LTS branch
then many people will need to carry local work arounds for multi-machine
builds. +1 from me.

Once the LAYERVERSION_core is bumped because of those python modules, then
BSPs will also be able to depend on newer version of oe-core when they
start using one of new tune files.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--00000000000027080e05a62bf713
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 21, 2020 at 6:16 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Now that they uses -mcpu, its better to have tune specific buil=
d<br>
directories, since aarch64 wont be appropriate any longer<br></blockquote><=
div><br></div><div>I agree with Steve that this is a bit invasive for stabl=
e branch, but on the other hand it&#39;s long overdue and if we don&#39;t i=
mprove it in LTS branch then many people will need to carry local work arou=
nds for multi-machine builds.=C2=A0+1 from me.</div><div><br></div><div>Onc=
e the=C2=A0LAYERVERSION_core is bumped because of those python modules, the=
n BSPs will also be able to depend on newer version of oe-core when they st=
art using one of new tune files.</div><div><br></div><div>Acked-by:=C2=A0Ma=
rtin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail=
.com</a>&gt;</div></div></div>

--00000000000027080e05a62bf713--
