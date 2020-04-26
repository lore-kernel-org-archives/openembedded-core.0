Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.2883.1587925793078128287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 11:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LgXoelPU;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id g35so3413050uad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1X0b9bJcLIlEVqFMzI/CHL7jFKZJfqNuFILz6/uaPlE=;
        b=LgXoelPUDjQzmizF56b66q2k+VONDpQiHZdFnoac7XkLUPoxC2J+cfx0T3P39LWc3n
         /3Wcmi0ebS+oNBhqpObsDTH5lz2MCVxggiFMAwZV5a+bk3gov75UDXwA1UbHOz9JUBq0
         3QINMMGMLjTN8YQ5XBf5Tw/vEoDmiOtr4FN6yoJ9x75IShe9oAItTxGVRDkIolE8Hv/+
         KV1BiYQB/pRLd86o70l6YpZaNpScG9m00XpGu/XarxNLfTP9+8g+aXd+plqxydaOZJFS
         vTUGZp+2kAwwEmNQ5+tjbMCNPMb4iyDHL/nYkuvZTneS73gcSiFI6WI1qgbt5mQabUmf
         8fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1X0b9bJcLIlEVqFMzI/CHL7jFKZJfqNuFILz6/uaPlE=;
        b=fnAFFXhGtS5I14ZBuRytCj8S/n2+RiZIG18yh5gztrB1B/eLmC/h7doeGK8WdUbL/4
         1cn0IpiZNY1bJiZgIphua30Lff/Z9kfOEpgodqaOOOb6yyhPiqGVHDDLcGb/Yjzwt70i
         RTwKOjjVgbGd9W3LAPgz+KNZxy+I6ewuq5Zjsw9RCObvjpMv39LhgfOuj0DuaXMhkDwY
         4m7rCSXO2HOGydc6OfKVG8NVMg/TnmHFp27D4saD0ElJIYPw3UO+puVjXZPRty4XyEmO
         jC3UtS0QMXMoxPt9GomQp6w6ckFg6S4MUU4LzLHAIOmGl1fveNjhe7O1bPeZgFWe3UrM
         M1Ng==
X-Gm-Message-State: AGi0PuauB889fFEVSm0J4urJCq1PHPyzHy3HKkQBx9Sg4jesaHxgzwZ9
	lKdq+pj+pQZ/XjmhSi/N3rYsbDubJJ4cOY3VKL0=
X-Google-Smtp-Source: APiQypJ4VsNGHHDEGG12hOG1QNh3mzUUq0S0qBMPAIgGGsnDLdfWPaKHzeqoXdSdmn7AOufp0Nw1ElgymqYQeHI7GDc=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr14626391vsp.83.1587925792187;
 Sun, 26 Apr 2020 11:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200425172814.27370-1-alex.kanavin@gmail.com> <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
In-Reply-To: <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 26 Apr 2020 20:29:40 +0200
Message-ID: <CANNYZj-M29suvyhMuuiUcv3aSKQOKtXM50uYqvXgAb6u7AAeYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c5e96305a435c842"

--000000000000c5e96305a435c842
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Apr 2020 at 19:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> There were some failures from this series:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/890
>
> It may be easiest for you to have a look through that build result as I
> think all the failures are from your patches as that is the main thing
> in -next! :)
>

Thanks Richard, I'll work through these one by one. Hopefully the amount of
actual issues is a lot less than the amount of red in that build.

Alex

--000000000000c5e96305a435c842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 26 Apr 2020 at 19:35, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
There were some failures from this series:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/890" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/83/builds/890</a><br>
<br>
It may be easiest for you to have a look through that build result as I<br>
think all the failures are from your patches as that is the main thing<br>
in -next! :)<br></blockquote><div><br></div><div>Thanks Richard, I&#39;ll w=
ork through these one by one. Hopefully the amount of actual issues is a lo=
t less than the amount of red in that build.</div><div><br></div><div>Alex<=
br></div></div></div>

--000000000000c5e96305a435c842--
