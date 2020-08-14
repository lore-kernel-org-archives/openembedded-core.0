Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.13803.1597392976158762344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 01:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t5NNtJiK;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id k20so7193255wmi.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RQQtaMjWQ32ayRjPkYwTvo3WXQeOo8yya7cTPLDFxnY=;
        b=t5NNtJiKJfJQl2MyUlyImXKkwAcXhepQ9NYCC6rEu4623Q7qjp6STSYhhISB1Kwf2W
         wPR/HZLbRwRlxOpxgECFQ9zSfvNQn8YxYL4ZKF+Qo7B9TQiyP3rW+oCfvyaRDeJdCyEX
         khyFCEj9+mlev4sr1a6gnHZsg2t+Bb9FDD4bOpIEmltKDU1kZWiqNoZZ9Iiu7nCLYT5+
         aLM/pen01AZCvpgPzrIE4531HzVtX9DgIGj/umst9iEKbCziLSQHQHveKWwMQrR76ZeT
         m/vujAyto93Fo7sJzi6YjeUgKb1Ch929dNXBlclkb50zOMODVFO6jjpKC/8OjS6rEAQ0
         +6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RQQtaMjWQ32ayRjPkYwTvo3WXQeOo8yya7cTPLDFxnY=;
        b=tlDyfugHYZoXL5xEFnU8dt1OxLeorQRE22om/p5fbdZOOud6iP4hBzqjhsGouv6La0
         C+3L3f7XoPPwajXuq4+e2I2wLlOHcRKdpEXlaMZoPAYTMlwp1Thlm5nnD2j+BLfP5461
         BOLT16V1AI5ZbVK4dxGkwZyrSOiIEa0BDWTWfThmDdZtW1jjoaTnGQaJGgRGC+BbwqPD
         qG4A9V9/fCDFlc1eceSL7CKi3wAoWySrBnLkvpqVDeNOzR8owI0Abep5JeI7rFRXrMQr
         WGTjX7WEPmQPRoFpV0HPcFovYYx9QyT4AywaQH7uq2JbYYgtOJKSVcqV78qp7/MymdRy
         9Nlg==
X-Gm-Message-State: AOAM533k4IvaFtN+MjU4PlfS4yD1l3SrNEfDHiqMzd8a7khFa0Uz1q71
	fEhSVwn2lAIRAJnJMd2n/v8NyDJlSdSGjimVaYY=
X-Google-Smtp-Source: ABdhPJxoDzH8gg3mhK6yKDAevfRRAOI1bqponPgDMXm3TlwScpMixFzr70Xgqw+2Ol/ddkGvgR0QMomrhI26n8wxn3Q=
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr1488966wmj.153.1597392974586;
 Fri, 14 Aug 2020 01:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200813102117.8726-1-liu.ming50@gmail.com> <20200813102117.8726-3-liu.ming50@gmail.com>
 <20200813190527.GA30737@localhost> <CALatG=7KcQ-wqCVOsLD6_1CfM1F8ibR3RcTm2_G7QRgewh6HbA@mail.gmail.com>
In-Reply-To: <CALatG=7KcQ-wqCVOsLD6_1CfM1F8ibR3RcTm2_G7QRgewh6HbA@mail.gmail.com>
From: "Ming Liu" <liu.ming50@gmail.com>
Date: Fri, 14 Aug 2020 10:16:04 +0200
Message-ID: <CALatG=7qEqtQZVoEHu=YAWujafJNtpAt1tR5NtKJoKecM6RFEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, sergio.prado@toradex.com, 
	Max Krummenacher <max.krummenacher@toradex.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000d1287305acd2086d"

--000000000000d1287305acd2086d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Adrian Bunk <bunk@stusta.de> Sorry, just double checked your comment, are
you sure "PV =3D 0.3" without git+SRCPV is a right way to go? This seems is
not like all other git recipes.

//Ming Liu

Ming Liu <liu.ming50@gmail.com> =E6=96=BC 2020=E5=B9=B48=E6=9C=8814=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:09=E5=AF=AB=E9=81=93=EF=BC=9A

> OK, will change back to 0.3 recipe in V3.
>
> //Ming Liu
>
> Adrian Bunk <bunk@stusta.de> =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=97=A5=
 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> On Thu, Aug 13, 2020 at 12:21:17PM +0200, Ming Liu wrote:
>> >...
>> > -PV =3D "0.2+git${SRCPV}"
>> > +PV =3D "0.3+git${SRCPV}"
>> >  SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps"
>> > -SRCREV =3D "86bd30a14e153a18f670b25708795253d8736f0f"
>> > +SRCREV =3D "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>> >...
>>
>> This is exactly the 0.3 release, so PV should be
>>   PV =3D "0.3"
>>
>> cu
>> Adrian
>>
>

--000000000000d1287305acd2086d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:bunk@stusta.de" tabindex=3D"-1">@Adrian Bunk</a>=C2=A0Sorry, jus=
t double checked your comment, are you sure &quot;PV =3D 0.3&quot; without =
git+SRCPV is a right way to go? This seems is not like all other git recipe=
s.<br><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Ming Liu &lt;<a href=3D"mailto:li=
u.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; =E6=96=BC 2020=E5=B9=B48=
=E6=9C=8814=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:09=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">OK, will change back to 0.3 recipe in V3.<div><br></div><d=
iv>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=
=3D"_blank">bunk@stusta.de</a>&gt; =E6=96=BC 2020=E5=B9=B48=E6=9C=8813=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 13,=
 2020 at 12:21:17PM +0200, Ming Liu wrote:<br>
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
</blockquote></div>

--000000000000d1287305acd2086d--
