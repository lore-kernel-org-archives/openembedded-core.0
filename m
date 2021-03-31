Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web12.6853.1617198256849456204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 06:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nAutPd56;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id u29so6779497vsi.12
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhkLRL2tCYGZiYCjP/njsKDVxrRZc1aiWPIPngoM40w=;
        b=nAutPd56I23DvBUWGpXjGPOrQQ0xlXrrKgCkDsG4slYMrnzMW5LtjTloMmmNM6OVUt
         gTmo9x5z1fXL8zatK2GDLtcCwGEhXJ+SYbEnbR7XFT0ygx+sTXolbpM47jvlco1SZrRC
         eiD2lIhranKgUnra1SxlfnJSg5rZv+gWfapsaPmU100BeC2eOyi5rU0Mx/l326QdhZTv
         xUmcovx+r570j4qVW/UdSw99afFlAczJmhWjH+WrNSrs6umYtyGb9EJvtevssPv2Yd64
         fczLaA6bK5QaRsUUWtoL0CM+xyBp5bxAV5O1GFfcIfXwPzW7vinb1SQiSa68H+AXyZF5
         tnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhkLRL2tCYGZiYCjP/njsKDVxrRZc1aiWPIPngoM40w=;
        b=RRQFKeWVDeV2/FEszlT3jzh6HK+p0h510hDI5IJkwAF1gvzU3VrjV3EqhSLaMf9zUM
         n6YfYEuG6yNCnywRQmVQQvbOIcIwjTxqdcCsBgcFDD4Eub5VMegjMQroULqiOGBcss5h
         Ohc1NMVjF0BSF/I1i5DWGvT5Ba9upzkkhljV6ZEZJLFfHdPuXG7YimziCpsemIH+CqnX
         ca/fV6uA9be/i4Q2hsGuzX8kvQqKxPq0xQvUV6q+ee0SqVfzIk4QYMcednLpt6gdo8fb
         oC3OwNYJhCOH4uIJzO9DfsvI9lJzjKCalU9lKOTn2ut466fkz1AcxLQtut9rRBDdvYnd
         Zb9Q==
X-Gm-Message-State: AOAM533JwYsiyNnfmwYKlX9BkY+3xk/eM3fp+3/ay9vc7XIcxiiIB8ch
	2+w5REnKJFRg3MM3ttT4XGliZADexirUnLBEX7c=
X-Google-Smtp-Source: ABdhPJzTW0BoPBThDTzUyvTnyN2fs5agoql6g41SfTvNtH3QAjbbUZcB0PlQlRxxNKyvMP6ixaC0ySCNBj6KAHfmi7U=
X-Received: by 2002:a67:1447:: with SMTP id 68mr1491001vsu.20.1617198256089;
 Wed, 31 Mar 2021 06:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210331122254.121192-1-alex.kanavin@gmail.com> <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
In-Reply-To: <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 31 Mar 2021 15:44:04 +0200
Message-ID: <CANNYZj-+v62b4Gq9UNq0EzZnqzRxY0ztr4hZjKTfw6eYYKLLuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="00000000000095edb305bed54f49"

--00000000000095edb305bed54f49
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Mar 2021 at 15:05, Martin Jansa <martin.jansa@gmail.com> wrote:

> Are you going to fix meta-gl issue with swrast still in DRIDRIVERS
> reported on previous upgrade?
>
> https://lists.openembedded.org/g/openembedded-core/message/149775
>
> https://lists.openembedded.org/g/openembedded-core/message/149779
> I don't know what exactly AB builds, but it's easy to reproduce locally,
> something like:
> DISTRO_FEATURES_remove = "x11"
> PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> bitbake mesa-gl
> should be enough to see build failure.
>

I'd rather Ross do it, as mesa-gl is 'his' recipe.

Alex

--00000000000095edb305bed54f49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 31 Mar 2021 at 15:05, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Are you going t=
o fix meta-gl issue with swrast still in DRIDRIVERS reported on previous up=
grade?<div><br></div><div><a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/message/149775" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/149775</a><br></div><div><br></div><div><a h=
ref=3D"https://lists.openembedded.org/g/openembedded-core/message/149779" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message=
/149779</a><br></div><div>I don&#39;t know what exactly AB builds, but it&#=
39;s easy to reproduce locally, something like:</div><div>DISTRO_FEATURES_r=
emove =3D &quot;x11&quot;<br>PREFERRED_PROVIDER_virtual/libgl =3D &quot;mes=
a-gl&quot;<br>PREFERRED_PROVIDER_virtual/mesa =3D &quot;mesa-gl&quot;<br></=
div><div>bitbake mesa-gl</div><div>should be enough to see build failure.</=
div></div></blockquote><div><br></div><div>I&#39;d rather Ross do it, as me=
sa-gl is &#39;his&#39; recipe. <br></div><div><br></div><div>Alex<br></div>=
</div></div>

--00000000000095edb305bed54f49--
