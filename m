Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
 by mx.groups.io with SMTP id smtpd.web10.34483.1591009255540318992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 04:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SE/Zemhw;
 spf=pass (domain: gmail.com, ip: 209.85.221.195, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f195.google.com with SMTP id n22so963659vkm.7
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HLuUmGPNMo0/wr7cgugLBwPe5j1SnFA3ph8U/g0c8DQ=;
        b=SE/ZemhwrWSjOYWGZFNnlSw70+z4RxOvrW82oILWD2FyTXA5iKvXhkXoxRWWWVNpmM
         lWxLvIpBcPu+qNI3jkFcQEMbM4bkYg5Y9q1VPMD3w196XujvBqLpvzmQcZfMUnMh7gAO
         floGU3z7Bl3LC8cC/7V7LNx7OxgQiHCJi7I+vsvI/CXNnJhWiuz3LK9Umk4mcjiYcVWZ
         obISrs6IYCoRjE2/Q7ke8Xxfbag4Vojyasfk+T1FmEmxNmcDZ+DBCszd1qrkciIRlOHi
         9RlWsLuLHUnHh1viyREedmsY9Oc3/yOAhAO2REIe+GrF8Zj+y/FbhQT7M3sHUW0RTr20
         C3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HLuUmGPNMo0/wr7cgugLBwPe5j1SnFA3ph8U/g0c8DQ=;
        b=EXiE9HX4ydDixFukFNh9BPZaNAf7eiPZDnY8WKKVo3A4+GNNsIjGFKzAdS8bOnuTBj
         U8MiUjWkoJA0uoaF4Ngu3KR5m+ogIR+FZX21DRGq+41XHbmarPyE2QmV1zwboXqghrXy
         ytVlWyiXA2COBSSilmRR2rk92RdTGBsSFnWsroyYF0b/Z3UrkGHvHmHQQKS0tbJR67Sy
         nilnmauNaVWE9g7jByOHCa4ZEmr+xtnllZk3PWLuXn0nYKiHDjXeM5TvPaHX/BWBgxiW
         NqhJpiKXPKkeO/8WI5yfM6QbMywhiKalSkO0lA9ZmDKz9BUHtosAaqtvAkDRcYHWhRL1
         K2RQ==
X-Gm-Message-State: AOAM531VI5ueA7JqgAzsJag9YsHaSQd4bSEyabsejZppK9h7wz9pfHI3
	6F4TA76uxwiQx7J89Hb5/ATUED3WjclhbAroL+L7+Q==
X-Google-Smtp-Source: ABdhPJwgpWyEyA3e2vXwSgQ77g/cQkqXnJ0Uwa+4IVQ33sg8v6viVwKwQUuEDhGzyhqesu7Ukg5DTcDFKVJTCjmUC7E=
X-Received: by 2002:a1f:1bd6:: with SMTP id b205mr8747780vkb.29.1591009254670;
 Mon, 01 Jun 2020 04:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-46-alex.kanavin@gmail.com> <20200531164305.GC12011@localhost>
In-Reply-To: <20200531164305.GC12011@localhost>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2020 13:00:43 +0200
Message-ID: <CANNYZj9gNMhQx0qcaj7tFCL+fC-kQkZ77oZ1-Capdsxbo93t4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 46/70] rng-tools: upgrade 6.9 -> 6.10
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000075849805a703b560"

--00000000000075849805a703b560
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 May 2020 at 18:43, Adrian Bunk <bunk@stusta.de> wrote:

> On Sun, May 31, 2020 at 05:52:30PM +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...d9ce64f132e463b9091d0536913ddaf11516.patch | 42 +++++++++++++++
> >  ...6a5fd4efde8ef569b358e19b1fcbc7d0d938.patch | 51 +++++++++++++++++++
> >...
>
> Please use "git format-patch" for creating meaningful filenames.
>

The filenames are this way because I downloaded both directly from github
upstream, to use as backports. So they will disappear in due time.

Alex

--00000000000075849805a703b560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 31 May 2020 at 18:43, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Sun, May 31, 2020 at 05:52:30PM +0200, Alexander =
Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...d9ce64f132e463b9091d0536913ddaf11516.patch | 42 +++++++++++++=
++<br>
&gt;=C2=A0 ...6a5fd4efde8ef569b358e19b1fcbc7d0d938.patch | 51 +++++++++++++=
++++++<br>
&gt;...<br>
<br>
Please use &quot;git format-patch&quot; for creating meaningful filenames.<=
br></blockquote><div><br></div><div>The filenames are this way because I do=
wnloaded both directly from github upstream, to use as backports. So they w=
ill disappear in due time. <br></div><div><br></div><div>Alex<br></div></di=
v></div>

--00000000000075849805a703b560--
