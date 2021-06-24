Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web09.4675.1624523324669049860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 01:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QtXf9reJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id n61so1909683uan.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 01:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FcJ9meLCY/pjr9i8WlUbHMZv2EbS7zENGcCO3P9/+FQ=;
        b=QtXf9reJsIxLEfoBz5naz/LD+NEHKpoipLqf9nMua83TqssKQWvzzRn2/DOqam4lYe
         C6z3cSWpq6CTRUIvr4Mrb0Xzpi584GmelDwL/E6eAoaLquOTWj2ZJDO55o46ljYYEG/Q
         obqh80CdmJFh/I9Ojws99ACWK7PQOOJJPzdjRvWyhrM5c7AEaMddZMixbBUw/FP/NHHb
         nsxNiErKR+GCSDjWHNpxDxYx/gxBJ2PqWonEiS8x0iwLQe4einQOVL1hSf2oyrTCbxxd
         zEIRMx6TDHvjFPY4UkrIDKlGQGRKL7eeTD2pMlli3MMVG0hpThT2CW46n7bLs6fVgu+y
         Wy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FcJ9meLCY/pjr9i8WlUbHMZv2EbS7zENGcCO3P9/+FQ=;
        b=sH7wQ2LsUOn1r7tJeQ00+lRPcytnOT9DzfQnYqpBfHfwQrVDIyvBBt+/5skgCjhgLG
         z8cjGeT0TIVxElymw19i//uQyvaDxT9PQfqxDfs+QdnqrgutWL3myEew72EbTCocgS1t
         i0PEi0nYSho9noC0bg2CIookk4htCL+ATmq45jXaJSn+v4wIdV+ZKIJyJOYMA8kqzRIH
         39QB18nRhZmioZBkVU5RpQyIP2Jpjo5DjrucDzlaDdLDHVNL0LU5+HJk1yv8c32+098G
         BWk7RrHVOJI+Ps/3LP77MlqTr/X+3Q0GC0nLA5IE+2BkZbu50/029Y1INUzw8Y7+x3qE
         UfOw==
X-Gm-Message-State: AOAM531jZdkS35sENBUqRVvmivFj9MNAbtSkmtA3ut7MrpHLE3lZNR7R
	YwUkir2Dsphc25NqujSOQjvaw6R6fExqtqvLDcg=
X-Google-Smtp-Source: ABdhPJwcm6jAN1dZW+yLElYuWJHdAnZlWfEvab0d9gKF0PSEPCLT/RBV1kEYrCvYSEGlqGccw7SFN8DPFm/6oC2A3rQ=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr4077422uad.89.1624523323847;
 Thu, 24 Jun 2021 01:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210622192723.2041345-1-alex.kanavin@gmail.com>
 <3324.1624431667479717516@lists.openembedded.org> <CANNYZj_wbfFtDL+8HSAJzqvrmx+y0ofbmmrve91qBd8PfO9WFw@mail.gmail.com>
 <6dd3291340e74358bdd444d563077690@XBOX03.axis.com> <CANNYZj9M5diDQ_jirzug2rRDCugTrCnhjHS7a6tXNwBrMAFwvA@mail.gmail.com>
 <CAJ86T=WnCZ9pFtejfiNOe5TVzu3niRiaRPoGLfEJX9hC99Q2bQ@mail.gmail.com>
In-Reply-To: <CAJ86T=WnCZ9pFtejfiNOe5TVzu3niRiaRPoGLfEJX9hC99Q2bQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 24 Jun 2021 10:28:32 +0200
Message-ID: <CANNYZj9dGnOrZPC8i5mA706BLMMNsgu-5+huje230WH9G+EXQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi: set SRC_URI with =, not with +=
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a5b6f105c57ecf51"

--000000000000a5b6f105c57ecf51
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jun 2021 at 09:21, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Jun 23, 2021 at 3:18 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Frankly guys, I think maybe we should just break stuff in this case, and
> have it fixed up properly, then try to guess what workaround might work.
> >
> > From that perspective the original patch is the most clear.
>
> The typical ordering of variables etc in recipes is to put SRC_URI
> before inherit.
>
> From the perspective of trying to get recipes to stick to a standard
> ordering of variables etc, _prepend seems to be the best solution.
>

That's fine with me, we should probably fix up gnomebase.bbclass as well,
as using = there adds friction to how SRC_URI must be set in the recipes.

Alex

--000000000000a5b6f105c57ecf51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 24 Jun 2021 at 09:21, Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Jun 23, 2021 at 3:18 AM Alexa=
nder Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Frankly guys, I think maybe we should just break stuff in this case, a=
nd have it fixed up properly, then try to guess what workaround might work.=
<br>
&gt;<br>
&gt; From that perspective the original patch is the most clear.<br>
<br>
The typical ordering of variables etc in recipes is to put SRC_URI<br>
before inherit.<br>
<br>
From the perspective of trying to get recipes to stick to a standard<br>
ordering of variables etc, _prepend seems to be the best solution.<br></blo=
ckquote><div><br></div>That&#39;s fine with me, we should probably fix up g=
nomebase.bbclass as well, as using =3D there adds friction to how SRC_URI m=
ust be set in the recipes.<br></div><div class=3D"gmail_quote"><div></div><=
div><br></div><div>Alex<br></div><div><br></div></div></div>

--000000000000a5b6f105c57ecf51--
