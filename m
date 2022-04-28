Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846C6C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 11:33:36 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.8809.1651145615761547588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 04:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GPGk1VF6;
 spf=pass (domain: gmail.com, ip: 209.85.166.181,
 mailfrom: rybczynska@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id i8so1764859ila.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 04:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VnFndEEwkSaUnjciSjlEjXAFOBwjUguCDVDXdHXKJfU=;
        b=GPGk1VF6unBmFpjSr7R0dhOPDoXcCrl/lHicOxC4Z0dTq4IBZyLq4/+eRi5UDVgW7m
         srNW3aYo49+Enh5MciMPQw46bttMXuZBJjtTC4d5+cxdXKsKZQDeBvslMf4SGtIxUEFN
         wqSZCWzXDCdD1ezeCkQbSTsaBHYO7yDl7K/tMlBiBFS1OuV/YrOs0J3UT6S6FdgQpOCE
         hSWjfU+5kx17eKQxmhhoOT8RVGMRnF0t7ndGyCyEy0A0BbgbGn2LlZAz+SWc4INCyCWI
         NYWU7ckJhrffooB515llRI+wykXO45LusMthS07RqmAzPG82KfiM2WYxX0zW6yf7qImC
         vfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VnFndEEwkSaUnjciSjlEjXAFOBwjUguCDVDXdHXKJfU=;
        b=ErBouDxq2ct6ZlnxSZm8WuFcUOnw3EcNSWcugz5tZ8A5C/Ywt9GcoY8EtVJIX+D+Qo
         QhY70lc3HEw6ZYTCmLKhVN6+2d1hnZo23dqVgUOkOHg4D3fZ1bwh6O68m8CbMlpzVSEg
         jhYfluM0zLiKjX4ZJd/Deb31hGFH9p2xvTmS6ZcJbVHkpRjaCkG0bEEhP4aVntBfxu8/
         is6j3a7bCKG1YGkLJvnggNESm/D8Rztw0TE4zB53sAQrdou+qeJgkR+lTMcKAZL8UN+x
         QCyc+UBQ8tX80ILpA9HeEZEBtI10k3WQfrHRyuRAuETIbVJYuJi37eAJbZ7iTwb04r34
         L1AA==
X-Gm-Message-State: AOAM5337D0LdMlNzHTwTxpOZuJVBJ3LS0UNTdTM+DHT8InlSt+FoKV4K
	uPxeSpw7QkdfkExaHOTsMW9HLBQ4jbs/01Jr3zc=
X-Google-Smtp-Source: 
 ABdhPJwEG+3oWnjtgkqwEV0fX55EOGna9QkSE01UQTY2LBw/FtwPZz+7oNJCUVd2No8qTECiBx1QdJXWv/q+2yyCjJg=
X-Received: by 2002:a05:6e02:1746:b0:2cc:d914:594f with SMTP id
 y6-20020a056e02174600b002ccd914594fmr14058139ill.6.1651145615162; Thu, 28 Apr
 2022 04:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220427132228.1179532-1-ross.burton@arm.com>
 <CAApg2=ROu0Vx5qca_QRVxbeB2E6fUFSMz3bi=Cj3QD1neJ6D-Q@mail.gmail.com>
 <8DF2A965-7865-4956-84FB-4060AAEADEA7@arm.com>
In-Reply-To: <8DF2A965-7865-4956-84FB-4060AAEADEA7@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Apr 2022 13:33:23 +0200
Message-ID: 
 <CAApg2=Tm2S90WmkVrkjc2MMwVvBrVHw-TykjJsc-0g75eAVOfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: no need to depend on the fetch task
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="000000000000dd414805ddb54b59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 11:33:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164942

--000000000000dd414805ddb54b59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2022 at 11:17 AM Ross Burton <Ross.Burton@arm.com> wrote:

>
>
> > On 28 Apr 2022, at 09:16, Marta Rybczynska <rybczynska@gmail.com> wrote=
:
> > A side-effect of this change is that we seem to not be downloading the
> NVD database
> > anymore... This is probably not exactly what we want right now.
>
>
> That=E2=80=99s unexpected, as the NVD fetch is in another recipe entirely=
.
>
> Note that the NVD fetch only happens once a day, so it=E2=80=99s possible=
 it just
> executed very fast.
>

This patch is fine. The error I'm seeing is a different one: the condition
of one hour between the
fetches does not always work. Under debug right now, will post a fix when I
have it.

Marta

--000000000000dd414805ddb54b59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 28, 2022 at 11:17 AM Ross=
 Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; On 28 Apr 2022, at 09:16, Marta Rybczynska &lt;<a href=3D"mailto:rybcz=
ynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt; A side-effect of this change is that we seem to not be downloading the=
 NVD database<br>
&gt; anymore... This is probably not exactly what we want right now.<br>
<br>
<br>
That=E2=80=99s unexpected, as the NVD fetch is in another recipe entirely.<=
br>
<br>
Note that the NVD fetch only happens once a day, so it=E2=80=99s possible i=
t just executed very fast.<br></blockquote><div><br></div><div>This patch i=
s fine. The error I&#39;m seeing is a different one: the condition of one h=
our between the</div><div>fetches does not always work. Under debug right n=
ow, <span class=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll=
 0% 0%!important">will</span> post a fix when I have it.</div><div><br></di=
v><div>Marta<br></div></div></div>

--000000000000dd414805ddb54b59--

