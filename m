Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.5240.1612963610467546538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 05:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=j3cfG63W;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.42, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f42.google.com with SMTP id a1so763051qvd.13
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=IlhHhSFsk5c9TTCFold6hqzw3016kgx9q9dH1GdhhGg=;
        b=j3cfG63WsZMDdkF93oE+Bf1+qYxTrgTwBV1e3M2QRPYHoGOFBKln6znLqCz0UFhQIQ
         AXqHYBU8CD9YsfDA7YpNy+1bx/3PaRgZM3L8ky02LGCoIGAYkdwswq5sFSTMDOyUqSEd
         Wg6piI+d8XoKARZ0U6UPP68+XeSoObZL3P+sNS7WxeOVVXjPBdnAN93PSWEsqAHIIU4s
         D54Nzc38pvjQsjAVD+IqA5HJXImU3LrpKicZB9+92PvFin1Pqbiwj6Rh2+SfFpajwqTV
         jfZTjjtY4uCExyh917hxGwTudPkuCh0lwzM+tmYWMm4JMFp3jciZ30C3A2l6nUy9vpQD
         sBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=IlhHhSFsk5c9TTCFold6hqzw3016kgx9q9dH1GdhhGg=;
        b=HaCL5UmlBVr2XNHg6z4+LxMPMIWdFtH+btSXxHCQgLydITGDThjHd2MMjvgyayjsfY
         s6LGRE+cLR8CkBhZOEG9vm72PT5mIrfXctj5U/Xqx7Xp51kaKcaldA9PcFQTOR7ZyqFF
         xg4HJWSWDPi8VHMcrgVILimj8Hk9yFX1ju/fRJMQEf+X31YU3gaEcF16Ug9zpcP9WYrg
         3vDGATnqQNLwBWen9zP4BpMOBHE05ajBxx2ASBP4OMtcsEItqT5RPw/caUb22b1Xm/KK
         7v2xsAjxkpGlO17smGiB6cyen/0a4ugB89UrQfUKgyB4s7kfGW7wC+txF9omw3q7Z4Bo
         lrsg==
X-Gm-Message-State: AOAM533h/J6YrLgki95tQMp1PcIODfkFMOjDg7HtNe3k4BNWOzCzBF2F
	G0klryMkNbmTLav8kBcOAvoTxlGchAIvoxrk
X-Google-Smtp-Source: ABdhPJwSsBf162Yx1QuuoYyHvWaTE12ppp6m7/unWDJV4+v6LY3rdYhhvBJd0o8aLPxNFMBXBFIcuQ==
X-Received: by 2002:a05:6214:bce:: with SMTP id ff14mr2535137qvb.26.1612963609309;
        Wed, 10 Feb 2021 05:26:49 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id o1sm1231334qtq.81.2021.02.10.05.26.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 05:26:48 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f179.google.com with SMTP id r77so1511789qka.12
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 05:26:48 -0800 (PST)
X-Received: by 2002:a05:620a:10b0:: with SMTP id h16mr3301593qkk.197.1612963608689;
 Wed, 10 Feb 2021 05:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com>
In-Reply-To: <20210210111113.17318-1-raymsmithuk@gmail.com>
Date: Wed, 10 Feb 2021 10:26:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
Message-ID: <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Ray Smith <raymsmithuk@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ee812105bafb5acd"

--000000000000ee812105bafb5acd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 10 de fev. de 2021 =C3=A0s 08:12, Ray Smith <raymsmithuk@gmail.com=
>
escreveu:

> (Note that currently mesa internally requires OpenGL support to be
> built in order for OpenGL ES support to be built, but this is a
> detail internal to mesa that should not be exposed to the wider
> build)
>

I didn't understand what you mean here. Could you elaborate this?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000ee812105bafb5acd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 10 de fev. de 2021 =C3=A0s 0=
8:12, Ray Smith &lt;<a href=3D"mailto:raymsmithuk@gmail.com">raymsmithuk@gm=
ail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">(Note that currently mesa internally requires OpenGL support to =
be<br>
built in order for OpenGL ES support to be built, but this is a<br>
detail internal to mesa that should not be exposed to the wider<br>
build)<br>
</blockquote></div><div><br></div><div>I didn&#39;t understand what you mea=
n here. Could you elaborate this?<br></div><br>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems=
<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.os=
systems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossyst=
ems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +=
55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-=
9750</div></div>

--000000000000ee812105bafb5acd--
