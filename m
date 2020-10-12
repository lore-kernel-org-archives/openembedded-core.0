Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.1615.1602517706542434769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 08:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tpTlhWqq;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dg9so15129504edb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zbLI8F5lft2+ZmuTxoqDHKLT7GjKmH5CEX56s//cSOU=;
        b=tpTlhWqqNvH6ad/rrFEGw+0iW8Fj5ic9Cas+GKy2Qbg9VvnJIck5nQ0gPxkRitJLio
         Bdq9RbrokYe4P1s/sfkZiwEz/hrCeglOUMdihB3G4IrP4wE3+RMzciPdQsqd4MYxkx8v
         dWrgD4rygBq+fxQ8OG5jdNLNWYGtxlptfH8aEJS0lD/zXlXFW+iJtfeQTenwRRccXN8G
         5o7Gq+6YygntT8TnrYUmXr0hT+QyOyHzBm0AdSeRl59LwY8KgM3gKUMJFY8LAmez146F
         5Hq4UiN/FTiBMTD2o3/BQGICqRzLMh4KpGpOQdbVkxNK3SsreNpJyMOp5PHhlU4KKIs2
         NS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zbLI8F5lft2+ZmuTxoqDHKLT7GjKmH5CEX56s//cSOU=;
        b=KXWuann18n6ZOyvn8FTZMKHmf0M2F18c84EvLSCaLFy3EvxAHLfptlAF3KJ3bTztFF
         1fBxD5HB0lxOuDQjEn/PixDc7pHFnLg75POmiH8kPjb2R3teeCPK0nyFKIwdnzIg24iq
         XA0lYL2JTMcqpu7BnWSzBq5JjCMhc6uputlazVltiVNDjY79lMHm2D2IgpeFHyn5Bzna
         rXVrKPGPn5vpAUJAcNcivyP8RkX2sgAa0kaaJ8ftYOr8OhLK/nC6Frqy/5+0NLi9Roo/
         ZAzwxP+FVyrwKIwYDt7CxhB08OAinGnBQ3tcfSIZ8/bBQVSx80O8YM8qRc6nnhzIqCgG
         uADQ==
X-Gm-Message-State: AOAM530opmUUDZ1XUeWmwWEG4lhU9LjQngqOpVyY67dc3sa/c8rWZRE0
	SrZ7U38ElgZxrqUzDKDyf6LUrumnEmnXVcQzNVM=
X-Google-Smtp-Source: ABdhPJw7d+ia3xHwB+KTY8gj8zBgKGULwMiput/UAlcICsyoykFjTYDB17psQoV9dLT8rhvvR/r1KgBfagw1Pii8Oio=
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr14819258edb.19.1602517704885;
 Mon, 12 Oct 2020 08:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-b9CNsgqHvfa8jU=ZHHCLJmQC-qSx++EYsWsba50PNgw@mail.gmail.com>
 <3583.1602513838762788237@lists.openembedded.org> <CANNYZj8PqNJvgkdOtFjsnb52Ukp3_fnvQ75xWUY7XyXiuu7RCA@mail.gmail.com>
In-Reply-To: <CANNYZj8PqNJvgkdOtFjsnb52Ukp3_fnvQ75xWUY7XyXiuu7RCA@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 12 Oct 2020 16:48:13 +0100
Message-ID: <CANPvuRn2M0SsqvwYdXhncrAReha6o4hq2gaU=mWWSX4F_7ECyg@mail.gmail.com>
Subject: Re: Private: Re: [OE-core] [PATCH 01/13] gstreamer1.0: upgrade to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia segunda,
12/10/2020 =C3=A0(s) 16:24:
>
> Gatesgarth is 3.2.

Sorry I have confused the vision number.

>
> I'm afraid it is too late for that; the recipe upgrade window closed when=
 3.2 M3 was tagged:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/?h=3Dmaster-next

I understand.

>
> What you can do is get the patches merged into master, then backport them=
 to gatesgarth via a separate layer.
>
> Alex
>
> On Mon, 12 Oct 2020 at 16:43, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>>
>> Thanks for the information about the feature freeze cycle.
>>
>> It means that this patch series will be only targeted for Hardknott [Yoc=
to 3.3, April 2021] ?
>> It is very useful if this can be present on the next release Gatesgarth =
[Yocto 3.1]
>>
>> Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
