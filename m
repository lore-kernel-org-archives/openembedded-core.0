Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D56C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:50:05 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web11.13613.1747403399678027513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 06:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKOtmfP8;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6063462098eso1543768eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747403399; x=1748008199; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9FGqMj5xFKEsT40U0zjDGyWl/81axeaYqpglvGb/xA=;
        b=kKOtmfP8BdTj4H0OniJNoHk8vrobFtKl729HZNzbAlLRI21EmrJqVQLSqMTDKKBvk5
         yUZ/kTfMyafve9pawqCjUcTQTSAYQKpr4N6jXpNpewoNdl5MRJVIux/6BAG8jBA8t7i6
         ZmxNWVpliiO8HzI7iiTc29x3jZs46rVJemcNnsCOWyVeYb+NE9vsf1s1GJ+qJOOJzrN7
         9hpx5/JUYj6T7mYWacwF2YO8dfkWws6s8m+8XEmI3ue9fZyBmIeGrpq9IuaT4xyIW4Sb
         lRQJPQCFpn83unmUU9ncpYqLdc/xUjXbGM1PFIsxEimta3AVkptAgJ+eXSe1MJV1X/mj
         c8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403399; x=1748008199;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9FGqMj5xFKEsT40U0zjDGyWl/81axeaYqpglvGb/xA=;
        b=kZOBI9s0gKFLiYpIlYiGCQ9ulgdk989is6jyzUkDdsDZLFiK4Eq3XJTJmeWKCq43o4
         woWzJH2/iPephabTx1MysHeVnZ38ByVwIqyHukougcT7w2tyT9tQTBr0Mxb2wGA/a81V
         SdA2va7ZaRr8VpZDCG1gBnjJ1mcn2JGbrUt0IDSM6C+OSNfwDeugSVYEr7aQkRzYgfIq
         XoMCbaabtgrBRVOo/wn1wY1+bMiYvhyVHtQq62uRpe4CE7YeNqbeqRjZTlcH4s+rau7h
         wK98Xfw6rZsvbBHALwkaJ/cG8uWgaX0IC06719EmWngJ/GmznEiSBDWEMlVkVdQuQF4Y
         JgqA==
X-Forwarded-Encrypted: i=1; AJvYcCV/6hIDD3QjEGV5sWpZ9+fOGz29tl71ZbRF1SJHOAHdlOXXpp/vG+oydonTcPQPrEZXI9kUL2s4X5PTaZbh0lXDnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw6IOAHLwjANtxFwEQ0ciq1FfVeip7Qx5a8AJkgEdPDFe7xOJjG
	53p9/OON2uSY8gdEwGRhmg72Z3w047uaTkcyeot3+ZprqLi7Zc7au0NIXf24c9OrIBQeAnOJ1EX
	DitPhb5dxXXQSWRw1i+JTh9gAPZz8eV0=
X-Gm-Gg: ASbGncv/kNay6UCH+VvoG5MH5cLpN/Rgr3LChd0u4gHd78si9CQleOiU7GGBibg8xql
	vgOBomvLyOLXej6NSvQOFP35YUuggdIRYPyuMYX8G5W2w0haio9Bp+eeawcFziX1zIWQaoHc3HN
	KP/vPWcyYJ0c3oePi1GBzXBXfFS4sRDpibLc7Qsk9Wn2QlSw4aLZ7z858VlIMiNLy8wQ==
X-Google-Smtp-Source: AGHT+IGnOokUgyemCGsTVjUM8HqqoSnmEfLpNaFZGdHM6fIL+W+Gb4sa+O6cbrp1XYgnX2IeV65k/CNfQChqL2rXdmc=
X-Received: by 2002:a4a:e905:0:b0:609:db2a:7d38 with SMTP id
 006d021491bc7-609f36bf46fmr1835945eaf.2.1747403398855; Fri, 16 May 2025
 06:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
 <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com> <CANNYZj-71JnUvJb1tAZ34TGQX8RTwGB9ATUVc7-ptf+CemP+XA@mail.gmail.com>
 <1CB83516-B9EF-4381-85DE-59B4C55A031C@arm.com> <CAMKF1sr68GCyfXRMuS4cUBRL4jCEd4RUZ4GZrKN84R01w_gfSg@mail.gmail.com>
 <BEB697EE-4F8F-4832-9C8C-F149BE8E862B@arm.com> <CAMKF1srHjmPo-tcx2u5c15oZCNzFKu=NagkFFHQ1UCYdCWe9bA@mail.gmail.com>
 <5979472F-B748-4ADE-B950-636574096C3B@arm.com> <CAMKF1sqAXCiaau0jfDo3OgoG=LFc96_czB0yC7JDsC4S85jJHA@mail.gmail.com>
 <A5AB0449-4EAE-422C-8314-758993EDA6E2@arm.com> <C8EC2D37-BBD3-461B-B150-9FCB7A12201B@arm.com>
In-Reply-To: <C8EC2D37-BBD3-461B-B150-9FCB7A12201B@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2025 06:49:48 -0700
X-Gm-Features: AX0GCFspl0tJwBK1Z1ehcP2kJjK32QrB05pl_YlJGzEMar0eeVN0tjoVClumNfY
Message-ID: <CAMKF1srGTa3yykuWdF8vyG2t_zeLO4Y_HxgCxPB7C2xVk4SKgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de3fb00635410e2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 13:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216753

--000000000000de3fb00635410e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 5:46=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:

> Hi Khem and Alex
>
> > On 16 May 2025, at 10:56, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 15 May 2025, at 22:13, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >> So it does seem to add 200s to build time perhaps make it a
> packageconfig
> >
> > Doing buildstats comparisons is less than trivial. I just replicated th=
e
> test, ensuring that there=E2=80=99s no noise caused by other recipes bein=
g built:
> >
> >  clang-native                  do_compile       9.3s    +1.2%     806.2=
s
> -> 815.5s
> >
> > I=E2=80=99m fine with adding a PACKAGECONFIG but I think it should be o=
n by
> default.  I know we=E2=80=99re trying to reduce the clang build time but =
9s is
> basically noise in this context.
> >
>

I agree if this is the new number let=E2=80=99s apply it as is

>
> please let me know how to proceed, PACKAGECONFIG and config enabled by
> default or disabled, I=E2=80=99ll send the v2 shortly.
>
> Cheers,
> Luca
>
>

--000000000000de3fb00635410e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, May 16, 2025 at 5:46=E2=80=AFAM=
 Luca Fancellu &lt;<a href=3D"mailto:Luca.Fancellu@arm.com">Luca.Fancellu@a=
rm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Khem and A=
lex<br>
<br>
&gt; On 16 May 2025, at 10:56, Ross Burton &lt;<a href=3D"mailto:Ross.Burto=
n@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On 15 May 2025, at 22:13, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; So it does seem to add 200s to build time perhaps make it a packag=
econfig<br>
&gt; <br>
&gt; Doing buildstats comparisons is less than trivial. I just replicated t=
he test, ensuring that there=E2=80=99s no noise caused by other recipes bei=
ng built:<br>
&gt; <br>
&gt;=C2=A0 clang-native=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 do_compile=C2=A0 =C2=A0 =C2=A0 =C2=A09.3s=C2=A0 =C2=A0 +1.2%=C2=
=A0 =C2=A0 =C2=A0806.2s -&gt; 815.5s<br>
&gt; <br>
&gt; I=E2=80=99m fine with adding a PACKAGECONFIG but I think it should be =
on by default.=C2=A0 I know we=E2=80=99re trying to reduce the clang build =
time but 9s is basically noise in this context.<br>
&gt; <br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I agree if this =
is the new number let=E2=80=99s apply it as is=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
please let me know how to proceed, PACKAGECONFIG and config enabled by defa=
ult or disabled, I=E2=80=99ll send the v2 shortly.<br>
<br>
Cheers,<br>
Luca<br>
<br>
</blockquote></div></div>

--000000000000de3fb00635410e2e--

