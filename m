Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.1151.1617217453915218473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 12:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n+XEVqEc;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id a15so17542vsi.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gZcFKNVn+0cVh46YTKGlkzwQM99PyVLvlbadB0yTBaQ=;
        b=n+XEVqEc5X5TrlzzZEBNaZI32xBgh+3pY6qfQVj5wMa+UxGvI64V6/nTaN9kctxPvn
         pBb7mqwEucjeNjUSrISQ9Hog1bS2MjxkeAE5z3vDdyKNGCT0mWzAlHYXvDxcbr5tMf+U
         ZHQwQitK4H+VWvy5sExcGyzUtj36GQcIRlfGzPOWbX7ookU+dITPCtguSjG1gDD3K4Zo
         /edNKK5kVy5cXhxUEv/pEXzQGcXZpnNSnyQ6Rj7eU8a22AxBI6dnzgXBChsIGq3aTlcX
         feCxMRkX6A/RI+i1+7ktHLWVKBcXw1O/vwJWO+yheEtTLt26BvCd406Q+zMBEBCy3X06
         FDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZcFKNVn+0cVh46YTKGlkzwQM99PyVLvlbadB0yTBaQ=;
        b=Io4mcIcHoJwtgln5oah9fAGhM2fXafmVsMcjbR3KxD0iTl2c4dtXkD1ZnGqCrnFBRi
         2vDT3IcFlMTC9/kfbtWMR00580hMVwLBnlH+lcA7B9dMQlwBXI0s4JkjHynHV8NCFlqU
         P1ujNUiDHHcM8POU5etV4xj7hl1dpMKwacTT0LvE62D6q8cdjbmZzJyyIxHY4ppleOW6
         hCFQvCcQoFjxZRtZUBptlkAOSQyWTjPug4LtkMKAXGqBRkwD77Y1PDF2sWCoQ9WOQhB3
         tsDySJglXuhbl9gbyd29wxY8ucTAgMLPxWpzFuTuVRUlMEqw38ESHbhQMekk7PDsmkyi
         nn4A==
X-Gm-Message-State: AOAM531La583Er7SLhC8pRtF7h9tQCS0ED0CEJCIc+8mIcfYKU20upEB
	eMTY2r8EA5a3ed9gJwDk93xDNRc7IrLu6PBvg5w=
X-Google-Smtp-Source: ABdhPJxFk7fM3nGN4zBqQSNNsl/XM4DsxPhhkVzZO6LP5Di3RCOmpkleY1uNQjzwUE9Z9ioMKv9R9YbbJ2ZoMce/TO0=
X-Received: by 2002:a67:72c6:: with SMTP id n189mr2777158vsc.54.1617217453140;
 Wed, 31 Mar 2021 12:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
 <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com>
 <d4b500da-5aec-075e-4632-8a65852b1600@gmail.com> <CA+chaQfYEmLSZa6iDSQcq_LhG+tF==+MQDdd60iZnLaLJ-vz9w@mail.gmail.com>
In-Reply-To: <CA+chaQfYEmLSZa6iDSQcq_LhG+tF==+MQDdd60iZnLaLJ-vz9w@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 31 Mar 2021 21:04:01 +0200
Message-ID: <CANNYZj-0HVAvSY4CBJ27uykVtRBX6-hbqG2jLsg4VRFoYAuYGA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d1ae5505bed9c7d6"

--000000000000d1ae5505bed9c7d6
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Mar 2021 at 20:50, Martin Jansa <martin.jansa@gmail.com> wrote:

> FWIW: I don't use mesa-gl at all, I've noticed it only in git grep
> DRIDRIVERS when looking why swrast was still enabled in our normal mesa
> (and it was because of our own bbappend).
>
> But I agree that it's sad that it's OK to break Ross's recipe, when auh
> says there is an update available, but it's Ross's responsibility now to
> fix the follow-up breakage from that upgrade.
>
> Thanks for the patch Khem!
>

Look, the autobuilder found no issues whatsoever with this update. This is
the line I draw in those oe-core version updates (which are apparently are
mostly my problem for the past several years): I do not care for the myriad
possible setups that are not a part of the autobuilder matrix.

Alex

--000000000000d1ae5505bed9c7d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 31 Mar 2021 at 20:50, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">FWIW: I don&#39=
;t use mesa-gl at all, I&#39;ve noticed it only in git grep DRIDRIVERS when=
 looking why swrast was still enabled in our normal mesa (and it was becaus=
e of our own bbappend).<div><br></div><div>But I agree that it&#39;s sad th=
at it&#39;s OK to break Ross&#39;s recipe, when auh says there is an update=
 available, but it&#39;s Ross&#39;s responsibility now to fix the follow-up=
 breakage from that upgrade.</div><div><br></div><div>Thanks for the patch =
Khem!</div></div></blockquote><div><br></div><div>Look, the autobuilder fou=
nd no issues whatsoever with this update. This is the line I draw in those =
oe-core version updates (which are apparently are mostly my problem for the=
 past several years): I do not care for the myriad possible setups that are=
 not a part of the autobuilder matrix. <br></div><br><div>Alex</div><br></d=
iv></div>

--000000000000d1ae5505bed9c7d6--
