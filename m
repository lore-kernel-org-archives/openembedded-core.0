Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.19896.1625658248107712266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 04:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=BQ7A0zby;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f176.google.com with SMTP id j184so1578243qkd.6
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=RixUit5Hy/6BtOCU/aGOK9lUj1neMGe9qwiDaNAUqmQ=;
        b=BQ7A0zbyr+CijcjzvZ9VUE7tfMKfyQ16vHkQQcY5XWrc1Hpk7aCGA+TaNEOgmj8C2n
         e3Nf1uuwkdbzGp3qmQwIvYj31SIw1qVSaifdsczlsfXaVdOM3PMRTzodbhZU9kg9WbqS
         7Nhf3fzNoVSBsY2gqBNokbv5KSIjG/mMoymBbzhpSln958jus1WJVdIXmAciUAk+MvRI
         mlb/2+lCxAr6OZdWk39PUbaQlAAqMbQYgBlrtzagIlEu84dgx2BB3FSIs3GWaXdQUykf
         m2co7Uqg4UEy4nrXBN4nlRlVBnZtQ4HnC2gFXoDqOS0JYA8KDw5GHe2lv5osbc+owiai
         gewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=RixUit5Hy/6BtOCU/aGOK9lUj1neMGe9qwiDaNAUqmQ=;
        b=Knq1vgr6kTfaC/gVvro0oLKM61vTvJdZEN5ZJK7xG3ZIgRkneKN44t/ikTloNBOh9x
         E3piZYJ+9HjW0qTgwgthKsW04c3+8rGpWt/KKjIq70jyQHrYxb+7LOg8YsgVEsL2qogE
         PlZ02aJBofVsIG1eo12G3aKQ6Jdrl5Q51laChPff36MGlIdJuPDsAUMs5GvHUpAutdeL
         DhXs9L9wXRoBtJXJuuN/KZmolwqGZHiBlCuBXMwoq1wige5jZHDjp1EZ28RP3eg442eu
         1Dp05mx3prJy0JhYF12QWxRS7WRsxdR473kGiZP3/zvkQThBHkjQEiNoKn2Dzir1c4KM
         m5Gw==
X-Gm-Message-State: AOAM530TGLHqkCUWSWIYY0F90n0JFYIC6W5/AMF0uW51WGnzNmzV5Yzx
	Wk+ubxjb02KOwOqf1a5mq7TPRAe5vfcDlMOu
X-Google-Smtp-Source: ABdhPJxbk98YVIjhR3ZRUkcEU442IB1T2kUWLHmUQHhleY66hOo0054euYsVHUhIUWXanItlDQDQ+A==
X-Received: by 2002:a37:4292:: with SMTP id p140mr25956998qka.471.1625658247103;
        Wed, 07 Jul 2021 04:44:07 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id a17sm3628491qkk.121.2021.07.07.04.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 04:44:06 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f175.google.com with SMTP id f13so1754883qtb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 04:44:06 -0700 (PDT)
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr8407579qta.217.1625658246271;
 Wed, 07 Jul 2021 04:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210702115900.19417-1-peter@berginkonsult.se>
 <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
 <775af313-1b19-146e-b0f3-113d5af0a992@berginkonsult.se> <a3f45eab0d82dea6f34936d821d902b79c43abbd.camel@linuxfoundation.org>
 <0e446811e98bcb4833cdc0c7f5dd40fcd8f07a43.camel@intel.com>
 <d83ff556-cab9-3616-f4ad-506e8675eda5@berginkonsult.se> <db03a0b4-d292-4db8-694e-56b3fa1c99cc@berginkonsult.se>
 <CAP9ODKrSEHz26EPkkOvPqpd37x3fzmTTJ9vuPxByFMnraJVmvg@mail.gmail.com> <CALatG=5ege67ZqNtxaKVVifg=pRnDBCKin2ZPtvejCgWDVu5QQ@mail.gmail.com>
In-Reply-To: <CALatG=5ege67ZqNtxaKVVifg=pRnDBCKin2ZPtvejCgWDVu5QQ@mail.gmail.com>
Date: Wed, 7 Jul 2021 08:43:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpYW=hLbwJc01uuf=qM_GwPaKGWYFdV8QTZUG50CqjCOQ@mail.gmail.com>
Message-ID: <CAP9ODKpYW=hLbwJc01uuf=qM_GwPaKGWYFdV8QTZUG50CqjCOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
To: Ming Liu <liu.ming50@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>, Anuj Mittal <anuj.mittal@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: multipart/alternative; boundary="0000000000004b9d7905c6870ee1"

--0000000000004b9d7905c6870ee1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 7 de jul. de 2021 =C3=A0s 06:50, Ming Liu <liu.ming50@gmail.com>
escreveu:

> @Otavio Salvador <otavio.salvador@ossystems.com.br>
>
> libubootenv will fall back to read environment
> from /etc/u-boot-initial-env if loading /etc/fw_env.config fails, so
> attempt to say it's not too wrong.
>
> To avoid world build failures, maybe set EXCLUDE_FROM_WORLD =3D "1"?
>

If Richard accepts it, it is good enough for me.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000004b9d7905c6870ee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 7 de jul. de 2021 =C3=A0s 06=
:50, Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.=
com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><a class=3D"gmail_plusreply" id=3D"gmail-m_423003639=
2662915316plusReplyChip-0" href=3D"mailto:otavio.salvador@ossystems.com.br"=
 target=3D"_blank">@Otavio Salvador</a>=C2=A0<div><br></div><div>libubooten=
v will fall back to read environment from=C2=A0/etc/u-boot-initial-env if l=
oading /etc/fw_env.config fails, so attempt to say it&#39;s not too wrong.<=
/div><div><br></div><div>To avoid world build failures, maybe set=C2=A0EXCL=
UDE_FROM_WORLD =3D &quot;1&quot;?</div></div>

</blockquote></div><div><br></div><div>If Richard accepts it, it is good en=
ough for me.<br></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
>Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http:/=
/www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=
=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-785=
4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--0000000000004b9d7905c6870ee1--
