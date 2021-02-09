Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.12107.1612885383220665793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=RGHhh/bO;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id y9so32320738ejp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jmS6gFi5ORbqhcpWkT6KlDpHKHkjeIpLOvwUwPyjpnc=;
        b=RGHhh/bOcfhMU7UOlgXEEiQmOb8nppERRFwZe3CFXltcBb//U/nctCct0UQ8IpRD1Y
         oEIc4JSC7UFM0gsHDAneRjHlpnnvOPHqQOcTMnh4fwrtM88+BRXiwiDZIkIH+6ZsCxVz
         eC0uwt3j8X5fIIpU30q9Z38bWgToKAP0HKtB1AWVDCtrN43h88NxrtNeTIL2ACaF/NYm
         ssJyONPhLNFZ0SB+ggH8Dfq7TgXWjWC4/WiIiJKJ0OqCijZXR+g+2XmcUxaESzSAg9Aq
         ICe2pxMD55PI/yLbuVTN1QLx5dESoZEa5ehOrY7A1V7KjjKV/CQiV/0ZrIxHWAjnCVeR
         pR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jmS6gFi5ORbqhcpWkT6KlDpHKHkjeIpLOvwUwPyjpnc=;
        b=BdOIM07Z4rM3CgaHlOmJiE0W0sBoA6tuXpmmi29N8NyLN/Al8N2u6HRAlthmCGksWw
         mG1sVoCFpZWOt644XvT50jsw1pDnYorsQy8PwNR2rgM23LwnRI4rNwSd5corT7qu35cn
         6aHc5ZPQLe1wTrwsLTHYoB+u/lECnIE3b4U+/zxQwQObTqE6VoLJcDLULT7nZ7/PvbEo
         zMR9Sbdrb40qwz04KM/AGLg8jeTFbxpggyyoTKz6aTx/PfSLBHPieaiQoyF2guBryR7B
         dVG1fEMo/1yGxWTDzBZvT/PqKsSbEfI6L537siodmQlSQnJrdBygyjoz4ZX81tRDEen+
         2xfg==
X-Gm-Message-State: AOAM533cB+0cEdRNI+9oR4wLxpSKr/Yl86uhS6e7h2aGZ6oQf4Rt5jO5
	KOnEaO69Km1iVo39k3lwWGP9HD1vjUAbmWgqF2lT9g==
X-Google-Smtp-Source: ABdhPJxmevvTlmX3jkYOOnLhXmLho9PL22hagzdQknCCZXsWXJPwhegywAkL74QheunYGFrVL5lN+hhyPoH8QIXBVaM=
X-Received: by 2002:a17:907:1181:: with SMTP id uz1mr23466158ejb.60.1612885381800;
 Tue, 09 Feb 2021 07:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20210208180747.12546-1-yoann.congal@smile.fr> <CA+chaQfTpihqNma3-_aNNwZJRyMa0aqMuqkq7y4HhbmUFt_dGQ@mail.gmail.com>
In-Reply-To: <CA+chaQfTpihqNma3-_aNNwZJRyMa0aqMuqkq7y4HhbmUFt_dGQ@mail.gmail.com>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Tue, 9 Feb 2021 16:42:35 +0100
Message-ID: <CAMSfU+7AdcJ6o3Uba6gn-C2832H+t9-RYeVZS2BiT5iDE-cphw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCHv2] npm.bbclass: avoid building target nodejs for native npm recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003ef9e605bae92474"

--0000000000003ef9e605bae92474
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 8 f=C3=A9vr. 2021 =C3=A0 20:11, Martin Jansa <martin.jansa@gmail.co=
m> a
=C3=A9crit :

> You need the override after the append/prepend operator and append is mor=
e
> common than prepend (order of RDEPENDS isn't important) so I would use:
>
> RDEPENDS_${PN}_append_class-target =3D " nodejs"
>

Hi !

Thanks! I already sent a v2 here :
https://lists.openembedded.org/g/openembedded-core/message/147833

... with _prepend though : I respected the original line as much as
possible. I would have used _append as well.

Regards,
--=20
Yoann

--0000000000003ef9e605bae92474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 8 f=C3=A9vr. 2021 =C3=A0=C2=
=A020:11, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin=
.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv>You need the override after the append/prepend operator and append is mo=
re common than prepend (order of RDEPENDS isn&#39;t important) so I would u=
se:</div><div><br></div>RDEPENDS_${PN}_append_class-target =3D &quot; nodej=
s&quot;</div></blockquote><div><br></div><div>Hi ! <br></div><div><br></div=
><div>Thanks! I already sent a v2 here : <a href=3D"https://lists.openembed=
ded.org/g/openembedded-core/message/147833">https://lists.openembedded.org/=
g/openembedded-core/message/147833</a></div><div><br></div><div>... with _p=
repend though : I respected the original line as much as possible. I would =
have used _append as well.<br></div><div><br></div><div>Regards,</div><div>=
-- <br></div><div>Yoann<br></div></div></div>

--0000000000003ef9e605bae92474--
