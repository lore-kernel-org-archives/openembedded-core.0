Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.5637.1593694045148165491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 05:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QWrZ9dUs;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id h16so735056ilj.11
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KXpk0mDYjzTwmixDZ6F+7TPUczL2UJRhtU1w3I539UE=;
        b=QWrZ9dUsnFEbw+7FhmHStjIAuj8iem464oTUL0por3t5PrlYCkSb2Lm61bgJip/Y+d
         SZi+H5b2zymMuIpbjIQ4JJZzjTxYDpgaW7Vi3JllTdweRzahj883dBZBnYRgF00tdwQ0
         AACOPHDiixOcbqb8wrEefpvKCcGE/KYLlRY/VwgMnZXRJx1iDLZgqZYp0/9XlpQcYoRr
         5M6YGIgBE+/n1p2ZSYVjPvJyCW+ikRC9LmJdOxkZy0sNdLyLssUF9kcdZqV8/BhAK3se
         yFnhvN+0H6aEw5nxlSqqAScpjNZhh1Ig6YblURAV0qgHskMMRf6wAGVW4MfvYHhLzEic
         o+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KXpk0mDYjzTwmixDZ6F+7TPUczL2UJRhtU1w3I539UE=;
        b=houmyyA1RMcYKpLMEI0dhhdjhUG8TcTVEz1Yv12S28icumzQW6Kcpt5RDnljqlIv+C
         mJiYMM/wyvO98h1UcLjkKDMx1pYvjosX92ypubhZdpB2PqOLCSthhl2Ikuy736SYv5RA
         AQ6r/7zK1no9rWsB+gAvO0CYKwrKT5kkKMz8blEwt2+jwpZBSi/ube3yBuPpZa4y+Wze
         7a73yGBAvVL0RyuU34eKDP3E75lElUY1f/dGmfO2+JO4SSEAhVi6V/9BFlrDipHf3ChE
         VgD5A7rg/oa2nV0c7JI80DBF2WpvFHXlBFFARMBoJdWzFZ71ChXl6ThcBxFCn9i10Sz6
         tcsw==
X-Gm-Message-State: AOAM5334GWyBdLwD99PWrot4cn2tHTcRv2NAAbawbcJjjdoBDVHSM6oe
	Wzx0/UGtHmQggyXk4WPvZx0h+veVsiV0VTRBL6Y=
X-Google-Smtp-Source: ABdhPJydDHzVKK/MUUjoN0a/9TCF8/phNw+XXJDvkVUfXf1vXP/pZu5fUXy40L+dmugnMF3rPmKZ/fo3huGyU9wCz10=
X-Received: by 2002:a92:c989:: with SMTP id y9mr2367485iln.108.1593694044609;
 Thu, 02 Jul 2020 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
 <20200628133414.3246339-3-schnitzeltony@gmail.com> <CALT56yNmLt7b3NcguRAiwxqU-sfh+J9diD7OgMEy8+k8jLhwbQ@mail.gmail.com>
In-Reply-To: <CALT56yNmLt7b3NcguRAiwxqU-sfh+J9diD7OgMEy8+k8jLhwbQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 2 Jul 2020 14:47:13 +0200
Message-ID: <CALbNGRSS6jdAYoj-9w7gyjjECyaeb4Z2vGkxp2UgEjtbC6YJvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: upgrade 3.7.9 -> 3.7.10
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2020 at 2:00 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wrot=
e:
>
> Hello,
>
> =D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 16:34, Andreas M=
=C3=BCller <schnitzeltony@gmail.com>:
> >
> > remove SRC_URI[md5sum]
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../ccache/{ccache_3.7.9.bb =3D> ccache_3.7.10.bb}               | 3 +=
--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >  rename meta/recipes-devtools/ccache/{ccache_3.7.9.bb =3D> ccache_3.7.1=
0.bb} (86%)
>
> This update broke python3 here (see the attached do_compile log).
> Reverting this patch fixes python compilation.
>
> --
> With best wishes
> Dmitry
Will try to reproduce and hope to come up with something helpful

Andreas
