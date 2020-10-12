Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.7308.1602531924526977887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q5XIipfz;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id w12so5764033uao.12
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ixc9y6Yg10kFrUuPG3oQsx0aSSHb1PWK+zG5kbSQwHE=;
        b=Q5XIipfzDOHol7X2+oNaE0/RnnDPre7j/RuvoUlaqQqofLIjvMXx9QAS/DxS7kgCXF
         V3yZRSIuHkw6h8Dd8T2tztyOgutBO5mAqKW+ULFspr1kYSZGrp24LjccvkL+7P6h5hxH
         Zm0kTNda2X5vL+O3RS8gp4hsQzxqVnGaZ8E7uHevytjh9/VIO1JPDpTBWpXIjGpgsmpF
         NixHwvAqrOmzf2ZtXVYOJzSXSMYLcDOGNMJRsr8bMbD4lOMqmtj6sDcxnRlWCAIVun8G
         nMItmLKRaCABPoojs1DCBKLcKRD89gCOOsq4BI7uYnBejtJTM8k2a2uMSRmNrUiBtejI
         3RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ixc9y6Yg10kFrUuPG3oQsx0aSSHb1PWK+zG5kbSQwHE=;
        b=t3D8nOt3XPE2P6MvzZYzUhtvB9410OxkuYGOvMgUrXUwR2Nzdj+MVHhGL6oD75aU+i
         53eCQpPAUEek9kLtAxPSDdv7uzgu80sXrvHXi71p2KBqQuh4P5EHmhzmVTzpOrFAqCRW
         tvgfSr5/ZX4IYTuLvwCT5lTvAml8cgmDMDFehcSsfR8J4MK5H2GbTE8d5QruY3p+geOR
         FabYzqBJj2ssbubY6aTXhCGHhAh8i6qCmNOR6/wZPcXOsf0REzuwRixs2tvWil3SyJ3x
         ZQqa3mAEl9890qyUJofugdLnGQmm5d5GVWzVeOyrMdxu758FgweD401nuBxxIFKxzEoL
         9THg==
X-Gm-Message-State: AOAM532C2npkRxf04ND5f73KiUAruVRqexOYJ0tMCywV7AqDbBh82F0T
	aJp/tXrcm9BUcsh+DnWeOZKiaUel1+C9ejQflGo=
X-Google-Smtp-Source: ABdhPJxwSL3//Ilez8Z2uO7TVEe6osLGg3aygzYrspf7ArVRkCFh5/AXMJprDideXBFX8SgnKJ2+6zU7fce6t6y4ykw=
X-Received: by 2002:ab0:7143:: with SMTP id k3mr14160984uao.93.1602531923701;
 Mon, 12 Oct 2020 12:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
 <20201012123620.2095778-5-quaresma.jose@gmail.com> <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
 <CANPvuRmb_GnG0R2+6zRHxWJG0Hu4cAYD_6kKEyZRp+05+9E8Mw@mail.gmail.com>
 <CANNYZj-w+S4Zk0Vjav6KABUNwX3a=jCjDznHDHBch6sLOXpJnA@mail.gmail.com>
 <CAHtQpK5hq5dZVwwwxUq3hvgQ3zUfAibx5Qboh6Ju7VvxWA+n2Q@mail.gmail.com>
 <CANNYZj9Mr1VLAY5=ubgdYO08KWWUTPfd50CMqT-jcvZ44rPtMw@mail.gmail.com> <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
In-Reply-To: <CAHtQpK7T7rqfACB7MSnTh701yPbPy2B51Em924-FueriejFXOA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 21:45:11 +0200
Message-ID: <CANNYZj_AqswY3JJnVu=vtNQPdgfd=tbE89WgRD4Fxm1O=msFFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000db4cc05b17e8ae6"

--0000000000000db4cc05b17e8ae6
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

>
> What I meant to point out was - there is a dependency in Vulkan on
> glslang, irrespective whether it is compiled standalone or as a
> dependency of another package. I believe this Vulkan <- glslang
> dependency should be solved first before Vulkan can be included
> anywhere further.
>
> As I know, it is currently solved locally in meta-freescale-distro
> layer, hence it was my question on whether it should be moved to
> OE-Core to solve the Vulkan dependency altogether?
>

Can you please point to where glslang is used in the vulkan source tree? Is
it something recently added, as vulkan bits and examples have been building
fine without it in oe-core?

Alex

--0000000000000db4cc05b17e8ae6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 12 Oct 2020 at 20:20, Andrey Zhizhikin &lt;<a href=3D"mailto=
:andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><br>
What I meant to point out was - there is a dependency in Vulkan on<br>
glslang, irrespective whether it is compiled standalone or as a<br>
dependency of another package. I believe this Vulkan &lt;- glslang<br>
dependency should be solved first before Vulkan can be included<br>
anywhere further.<br>
<br>
As I know, it is currently solved locally in meta-freescale-distro<br>
layer, hence it was my question on whether it should be moved to<br>
OE-Core to solve the Vulkan dependency altogether?<br></blockquote><div><br=
></div><div>Can you please point to where glslang is used in the vulkan sou=
rce tree? Is it something recently added, as vulkan bits and examples have =
been building fine without it in oe-core?</div><div><br></div><div>Alex<br>=
</div></div></div>

--0000000000000db4cc05b17e8ae6--
