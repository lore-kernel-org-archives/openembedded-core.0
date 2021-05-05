Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.717.1620254215051507577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aCDgY6Ar;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id n61so1088882uan.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tHmDo9NM2STgJG+bxqHPpWBicjD7jIpOl6b5XD1kSs=;
        b=aCDgY6Arwuk01IgGbcnJeqRQ3M2tukjKN555TZEK9jThoZb4MYWiRxOlFqnKhUslTd
         vc+/MasmrklgDMmAwBymlnIYarqV/i9QINpozL7NLz201ZOgaO4zCZxIXfFgX+xeoYhp
         lmMuHacvxus22tsUpqI0Rvl87dzEenXhZ7ui5uqGJJZah6YgMUgpsk4Kwzkbh7a45+Ce
         kS85f0Y8tkvxbr/Hk8mqiTGtVdB9SKTnVP9mlLA+YgcyPodE5MhXCKWsBSKRr8cOuJL6
         tDaWK+M+Nwl6YFcb7y5XOg7fXJj81hf1KCM4o8BoijqVxWQ+LgbXgZ1ZAig7PK7KDI1e
         78jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tHmDo9NM2STgJG+bxqHPpWBicjD7jIpOl6b5XD1kSs=;
        b=OTZw7crjnkjOcH6k8wV0HmFBJZ+bJv8aKbEuDR2LOpp6wbXt1+XTDTi8H+5sp2bNeF
         ZRB8d4GqqS41GB/M+yRkglZHZJa1el+vg+1yplFWboOpdMTd/IC0T5gSnLvVjxRY14A0
         wTkkkBeeMIFWIdMtJD+Imj4WXcI/egFhsID0E57Fucq+I8QKlSu0/lcoAhocF/Kym6/r
         D7Ae/knfA0U7Iz0R74/Zsgsh5FPH4DicAhd/9Kzfiqx6E6VIKC19JjHRWI4S3Z9r9ADL
         hRuLXskbo2WUYy6NWmtlLKYlNksTN58kN6QVAl1Bd5y/ZDVjeRkgpl3FeLe5rBFJAQJH
         jN+w==
X-Gm-Message-State: AOAM531ePzcSu6BfZ13J0dTnl2oMT6TnQs9sxIdG8Tqju4+pqt6Oojn4
	zbX5SizW1wm2TESSx/VxSfHOwum641hhAwAFTEeEHrb/UL8=
X-Google-Smtp-Source: ABdhPJyPJi1yJITZbyWCOr+hpz8tqsAJUhV9k6kvnMXDzZRtiSu7wEFqT5zwF5yS1N9DOZjCYOHrxaWc7tdAnDajKF0=
X-Received: by 2002:ab0:21d1:: with SMTP id u17mr1339356uan.22.1620254214242;
 Wed, 05 May 2021 15:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-6-alex.kanavin@gmail.com> <e08e70ad086f413733bf5ba3cabdd558926a9868.camel@linuxfoundation.org>
In-Reply-To: <e08e70ad086f413733bf5ba3cabdd558926a9868.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 6 May 2021 00:36:43 +0200
Message-ID: <CANNYZj_0FhRRWza=qv9LANNkKWKqQp90g-uMdhA6=6p0Oi8pmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/61] expat: upgrade 2.2.10 -> 2.3.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e2c7aa05c19cd46c"

--000000000000e2c7aa05c19cd46c
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 May 2021 at 00:32, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Doesn't removing this degrade the accuracy of the ptest reporting?
>

I'll check the outputs before and after.

Alex

--000000000000e2c7aa05c19cd46c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 6 May 2021 at 00:32, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Doesn&#=
39;t removing this degrade the accuracy of the ptest reporting?<br></blockq=
uote><div><br></div><div>I&#39;ll check the outputs before and after.</div>=
<div><br></div><div>Alex<br></div></div></div>

--000000000000e2c7aa05c19cd46c--
