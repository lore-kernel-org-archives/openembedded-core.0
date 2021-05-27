Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.5420.1622113896902463897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 04:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OvPEKCDp;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id x1so2576151uau.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 04:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IdW6DyYc5DeGmIc7TIKGwUn3kl5JkJKJeBeNNXsH7vQ=;
        b=OvPEKCDpieC/t0EuGhIhFWX9E/sIpFvoSfsz2buRMTUqaf3stN3UR05DKOu0ODbFzn
         CdBWCY2LOjiU1kIfacSRLoqBrNgOkI2q1rAPYPWu/YzUykJDZL1uZsNq+Z99snEY36lw
         s+bQTHK1DZh7k3jPq3TedI/7ufn237hJghM692fXjfE3V7/t8zeZz3bStaBUlD6rcAtN
         AUS15BE4ElRHrvWcfjZyT6wOg6MZX5CBthRK19mn9vxLIklnvwdvDBkc1GMUaA9vpEv1
         JJJLh76SE886q6urtJXfIPwxQZwv5NUt9y2WN3xR31KbesDBBluziydJDahWMOyU44HL
         lU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IdW6DyYc5DeGmIc7TIKGwUn3kl5JkJKJeBeNNXsH7vQ=;
        b=YHEMVDiTi+hhuIT97q4Gz2sAc9irE6EFHYfa0tyOfoHINIfU88jFDBhnFyWCOTaUPy
         DXE25NhQIoiAtUqjR7n+JjIzSVxL/aduSIMOiUtT5Z1X7cnMrsg/3awg8uVbAmF1OIjf
         EgNeI8TfFViLW2IbBFEQVzFprnwm+bmgSF3wTn1JmJBlMiyk3wvPfIklM8zYv9dwhaSI
         JA1OXuTZW9lmy+6xfQgns8sKWPPxV7zipkP970ybaRgbyVr8RsrglVQDPX+JUVwMbTcL
         tBQ+33P57t7tg5hlsDFvtiUBJMGcEqKMS2V59XRGpTRx3c42Uf16tdyzcnfb+z+kiVmd
         BEzA==
X-Gm-Message-State: AOAM532TmruYFKJ/NaeMYyNzkOJ21iavbpK+gDtoH2Ci95ZQcBI6aN6q
	xZPTW/ff/3F7mtNO7u0KzNiLC+aBJmBeBeuhcQM=
X-Google-Smtp-Source: ABdhPJwRZrfLPpwbcggx6n05RLylP9uGbMhNIeTPUI3mVHHKufl8rPlVy0ipvalZzBSBvE/AWx3zL38tw1L49qs7orA=
X-Received: by 2002:a1f:b217:: with SMTP id b23mr1378262vkf.16.1622113895980;
 Thu, 27 May 2021 04:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210526204018.496352-1-alex.kanavin@gmail.com>
 <20210526204018.496352-3-alex.kanavin@gmail.com> <1cda2f133faff4948af66319d90f4817ea390e65.camel@linuxfoundation.org>
In-Reply-To: <1cda2f133faff4948af66319d90f4817ea390e65.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 27 May 2021 13:11:24 +0200
Message-ID: <CANNYZj-2zTLDEv_z8_sP3jF=UXbJTpiMUi0ZbjDnSXMy6Z=i+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] images: add ptest images based on core-image-minimal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008e202b05c34dd291"

--0000000000008e202b05c34dd291
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 May 2021 at 00:08, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Since we're renaming, can these become "core-image-ptest"? The base
> image is an implementation detail we probably don't need to care about
> and would make any changes easier in future...
>
> Other patches look good, thanks!
>

Updated patches sent, also for config.json.

Alex

--0000000000008e202b05c34dd291
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 27 May 2021 at 00:08, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since =
we&#39;re renaming, can these become &quot;core-image-ptest&quot;? The base=
=C2=A0<br>
image is an implementation detail we probably don&#39;t need to care about<=
br>
and would make any changes easier in future...<br>
<br>
Other patches look good, thanks!<br></blockquote><div><br></div><div>Update=
d patches sent, also for config.json.</div><div><br></div><div>Alex<br></di=
v></div></div>

--0000000000008e202b05c34dd291--
