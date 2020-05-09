Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web11.4854.1589057417279455009
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 13:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uT724TEO;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id x136so3269555vsx.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBYEE4uBvUS/hoQz8t0FQhI743IX/xdRXz4TSYF40JY=;
        b=uT724TEOo472+gLfxwAEylvVyF8ocjHa5qLHFd6SVmeDrVkSmoxzT8VZ8IathDSGEi
         GR0Fbq1+Yi0cWKwkDZFwZIfbPWeW21/52MwL8pXMddTazB7rjhLUz7EANoXp/9nRnqay
         zxsh6wmlzwRV9DuFW57O+6FSVJX/P/bqPpojGxz9n2bgLyTpPfaSjN0876vXKyeC/mbD
         adEgWWQTaYci1ziuf//avE7VK01R8Ka3XbKK+RQ+ncYDpzOzKA5pTwGInZobrAiNtFeT
         ixmcz6nbgirtfnVBHdFXSIMV4d1r+wllWnDDiV3upBqyxY/8hQu8lRUegzjQ6iTltmDQ
         TwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBYEE4uBvUS/hoQz8t0FQhI743IX/xdRXz4TSYF40JY=;
        b=qmaY5nuiS/DJP+ozSmT2KO1GX1CDQ4RG2oG+RUCe5tDZWHgmQ+MSzBCeVg7I2oPbSl
         ONU6uXiNXOvvIGR+4l5DyP3++NLZ8KFIC8NVn9wA7ZUgGcvpevtYrFSOBpGEu8RT781G
         vpDKDW+EA24Y92p6VNYkCs3jlY3eye0KcRk2Gf3Txap0n7kmtXU0GgM+vha3oaxKlt5E
         YCbwsAXUxOpHHHG1iFao31tmq/v0wnRY68HpTlB8Q5JLkjjlmpxnPNo7ogQiPhSXoSFU
         AGPaN4KHhqvipZ/8U5HhWV9KVojot+rncgsbRdmDCn2CnFTCrFBHo7OuSqucymjKK/bb
         kEJg==
X-Gm-Message-State: AGi0PuaaFV5jZnw9HwTYVwYgaCFwLHFj3HDThoSl0ZZ3k72nXtrn2Kg2
	47nlefM0q0iM6z8RDLbCIjAg93LV/eGEqnrYXnI=
X-Google-Smtp-Source: APiQypKy77pxJaeZG0IzfsIN6B5KYrYLK2vNvVnckOfMlo1O6eNTgQxO2tZzBFk2ypOTIUwkj0VDluJ6Jgzxh4b0OLk=
X-Received: by 2002:a67:7d10:: with SMTP id y16mr6642312vsc.23.1589057416219;
 Sat, 09 May 2020 13:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB6881668050DCD8DBA7AE873DA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881668050DCD8DBA7AE873DA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 9 May 2020 22:50:04 +0200
Message-ID: <CANNYZj-3RfpBbFDP1fWExHjxtEwPdpNWRugMVCmtVpGzxFHTrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file: add PACKAGECONFIG for auto options
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2513605a53d4260"

--000000000000d2513605a53d4260
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 May 2020 at 22:43, Konrad Weihmann <kweihmann@outlook.com> wrote:

> +PACKAGECONFIG ??= "zlib"
> +PACKAGECONFIG[bz2] = ",--disable-bzlib,bzip2"
> +PACKAGECONFIG[lzma] = ",--disable-xzlib,xz"
> +PACKAGECONFIG[zlib] = ",--disable-zlib,zlib"
>

It's better to explicitly list the enabling options too. If upstream
decides to remove support for any of these, we'll be able to catch that.

Alex

--000000000000d2513605a53d4260
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, 9 May 2020 at 22:43, Konrad Weihm=
ann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">+PACKAGECONFIG ??=3D &quot;zlib&quot;<br>
+PACKAGECONFIG[bz2] =3D &quot;,--disable-bzlib,bzip2&quot;<br>
+PACKAGECONFIG[lzma] =3D &quot;,--disable-xzlib,xz&quot;<br>
+PACKAGECONFIG[zlib] =3D &quot;,--disable-zlib,zlib&quot;<br></blockquote><=
div><br></div><div>It&#39;s better to explicitly list the enabling options =
too. If upstream decides to remove support for any of these, we&#39;ll be a=
ble to catch that.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000d2513605a53d4260--
