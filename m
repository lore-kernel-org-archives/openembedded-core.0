Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.12594.1612886400617726043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=xxxQhR/b;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id lg21so32502538ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 08:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QHNm9LDRryO1gLdLpDNJOR91SRsHQ4SGzFTuFCviEJU=;
        b=xxxQhR/blJP7v3YONklSIF17uxR1TYFeJSiLJ3tHDdxeoU9Qriyj+GPDg23sQZlRob
         ltDAzCnaqC+REa5iMIgM50kN3ytl8c33sUYocmRgy1/PaglrnhqVrGw9pxK7pAOimIDg
         yvUzTBddRnRilQ+Ipl6Vye7FYupCUOT5cGJRNekknwLvbe60fq7DFfAvj2AGldLd8CLc
         j/Gebr8mjce9bwuYZWTPvTnEsL8ZZpcWfyCuW6lKnlemAUEwVHZ/5An20230mW60poxN
         KBUCKbGPa98AOvc3gkUeN7qm3VB2gywHH/aG/CV9AGh0CS/6F6zOA2BgY37zABt0RNkA
         7rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QHNm9LDRryO1gLdLpDNJOR91SRsHQ4SGzFTuFCviEJU=;
        b=he7pZZ2fjOb4auJcJ6obsPqCq1WT3bgq+BPgXYPGse8WyuXrqtBl6wiRr9THXTrAt/
         X9hAx69W5p2QIp/7/TeovWRdg1iPrpv73W9HNvb/VG/DEty1ZwBn/6728nYdipOsPGWx
         kni/hjGvOeqpZG6Y/UtAiNZ38HjdedNGiE/b7SoRptTAYkh6roXFOMT7ipiCC9Lhy+CT
         rSrYBqDHv2FlWVhyL3OMJsWO7xAHokrR24T0JdydKHmKkydeWECQuCOH9OHtsEn9mhEA
         lT0mQfwiy/vS3DEFC3UwklzUZ9O1w0gNKuykXVT41AeCyzkyV2WieYK8vCg7aAgNOKFJ
         X0lw==
X-Gm-Message-State: AOAM532DzW2hUrr+4voU9skrNYTGy2XnLiAddRyi2hySzWPKV791S2su
	F33NIptkfe6jAEy7U9LE8Z0WlMWnBWNPfQ6A2PH1zw==
X-Google-Smtp-Source: ABdhPJwFgNshStLzmtS/2RE7YofntFnrt+V0sKyJRFMKidI/JY3IuozEQ6djvJfIbKbpG4ZLJ/zgNX819onymHmdy9M=
X-Received: by 2002:a17:906:5cf:: with SMTP id t15mr15052448ejt.128.1612886398987;
 Tue, 09 Feb 2021 07:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20210208180747.12546-1-yoann.congal@smile.fr> <CA+chaQfTpihqNma3-_aNNwZJRyMa0aqMuqkq7y4HhbmUFt_dGQ@mail.gmail.com>
 <CAMSfU+7AdcJ6o3Uba6gn-C2832H+t9-RYeVZS2BiT5iDE-cphw@mail.gmail.com>
In-Reply-To: <CAMSfU+7AdcJ6o3Uba6gn-C2832H+t9-RYeVZS2BiT5iDE-cphw@mail.gmail.com>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Tue, 9 Feb 2021 16:59:31 +0100
Message-ID: <CAMSfU+5Y9EE6rcjshD8QmvpJJv++CFuFXETBbG7JtgtbF0byUQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCHv2] npm.bbclass: avoid building target nodejs for native npm recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e00b0d05bae960a5"

--000000000000e00b0d05bae960a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 9 f=C3=A9vr. 2021 =C3=A0 16:42, Yoann CONGAL <yoann.congal@smile.fr=
> a =C3=A9crit :

> Le lun. 8 f=C3=A9vr. 2021 =C3=A0 20:11, Martin Jansa <martin.jansa@gmail.=
com> a
> =C3=A9crit :
>
>> You need the override after the append/prepend operator and append is
>> more common than prepend (order of RDEPENDS isn't important) so I would =
use:
>>
>> RDEPENDS_${PN}_append_class-target =3D " nodejs"
>>
>
> Thanks! I already sent a v2 here :
> https://lists.openembedded.org/g/openembedded-core/message/147833
> ... with _prepend though : I respected the original line as much as
> possible. I would have used _append as well.
>

... I was not aware that you answered to the v2. Sorry about that.

I sent a v3 with append :
https://lists.openembedded.org/g/openembedded-core/message/147904

Thank you for your review.

--=20
Yoann

--000000000000e00b0d05bae960a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 9 f=C3=A9vr. 2021 =C3=A0=C2=
=A016:42, Yoann CONGAL &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.c=
ongal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0lun. 8=
 f=C3=A9vr. 2021 =C3=A0=C2=A020:11, Martin Jansa &lt;<a href=3D"mailto:mart=
in.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div>You need the override after=
 the append/prepend operator and append is more common than prepend (order =
of RDEPENDS isn&#39;t important) so I would use:</div><div><br></div>RDEPEN=
DS_${PN}_append_class-target =3D &quot; nodejs&quot;</div></blockquote><div=
><br></div><div>Thanks! I already sent a v2 here : <a href=3D"https://lists=
.openembedded.org/g/openembedded-core/message/147833" target=3D"_blank">htt=
ps://lists.openembedded.org/g/openembedded-core/message/147833</a></div><di=
v>... with _prepend though : I respected the original line as much as possi=
ble. I would have used _append as well.<br></div></div></div></blockquote><=
div><br></div><div><div>... I was not aware that you answered to the v2. So=
rry about that.</div><div><br></div><div>I sent a v3 with append : <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/147904">http=
s://lists.openembedded.org/g/openembedded-core/message/147904</a></div><div=
><br></div><div>Thank you for your review.</div><div><br></div></div></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font fa=
ce=3D"Raleway, regular">Yoann</font><br></div></div></div>

--000000000000e00b0d05bae960a5--
