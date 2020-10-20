Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.2063.1603229723006515687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 14:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BBN/N/Eh;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id f8so56295vsl.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQjXT3D+aqkf0/xvyrBuT1644+6fwXajsqgimhMQuzU=;
        b=BBN/N/EhqtgU3plNon55wTfcoVp6C+y7g/DPaG28l9Yc6MQYnmUi8paVbGG3INFPgw
         uvd39iSG3WN3PvggS1iKzmu3j7eh4X6/LIVtd7llVCSOmpN1RWcgnyi5RBHMoUPu50GW
         2RmUUOz+tSWPmwcOhfwSwrq++I6WrXgOXl/XyQKiNWOXIpTm7iOGzrKkxXMLXbq7DrUM
         gUHiQpU/I/Mf5NIGPvj/cV4Ghp0AIISfoOm1ijdxPBTpExSYGz67TzNYOBetSEgIhdXH
         m7BTPlUX1v+n6koIcx/CrDopzbW3Q0hpVR2ggyz2Z2f3OyEXDCqzG2sMRRt8o1nQQ89O
         3P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQjXT3D+aqkf0/xvyrBuT1644+6fwXajsqgimhMQuzU=;
        b=jKwXyMXZtse7WO2idYY29VmBTrxtRKD9HLaCn7hSlynukd3ZUJFy5/rHqfuu87EUBB
         EX8zvy+voSZMFVCuWjU3wsULjrnKd1B0Sv7Oi708nYG8G7Ic2PTsA5mfR1kMcjpCNoUj
         9G/uhYmmUdxweG2X2En6fL0mSocTsrjXeA1e1SsZ/WxiofFaSbA4mEDzRmfe062qx0Yj
         5D6OWpPhCNrr8YXvLMpoJHdrI1At67JP4S/B08+hyT9k2w1hiHc0YH9/8HNhMxBXoytu
         Owm1s8pSce4ASDzM3kK7KXnddpQBtR1Z2H7KSXD6hRh7jee8M+JWtg89zbuFI0kV1MZz
         sEag==
X-Gm-Message-State: AOAM533ikgB8XFNWbLHBALCmptOy9JEDV4XwQgtyME92Tr0gxJ9xsWE6
	+Ma0UXpktv+FENVBIXSCVhPrFD4AztQDnoR5wb0=
X-Google-Smtp-Source: ABdhPJwCSBqjZhGbuDvi84hBIRvHqu56I09llMSujvYBVYfSCRdfmrcUYGcBziV7oV6RNIHEIbntbRs2Xd5HN+LBVOo=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr3305046vso.20.1603229722183;
 Tue, 20 Oct 2020 14:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201020185435.24361-1-petr.vorel@gmail.com> <CANNYZj-Cz4tk=Vi8Us-f3ieQXnzbs=O=jPQLnnS3OSbv5txo7Q@mail.gmail.com>
 <20201020201048.GA2215@dell5510>
In-Reply-To: <20201020201048.GA2215@dell5510>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Oct 2020 23:35:10 +0200
Message-ID: <CANNYZj8HMzDSadsgnoP_0QL4Q-jf0EWbvp=q7nqfYPH3t=Yh6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ltp: Update to 20200930
To: Petr Vorel <petr.vorel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Anuj Mittal <anuj.mittal@intel.com>, He Zhe <zhe.he@windriver.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Yi Zhao <yi.zhao@windriver.com>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000158bb305b22102d1"

--000000000000158bb305b22102d1
Content-Type: text/plain; charset="UTF-8"

Yes, seems fine now!

Alex

On Tue, 20 Oct 2020 at 22:10, Petr Vorel <petr.vorel@gmail.com> wrote:

> > On Tue, 20 Oct 2020 at 20:54, Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > > -Upstream-Status: Pending
> > > +Upstream-Status: Pending [pvorel: this is not going to be merged,
> instead
> > > +each test needs to be fixed]
>
>
> > Nearly there - this should say 'Inappropriate' then, and the status
> should
> > be kept as a single line, with no line breaks. Same with the other status
> > adjustment.
> Thanks, fixed! Hopefully we're there now.
>
> Kind regards,
> Petr
>
> > Alex
>

--000000000000158bb305b22102d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, seems fine now!</div><div><br></div><div>Alex<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 20 Oct 2020 at 22:10, Petr Vorel &lt;<a href=3D"mailto:petr.=
vorel@gmail.com">petr.vorel@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; On Tue, 20 Oct 2020 at 20:54, Pet=
r Vorel &lt;<a href=3D"mailto:petr.vorel@gmail.com" target=3D"_blank">petr.=
vorel@gmail.com</a>&gt; wrote:<br>
<br>
&gt; &gt; -Upstream-Status: Pending<br>
&gt; &gt; +Upstream-Status: Pending [pvorel: this is not going to be merged=
, instead<br>
&gt; &gt; +each test needs to be fixed]<br>
<br>
<br>
&gt; Nearly there - this should say &#39;Inappropriate&#39; then, and the s=
tatus should<br>
&gt; be kept as a single line, with no line breaks. Same with the other sta=
tus<br>
&gt; adjustment.<br>
Thanks, fixed! Hopefully we&#39;re there now.<br>
<br>
Kind regards,<br>
Petr<br>
<br>
&gt; Alex<br>
</blockquote></div>

--000000000000158bb305b22102d1--
