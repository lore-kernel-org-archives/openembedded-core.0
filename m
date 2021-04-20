Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.1576.1618946190286694037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 12:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BrvzEvb4;
 spf=pass (domain: gmail.com, ip: 209.85.221.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id a11so2196013vkl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wj1mwm3SwO38mKyMQySo8ZT8ZyFVUYj0/ABv1mDpa+E=;
        b=BrvzEvb4mpb9AP5T6XHaAJ0wADRGlIaMyYeFPVKyMbtj8ReMd9CS9aYgJsb2HblKFQ
         YzaLr+5871XxEuEeRYnFBCcuTXDclVEivbB4Ybh7zGeCV85dmIsNK4a2/Gdt9uQY14Ly
         Ayu+OWa6DZPWHoLh6zavXXoCO/8YY/MSCqOieGLkyJG0uxMfyAbg0P6y5IrWxjTK2vTr
         Pog+CzjeyqsBJE+wWpFu2YBqiLH1CWAoFCa9PzgYrusVS3SkziLcgl9seX+Wgjf7sz/a
         NeSYzMCRVla5bfO9fnPIeDbshTSACDUdF5gO8mBvNZcFnsdUmNVBLxABpcyG+WTbt3RQ
         xI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wj1mwm3SwO38mKyMQySo8ZT8ZyFVUYj0/ABv1mDpa+E=;
        b=bQkOvsX7WuS2pw5GfPGqqcOUZ8A49gU7RzzZe9cn9shi5J8W+uzKovRbyvUb50OkWE
         AkOQgwEt8WC9Hzlj2QZ2SMahfF6kmCmtNRtSwCu9iFuGr1+VQsNv3bjlMcOpf8lnog1V
         V5Qs0ZT0WXzFC1lSCfIQcGXrXTxIimNa9rq15ARgVzosDNLq8BpI5YMRrA6W8fVMbdgj
         +O9gK9GZFjljf1LtTTb+hzFWAelcWBM2jeNOOx0qDpIdWl2DUHd0fT1hEn0IC4nyvWLL
         dc3dB4Zp/r9EUpYzqc/yOelTP535s1iU/MWI7ihi5aJyLYYEIvqSi498sOTD+DSjeOMb
         wcuA==
X-Gm-Message-State: AOAM533PP8LmII+Ff5lP9xZOQm4VHfnFXIUllDVzd6mX0KUqzYxtbBjX
	IkzGONGy21QfJaaywZG1Ru85wkxciyDlvY5qzX0=
X-Google-Smtp-Source: ABdhPJy8lXy7PgfXYW6zevvtSpU9niqq94a2ed8OL5VplQ2Cu4+9gxdCabKwhV/ZXav7Ud5kklkiLTYZNQ8k1UiYLUs=
X-Received: by 2002:a1f:4581:: with SMTP id s123mr12797812vka.10.1618946189459;
 Tue, 20 Apr 2021 12:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210420162259.179433-1-ayaka@soulik.info> <CANNYZj9dcq0fsz+zStCiGnMFr_FmcGA-+frMVhwnjzW6ZnH31Q@mail.gmail.com>
 <8cd8leGg45Gxy5RpPo8Qahajr-bTPFM6MlcVSzeWsz-UFPUYn3bdumIRKyM7hjr0rkeQm-CB1qmIqAHShlon7ZbCedWzvBoS6_okd0GqHhY=@emersion.fr>
In-Reply-To: <8cd8leGg45Gxy5RpPo8Qahajr-bTPFM6MlcVSzeWsz-UFPUYn3bdumIRKyM7hjr0rkeQm-CB1qmIqAHShlon7ZbCedWzvBoS6_okd0GqHhY=@emersion.fr>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 20 Apr 2021 21:16:18 +0200
Message-ID: <CANNYZj-URUhy_osEObxEHMcLaU-uM0O0Q+ONkD4OUTCPMs4SYw@mail.gmail.com>
Subject: Re: [PATCH v2] seatd: add seatd recipe
To: Simon Ser <contact@emersion.fr>
Cc: Randy Li <ayaka@soulik.info>, OE-core <openembedded-core@lists.openembedded.org>, 
	kl@kl.wtf
Content-Type: multipart/alternative; boundary="0000000000008882ac05c06c4803"

--0000000000008882ac05c06c4803
Content-Type: text/plain; charset="UTF-8"

That's fine then but please resend the patch without the erroneous
nativesdk-packagegroup tweak.

Alex

On Tue, 20 Apr 2021 at 19:43, Simon Ser <contact@emersion.fr> wrote:

> Additional note: libseat is already mandatory for wlroots.
>

--0000000000008882ac05c06c4803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That&#39;s fine then but please resend the patch with=
out the erroneous nativesdk-packagegroup tweak.</div><div><br></div><div>Al=
ex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, 20 Apr 2021 at 19:43, Simon Ser &lt;<a href=3D"mailto:c=
ontact@emersion.fr">contact@emersion.fr</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Additional note: libseat is already =
mandatory for wlroots.<br>
</blockquote></div>

--0000000000008882ac05c06c4803--
