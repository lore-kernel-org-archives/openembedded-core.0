Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.3267.1624309815432912971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 14:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pVbcxkLN;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id f1so6847522uaj.10
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GTgCX+MLMD1TPuxIi7n4+IC/Mm20gLRPuNyNciZpIeo=;
        b=pVbcxkLNMI5WnCTLLWvsbRIvqgwHmGZK+VFYC229cvx9E0BaA7to+IfV/bJwedAejY
         DRz4L3wA2QoNgjAhvgLdeOySCjT47ywFQ46dPBaMDXHq9V6VZkC9DSglZm4cbhxXs6/O
         nnlrNTg27FNpLeAPI+opzk+XqJY3riOcA3LHOqF9PtalNPMqALH2YUoeD4qCunnsd8bN
         xZbnZ1/lMxs1PKEWBB1I5Qc8xqXWH68bH10e90ssxo4Mq9E4rS8TJEjUUNOtKWYJuTKT
         +yqcTHghfd/RubKgWfToF8U2wyygS1Sku6UWKuo7gkAgfgx1zOXp2Y536OFAGr8HI+VT
         dkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GTgCX+MLMD1TPuxIi7n4+IC/Mm20gLRPuNyNciZpIeo=;
        b=Euo9Ty9p+qmGjzQhbEjIO3h3JpFO5zU7wFkhfxWeDfrIMdrTObLlC1d0WzRCBaMbOi
         OevMgoPjun2xq0K3YRnAgiK2DXQeuzksgLeXpgs3EHmzM0jxSA+grbA3Erq+0KI0W0Xr
         H/YAA7C4ZiVdU9WP4Qf3o+x1lsATYvqB4ksH47ttHjMEoMYSHELT+ni2DZ/iiM9DIIDt
         EyXddFlgZwdw26VPNsS5u6lMIACCVwJb6kaJHQyccuxeXmEmovv5U5MFvfMQNQR6ZHZN
         FoNb/g9ivU3CSQ6QLR2wewoXxAKmnO4LANOu7Ntm3mKu1+5B7tNjRELhl2RfuCpuDrG6
         rbTA==
X-Gm-Message-State: AOAM531126QLRz9qDp1a8QBJwJIgrkvdxs/SScYsCasgPQZdaOUCjCti
	2ruSV1zPkbIwjtCvTw4oeJ6RsZe07t4RCaJt6LQ=
X-Google-Smtp-Source: ABdhPJypZ5Kjvr+rLumA4ZdQYgJBXbVDWJ+RB34axQHvg58HHZ5MeZsAqJNcA/knMhm6OzmTpc90w9Ulz8eaProY/iI=
X-Received: by 2002:a9f:31b1:: with SMTP id v46mr749957uad.22.1624309814593;
 Mon, 21 Jun 2021 14:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624060313.git.timothy.t.orling@intel.com>
 <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
 <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com>
 <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com> <9fc0beb461ef23b8ad98aa19e7948c9301ff6280.camel@linuxfoundation.org>
In-Reply-To: <9fc0beb461ef23b8ad98aa19e7948c9301ff6280.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 21 Jun 2021 23:10:03 +0200
Message-ID: <CANNYZj-2F_WYzFppo7o0uGzuOj3UX3XY4RZEcxs-HgajiSGYUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3: skip tests requiring tools-sdk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="000000000000810dcc05c54d1943"

--000000000000810dcc05c54d1943
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Jun 2021 at 22:51, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I think we're all fine with disabling these tests. The issue is that
> IMAGE_FEATURES isn't available in a recipe. As such we may as well
> unconditionally disable them as that is effectively what the current
> change does.
>

I'm ok with this too, although I'd prefer a check with a fallback to a skip
in the test.

Alex

--000000000000810dcc05c54d1943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 21 Jun 2021 at 22:51, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I thin=
k we&#39;re all fine with disabling these tests. The issue is that=C2=A0<br=
>
IMAGE_FEATURES isn&#39;t available in a recipe. As such we may as well <br>
unconditionally disable them as that is effectively what the current<br>
change does.<br>
</blockquote><div><br></div><div>I&#39;m ok with this too, although I&#39;d=
 prefer a check with a fallback to a skip in the test.</div><div><br></div>=
<div>Alex<br></div></div></div>

--000000000000810dcc05c54d1943--
