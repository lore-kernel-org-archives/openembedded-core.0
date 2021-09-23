Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.419.1632423617417767973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 12:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z550gKPq;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id f24so4908404uav.8
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+7AZo8cC8jYBErXs0c47ZxRkpI2tZf/VeyvOoprkFM=;
        b=Z550gKPqCYj+l3qHzmShf5p01E4WPxmsUexZ+PNq09MLQVb2IFe9uAGFxapE9gQFtm
         P689hbLuZPEAsClNxHjVQJZhJt6BNs2HNyi34U+MB4oEngOPXvP/KBudPZ4YzHDMT74Y
         pNO9/yzG+O7V8vgWsbSYH2jxudtr27IVPhwQFuZeBDMpS6EY9JiAEoBAfNEk3GgGoEbA
         o3uCyVL7/cCxCm313XqurHE3jqLiCRVuTzXzLWuxtBm3KdsElk3fLD/ooI8D8Sx4msYa
         lcD8G/zprK8IEZuus8AQElH5kRy4Tv/HKw1+uw3fLZY3TZ5LFW2iO/wAh3HbYGmKhHb5
         /3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+7AZo8cC8jYBErXs0c47ZxRkpI2tZf/VeyvOoprkFM=;
        b=x+Rh5NU+wr/kDhScIk6+CWgfH+qGt9/xvVWcUr7tTN58AW8jFTPS/HWpc9NYtXApla
         W/yahD0r/PgHs+OhfL6Aci5Nnqi4ReQI7rdF4YfI1GjZY9B2OXuvqc1NhYajb5OZQqja
         1LQzAIz31BK9HRjcT7BYnpsuvc9gxKEACSFVYA1DP6vIN+FbZUA22DTL57bvITFQcX9C
         BHjs+v2RjnJIeaR0mGHmvynGclq3QXSDdKa9Po5pd8y1fwpHZOrPHsSukUp1vTi+KKJG
         rZxgqXNknhKT6olGBBtLu8GIXte093oL8/ZTgXfw0KEGfsFpeRqLsGcAyEiDHF+nXtuw
         Re7g==
X-Gm-Message-State: AOAM530gawweXSNt81eReWjnbHmUdODSeSEdl1BUn3YqYvXlLh9vRY36
	d5nMrUGj4pzj3mGvDGlbwAKl60e+cNCxxXYJ8v8=
X-Google-Smtp-Source: ABdhPJw1y/lxiM+l2H2jZUkF79IYrEHYJuINwAkHTTy+va6sRXKajilTbIBWoM08hOaL37fX80X/eVdinzelomwn8OU=
X-Received: by 2002:a9f:30d8:: with SMTP id k24mr5869959uab.89.1632423616492;
 Thu, 23 Sep 2021 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
 <20210923151723.3435155-1-psaavedra@igalia.com> <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
 <eecd36d1edb8fb6a25bba430505f223c021b8302.camel@igalia.com>
In-Reply-To: <eecd36d1edb8fb6a25bba430505f223c021b8302.camel@igalia.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 23 Sep 2021 21:00:05 +0200
Message-ID: <CANNYZj8+PEXuuGCUdqs2+T+-F-q1_VWczhZqdtebZeHF-9ieLw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH v2 ] mesa: Add patches for red label issues on video for VC4 and Freedreno
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c8cdf305ccae3d58"

--000000000000c8cdf305ccae3d58
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra <psaavedra@igalia.com> wrote:

> I kindly accept your recommendation but could I make also a question?:
> Couldn't it be enough just setting the
> 0001-freedreno-YUV-formats-are-supported-as-external-only.patch with
> "Upstream-status: Submitted" [1].
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
>

In this case I would like to be cautious and accept the patch into oe-core
only after it has been accepted by upstream. There have been situations
where submitted patches were never actually merged upstream for various
reasons, and so we ended up with unmaintainable custom patches.


> I assume this point affects only to the
> 0001-freedreno-YUV-formats-are-supported-as-external-only.patch patch since
> the other commits are already in Mesa 20.2 (version available in Honister)
> and they are not required for Honister and next Am I right?
>

That's right.

Alex

>

--000000000000c8cdf305ccae3d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra &lt;<a href=3D"mailto:=
psaavedra@igalia.com">psaavedra@igalia.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div>I kindly accept your recomme=
ndation but=C2=A0could I make also a question?: Couldn&#39;t it be enough j=
ust setting the 0001-freedreno-YUV-formats-are-supported-as-external-only.p=
atch with &quot;Upstream-status:=C2=A0<span style=3D"font-family:sans-serif=
;font-size:12.7px;font-weight:700">Submitted&quot;</span><span style=3D"fon=
t-family:sans-serif;font-size:12.7px"> [1].</span><div><br></div><div>[1]=
=C2=A0<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/=
12991" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
mesa/mesa/-/merge_requests/12991</a></div></div></blockquote><div><br></div=
><div>In this case I would like to be cautious and accept the patch into oe=
-core only after it has been accepted by upstream. There have been situatio=
ns where submitted patches were never actually merged upstream for various =
reasons, and so we ended up with unmaintainable custom patches.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>=
</div><div>I assume this point affects only to the 0001-freedreno-YUV-forma=
ts-are-supported-as-external-only.patch patch since the other commits are a=
lready in Mesa 20.2 (version available in Honister) and they are not requir=
ed for Honister and next Am I right?</div></div></blockquote><div><br></div=
><div>That&#39;s right.<br></div><div>=C2=A0</div><div>Alex<br></div><div><=
div><span></span></div></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
</blockquote></div></div>

--000000000000c8cdf305ccae3d58--
