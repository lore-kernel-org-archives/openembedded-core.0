Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.2147.1620244191875740436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CufjnL/a;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id r18so1706125vso.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ErO62Rjje0Ud2V9gE6SLKEyUs9iy9EcltHIUWVRwog4=;
        b=CufjnL/a0dvgZiMXHQuiH33puFYG83znzaiB36VgWvxrrEAFyWVGUgKt7GURgyPqj2
         eDNh4oOKhV67QI0hyESuvOdiNuWn1UwLAKDlZ+I0/KhfWP5zgeAjHKJlD+oe4AktQ9JI
         VrevfiUTqJr86xBXichUxuFpbY8SxyX0AdkZWogzRZl6uBWAHmsamF/7E5CxEbPwHp9A
         5OB71K+mbAHF4XU4u249x9uSn62ySfpfb6Ohi8JYNfPH6+n7fYdn9fu3bAlJudVq28DC
         zYVWZocCgF7aqGCRS8xzVTDImBB5+IJzQFwi80XGCQxC4NrtUPAoC7WRVFDzWcj2PItL
         z5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ErO62Rjje0Ud2V9gE6SLKEyUs9iy9EcltHIUWVRwog4=;
        b=sFBuV68WQDqTKBrLC66Xz75txlFkCPXWf2vLky7oK9yILdpmMjrDaCDyC5Vf8JXCzu
         LCCpyhGHjdJWjLgvMUxq61j2y46scwHSZBKHY2d31n6zST3YQv4FTloREWpTLPnCqFgK
         89eCXmmOqzpuWPrW9kE9r5oKXt4PZoOK0lp+YOxz2UMl4WHVFLp4yj8WUIVMENg0+hkg
         wZ5enHvlWH4z5F+sI9qpziPDDDbWjmyHOv8RjSovcDiLtQYliXiJdyDc6vVtH8vBT9gf
         RmwjokjLmXSacnxDwx71bKrcfgFYzxfo7Xby3mu1YNw3hqTZEE7jLBDbkJKMzi1I+Twn
         jmEg==
X-Gm-Message-State: AOAM5301tdnl4lA1lIyERL/V93kU2Ewn5xnDpfUfrwBHCeJiHk0dXc6x
	iJ8nfYag8oAdyNqg/QPuGuqQRp4Y3rfWbEI0BoY=
X-Google-Smtp-Source: ABdhPJwERhBF62E/z1FoS1OCfxZNVU+xq8rJZZFtA9iVgAOq2O5Tv0yhrgzDxMWKUC+O7CicN/QoZrqd4EAUbd/kBvY=
X-Received: by 2002:a67:1447:: with SMTP id 68mr484635vsu.20.1620244191073;
 Wed, 05 May 2021 12:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com> <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com>
In-Reply-To: <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 21:49:39 +0200
Message-ID: <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000075591005c19a7f11"

--00000000000075591005c19a7f11
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:

> > Sorry, no. If I do not understand what it does, the version update is
> > incompatible with it,
> > and there is no trouble detected by the AB from dropping it, then it has
> > to go.
>
> OK thats fair, no one knows everything so drop this patch from your v2
> series and let someone else handle it.
>

I assure you, nobody else will do it. I regularly drop poorly written
things that are a maintenance headache, if you have specific objections or
use cases or issue reproducers, please state them, but saying 'don't remove
because it might be useful to somebody, somewhere' is far too vague.

Alex

--00000000000075591005c19a7f11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 21:43, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; Sorry, no. If I do not understand what i=
t does, the version update is <br>
&gt; incompatible with it,<br>
&gt; and there is no trouble detected by the AB from dropping it, then it h=
as <br>
&gt; to go.<br>
<br>
OK thats fair, no one knows everything so drop this patch from your v2 <br>
series and let someone else handle it.<br></blockquote><div><br></div><div>=
I assure you, nobody else will do it. I regularly drop poorly written thing=
s that are a maintenance headache, if you have specific objections or use c=
ases or issue reproducers, please state them, but saying &#39;don&#39;t rem=
ove because it might be useful to somebody, somewhere&#39; is far too vague=
.</div><div><br></div><div>Alex<br></div></div></div>

--00000000000075591005c19a7f11--
