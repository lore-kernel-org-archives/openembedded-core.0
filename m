Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.17554.1631462707988292692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 09:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LYcONyZF;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.43, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f43.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so5155486wmq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfpntUG45cjRQEH2E8er5GXkPQqM1zMM2GB2hkmKfFA=;
        b=LYcONyZF84jY85YC9IaVZmjZ5/z513TPw8Ut8MxfkZu7ogDIJ0/xvm0zrETbTtXFMr
         OiIDl96Ol96SxsFa0VKqMaBFaxlFsxMNM9FT8k5damqNj86anP7/7qDD3xD7pgZOLmT3
         DoUOEmekGEqW881c4bF+rw6YI+XEA9CbAJWl+/Rnda/IWjZ+qUbFxy9QdwGpe+2V7oZh
         xkiVM4qgpA4Kt4bWmengoBbRT4ns0YjWgxZX3Qz3fASFrxlJHXPmY2VTs1h8OjfSz9jR
         GaEwmnxrTDmkdSNDotieIoiNdUYtjc3N779i+xT5Y8sWmqk9J02Z/sBR1ehtCpwI1JcM
         akfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfpntUG45cjRQEH2E8er5GXkPQqM1zMM2GB2hkmKfFA=;
        b=ZjN5pg2oVxoqJFy0cwAJi3bnjbg93fQ/62fiTTUZKIhMoVy3GTcomWyD2J8b8JOOgf
         yraSZKvRRzlgG43/E/zZIE6rOgDc1n4Ik8BMQ6Z7D9rcBI0DgSrJO5DKIo9OGoM32K+e
         vbcQ18LOGuf3V48qamsyVZp3w1fd7qCLxq2Wpk9cBzcnrxmj1nxW9KG3o9WUxaKa/OSl
         ClrxxiqpF9Yr/DbDZOLbXK8rbgd/mR/RZksSdleGrhgplezypizgc2eLixlYVhJToMp/
         1ngKohJn9LlYCdlVR6i8Z5AIjQdojaFJ0pqDFyXdag6GosLCGJqH6uUC0YCdGEl4+LI4
         y5ng==
X-Gm-Message-State: AOAM532LlC78J2xz6qbA3g11zuZwBB5/r7tkN/iwHp52Sb6UgLnaqJns
	wAmcBce3LiPausmyr8hNNlOWFwd3JbPrVBO0vE5zEA==
X-Google-Smtp-Source: ABdhPJwo4uyCSs4NO1XQAo0qUWrVKYPPBNBo9BYWxmh+oJ29XiN5oHpIVf3snsU5pkDevBydgwfJ94miXOxkZPQnREA=
X-Received: by 2002:a05:600c:acd:: with SMTP id c13mr7105460wmr.28.1631462706451;
 Sun, 12 Sep 2021 09:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com> <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
In-Reply-To: <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 12 Sep 2021 06:04:54 -1000
Message-ID: <CAOSpxdZG9Uh6G4+9f3gR6AGH=OfV4rA04xhLuo+h1-7GtfNyEg@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000152f4d05cbce838e"

--000000000000152f4d05cbce838e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 12, 2021, 5:57 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
> > Branch: hardknott
> >
> > New this week: 0 CVEs
> >
> > Removed this week: 2 CVEs
> > CVE-2020-27748: xdg-utils
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> > CVE-2021-38185: cpio
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
>
> I'm not sure I believe these numbers as tar CVEs which showed up for
> dunfell and
> master don't show up here. Why? :/
>

Don't know! Will investigate tomorrow.

Steve


> Cheers,
>
> Richard
>
>

--000000000000152f4d05cbce838e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Sep 12, 2021, 5:57 AM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 202=
1-09-12 at 05:01 -1000, Steve Sakoman wrote:<br>
&gt; Branch: hardknott<br>
&gt; <br>
&gt; New this week: 0 CVEs<br>
&gt; <br>
&gt; Removed this week: 2 CVEs<br>
&gt; CVE-2020-27748: xdg-utils <a href=3D"https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2020-27748" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27748</a=
> *<br>
&gt; CVE-2021-38185: cpio <a href=3D"https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2021-38185" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-38185</a> *<b=
r>
<br>
I&#39;m not sure I believe these numbers as tar CVEs which showed up for du=
nfell and<br>
master don&#39;t show up here. Why? :/<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Don&#39;t know! Will investigate tomo=
rrow.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000152f4d05cbce838e--
