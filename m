Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web09.287.1603222389046624115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 12:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jp2qSIfw;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id u7so1778760vsq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2dY7lx7WyeLo/Gx+Eux8rQHgDTwAMlRTFlmQLgVNSE=;
        b=jp2qSIfwcprd9PXgIGL/k2xC3L9SAC5hkmlm4u8b260ublt+z7GMKhSp6T6bHaThex
         67+BKF2XyWa2QDx3u4UzuvbKPUR0YnHsJ9LILO+CEYLGZIKFJ2HvIr4x8BQ+FLu6scTv
         nRnYnwU9H6ttSPMV2fvEsoL4A+v89ArRDlCzUqRcBFVFmFUzvtGvia8ocfrcWRPsZ9lK
         FDZU8lCyvXmnyxM/QejuOcdNAeAs940F3rTHRXVBe5/bSXZVQ8EFyDiIGhFqMfLBaC29
         27O2l2oHJcWAkGCsIdiDb65aBf/JY4rCuYEyoxl+vSp+Q5AmVshq3YsoqFy+/SfGZgtT
         bOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2dY7lx7WyeLo/Gx+Eux8rQHgDTwAMlRTFlmQLgVNSE=;
        b=dGo8HrHNXFzuawomYJScTn7ghJT+WTwa4u6rkrGanNE23uku8mDBaPv5J/xzbjpCeQ
         MdUFQgwp6c/YfXb5dQ6OMmLT2mHU33s7Rm2ZS+7zRkRSfpt+r4nkWWlq0LANmJPOgee3
         UXZsKC+97cmz91moDek8pOJYiAEy+RDJQJmNfAn34gNdRlzFl3xPYSz+rjCYyd/Sl7P5
         E6XKS7aaE5LOTj22GJ0Qa0+6IiQ/zUosp7qLeIL/2PAtmazcLPW46PMGv3a3lMMxWP+n
         +weRkaBzWyeAKyhpn5ZBXSSj5V51W1TBqiFLoflD9pjL6y4FuvB4MZZK57Hh3NxXwZwt
         ZzXQ==
X-Gm-Message-State: AOAM533FQX1o5v4DG7mvC3YsoPa2x131g9ogC6lUViZoHdYdSdhmdDYH
	HcoffQHk/66SbM2lieeiOBZ9W2mXA/BrGf/xgnQ=
X-Google-Smtp-Source: ABdhPJzMvZupyxhIZ2QTHU14h945DnZk9h2Y7ZCwoT5xwoSu1FXUbSPHkDI0jfN7RJC4Rvo7GpGjPnPpmOtVt1mO+ZQ=
X-Received: by 2002:a67:1087:: with SMTP id 129mr3242409vsq.41.1603222388212;
 Tue, 20 Oct 2020 12:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201020185435.24361-1-petr.vorel@gmail.com>
In-Reply-To: <20201020185435.24361-1-petr.vorel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Oct 2020 21:32:56 +0200
Message-ID: <CANNYZj-Cz4tk=Vi8Us-f3ieQXnzbs=O=jPQLnnS3OSbv5txo7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ltp: Update to 20200930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000f206a905b21f4c9c"

--000000000000f206a905b21f4c9c
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2020 at 20:54, Petr Vorel <petr.vorel@gmail.com> wrote:

> -Upstream-Status: Pending
> +Upstream-Status: Pending [pvorel: this is not going to be merged, instead
> +each test needs to be fixed]
>

Nearly there - this should say 'Inappropriate' then, and the status should
be kept as a single line, with no line breaks. Same with the other status
adjustment.

Alex

--000000000000f206a905b21f4c9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 20 Oct 2020 at 20:54, Petr Vorel &lt;<a href=3D"mailto:petr.=
vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">-Upstream-Status: Pending<br>
+Upstream-Status: Pending [pvorel: this is not going to be merged, instead<=
br>
+each test needs to be fixed]<br></blockquote><div><br></div><div>Nearly th=
ere - this should say &#39;Inappropriate&#39; then, and the status should b=
e kept as a single line, with no line breaks. Same with the other status ad=
justment.<br></div><div><br></div><div>Alex<br></div></div></div>

--000000000000f206a905b21f4c9c--
