Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B7EC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 23:58:48 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.4813.1642723127054281918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LoTp2kMs;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id 2so13905232uax.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tln1H0XWa+OGvg4o17c6JhTcMize4jYNKaEKM7U1VpQ=;
        b=LoTp2kMsUA1J1+XNBL+X6lvNCoxXjlEydBGl3uViWunUhEqwiBj335LrV2+Jsj3bvG
         N5KFcw48Bu0gWLXI11wooxTH3jmng5R3/Wxd9h3ys44VooVJDIeHLMeuLRso6b1yVIH3
         kGkU17rdX+pdwzfpPzFeTVQDA3jWkKbz/CeibPzBcMFOm4RvJ4E6MNbjOcE94BWou6lB
         1miJu/Qz7g0VgoqsGDUMf4QUCBncpKC/FDm3qpoL2ZkJKcMD0XHbmwnEi9gAzjFzkPH8
         BRkFcVtvYxBkrdeCbG1HYK6KXFCp1Qdx18EuaggpfLLNrQDWKK1ln9lM2kjWRuwqYhQK
         wNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tln1H0XWa+OGvg4o17c6JhTcMize4jYNKaEKM7U1VpQ=;
        b=sEwmXh32j0w48QRg6tCNkWnue0zqvlSmSnAzJIxNE9zawwTKFzQVhO3j3XTTxhjdDX
         S1M9A6ozEF627jSbNOL6n+nmkvzntEf6IuBZU99Hk8o/YY3hcsahuT5eBat5ca0nifyD
         G85P9teCRuD1bWw+dwpGPd0eHXqhjshVU8ODsZHtsrcFEB+R9BU//l5RiRT9s0RNL/xS
         o7IR6g3EVoM93skDR+tDR04FSzSOrtSd/mXt+TNQpeHJJ8ObyJ9l1zGZQoWk0erx51OY
         ILUTyRdQycKibBi77Cv9xOOvk0UCzLQ9ySQUS5pFe1hcBUT7yq3qNAbVqlwdGZJM5h76
         8ayw==
X-Gm-Message-State: AOAM530/VbwPyqRlGAHOwK/1gJduy5hQ/yda9edaPJD9lwvn+xzovr9q
	ZZmkBOE5xKn72GG6mKzS3bzQuMCZbbJmCQEkaeQ=
X-Google-Smtp-Source: 
 ABdhPJwmoUzHLtrl5kJGGxAPzy2s+B2FpzaoVty6cALEniugIxL4zFujgkeHr3NjBn5Xp7OWPvGDu3WbVyyDDi544m4=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr767567uai.89.1642723126209;
 Thu, 20 Jan 2022 15:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20220120222256.1697929-1-alex@linutronix.de>
 <d7ec24b683844c38a85c14ed2d0595390ded0ee0.camel@linuxfoundation.org>
In-Reply-To: 
 <d7ec24b683844c38a85c14ed2d0595390ded0ee0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 00:58:35 +0100
Message-ID: 
 <CANNYZj898TyMAue8qQL47eS=9VkXYEEuTZyT1Cu9KvhorDNmpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ruby: disable libruby.so
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000066eef505d60c48d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 23:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160807

--00000000000066eef505d60c48d9
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jan 2022 at 23:55, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Disabling shared libraries because there is a makefile bug doesn't seem
> like the
> right solution :(.
>
> Better might be disabling parallelism in make install. It raises questions
> about
> why it is linking/relinking a library in the install step too of course...
>

It's doing this with ruby executable too; seems like make install
regenerates something that triggers the relink:

| generating enc.mk

I can try to dig deeper, but upstream isn't even enabling the shared
library by default, so they're probably oblivious to the whole thing
:-/

Alex

--00000000000066eef505d60c48d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 20 Jan 2022 at 23:55, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Disabling shared libraries because there is a makefile bug doesn&#39;t seem=
 like the<br>
right solution :(.=C2=A0<br>
<br>
Better might be disabling parallelism in make install. It raises questions =
about<br>
why it is linking/relinking a library in the install step too of course...<=
br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">It&#39;s doing this with ruby executable too; seems like make in=
stall regenerates something that triggers the relink:</div><div class=3D"gm=
ail_quote"><pre class=3D"gmail-row gmail-log" style=3D"height:888.317px;ove=
rflow-y:auto;display:block"><span class=3D"gmail-ng-scope"><div style=3D"he=
ight:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding"><span=
 class=3D"gmail-">| generating <a href=3D"http://enc.mk">enc.mk</a></span><=
/span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-l=
og_o gmail-ng-binding"><span class=3D"gmail-"><br></span></span></div><div =
style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bin=
ding"><span class=3D"gmail-"><font face=3D"arial,sans-serif">I can try to d=
ig deeper, but upstream isn&#39;t even enabling the shared library by defau=
lt, so they&#39;re probably oblivious to the whole thing :-/</font></span><=
/span></div><div style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-l=
og_o gmail-ng-binding"><span class=3D"gmail-"><br></span></span></div><div =
style=3D"height:18px"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-bin=
ding"><span class=3D"gmail-"><font face=3D"arial,sans-serif">Alex</font><br=
></span></span></div></span></pre></div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote"><br></div></div>

--00000000000066eef505d60c48d9--

