Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
 by mx.groups.io with SMTP id smtpd.web10.2641.1594840660047096443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 12:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7dL2+fm;
 spf=pass (domain: gmail.com, ip: 209.85.221.193, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f193.google.com with SMTP id g22so740802vke.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AKZCuA847hcu5EBpsu8C6lBW5LVGT21HUPwCiLaKuVo=;
        b=Q7dL2+fm9o/Pc/xtnm2BCIVRYKUa5/jBK+gdM3E89mIIptxuyt+OGzGXarGwKnKQ98
         l7tREpM9659nzVnD+F/oM5zuFyhrGKoYB1O6SMeTs2E9svCNHO8Um3fvaw83z8bT3EFm
         qUi3yYPqdtJySHeYbHWZ2WPgeW4i+l2/LgoJDaXwPl7yT2WNTyqGajlHFGxbr0chLHq1
         A6A2H6c5Sw3kTttQnNhIm1xF+M57Jf45QvNG8C8v5oOmDinJS56+M2eaZptwfY600pi0
         aNAJYdD2orbOfGl74LXSGmpS1lOJFW/55+02G1Rb5id120Q//9LffwVHx5FensxlQhO7
         grVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AKZCuA847hcu5EBpsu8C6lBW5LVGT21HUPwCiLaKuVo=;
        b=IaqHTlhEK96KYuXyvVNfAsmgKmc+5HV15qM82Inmw/ijfN5yfDQKNHLL2aQfVhYqo1
         9SHLcpkEzcGCL4y7Eft/2PighijIzHiSCDfi+M9MqlAIXsk8hoE9NYgniciL27vgtNrc
         hBGZVMd7acM6KhbY/5PqrPBfxm+BZXh6nSbnb0D5wUsBcJE2NFIc8heiwroKzEIP9yw/
         Qljx3Mqcbl1dp5EEipN5t+hRZZQ1uWywhaWAMqxd8dyv52AiwZX/p+Z0t2zX6pQzUZbR
         Evbrqdt0ycWSa8nqN/sBiMs0ZXddh5AVr0RmZrEL/MKxx/ys39lrvZA2/6z2xyscPZRb
         7UCg==
X-Gm-Message-State: AOAM530R4GXLGR1Zps7FKhHiyXjIKcP1rKOrtNy9N70fWJFp2e4NIBLX
	sw5KuSwPjAjWFem32/V2HXzUvj1vV0WUwDT0wGY=
X-Google-Smtp-Source: ABdhPJzcr2NwukwXJJ3H0ATyHXt+OPuHvcCdX/T54Y2KRvbf/bhJ0rUc5+HKm77/Dj1vCUaJTvRGEfpIVueuSmIsMZ4=
X-Received: by 2002:ac5:cdf5:: with SMTP id v21mr496621vkn.1.1594840659260;
 Wed, 15 Jul 2020 12:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <fb3b732ab791369a2287a3b89e0d125c78f228ca.camel@cisco.com>
 <20200712213551.2206605-1-takondra@cisco.com> <CANNYZj8QBo7X5qoq3yse8rO3qh47_zTWkm6hkRUng2hHmj+c_w@mail.gmail.com>
 <0cef3914ade47872815423de749d0885759d24e8.camel@cisco.com>
 <CANNYZj-5OJTK7OZ0MHvdiHuWdEAykbG0SKbkxaQjYQpqkgQzqw@mail.gmail.com> <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
In-Reply-To: <b2d458f64f65890e3fa30644b4c18f7dcd74dddf.camel@cisco.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Jul 2020 21:17:27 +0200
Message-ID: <CANNYZj8+qiNMt_0thqSY-TZGGH+PDwdLLY6c0vevof98=iR_OQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: use host pkg-config only when host provides sdl
To: "Taras Kondratiuk (takondra)" <takondra@cisco.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000f7f8b105aa7fc6a8"

--000000000000f7f8b105aa7fc6a8
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2020 at 20:54, Taras Kondratiuk (takondra) <
takondra@cisco.com> wrote:

>
> PACKAGECONFIG improves determinism, but it is not sufficient. It is not
> feasible to make sure that PACKAGECONFIGs cover all configurations.
> There will be always something that slips through. I think
> acknowledging this fact was one of the reasons for recipe-specific
> sysroots.
>
> We use buildtools tarball to better isolate OE build from host
> environment and improve determinism. Host pkg-config opens a big hole
> for non-determinism and plugging it with PACKAGECONFIGs seems fragile.
>

Right, with this I agree.

Alex

--000000000000f7f8b105aa7fc6a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 15 Jul 2020 at 20:54, Taras Kondr=
atiuk (takondra) &lt;<a href=3D"mailto:takondra@cisco.com">takondra@cisco.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
PACKAGECONFIG improves determinism, but it is not sufficient. It is not<br>
feasible to make sure that PACKAGECONFIGs cover all configurations.<br>
There will be always something that slips through. I think<br>
acknowledging this fact was one of the reasons for recipe-specific<br>
sysroots.<br>
<br>
We use buildtools tarball to better isolate OE build from host<br>
environment and improve determinism. Host pkg-config opens a big hole<br>
for non-determinism and plugging it with PACKAGECONFIGs seems fragile.<br><=
/blockquote><div><br></div><div>Right, with this I agree.</div><div><br></d=
iv><div>Alex<br></div></div></div>

--000000000000f7f8b105aa7fc6a8--
