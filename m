Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A6BE7E65C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 17:55:36 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.26442.1695750929498483326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 10:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A3nBVI2+;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32008e339adso8830989f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695750928; x=1696355728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rIzzoVwO4uQYA73M+CZQuDv3GZ7dVLTx6+c8RSZPF20=;
        b=A3nBVI2+SyhpUd6GtIvNu6Zl8MlQm8qbSIGqanmCMz/10Cwc+yYQL1rdCzzDMm/iY3
         Z2x/ivNl6+zSnNMlMSePFCGZ2hlLJYXVaKy7ZVde5L4ginW71AoeZMMdJ7amSErh+NFI
         P+S87a12O1rhGdNqwzsT3BqlI55y+sw63wtbk+TsltkqxJnPUA1KQGvYLA466RlAOzVZ
         1K3FL3FMvRyDykcmSlRLgszftZz+2vY+Pi2Pb1rTLfe7r7Ylk0T55Invxq8Bjo1v0MDQ
         uAxArXC6Si+Q9lLgmJUtqdR+AACOHzWKcymouWR9H7wAQKtuCX6zmdHe/51teLNilNxj
         G7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695750928; x=1696355728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIzzoVwO4uQYA73M+CZQuDv3GZ7dVLTx6+c8RSZPF20=;
        b=WqM2ZPED6xHeb5YXaTxq666y22DSqHXVPR9uSafW8iNAdwuDLnpQGCAZNVyXovNUPC
         FMpHjbpKqLnUd9nJ/c3bnH3pB5ib8Mppp7q7wr3m/wFshV67IoUMM4n70hEhSpPH2YVz
         Hgyp0suKD/nQ8dIHYLuvNhVealUHArv5CG71WTWTlu889MG48NRC9mmk0jfrooZ8NU91
         S0ugjFRqqrJx73wzpdpESvA5+DgbMu/oQbDN9O4Tq7IrdkquKlDAiMyyr1fUkCe12PP5
         MWWdOx8/NXi4Yg0b05qMREu+gOdDfss9GqulcyL5DYmm/TRA06+1AxW/UWFCX0duNJIn
         WoJA==
X-Gm-Message-State: AOJu0Yw/aYjCvpfhFN73QCOKcAVADEzsCzLvmClolotwmtd7rPCwAHUm
	MzBm0ID8P0EKukbjtsMVhAdVdjLjR93Xs5UHR+7qz+In6GI=
X-Google-Smtp-Source: AGHT+IHXcrg2GpqLAtrzOWVBD3cKav5xxzicDoPso6WL5lqdbzujriMfoFl1gnz+l8k7Dw78PdszAch49D07NvOP+9M=
X-Received: by 2002:a5d:4285:0:b0:31f:f753:9938 with SMTP id
 k5-20020a5d4285000000b0031ff7539938mr8772371wrq.58.1695750927816; Tue, 26 Sep
 2023 10:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230922072431.1481743-1-alex@linutronix.de> <20230922072431.1481743-25-alex@linutronix.de>
 <CAMKF1sprXm-xWCYGVbtQTt7y5ons1Of4ktDHMq0HYBE0+2A+JQ@mail.gmail.com>
In-Reply-To: <CAMKF1sprXm-xWCYGVbtQTt7y5ons1Of4ktDHMq0HYBE0+2A+JQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Sep 2023 19:55:16 +0200
Message-ID: <CA+chaQf3p3=hzQqc2JqBjxMjy-wmBR2vjUqa5QpFcDT7qtj7+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/40] meson: upgrade 1.1.1 -> 1.2.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000ae1d7f060646c78a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188258

--000000000000ae1d7f060646c78a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 6:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> gnupg failure seems related to this -
> https://errors.yoctoproject.org/Errors/Details/738191/


I've just sent a fix for this one (gupnp not gnupg :)):
https://lists.openembedded.org/g/openembedded-devel/message/105145

--000000000000ae1d7f060646c78a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 25, 2023 at 6:47=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">gnupg failure seems related to this -<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/738191/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/738191/</a></blockquote><div><br></div><div>I&#39;ve just sent a fix for t=
his one (gupnp not gnupg :)):</div><div><a href=3D"https://lists.openembedd=
ed.org/g/openembedded-devel/message/105145">https://lists.openembedded.org/=
g/openembedded-devel/message/105145</a></div></div></div>

--000000000000ae1d7f060646c78a--

