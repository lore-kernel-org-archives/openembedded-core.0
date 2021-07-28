Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.2260.1627461444567010702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 01:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+u50gB8;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: nagesh.shamnur@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3075973pjf.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ul6pZaCBPy5rcbWxX7dg7sagJqvudyE4hXAn7besBHU=;
        b=E+u50gB81T2WCDsOniOgav+nmFUwjB2VobByrKkvtuQzSEN1q4F/3PeuXQLD1YS5+i
         UI1eZsi+gQ3iaMnIE12q0apRkGHXzqUh+S2iAHqNDaVzBARYhiGRj+NoMESJ3oLnf+wi
         ee5AN5pOT3W0ArZMc6vWP2PwhaymMHPwQOGAB7vPKwe15oXBwhCO2k8DQiMUDX1eANEY
         fn8k237iPxIskjS1/31AAH4Noe54xoOf8A8CNNEtHdLFbm31x5kpY+1tDdqAREz/10oV
         moxpT4W2eeaB1sPp9oiS2k3iCSSH86/tx9N94OP/uoK+p8feaywwXJ0I8oOJbEgHbxnP
         aJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ul6pZaCBPy5rcbWxX7dg7sagJqvudyE4hXAn7besBHU=;
        b=ikyQvUnNeLZ+1/bPgoXwokwC5Z+MU2OZd0bCSEkx2HqPpba1IoX+ZjQsR3Giq+lGfu
         laPAOxuJLe+DVLITYGI2VpL1yUr68ljS4u7Vz9DVkk+d+V2ZRubo7m44mQwQOUT6TgQR
         cupaxvavXPgEQqD1kbGd48Yi9fvMy8qZEEadV/aHgBz1YrPKUuhAWMdmdLW0kQv8Gcez
         fAbNHlySbu+Yi1QlAmikzyYKMQxKU+DJC1Sz2Yw6G2/S2SGWz4Un0QA5pP2XQy4q6fSe
         kkTAtF++nJpCEIE/4qIP+yM3R5f46CY1f9UmZvY2yFsDiuxe2HUMyyvfN00yLskqbzTO
         9hxA==
X-Gm-Message-State: AOAM53375lBZsEmWd90OZ2f2csttdUntm/gEkJyjBve6GW72sZbkwu/O
	+CvI0wJavZxTH8C1gj7N9A8er/DBnC3pXk/nLSI=
X-Google-Smtp-Source: ABdhPJwvHY+zgUKhT+iWX7SqGr5LIeCwPtJK4+0UUyjsjf40OhpURe6TP4TJVx6fhwRGVtABzlFsPpl0TjyjXuAZLb4=
X-Received: by 2002:a17:90a:5d8a:: with SMTP id t10mr8665486pji.6.1627461443765;
 Wed, 28 Jul 2021 01:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_JV5PZwZh8mMw0ZoVBuCA1570ki0gqSi_Du=UqXfNtuG6P4w@mail.gmail.com>
 <CAA_JV5OinDTfVwtVN4hYexvr2c08NxL5=A-pAsiBquFqvEUPEQ@mail.gmail.com> <3bda3524-7dcd-9f8f-d22b-00a3034a4e8d@bootlin.com>
In-Reply-To: <3bda3524-7dcd-9f8f-d22b-00a3034a4e8d@bootlin.com>
From: "nagesh shamnur" <nagesh.shamnur@gmail.com>
Date: Wed, 28 Jul 2021 14:07:12 +0530
Message-ID: <CAA_JV5NSjsshbeavgu0=MYv9cpq2ezi3Cq26z5E1cgaBnYrNUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] fix compilation error when add libgloss under DEPENDS in recipe
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Thanks Michael for the feedback. Will surely keep that in mind and take care.

Cheers!
Nagesh.

On Wed, Jul 28, 2021 at 1:47 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Nagesh,
>
> On 7/28/21 9:53 AM, nagesh shamnur wrote:
> >  Dear Group,
> >     When include newlib and libgloss under DEPENDS in custom recipe,
> >  then newlib compilation is successful however libgloss compilation
> >  fails since it is unable to find the needed include path under
> >  recipe-sysroot/usr/include. This patch is to fix this issue by
> >  including recipe-sysroot/usr/include while configuring libgloss.
>
>
> Many thanks for your patch corresponding to the fix that you found for
> your recent issue!
>
> The patch looks good, but next time, it would be even better if you
> could send it as an inline attachment (easiest to do with the "git
> send-email"  command). This makes it easier for people to review your
> patch and in particular directly quote parts of your patch and comment
> or reply on specific lines.
>
> I realize that the YP manual doesn't explain this requirement well. I'll
> post an improvement to the corresponding section
> (https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-email-to-submit-a-patch).
>
> Thanks again,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
