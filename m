Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web09.11659.1610469010761211660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 08:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X7dfIQK1;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id s13so733914vkb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xm4H+gEbDO8yEKpTJz1YnjVC1vulcRPOyJQOU+bJqsk=;
        b=X7dfIQK131JuGu/XFx+TICk64InH4QUdQ3DoWrrJVjIv8fGQoZMb2dsrwYx/J3vNdf
         4gmgl5jd1+TBdjrzJ9LD1RYDIAONhTgYhfwImrKjVVElYWI9sf0pdpAOD/jEZ70g8+cy
         wTUbmopCWU9XOtWwXD7izCtfr6QflTsgiV7Wb4uc3x6r2GhJnKhtEH7eKPiW0RDIl+mO
         2SdHhVceVRHIWnQ//TRupUyceMtEw3HWaAJYUtdPtpMh7JPYKhQd6bpHiDjjp38yiren
         4+JTcmHbOJF1SNsB97Ltjh1ZTpw+7NnQujQJez5OA1hShlk4ofZugto58529S9SXU6pY
         72mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xm4H+gEbDO8yEKpTJz1YnjVC1vulcRPOyJQOU+bJqsk=;
        b=elhecW9iQNzNitS4B8XlepwbDyOARm4rJ2jxntCgbLrIj/eSzOz7wfr8KR0aznmmsY
         I4pjo0sMowop3VOx3p9H9oLYq68vCbf+ZjpuiwEeiyF3I0fCMnPWS7wlzFSEuA5FRNn/
         iCotxLz+iMzIrjwwVpa3ed4+uavI5bNrWxr+3P8PDliG0z+qAvFqiXDox4PzJiffoe2/
         MU0VxWD1Ct4s9MM67qMNbYoacQsfsM5XAuAIPh5vkGH+SuqGaQM8/K2mN7qXqCfneA4c
         dC6Ync9fitA8TjmIRDD+w45bFhenzaEvS0XcxWq4X2lb7F5oLUvnqiG4tsJrOdQPVsIt
         02eA==
X-Gm-Message-State: AOAM532Q59zhjPvX48zbagKTFROub7F2kLaH4S4Mw4x1Z2jQOtCwDin3
	QSh9qwHenXWUYMspDWOTq8yC8E2p+lrMXzRBNzo=
X-Google-Smtp-Source: ABdhPJyfZ5tQq82Qv0LHfUvGm93ptriGqyDunJTWXkwJF/w2z8nGoYuzI9uOFHrZNXyHoZPC07wha7q9Loy5RIfE/f4=
X-Received: by 2002:a1f:9c42:: with SMTP id f63mr279846vke.10.1610469009881;
 Tue, 12 Jan 2021 08:30:09 -0800 (PST)
MIME-Version: 1.0
References: <1610424117-18134-1-git-send-email-wangmy@cn.fujitsu.com> <X/3BRVxDbCncYdSV@korppu>
In-Reply-To: <X/3BRVxDbCncYdSV@korppu>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 12 Jan 2021 17:29:58 +0100
Message-ID: <CANNYZj9Ad10xxhHWDju3UDCxBmEoJ6YkwBnPiLZOoOz7TdDMYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: upgrade 2.35 -> 2.35.1
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000417c8605b8b68907"

--000000000000417c8605b8b68907
Content-Type: text/plain; charset="UTF-8"

Maybe Khem also has a patch in progress? This update has been pending for a
while.

Alex

On Tue, 12 Jan 2021 at 16:33, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> Hi,
>
> Would be nice to know a bit more of the update, e.g. a changelog summary
> and wether API/ABI changes are in it.
>
> It's important to know if the patch is also needed in stable branches.
>
> Cheers,
>
> -Mikko
> 
>
>

--000000000000417c8605b8b68907
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Maybe Khem also has a patch in progress? This update =
has been pending for a while.</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 12 Jan 2021 at 16:33, Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw=
.de">mikko.rapeli@bmw.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
<br>
Would be nice to know a bit more of the update, e.g. a changelog summary<b=
r>
and wether API/ABI changes are in it.<br>
<br>
It&#39;s important to know if the patch is also needed in stable branches.=
<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
<br>
</blockquote></div>

--000000000000417c8605b8b68907--
