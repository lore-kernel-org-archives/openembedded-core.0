Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.235.1613596098627302451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 13:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4IZMXIN;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c1so10684422qtc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 13:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OZJmbpKeu5hNMryxN+mSV8wMp+bfcV9Gza7UrgmYTxk=;
        b=U4IZMXINE4DCJ57l5fEE3kcjP2dMnuxIMUUrMD4V4mgqvYfGyMSh1AGMbYtw61P0LM
         Z2TUmkh0VamLs1F7tYpkhPLki8Uc9iBqWkM7+EvuDEEgkrHUazDumXS9Zfz/iPX8Dcek
         mUSW8t+H5zZetFP9FKLuVnb/0k5HZcm5276T7oo3em7dIB3dYMiQ4kxRIZMIdh1N8iOS
         QVpYI/9Z3OSQ5qBqE0fuWpdv7wVs1wtQHn8kfp5DfXABYjXM5KdqKc1Fsi9xexf+/D1b
         P/ePu98xFVeF6J8GgVNIWrkR0y5Wg1Xf4DH9Puy5zcVB19wg1NYqXqbKkBCLsBG9owSC
         C4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OZJmbpKeu5hNMryxN+mSV8wMp+bfcV9Gza7UrgmYTxk=;
        b=c5hmylRN00QFvgbqTqRJY+oa4L/Hsl58IMvV8ZrgzQ8GJezyhEmSKRVMsaasYkmWFi
         AVcE/Ur5xqRX6MgyF70pEFKi5LLxrJTFvRDwN4AujDWiz4C+4qPRG8JazpGyifuN9j4e
         fYgqETErK7hjUdkaBnjbt76DhvWfz813K7RUuI637VscUy8g6b4Qqw7Cc0qRjtvIJHA8
         Oso4XAcbA7YlekUZW3x5Z5LY6d+u3EJ2r6fPOnW2yVzs1Ju/3igPVfhnjD1sH0yPurQc
         ADZkVURnBVY7bXTDLrDzIbxeNGlY9iH/nheqcG22nRA+GqUD2Lg+MUhaEUusfYHqoVTw
         2dMA==
X-Gm-Message-State: AOAM531Vz/BS0uJEMKacT15L3TuyZATLgt9XEth35x1B8Oj7N3Iit12q
	Ot1qhPfQvQ0BpFDuRqceBaj61vXNZPNJO5Oh/8g=
X-Google-Smtp-Source: ABdhPJwsTT0kWtb6EdCj4AyA2ZgaDyXlpNZP9l8UcAeOxRbFDpbHk8CI1TCg40hG5v2Gx9j0UBux7J3S73hMxIe1T/w=
X-Received: by 2002:ac8:745:: with SMTP id k5mr1198515qth.214.1613596097808;
 Wed, 17 Feb 2021 13:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
 <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com>
 <cc0164c7eb45418117aca6b948116acc941ba464.camel@linuxfoundation.org>
 <CAMKF1sr5ez1-Ty67OeiPNvbYJq4ipjPuFEmSV51GPeEG8yDutA@mail.gmail.com> <cee9e2a364cb99e7cf2fa9ec024e58adf345780b.camel@linuxfoundation.org>
In-Reply-To: <cee9e2a364cb99e7cf2fa9ec024e58adf345780b.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Feb 2021 13:07:51 -0800
Message-ID: <CAMKF1srZgDhnRSQ=o1iE0QXxbmemLO98zLoKYY4i9Sm5H-eCRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Refresh mmap fixes patch status/content
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes I am testing latest master-next as of 30mins ago :) so lets see if
this blocks the build too. it will take few hrs to reach there

On Wed, Feb 17, 2021 at 12:52 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-02-17 at 12:49 -0800, Khem Raj wrote:
> > I am always on master next and rebasing my branch onto it often sometim=
es
> > multiple times a day I am trying latest master-next and let=E2=80=99s s=
ee what happens
>
> So was an effective revert of the qemu patch in there or not?
>
> Perhaps test with the current master-next and see if that is ok?
>
> Cheers,
>
> Richard
>
>
>
>
>
