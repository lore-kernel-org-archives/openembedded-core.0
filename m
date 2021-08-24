Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.36356.1629790999255015201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 00:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eTzXfJKb;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id n12so30162869edx.8
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjLdaPSni2tdPXbFk1s1HhcetOjmHDpkvWtAlz6y/RA=;
        b=eTzXfJKbX/KlA0tG8MJVBPJuslXX7dkcxeyhO5ce7EMbDTQDmEuoHKlPuNIlrk37Ec
         S6blGVldYvsHS9WToUPKbHteRmLYiiNRXLlLHTcNXUa32xrSAiecKeEU98j1wpVSOS+s
         CdH4YLVqbIoWx+O8UE/NfCWDX1gSRl2IPosMdIFRdehwwxg/c2Zb7FDn501vznO24taw
         AyNjZazattcv/IFayzHWmD6s7AE1UMLSK0vxGvB1ycSdiT0CVFBeLBF4sVjpx6xdaet2
         tyILta/bte6xBRRVnfYhS/CAWAhE95cLefBSHobEBebPWZn+O0+9bFItIsQdNhzcJTNM
         e3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjLdaPSni2tdPXbFk1s1HhcetOjmHDpkvWtAlz6y/RA=;
        b=KIEisMAwXsyzYzKf+gP1sJcjDL1UtUfyxd/RvM7d26x8qljV6U06amsZsv8u46Vh9c
         XCYMImyhA8lK6Jg7yOYj65PxYs8oNFjgc9B/X+KnlbVBvWPbSZ/DSI0HH1OxANavS4R9
         1IF/Yt6C/iYXsiuKfJZBVOJiZjFza/D47NexAmQkPRrkd9D4DNHZPCnoqmHTqimwkhip
         9Nol3Rhn4FacGKdiH85TOgp40LV3FvPHlAShNZoBDKs7gcz25Wmsgb4kiaDMdvcoW48R
         FGlOQnmHGkceiRZtqccEWDk/WQFijFh0CyJSog8xRW1eWLDAyg7tU2cY/hrsauTOU5nS
         jNCA==
X-Gm-Message-State: AOAM533TufYCGQZ8cvFc3YxrqeBaLYb1/gYM7EfJ3cPTbP3bc5blsUw9
	BnS7cyEG1brCso5/XItNukj4sTurhRmHVJIJN+Q=
X-Google-Smtp-Source: ABdhPJzT/zDCvHMWVp3h3cGdtvmimPP1Nf5ws7atKskczqvdif+RvQ8kqLwfEy+eW4O6aRuwAReXizy5ZT6CYybzm6E=
X-Received: by 2002:a05:6402:c9:: with SMTP id i9mr41226269edu.76.1629790997489;
 Tue, 24 Aug 2021 00:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWTLNgEgKhsthziTyTShb6VFVKyy6JXzZBWr+nCLreGW-g@mail.gmail.com>
In-Reply-To: <CAA=hcWTLNgEgKhsthziTyTShb6VFVKyy6JXzZBWr+nCLreGW-g@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 24 Aug 2021 09:43:06 +0200
Message-ID: <CA+chaQd-7boZLVLwq6ev2LgHSoEKExQ-y6-u1uGXCR=LoU4mtw@mail.gmail.com>
Subject: Re: [yocto] Update bitbake broken build
To: JH <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>, 
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000076a95005ca49496b"

--00000000000076a95005ca49496b
Content-Type: text/plain; charset="UTF-8"

Hi, read
https://lists.openembedded.org/g/openembedded-architecture/message/1260
https://lists.openembedded.org/g/openembedded-architecture/message/1279
https://lists.openembedded.org/g/openembedded-architecture/message/1291

On Tue, Aug 24, 2021 at 12:33 AM JH <jupiter.hce@gmail.com> wrote:

> Hi,
>
> I updated the bitbake to run git pull in master branch, now it is
> broken, what does the following error message mean, how to fix it?
>
> $ bitbake-layers show-layers
>
> NOTE: Starting bitbake server...
> ERROR: Variable PROVIDES_prepend contains an operation using the old
> override syntax. Please convert this layer/metadata before attempting
> to use with a newer bitbake.
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
> 
>
>

--00000000000076a95005ca49496b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, read<br><a href=3D"https://lists.openembedded.org/g/op=
enembedded-architecture/message/1260">https://lists.openembedded.org/g/open=
embedded-architecture/message/1260</a><br><a href=3D"https://lists.openembe=
dded.org/g/openembedded-architecture/message/1279">https://lists.openembedd=
ed.org/g/openembedded-architecture/message/1279</a><br><a href=3D"https://l=
ists.openembedded.org/g/openembedded-architecture/message/1291">https://lis=
ts.openembedded.org/g/openembedded-architecture/message/1291</a><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Aug 24, 2021 at 12:33 AM JH &lt;<a href=3D"mailto:jupiter.hce@gmail.com">j=
upiter.hce@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
I updated the bitbake to run git pull in master branch, now it is<br>
broken, what does the following error message mean, how to fix it?<br>
<br>
$ bitbake-layers show-layers<br>
<br>
NOTE: Starting bitbake server...<br>
ERROR: Variable PROVIDES_prepend contains an operation using the old<br>
override syntax. Please convert this layer/metadata before attempting<br>
to use with a newer bitbake.<br>
<br>
Thank you.<br>
<br>
Kind regards,<br>
<br>
- jupiter<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000076a95005ca49496b--
