Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.525.1612993335618334867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 13:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=NEt74UVd;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.170, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f170.google.com with SMTP id s77so3295770qke.4
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=mQeTguKNqcqIm55Ft6/OZeteBuPKeoM2ovsSustxJ/E=;
        b=NEt74UVdp5PDqSe8/pRgW/e6r8RpQTDRh4fFjS/BQwB6LGUZ3qFEqzsiXv1kyBAXZv
         hVe1IZdH3FMWJGDbGloXEceNWmWGSBkUWy3tJVviiG3cTXr1qL9YyPfeq4r9l/AO1PqY
         4z0Yty1SAbqRiUBqLRupRbjYkBIizseNHhJshe8tF7Ltpks7U6kWTQegVgfNp4pmxniq
         pPIeZYFHy++UEZUKsC4AREKs49mbPAabYW9jIgk5LeAfvypMUeGgUg0k9u8SDURsCw8o
         qZq8kE1gH1IIPltdnUUY2Oe8If9z86k0pJ3zD1Qb4aulWfdLXpcv+B06yfadO5L0HdQa
         4nhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=mQeTguKNqcqIm55Ft6/OZeteBuPKeoM2ovsSustxJ/E=;
        b=U16mkL1nKZkUhPDqUOt4SsfaxbwMEIlv1KsoQb0ZCB5CqQxURa/V++Oww+ksoO10C4
         xG4zGquVYryEIhen0MGOq3YROM1Qjgj6+kdy4YRm4r+v2UrYZoCp4r40laqpZrz/o3o+
         9DsxceO0Ye4wzXL6jH7HVcXIRcZbf4/yWsvlC1aQGibrWtKm5PydoTh6ljuucFUQtmQ0
         5NGHn6TZsDx5LlVwfn0/QaU2J+EYZlybN7iRywC/pNkxTVd5XQJwS20pOzqJ5Wr+vmTk
         ESjQ/yqbBmqt479xAzTy1DxCzWApTIAHLytV8uoer2Gyi05ASZHTX8y0Hl/bni+sZ6s1
         h+9g==
X-Gm-Message-State: AOAM533MQ21AHt6sa4H94YikHoKulS2QUq9qRd7z7pP9ZiBdq+hfEsTy
	tLsgUzrEzjH81yooJVBPN1xLD6Yjhp7xH3Ao
X-Google-Smtp-Source: ABdhPJy4+4SCtGXPsFdU2TqWbVceLtJTxUHg5U93S9CsV0u/EDArhJ0JWe4JHkSVnEhxVWp+RT4kmw==
X-Received: by 2002:a37:73c3:: with SMTP id o186mr5286801qkc.194.1612993334554;
        Wed, 10 Feb 2021 13:42:14 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id r17sm2034041qta.78.2021.02.10.13.42.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 13:42:14 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f176.google.com with SMTP id v10so354480qtq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 13:42:14 -0800 (PST)
X-Received: by 2002:aed:3165:: with SMTP id 92mr4805069qtg.233.1612993333972;
 Wed, 10 Feb 2021 13:42:13 -0800 (PST)
MIME-Version: 1.0
References: <837699ce-eb4d-3610-8069-8e93d87b7be4@linux.ibm.com>
In-Reply-To: <837699ce-eb4d-3610-8069-8e93d87b7be4@linux.ibm.com>
Date: Wed, 10 Feb 2021 18:42:02 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpOMj46M-jOsBdN2n422X177fOtFhjU=zSh-=kjq-Nx8w@mail.gmail.com>
Message-ID: <CAP9ODKpOMj46M-jOsBdN2n422X177fOtFhjU=zSh-=kjq-Nx8w@mail.gmail.com>
Subject: Re: [OE-core] Next steps for extrausers passwd-expire PR 63?
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Kai Kang <kai.kang@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000b2542605bb02466b"

--000000000000b2542605bb02466b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Em qua., 10 de fev. de 2021 =C3=A0s 14:27, Joseph Reynolds <jrey@linux.ibm.=
com>
escreveu:

> What are the next steps for this?
> https://github.com/openembedded/openembedded-core/pull/63


I reviewed it there and mentioned what is missing. Including suggesting it
to be send here for review.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000b2542605bb02466b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Em qua., 10 de fev. de 2021 =C3=
=A0s 14:27, Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com">jrey@=
linux.ibm.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">What are the next steps for this? <br>
<a href=3D"https://github.com/openembedded/openembedded-core/pull/63" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/openembed=
ded-core/pull/63</a></blockquote><div><br></div><div>I reviewed it there an=
d mentioned what is missing. Including suggesting it to be send here for re=
view.<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a=
 href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystem=
s.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.co=
m.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53=
) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</=
div></div>

--000000000000b2542605bb02466b--
