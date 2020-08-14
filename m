Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.14414.1597396801935687038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 02:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dpp4tCUt;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id k8so7350338wma.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=68YzhWw86HQs7lv6+dWTAn7yR3k6hTUgnGqYttmIfMw=;
        b=dpp4tCUttsQdR7cngToQ0Azt5+FbUZcdptYrD97BhrB2QhuFipT7ZDZEB+82qebdkm
         iRGi4baMnQSM39YHu1QM3dsrhne09iqMz7UxN/VaiE4FX4zDJVSpzTMrNVa/NjpCDhPb
         8kvG4jWsSWXZ3VxRzHaqXSlnQ0hfv0Xb3bCAy++ZyN4/VT5kn9gyudXftV/gPyav/V6x
         WjmZupFIeNAZVfL4Ce/feWL/mtYOkhPKabXxRNqiMFk8Ueav0qpBqbvGqSErZ0IVc/Y+
         5tILM7eir6V0ng5KIXEtJBDa2JPpoJw1Mr8R2gPworSr/F7Rvo8LdIGWQSqzXot1z+yw
         Tp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=68YzhWw86HQs7lv6+dWTAn7yR3k6hTUgnGqYttmIfMw=;
        b=dvRyE9t6UpB7c+rswGkuprv25MGUgqoVdVLxuQ8+FMTLd+EyZejtLy1Fd+tJfvOJMv
         kSXxQxhIlxtjPsMdprrF35GiEsgsDpBLVsdyIfjalqsQ+FnTR9spWv2j5gcrkCdYO6KY
         7Bup8cXne5CG02SeGIfVjQN7LMASPtjh++cVkusWqEtB5DL9PnilKFtgTjzjeR09VF3G
         TXeQTyeocorXM96TTmOO1lXAZkVa7dOfxIqLQn87wsehkoXbNQdlcyp6rKGdcNHg7d01
         lBTosJ0etUm2YxsReswPhJtSt/8iULQ3XE/sTxdSUcrlOFhpnPl63YXwmM6nsOGOzh1s
         xfHQ==
X-Gm-Message-State: AOAM533Z8R0NX7uhNdlJHWYe23R+07a0UhbHWiIbMjybpIq2Ji2jjYSm
	W65Psx8GSnRR1ezHj1yKZf71wWMOKJTDdHHNCws=
X-Google-Smtp-Source: ABdhPJzPM6zWwQKUOiLIIG3p2c7t5Ugz02eMrzPme52F0hAxqFOvZ8VG64Io2YRyxC2sJ55fbSsZ+7oL8uoWNE9wzDY=
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr1716511wmj.153.1597396800355;
 Fri, 14 Aug 2020 02:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200813102117.8726-1-liu.ming50@gmail.com> <20200813102117.8726-3-liu.ming50@gmail.com>
 <20200813190527.GA30737@localhost> <CALatG=7KcQ-wqCVOsLD6_1CfM1F8ibR3RcTm2_G7QRgewh6HbA@mail.gmail.com>
 <CALatG=7qEqtQZVoEHu=YAWujafJNtpAt1tR5NtKJoKecM6RFEA@mail.gmail.com> <defd0b2cb4166a058da0cd779c443b26e44baffb.camel@linuxfoundation.org>
In-Reply-To: <defd0b2cb4166a058da0cd779c443b26e44baffb.camel@linuxfoundation.org>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Fri, 14 Aug 2020 11:19:50 +0200
Message-ID: <CALatG=4viVOz5OYtO0qJKu=3LhnV1Myom2raBBkv_8JG2_2vqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Adrian Bunk <bunk@stusta.de>, OE-core <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000d9bffe05acd2ec4f"

--000000000000d9bffe05acd2ec4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got that, will make a V3 dropping PV definition and _git version suffix
from recipe.

//Ming Liu

Richard Purdie <richard.purdie@linuxfoundation.org> =E6=96=BC 2020=E5=B9=B4=
8=E6=9C=8814=E6=97=A5 =E9=80=B1=E4=BA=94
=E4=B8=8A=E5=8D=8811:04=E5=AF=AB=E9=81=93=EF=BC=9A

> On Fri, 2020-08-14 at 10:16 +0200, Ming Liu wrote:
> > @Adrian Bunk Sorry, just double checked your comment, are you sure
> > "PV =3D 0.3" without git+SRCPV is a right way to go? This seems is not
> > like all other git recipes.
>
> Adrian is correct, if this is 0.3, PV should be 0.3. The addition of
> SRCPV is only appropriate if it is some number of git commits past the
> 0.3 release.
>
> Cheers,
>
> Richard
>
>

--000000000000d9bffe05acd2ec4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got that, will make a V3 dropping PV definition and _git v=
ersion suffix from recipe.<div><br></div><div>//Ming Liu</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; =E6=96=BC 2020=E5=B9=B48=E6=9C=8814=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8811:04=E5=AF=AB=E9=81=93=EF=BC=9A<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2020-08-14 at=
 10:16 +0200, Ming Liu wrote:<br>
&gt; @Adrian Bunk Sorry, just double checked your comment, are you sure<br>
&gt; &quot;PV =3D 0.3&quot; without git+SRCPV is a right way to go? This se=
ems is not<br>
&gt; like all other git recipes.<br>
<br>
Adrian is correct, if this is 0.3, PV should be 0.3. The addition of<br>
SRCPV is only appropriate if it is some number of git commits past the<br>
0.3 release.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000d9bffe05acd2ec4f--
