Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.32171.1610968074640970247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 03:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=SMI3Iymv;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.48, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f48.google.com with SMTP id l7so7290504qvt.4
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 03:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KAriMlJtrkM2arLS4gLzSFfZ2KeVZJSnJay+i1ABBMM=;
        b=SMI3IymvcC8yvk7OjRd6WKQbU1vgnaHnJDs2OV/nedvsq8qI3P/RzgmLGXu6Jwim/y
         Qv8WkJQfBdz5/X8xVjh7c0kxZ6/GtOZtKhuTCoyiiCq5BGsJa/f2dLrmt6BnF3ONB672
         PCRc8KQtIpCKxjybVLN+y0n6+RlFR6FyjaHw/X+FEMjXfjlT2/RTBishqAJOpPueXaha
         oKhFgyYbOH1m2Te4lLwrOiIcRyb3UY4odv3eHGPj4pb7PlR1mdHs2phNZgxmumnbjIXF
         fr85CeyVT1zBmBMsIUlYV3Ekf2YswJpAU1+tdpTAlSyyblGsapgpf8iAJ29rgQOSrkOk
         S/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KAriMlJtrkM2arLS4gLzSFfZ2KeVZJSnJay+i1ABBMM=;
        b=GHZY3woB9Kg5JnDJgo1CYX9plNu5521RblpG/USRCaST4cKXEpu4Ckq6ggZQFJoe8k
         u1YaMSB7qq2WhbqWI9V7OmhL2wwngzp7qdk3XFCki1cMbktbpEsrN2o2h0vNWvD8ARY6
         NWiKlLueZ9yxgz3W1lw8ZSv1DS5NqRF35nMmG/FhrRUrAZ3SoqmRvfB05/uIxuBexYFD
         7p1RH8fm805DjXIH+waPYf7StDV19nGygK6Tpqn9ysSlk25BDvOBQP0qUZ9q4qlULvIs
         qRimznDNBHQcEiLLDw9bm7DIiLcrwinmDeFKNaP4mCQ9M1qlz/HZpl783SdyODMEJN+R
         Q2XA==
X-Gm-Message-State: AOAM533HB3WH0rXW90YvejKfdSOfcJibRtGKqakku//CvNvNIx9js7Ah
	ScxUAHOYNnQ55pTogjl3msfIJ9m1cooJBnGCOSjszA==
X-Google-Smtp-Source: ABdhPJw0b0BTzKy/qC7SK/JybdgzE0HVhWDufAByb0XpcjhiL70BB5Obx25q6JJt+4yxS3HTYBepCqRO3yP/+V5Osb4=
X-Received: by 2002:ad4:55f2:: with SMTP id bu18mr23906871qvb.27.1610968073642;
 Mon, 18 Jan 2021 03:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
 <20210115144724.GM16838@windriver.com> <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
 <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
 <CADkTA4PrQefBMme_z6JAquZCv=7CYMsq8OA4+Y7xVHwL=VjseA@mail.gmail.com> <9fa544389d040b0fbacd14a1861cac0721d7d2c0.camel@microsoft.com>
In-Reply-To: <9fa544389d040b0fbacd14a1861cac0721d7d2c0.camel@microsoft.com>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Mon, 18 Jan 2021 12:07:42 +0100
Message-ID: <CAMjhiJiOnsaHHS47m_mT_k+7-W9eABW8S2Qm+KE2U2cqR4E3Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
To: luca.boccassi@microsoft.com
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c63a5205b92abb20"

--000000000000c63a5205b92abb20
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Jan 2021 at 18:35, Luca Boccassi via lists.openembedded.org
<luca.boccassi=microsoft.com@lists.openembedded.org> wrote:

>
>
> There's the get_kernelversion* functions available to recipes,
> reasonably widely used already - so something that checks it and
> conditionally installs the drop-in should work fine, in theory?
>

That would make the workaround a initial build-time dependency. As I
understand the proposed solution was a run-time check.

What if the kernel is upgraded in the field?

>
>
> --
-- 
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--000000000000c63a5205b92abb20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, 15 Jan 2021 at 18:35, Luca Boccassi via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;luca.boccassi=3D<a href=
=3D"mailto:microsoft.com@lists.openembedded.org">microsoft.com@lists.openem=
bedded.org</a>&gt; wrote:<br></div><div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)" dir=3D"auto"><br>
<br>
There&#39;s the get_kernelversion* functions available to recipes,<br>
reasonably widely used already - so something that checks it and<br>
conditionally installs the drop-in should work fine, in theory?<br></blockq=
uote><div dir=3D"auto"><br></div><div dir=3D"auto">That would make the work=
around a initial build-time dependency. As I understand the proposed soluti=
on was a run-time check.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>What if the kernel is upgraded in the field?</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"=
auto"><br>
<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div style=3D"color:rgb(0,0,0)"><span style=3D"font-family:-webkit-standard;=
font-size:medium">--=C2=A0</span><br><span style=3D"font-family:-webkit-sta=
ndard;font-size:medium">Leon Woestenberg</span><br><span style=3D"font-fami=
ly:-webkit-standard;font-size:medium"><a href=3D"mailto:leon@sidebranch.com=
" target=3D"_blank">leon@sidebranch.com</a></span><br><span style=3D"font-f=
amily:-webkit-standard;font-size:medium">T: +31 40 711 42 76</span><br><spa=
n style=3D"font-family:-webkit-standard;font-size:medium">M: +31 6 472 30 3=
72</span><div style=3D"font-family:Helvetica"><img src=3D"http://www.sidebr=
anch.eu/en/images/sidebranch-logo.png" width=3D"96" height=3D"53"><br></div=
><span style=3D"font-family:-webkit-standard;font-size:medium">Sidebranch</=
span><font face=3D"Helvetica">=C2=A0</font><span style=3D"font-family:-webk=
it-standard;font-size:medium">Embedded Systems</span><br><span style=3D"fon=
t-family:-webkit-standard;font-size:medium">Eindhoven, The Netherlands</spa=
n><br><span style=3D"font-family:-webkit-standard;font-size:medium"><a href=
=3D"http://www.sidebranch.com" target=3D"_blank">http://www.sidebranch.com<=
/a></span><div style=3D"font-family:Helvetica"><br></div></div></div></div>=
</div></div>

--000000000000c63a5205b92abb20--
