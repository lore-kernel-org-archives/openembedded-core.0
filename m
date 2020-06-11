Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.2899.1591863278579213325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 01:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X2w4Vcmw;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id d21so2886223vsh.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pBS3unvY41A5FOj6BAVqsic2h8KmQ0ZOaNNDulmQ+m4=;
        b=X2w4Vcmwm9k6OoeCowFUM5cofu1lX8I2+4TdR8FT+sQw/rr1xHkNxq3fbEcwreSFU8
         xGrtdFmidEjiUyUARSjqvm71wLjPrnA3xdvWUBjgIiWHx0SEaLnlTJPwsbCoEFZbPwbA
         Y+HBmu+Cxluyd67wjFivDhtcCKGAFwL6Jrln+eh5U/f0zLHRZ4UeC57MVwx7tyruKqar
         OdZR7oWcw5TAFb1+RQjnBiiZdwZFNv0mn5eZ3viuCG3C0GBepAgMPpsXTCGwaBoS1bh5
         i3mDXufYji1G+b7/6zCTIKLVWda9UVX5AoP9HgiCL6+ZJcIm9mA41HFlpFFToodSNjD1
         o0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pBS3unvY41A5FOj6BAVqsic2h8KmQ0ZOaNNDulmQ+m4=;
        b=FYEybVoCHakA1kaVbjXqS31F0CoWespIYbcESmM7hn/LelXUAyxln2gq40uTnHIB6B
         tlzdrruHKn23LmvjMRN16V3eATK3aHS/6EfKhrpTLxMiv2IwtGtE8pGtt53L8nDs2M8o
         pDduxHUOjzZNvV6RG0zfLy8/XnYFEyyeoh0f2adnC07nhKcRhPWU174WOit0lEVKKEkN
         FxdAzhDbAzkV5xBe+nouC9QOvTIoEWCj5YtL6ALLj0uvjVQe0k9p1W29xyxSHzkhnrQK
         VVzuXTQ+JEORDR9jMWxn/x8Uv+Ems2i9/QQ5WxUCFZMuLh3qbGUwUFX/cxzYXRBNXkgf
         1PAA==
X-Gm-Message-State: AOAM532ydAfofpEb3Ne/hh5ILnFNt0WPSjgrUHZgS5Fr/uA/GlKw35lj
	zmJuu0DUjZmOz9vP4KKyK1qD1dHVc02KPFpiHuV93ofdrqE=
X-Google-Smtp-Source: ABdhPJx0gp+iECxKT9ykZETUvXaLQbuTGBuyoZK77MuHKvayxVhDPDQJOaL0JFq8BB7ZbujGGqJ5Q5ejru2iZ5C/F6o=
X-Received: by 2002:a67:6686:: with SMTP id a128mr5778238vsc.83.1591863276759;
 Thu, 11 Jun 2020 01:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200609071549.350578-1-mingli.yu@windriver.com>
 <CANNYZj9AZ7HS2ufOhWbEpDknD87Bp84nQNVe1kGBFdBffRP_tg@mail.gmail.com>
 <20200609215055.GV17660@denix.org> <f2a20c42-f0b6-4387-b877-90344f90a627@windriver.com>
 <CANNYZj_YwkQeLNW1VHAhOJXkgyXDW6XcfyM-N4zcrRdp3fJZ7w@mail.gmail.com> <fe6bf251-571e-a5ed-53f9-e150f7407b13@windriver.com>
In-Reply-To: <fe6bf251-571e-a5ed-53f9-e150f7407b13@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 11 Jun 2020 10:14:25 +0200
Message-ID: <CANNYZj9Ng7mr3-Ca7dNATFeyh7q3odoc+tzyizM9G9dZt07wrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] virglrenderer: correct REQUIRED_DISTRO_FEATURES
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Denys Dmytriyenko <denis@denix.org>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002471a005a7ca8da7"

--0000000000002471a005a7ca8da7
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jun 2020 at 09:22, Yu, Mingli <mingli.yu@windriver.com> wrote:

> > This is not an error, but expected behavior. virglrenderer-native only
> > works when opengl is in DISTRO_FEATURES and should be skipped otherwise.
>
> Does it mean the DISTRO_FEATURES setting also affects the native build?
> If so, please ignore this patch.
>

By default it does not, but for specific items listed in bitbake.conf it
does:

# Normally target distro features will not be applied to native builds:
# Native distro features on this list will use the target feature value
DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"

Alex

--0000000000002471a005a7ca8da7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 11 Jun 2020 at 09:22, Yu, Mingli =
&lt;<a href=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">&gt; This is not an error, but expected behavior. vir=
glrenderer-native only <br>
&gt; works when opengl is in DISTRO_FEATURES and should be skipped otherwis=
e.<br>
<br>
Does it mean the DISTRO_FEATURES setting also affects the native build? <br=
>
If so, please ignore this patch.<br></blockquote><div><br></div><div>By def=
ault it does not, but for specific items listed in bitbake.conf it does:</d=
iv><div><br></div><div># Normally target distro features will not be applie=
d to native builds:<br># Native distro features on this list will use the t=
arget feature value<br>DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documen=
tation opengl&quot;<br>DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-docu=
mentation opengl&quot;</div><div><br></div><div>Alex<br> </div></div></div>

--0000000000002471a005a7ca8da7--
