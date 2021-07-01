Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.1992.1625168304197651705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jul 2021 12:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Csy/ul5x;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id r16so10019760ljk.9
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jul 2021 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/q+BSYieX4FKnKhFufoFwK/SQXteDWAQHuC52V3EKms=;
        b=Csy/ul5x/yk68n/A7SZ2gNQAYcGS6jxreGL6Q3nDqtSFEI0VHeLMMyhoNiLYfcu4HB
         XrR7pAmN1g0jGmhjzdDJx/keA8qWuNgzd6eO06EyeL8/y5BXJV7izTWpoRN/Ax0KigRj
         k12kYwuL2nYGMyNBmVS1nfGWcSrtZp9aoFRdNhS/JYKX4Lmnv5EudGcom4OS2J/JR+Y/
         pS8dt8gnuWemlbGUwgHRRjU5G4Xw5gFq6ITdo5xRkblEeHZBcUBGk+xbdN4yP4rRWEuD
         06JWY7Qwk86DHcAsRt8N/ToO2Q3pKVpa4Z0omBDoHCTD+MHqtIfsa6ePl0ffpZQ8cz1d
         68LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/q+BSYieX4FKnKhFufoFwK/SQXteDWAQHuC52V3EKms=;
        b=TeVd6J9CKKBe4qvatB3zXlXWGIU2s/KET2mpVoABgfhi4+IvAxrwYR2PAlJRsWtnXO
         EbZU27AR1fnPOwlIbHaDe/e2L1MZfE49Tl1Ycphoj55ZsU7HWmxDfqnlr1lLo3f2H+qw
         sN2YzeWI21kVxCGg8Au1ztRJ9sjjYfNhtZm/Wg3mW+wcw6mRJ5H5Q9DyXdKIWAqErXN4
         DR8mA9r3BsrouUTrcp7EMSUID0Lmv1QAV3Mlh/oRtsIp27/Ygs3f55yjlBWJW62Pl1sX
         8K0nxFtUpmVEkhax061DG3vmfxbS3QKQNUa5tAzrWbmAftBL45MN3+92t5jUSljD6npc
         Zf+Q==
X-Gm-Message-State: AOAM530U9cnjrLhCHjL2J31nxNh/lAlyNtet4TolXvC4W4YVs8ZuHwdw
	fH4B3DSU92t673OE4BJ9DWdlQwM1kZuZfQ9l6cc=
X-Google-Smtp-Source: ABdhPJxJbBSmKZ9meXk7vjlaBcEI/xpk1Oa7AonyCkFvQsRInYqPQ7EHe+ypVyOXh4YtWX5LeR4RMeaYdiNh1ZGdMeo=
X-Received: by 2002:a2e:7306:: with SMTP id o6mr882120ljc.125.1625168302042;
 Thu, 01 Jul 2021 12:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <9IIF.1625162494577129155.qxBE@lists.openembedded.org>
In-Reply-To: <9IIF.1625162494577129155.qxBE@lists.openembedded.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 1 Jul 2021 21:38:10 +0200
Message-ID: <CAHtQpK7evQSrL_HpOthgFHQGtAA5JjtRp2XAnrX3pDiDh=knPw@mail.gmail.com>
Subject: Re: [OE-core] SGTL5000 audio codec freescale
To: nanotech.ei@gmail.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello "nanotech.ei",

On Thu, Jul 1, 2021 at 8:01 PM <nanotech.ei@gmail.com> wrote:
>
> na =C3=A1rvore de arquivos do kernel linux padr=C3=A3o tem os arquivos "=
sgtl5000.c" e "sgtl5000.h" que controlam o chip do codec. Como fa=C3=A7o pa=
ra incluir esses arquivos ao construir uma nova distro com o yocto?

I believe that vast majority of the recipients are multi-lingual and
you would have better chances to address your questions in English.

In addition, this is a cross-posting of the similar question you tried
to address on the [meta-freescale] ML
(https://lists.yoctoproject.org/g/meta-freescale/message/24705) where
you asked about Raspberry PI HW. This machine is not a Freescale/NXP
machine, and this perhaps left your question unattended.

I guess a bit more specific information is required about the target
HW you're trying to integrate this codec with.

As for the Kernel: mainline does provide support for SGTL5000 IC
(since 2011), have a look at the SND_SOC_SGTL5000 config option in the
kernel.

>=20
>

--=20
Regards,
Andrey.
