Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.1903.1614539258229790957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UjIao/tw;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id a62so7510545vsa.10
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNUg4+dBpjOtDQV47RhAsKWuFPcigATQkux5HpRqlr0=;
        b=UjIao/twYpIqLopfT0Hs3sueD6DdXsTZGFLY5lDomH8ZxXBqTBC1rqE9pJr2HDcupK
         yJfHqRUAvxAqDrOAaV84AU5ogolp8Dtr4/cqw7OFzX8ZrjldXiOjNjG7iIJPIOIdoRbw
         Zoe0EKEU7HEH+RFpDgTz0PfG8IqdZq5dFQWvdRF6Jwn5OowbqDCZSLpVE8upxli09Xcd
         nhou3Bb8FmhD4Iv+iBFB6o03eIgf9DKeVFFmpOAxagSeJrUmEXjq+qv58SwUIp1W8oFI
         wadOwQ6sP8KBKxTT4eFJ6hg7CWQk5LSGC2BD0/0Xet9I2OU8+MjCRaC+ufdOMTdXAWNj
         gLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNUg4+dBpjOtDQV47RhAsKWuFPcigATQkux5HpRqlr0=;
        b=END73pRh5/9CFd/NPpoWyk6V1qkrwi9mgqRVoAkY5L6zaCYwwNaH9C1t23B8ff1V2p
         tdwJi0CaxIFq9OfgCWEbAoP4pJA/15aRs+uYk5dmrbEmP8f+qEud+BrEfzwvmxOHdvNP
         A40pk3uVvZFU0A9hYOxEPtI3u2RV1+XWN6k+ouqA61VSRh6Vxk5hu2+UlvaURHc4aAsI
         i2d69P9rM+8IVPa2kTMxTw/Is/sJNMadwMyfhtuBpGMx6bJtkF7trmWd49SFhUUZ63Cf
         uZo/Er7M+v4vTDye8D2nZZaZ4rfkK/CIOqthNZw1/08S9POKDb42jCxnrM6N+broqNSX
         7Smg==
X-Gm-Message-State: AOAM531obPC3GElJjicx3PeE8TtMc90P3oqGAmdWzrgpBKIqvHiQiy9X
	ggrjo0w1Krv4XCpzAj1nm34SWPggfYS//TCexEc=
X-Google-Smtp-Source: ABdhPJxO3HLdfSbOWBAPB3xfgUz3ad7ulyjaJqhuG2fD+b07MJt033RozjJjaFBtdb0HNk2t72EcdPEkBSyRae2KcFc=
X-Received: by 2002:a05:6102:154:: with SMTP id a20mr4792841vsr.51.1614539257152;
 Sun, 28 Feb 2021 11:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-8-alex.kanavin@gmail.com> <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
In-Reply-To: <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Feb 2021 20:07:26 +0100
Message-ID: <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6088705bc6a3646"

--000000000000e6088705bc6a3646
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Feb 2021 at 20:04, Khem Raj <raj.khem@gmail.com> wrote:

>
> It seems __WORDISIZE is what is being used here, a portable way would be
>
> #include <limits.h>
> #if (ULONG_MAX == 0xffffffffffffffff)
> 64bit wordlen stuff
> #else
> 32bit stuff
> #endif
>
> if we still want to keep using internal libc internal define __WORDSIZE
> then for musl include sys/user.h headers under bits/ dir are usually not
> portable and not meant for direct includes
>
> #include <features.h>
> #ifdef __GLIBC__
> #include <bits/wordsize.h>
> #endif
> #include <sys/user.h>
>

Can you send a patch upstream for this please? I have filed a ticket which
you can reference:
https://github.com/rpm-software-management/libdnf/issues/1146

Alex

--000000000000e6088705bc6a3646
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, 28 Feb 2021 at 20:04, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
It seems __WORDISIZE is what is being used here, a portable way would be<br=
>
<br>
#include &lt;limits.h&gt;<br>
#if (ULONG_MAX =3D=3D 0xffffffffffffffff)<br>
64bit wordlen stuff<br>
#else<br>
32bit stuff<br>
#endif<br>
<br>
if we still want to keep using internal libc internal define __WORDSIZE<br>
then for musl include sys/user.h headers under bits/ dir are usually not <b=
r>
portable and not meant for direct includes<br>
<br>
#include &lt;features.h&gt;<br>
#ifdef __GLIBC__<br>
#include &lt;bits/wordsize.h&gt;<br>
#endif<br>
#include &lt;sys/user.h&gt;<br></blockquote><div><br></div><div>Can you sen=
d a patch upstream for this please? I have filed a ticket which you can ref=
erence:</div><div><a href=3D"https://github.com/rpm-software-management/lib=
dnf/issues/1146">https://github.com/rpm-software-management/libdnf/issues/1=
146</a></div><div><br></div><div>Alex<br></div></div></div>

--000000000000e6088705bc6a3646--
