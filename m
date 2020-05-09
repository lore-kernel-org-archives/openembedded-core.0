Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4110.1589054899293905789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 13:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l1Tjfezs;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id i14so4516278qka.10
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 13:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9F1dcj54a6+MrrsOVkyVbRN477dfPmrmvcX8Dwdv0Ts=;
        b=l1Tjfezs2oQM/8y3m8gvn9x0UtcuPDby1vGMMrylHf2vCZs84C0D8rvugmsF7xkZBK
         1rnDpc+LEEaM386YiQykxVbmu56esarCuklp5X8ctFC7PiJxTv3BxP0EgSMhHLWYJxoq
         mlkfH/CNqML8fhpiS9+dzuW8GOoxa59FxJyeY02lyEm7B6bEekga0ApIY2Tbk9dClsOK
         r8ihGDClpaTtkF6xLp6i3F4Qz3aj553L4RRGwHZiLKbVlwFs7jGKst5paxfPDTuGeCT8
         ynfeuijVSmPkDN6aV2YPQMXtMNFjSS8YC7TQFy9drKgqNU2QAZ3+nyZ3yS2LUvHQHDcl
         Y/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9F1dcj54a6+MrrsOVkyVbRN477dfPmrmvcX8Dwdv0Ts=;
        b=bS3j8SzFt5wLiaTcNKgVCygwkFMm0725vFZSsbGUZMZHepZfzfqEiuDQrppFkxkJaA
         ANTSrNOe2sFsFy4NxgS7Gs8MRMcxpH/IfmNGq5Xw+lhgLCUCYqboDwKP5o7URq5YNlNk
         9Y0YibN0w5Kx1g36SAXs7MlkSWa+ofnPMh93I70jMwuRxm92doAyedvrOWGIHG2qbx8g
         +hAJ2PvhuqThQSTz6PTqe3VOUF3Q6A34szjgV3Bbq6Php6IiogCaOVq8VrxpcPCuEKQt
         AoNlS2YlAB1DfogZ2C/G0QNURwMnCJSwRNvgxt+xCiCZl/YOEYmhhrgIO8u7YJdO3m8n
         nf9A==
X-Gm-Message-State: AGi0PuYw2rIUMymn6UMqM4Ann1MSRPaqusUQAZDHSziSB3JUgiC83djz
	IYtdRQJH6rhjE7VLKy6ewc8JFkrbfVjLOEIo5rg=
X-Google-Smtp-Source: APiQypJackfuVRlg0hVcGLsByO1UgafGF+pNTBE3p4gH5eiKMHip6lsZfPsvtRV7wETlKJsBpYx/sUDSzta8yZV9Pxc=
X-Received: by 2002:a37:52c6:: with SMTP id g189mr8179608qkb.17.1589054898244;
 Sat, 09 May 2020 13:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200506134002.155500-1-richard.purdie@linuxfoundation.org>
 <66e0d1d5-2b72-ce26-4b5b-709fbcfc7274@gmail.com> <CA+chaQdaOXJ694M2Tz8LAtcmW+Dj7VW5MZPvec1Vjb5MheVr=Q@mail.gmail.com>
 <017fe4f07474c789fcb15df550e18fd05e2b20be.camel@linuxfoundation.org>
In-Reply-To: <017fe4f07474c789fcb15df550e18fd05e2b20be.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 9 May 2020 13:08:07 -0700
Message-ID: <CAMKF1srLhdXbSN9w+dtt3gL0EvipGS0bEdfdfOqdn6E6f8wuVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: Promote warnings into errors
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bd101f05a53cacc5"

--000000000000bd101f05a53cacc5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2020 at 12:36 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-05-09 at 19:57 +0200, Martin Jansa wrote:
> > Agreed, I would go even further and move all WARN_QA to ERROR_QA. I
> > do that in all my builds already for few years, so oe-core+meta-oe
> > status shouldn't be so bad and those few cases where it still fails
> > can be skipped with INSANE_SKIP in the recipe - to make sure that no
> > new warnings are introduced later.
>
> I wasn't really sure how far to take this, I also wondered about this.
> FWIW we've already cleaned up all the warnings from the YP autobuilder
> so OE-Core should be warning clean and the meta-oe builds made there
> are also warning clean.
>

Meta Oe layers are already being CI with same strict setting as poky so I
don=E2=80=99t see huge fallouts perhaps raise the bar

>
> That does mean we should be able to do that at least from the
> perspective of those layers.
>
> The best way forward may be to give this a week or so to settle and
> then add an additional patch moving the rest over?
>

Seems ok


> Cheers,
>
> Richard
>
>

--000000000000bd101f05a53cacc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, May 9, 2020 at 12:36 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2020-=
05-09 at 19:57 +0200, Martin Jansa wrote:<br>
&gt; Agreed, I would go even further and move all WARN_QA to ERROR_QA. I<br=
>
&gt; do that in all my builds already for few years, so oe-core+meta-oe<br>
&gt; status shouldn&#39;t be so bad and those few cases where it still fail=
s<br>
&gt; can be skipped with INSANE_SKIP in the recipe - to make sure that no<b=
r>
&gt; new warnings are introduced later.<br>
<br>
I wasn&#39;t really sure how far to take this, I also wondered about this.<=
br>
FWIW we&#39;ve already cleaned up all the warnings from the YP autobuilder<=
br>
so OE-Core should be warning clean and the meta-oe builds made there<br>
are also warning clean.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Meta Oe layers a=
re already being CI with same strict setting as poky so I don=E2=80=99t see=
 huge fallouts perhaps raise the bar=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
That does mean we should be able to do that at least from the<br>
perspective of those layers.<br>
<br>
The best way forward may be to give this a week or so to settle and<br>
then add an additional patch moving the rest over?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Seems ok</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000bd101f05a53cacc5--
