Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.16.1620062191236231667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 10:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHYCOdAh;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id w3so9028120ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6qqUYyl3HDJgSEtB4/0OZdV2z+FfrYPplVp/fx14TtU=;
        b=dHYCOdAhYtDMnW4O7EclOxN5jQgtWLSXlUsSwF9/r0hAR1gVrNKRBMfxtQ7wh+1/l1
         0wZ+I0BlhNR1in35foxrffFhCtv89qUQSDrOu+5l7pqkjrgXEDFtnT5aY/rF4EF77dtX
         hBo1O41UaNCbCT2u3BAb55qUWPIJFh6sNUiPoaaq4UelmaGdMxAfqzGo1wcye30OVwif
         cP5zhjgEmTkZIZn7i5Up8icpUUv1Suu+o9nliIKsd/Fx4Z5SBjxpdzAWDvFChwx/1NaQ
         tFj4QCfaxjO0nxTahhS+vQT9QXTliuLjeGzc+eV52muBjYVH6i8I9SC1iGT5TZuTF+PW
         ARgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6qqUYyl3HDJgSEtB4/0OZdV2z+FfrYPplVp/fx14TtU=;
        b=NRp/0hbGi/HjtCSMCcSGW/3ncbzuIdP2qbVHf7moAsD9mGS+sjen5hzVO6wpUnjGQf
         OZeWmc2qEmMjmonOEIo0nfDW+BXNOI00wqsn02LTTwRW4/Ew5+yGOpzbQVTXNWAyWq+8
         iz6QoWAQngTWFqzCIiCUOTWokjaaxOCTFmINC2pxZzv2TAFhM15j3XGVKDu2rkOcwMEJ
         1VgR/jqltEb3inKrK5mRwTt8DRfYR6hL7mra5BsSIOojY2vXJQlf8t64ranZZGl/OPiN
         n4zp2eE08Mv4EUrW9rmyYpJfdFlXYTVJ2/h6bB3MarrWI1h0eTkyth/6YoptEPbcfVAL
         TXZw==
X-Gm-Message-State: AOAM530hrGQnwbmceveHwWgfrdIg3md2Pztsd5j/URExh3rxHtPUFWAo
	5SkyWLUkhZirUoKPT/wCSdQhY691DQxgqsjY/rw=
X-Google-Smtp-Source: ABdhPJwtL4UiNikWt3VKFfMk8EmmJr49U+3AMkbQkQtvsonSklganZZX3B9hrTpReC0CGCy5zvi0eu1NjQWo21dUHs0=
X-Received: by 2002:a17:907:9612:: with SMTP id gb18mr17951332ejc.408.1620062189714;
 Mon, 03 May 2021 10:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
 <167B517A343BA3A6.25516@lists.openembedded.org> <CANPvuRnX=tSwOzFn3Vkx6JRg5rigu-Gy86SFpsXY5COLDpDvgQ@mail.gmail.com>
 <9fa68475197d0b0d6c0dfa250fc433e101d9ed9a.camel@linuxfoundation.org>
In-Reply-To: <9fa68475197d0b0d6c0dfa250fc433e101d9ed9a.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 3 May 2021 18:17:46 +0100
Message-ID: <CANPvuRko-KR6yh=8HbMzcQ_M+j8DcLxu5=tZFjGZ8Q7tKez4hA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] gstreamer1.0: update ptest patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 3/05/2021 =C3=A0(s) 15:06:
>
> On Mon, 2021-05-03 at 09:52 +0100, Jose Quaresma wrote:
> > I have a question regarding the patches submission, what is the most
> > appropriate option to submit them ?
> >
> > 1 - send all patches as it is submitted upstream
> > 2 - squash all patches it in single one
>
> I think you'd done 1) and that seemed reasonable to me? It makes sense
> to have the separate changes identified.

Yes, I have included all the patches as been sent upstream.
Thank you for the answer.

>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma
