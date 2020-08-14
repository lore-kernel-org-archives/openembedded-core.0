Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.13728.1597392561095361288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 01:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MdwhGDFU;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: liu.ming50@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id f12so7530710wru.13
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0H96kA3nZbfI+y+ciNRDPz+rqSg2uvOkVf1iB6cFS0=;
        b=MdwhGDFUr4w3y3FbuoMPbYmp+qhe9cNRn9cGkk1XzJHYsEi9InUQCXAHHVD13Fu9Si
         2I94cEs/DHFVt7sHkKPmif0bqZQSq3Cbja7ruovi5AvhLsh5Z8W5eSsnUcqR1ZngTS1i
         1wWo1DiZp8yJ8fpir9n1sIWqDtCDi9vA4l+G+z+GwXtcwdzCky0JYW5yHuZ49MYMRAoN
         pXZC0Dv8unYD1gcg+YQtwavc+xhbcCgbRcOLY9CYqhayKFGAyPQb6XCYjPR6b1etZGq1
         0j7XmRnStY8TL4V1/1pbLkT7SIRl9E2LIOEz162goi0gGd6YBwe5OA/VlD5aDiFGiUmm
         396g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0H96kA3nZbfI+y+ciNRDPz+rqSg2uvOkVf1iB6cFS0=;
        b=HLMhGNOEcS0pBtf/zHOkDupA2qf3lI33TBZ8A4mCgHeE6ZNCq7eFI39AYgRjb0NKUH
         0sQZcE7BwGCiBXgIMecyqVO/1FfKpMgmohUlxYnYUJyeF9GgfrtRuA4G87MwQI4dTpSm
         PpNPXMcpcvLbuybFVD7C82uuvWM0XH2cOvpLpv/znDfb8+2LSyjZq8v/nk66FCWQ4cnP
         hK1vjXe6IMhmSBgGZjZk6XCq3eWPsxOtgufbSYo7aKy0RUZZ3Ci8gA6bsbre/qRb5bmr
         zXtv6IfXyffLDb7my4q/nH6hI/rqzE0S0CYDFKURmoFva/tNztK2Iy2D6QRh1fQV3iD2
         +aww==
X-Gm-Message-State: AOAM533btZxk1BMuex1bjcsUE85BwMTm0BArqHDO4JDdOnUlz030SbHb
	JQQwbNqY7NmmOlgfvVjCfteQ0DxZaBIlZoiPGtLv7xLZnDc=
X-Google-Smtp-Source: ABdhPJwilzI8EisCUJOZ1omGPeHxag2Tf8ByalUGT/Qgx0+kmTLth/q0CpvzwZR4ERow3V0Z5ynaumf2adQ/Tq0LsH0=
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr1592091wrs.216.1597392559728;
 Fri, 14 Aug 2020 01:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200813102117.8726-1-liu.ming50@gmail.com> <20200813102117.8726-3-liu.ming50@gmail.com>
 <20200813190527.GA30737@localhost>
In-Reply-To: <20200813190527.GA30737@localhost>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Fri, 14 Aug 2020 10:09:09 +0200
Message-ID: <CALatG=7KcQ-wqCVOsLD6_1CfM1F8ibR3RcTm2_G7QRgewh6HbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000016ed9905acd1f06d"

--00000000000016ed9905acd1f06d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, will change back to 0.3 recipe in V3.

//Ming Liu

Adrian Bunk <bunk@stusta.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A

> On Thu, Aug 13, 2020 at 12:21:17PM +0200, Ming Liu wrote:
> >...
> > -PV =3D "0.2+git${SRCPV}"
> > +PV =3D "0.3+git${SRCPV}"
> >  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
> > -SRCREV =3D "86bd30a14e153a18f670b25708795253d8736f0f"
> > +SRCREV =3D "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
> >...
>
> This is exactly the 0.3 release, so PV should be
>   PV =3D "0.3"
>
> cu
> Adrian
>

--00000000000016ed9905acd1f06d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, will change back to 0.3 recipe in V3.<div><br></div><d=
iv>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@s=
tusta.de</a>&gt; =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=
=9B=9B =E4=B8=8B=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 13, 2020 at 12:21:17PM=
 +0200, Ming Liu wrote:<br>
&gt;...<br>
&gt; -PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt; +PV =3D &quot;0.3+git${SRCPV}&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/sbabic/libu=
bootenv;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/s=
babic/libubootenv;protocol=3Dhttps</a>&quot;<br>
&gt; -SRCREV =3D &quot;86bd30a14e153a18f670b25708795253d8736f0f&quot;<br>
&gt; +SRCREV =3D &quot;ad253cfdb07c8492f2ee46a52fbc607ad0b96414&quot;<br>
&gt;...<br>
<br>
This is exactly the 0.3 release, so PV should be<br>
=C2=A0 PV =3D &quot;0.3&quot;<br>
<br>
cu<br>
Adrian<br>
</blockquote></div>

--00000000000016ed9905acd1f06d--
