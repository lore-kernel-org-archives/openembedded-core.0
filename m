Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.11165.1614599635231505388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 03:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jebhw5m8;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b6so8452167vsf.8
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 03:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NqybZYIzayi0VoDQmh5zEAV9Ma5Cde/YsrBq/6tl1LY=;
        b=Jebhw5m8sZziejuQ3o+Br1h89cBlRtioJrukr1F4QfqbnjP4t8xrTFg9WbA/sUUbN9
         u9SOZSDudS3WPCsRV5QfJWH17/oua/kXcQA2htNTCd9OY0psBHV+KVzrYK0Y+AAZfQXT
         61pomgvrg34o0lt7OtTcK+SKDR7bWDt5fEj0UZagLKcyAthjmrwCR7+52KEsk2EPAuje
         OP5gzG6/v7uRs0QERgZjGh0pxLiuWUn5qTwpLSkGnlXaYKkdT/Sr1xxQfmXseZO0rQh8
         uuuDbohelS9867bPVAbWywv9w7cA9PrZsmXRfjleEnb/UXwMfEwhEkaLD3dxQK5ai0Z9
         Ec5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqybZYIzayi0VoDQmh5zEAV9Ma5Cde/YsrBq/6tl1LY=;
        b=ItY1McSlZbtllPUEwAU/RAaizjFZgbaw1481UR7x9eC+W82a6kkr3/nUu+AArBJ6pQ
         awLlih/C51Ek/x9nw4cgD8K283Zg8dWR5XCdPZ9CHLDS19xIaKWHo8E7N5snnj3HMvqR
         TX7QkanuLvmQnmwiaDWjA7jiWGA3KNzhv9rjdtXrgXlTDTwsBWaXKLe8v/iO+YkzHaZj
         cnpInQU57Q8NLROkMuOhgdEwwmkbJxUzaSG5IvUrBHd+0i15HvlJXAfyPV82rUoWOur6
         v7lO0T0QwdGsSvEdJ8AxkkFuWBFo+Lj2/2cLozVYh8/7nkd10wJE86QvmghM6lRMVFAr
         riLQ==
X-Gm-Message-State: AOAM533S4z+b6/GLQerEBgCwvAjH2nNPzrPymE55fMmlUmBLou2tOPR0
	UN0lVJboCDfI/PcbmfgWxXIcb74rg/l1v5Yf/OQ=
X-Google-Smtp-Source: ABdhPJwQzbYR4SJkJbULUGd4jjJsiXD2ilax6cKkRjD5wwlgyA0iwAKghAZCDcBRKofBHjnpW2P4aIIv6txDowOW3GA=
X-Received: by 2002:a05:6102:902:: with SMTP id x2mr2458876vsh.31.1614599634321;
 Mon, 01 Mar 2021 03:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-8-alex.kanavin@gmail.com> <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
 <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com> <82beb9df-56ea-3081-b502-4fce8a65f4d4@gmail.com>
In-Reply-To: <82beb9df-56ea-3081-b502-4fce8a65f4d4@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Mar 2021 12:53:43 +0100
Message-ID: <CANNYZj_88i2diRoHSTFpiEVswR-diK3Cuu6c2Nx9SJkovn=MdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a8875d05bc7845d1"

--000000000000a8875d05bc7845d1
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 20:30, Khem Raj <raj.khem@gmail.com> wrote:

> > Can you send a patch upstream for this please? I have filed a ticket
> > which you can reference:
> > https://github.com/rpm-software-management/libdnf/issues/1146
> > <https://github.com/rpm-software-management/libdnf/issues/1146>
>
> This is a review so please fix it as suggested in OE atleast since you
> will have test setups I do not have rpm/dnf setups
>

Any fix we do needs to be upstreamable, so can you please write a comment
to the upstream ticket?
They're too telling me I need to send them a patch, and I don't want to
send something I don't really understand.
https://github.com/rpm-software-management/libdnf/issues/1146

Testing is easy: build libdnf with TCLIBC=musl.

Alex

--000000000000a8875d05bc7845d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 20:30, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; Can you send a patch upstream for thi=
s please? I have filed a ticket <br>
&gt; which you can reference:<br>
&gt; <a href=3D"https://github.com/rpm-software-management/libdnf/issues/11=
46" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-software-ma=
nagement/libdnf/issues/1146</a> <br>
&gt; &lt;<a href=3D"https://github.com/rpm-software-management/libdnf/issue=
s/1146" rel=3D"noreferrer" target=3D"_blank">https://github.com/rpm-softwar=
e-management/libdnf/issues/1146</a>&gt;<br>
<br>
This is a review so please fix it as suggested in OE atleast since you <br>
will have test setups I do not have rpm/dnf setups<br></blockquote><div><br=
></div><div>Any fix we do needs to be upstreamable, so can you please write=
 a comment to the upstream ticket?</div><div>They&#39;re too telling me I n=
eed to send them a patch, and I don&#39;t want to send something I don&#39;=
t really understand.<br></div><div><a href=3D"https://github.com/rpm-softwa=
re-management/libdnf/issues/1146">https://github.com/rpm-software-managemen=
t/libdnf/issues/1146</a></div><div><br></div><div>Testing is easy: build li=
bdnf with TCLIBC=3Dmusl.</div><div><br></div><div>Alex<br> </div></div></di=
v>

--000000000000a8875d05bc7845d1--
