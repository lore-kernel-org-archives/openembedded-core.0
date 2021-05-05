Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.1516.1620241911068629335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ntEx5LNM;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b4so1645235vst.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UhiUFeRSnGl8vgk+zqB+saA0oJWS15L6Fn5KpUKyItU=;
        b=ntEx5LNM1TbXj/woeUNPAy9+gFy4l0BeYCDNLH/UxYNYOuG1rOBktLGwJ18IWl46bL
         1Sppiv19ZUniORJ9sH/MTAeIaSsxRWmVNVLhkYDw8w5V8+p3QS04nF8yIHHcxpaslu3E
         7JYyTHbV/pP/2B7Gn8+6a2vQsLM/IJmp5rpM0X3JcKqr0oUOG3fqPZeTNV9EPPpdd1c8
         LEcD/rRhuU1Z/2Kx6b/sFsiwWZ2FpR+iFwgnZDCOci5YWsH367LsmjYteIXwXZkg7jd6
         D7h4VO4kLuUfQS83OZ+czB+xlKdaMbuWW8UxuzVdn+K425G2JpoVbQQYi3WpfwnoorL/
         7IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhiUFeRSnGl8vgk+zqB+saA0oJWS15L6Fn5KpUKyItU=;
        b=aqIYVUJLcn8slAjFskXV6cmWA+WsFMzJuSRzoETVMuyad1UbVuTbaWLNSwYgOfmmec
         4rOSuHPO59Yv/j1p+IEU3Slphmny1iELAp2yt2g1J3zLwxsa1f02oI7jKTUgxnwPbbLe
         IIINX6CfCQWC4gaCH/bUX+nG5WlSTLfNxdawtAlpbsEDKSI1xVn0Oexd4/SjiNfLDf6j
         KxtJ9OblaFsYbpaKE9bhwFe4xnVqAoQ0BxzlSvVjN19pwcbjWeiDSTD02WH+XWYibyF5
         j9K9MXZa10HtLvavC5kZXAoJD8umiEiLdjp3i1THCvYhAd4X4CZ8WVzVdHXbTn41UPm5
         TuQg==
X-Gm-Message-State: AOAM532rZ4p4kD3WgJDXS0bSvsJc9iC5B/9EZpNc+rC+B/N9g3V+jpKT
	2VbCfJJQ3lTZEqp6CHR0PdhNGmh6T/IcSHWNmWY=
X-Google-Smtp-Source: ABdhPJyNmo4EjuISdpE6f6XeKJaNVWvG/hiusVyNJ6i3qgVJD78DWYONHNKleOyCWnGaoUZRXZL9w9snMZG/Q3Y1WoA=
X-Received: by 2002:a67:1447:: with SMTP id 68mr359035vsu.20.1620241910289;
 Wed, 05 May 2021 12:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com> <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
 <CANNYZj8VfB5sO4O3tjpUDHseBTMwYG-kRGwVUERmAjJSH61=oA@mail.gmail.com> <AM9PR09MB464224482626504F72484641A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB464224482626504F72484641A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 21:11:38 +0200
Message-ID: <CANNYZj9M5Gy34YJacwpYLvbyBREpAdPT5_uszJs5p=LnPXyLHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008358f105c199f7c5"

--0000000000008358f105c199f7c5
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 21:06, Konrad Weihmann <kweihmann@outlook.com> wrote:

> On 05.05.21 21:03, Alexander Kanavin wrote:
> > The repo is here:
> > https://github.com/leohemsted/smartypants.py
> > <https://github.com/leohemsted/smartypants.py>
> >
> > I opened an issue:
> > https://github.com/mintchaos/typogrify/issues/56
> > <https://github.com/mintchaos/typogrify/issues/56>
>
> Thanks for that one - but if this project is still alive (just relocated
> from bitbucket to GH), wouldn't it make more sense to introduce the
> 2.0.1 version pulled via git instead of the pretty outdated 2.0.0 from
> pypi?
>

I don't think it's alive, open issues and PRs all dead, last commit in 2017
shortly after 2.0.1 release.

If it becomes alive again, it'll almost certainly be a fork in another
location,
and pypi would then automatically take care of it for us. Besides pypi
recipes are
much easier to write, and this is a very marginal module :)

Alex

--0000000000008358f105c199f7c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 21:06, Konrad Weihmann &lt;<a href=3D"mailto:k=
weihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 05.05.21 21:03, Alexander Kan=
avin wrote:<br>
&gt; The repo is here:<br>
&gt; <a href=3D"https://github.com/leohemsted/smartypants.py" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/leohemsted/smartypants.py</a> <b=
r>
&gt; &lt;<a href=3D"https://github.com/leohemsted/smartypants.py" rel=3D"no=
referrer" target=3D"_blank">https://github.com/leohemsted/smartypants.py</a=
>&gt;<br>
&gt; <br>
&gt; I opened an issue:<br>
&gt; <a href=3D"https://github.com/mintchaos/typogrify/issues/56" rel=3D"no=
referrer" target=3D"_blank">https://github.com/mintchaos/typogrify/issues/5=
6</a> <br>
&gt; &lt;<a href=3D"https://github.com/mintchaos/typogrify/issues/56" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mintchaos/typogrify/is=
sues/56</a>&gt;<br>
<br>
Thanks for that one - but if this project is still alive (just relocated <b=
r>
from bitbucket to GH), wouldn&#39;t it make more sense to introduce the <br=
>
2.0.1 version pulled via git instead of the pretty outdated 2.0.0 from pypi=
?<br></blockquote><div><br></div><div>I don&#39;t think it&#39;s alive, ope=
n issues and PRs all dead, last commit in 2017 shortly after 2.0.1 release.=
 <br></div><div><br></div><div>If it becomes alive again, it&#39;ll almost =
certainly be a fork in another location,</div><div>and pypi would then auto=
matically take care of it for us. Besides pypi recipes are <br></div><div>m=
uch easier to write, and this is a very marginal module :)</div><div><br></=
div><div>Alex<br></div></div></div>

--0000000000008358f105c199f7c5--
