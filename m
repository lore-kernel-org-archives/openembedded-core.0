Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.11614.1631109748752100666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n9ZSeRBv;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id u1so2103914vsq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 07:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+0f0lVZtBp1Fg3aQ1ueUFw5zSmOsSee/xSAg5vEhEg=;
        b=n9ZSeRBvTKvCR2ajersYD6HcvYdsQBruZuOQLpYOxSNsXY4YtVe4SKB4dARlv94yOf
         5DOCV8mHKGPaNqFniaFllBleMgexinlH+wHzParRxVAXLyvC4vo3WzTCo83Qbthy3g5o
         qZ5KlK3/ExffrKRH1cyq0jhKnvuN/PPabJXoAXf4f5mvkcc1PD/wBmXkjP3IkQaYOPrL
         fdkKXcaFOWqOyvezM6aTF/fqRS8qT+cAPpytOyyJsdh1k7S8i1rqo3tMLoIjUXkutBPs
         XA5nm5XkqxgfhrJZVQNTLf9OBNkBSKXk88KaTU5JUU55oGWKtiynMpemfEdyQzSpU3ZL
         o7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+0f0lVZtBp1Fg3aQ1ueUFw5zSmOsSee/xSAg5vEhEg=;
        b=fstdK/nSlS0mcyAzpJJrmpHeta03QuV0ox8uDnmjp5cIcW+LhipyCSrhRYgqR4tLFS
         cfPQ1695rk1jQ5i3hSNDM5YLGtCFXG4c6Ppj+nM215eSoaXeRGedI/RcnCGuRW7B5tXW
         FlvfM6nNRY2+F+1EhQkrrntEcyMSDjtbIym7UrgT+KOMwOdscNk6HEPLaRB2GmOqw9zu
         C5rnWv7uielWLtJkSZDaUds2ooXxey+Y+pRgSjjQovttzg2ZoXw0/O9cAyIumQF5CiEX
         k7+thwJMY0uqZF4//wyt9QBpQf2upGnaeONw5ErlT1ellUKPM5bpBXl5eXQFKvlzBnqH
         d9Pw==
X-Gm-Message-State: AOAM531KCMltRocab+X+xS+HWwQ1DlvkVEH3/mokwjqex1ltXin/jwSC
	faKZw2uvVHr0nXDsPn00UI0DzPsrE7KTPdT1MSQ=
X-Google-Smtp-Source: ABdhPJxFHKfzMioDnmZqKm8KB1b6bwMI7v9dmztywN7EDC72rRUz03ttJ/6y3ASKIkkcZw4TZLWdHxr0TC9t7XDMRXY=
X-Received: by 2002:a67:3349:: with SMTP id z70mr2148727vsz.7.1631109747790;
 Wed, 08 Sep 2021 07:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
 <20210830184800.954770-7-alex.kanavin@gmail.com> <YTie/qN+H1Yo4qjp@piout.net>
 <CANNYZj9BCohUTvCt0GJs-VLtih47xi4k=ptVrSYjV2Z9abJLdQ@mail.gmail.com> <YTiyelo2c53gbo8Y@piout.net>
In-Reply-To: <YTiyelo2c53gbo8Y@piout.net>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 8 Sep 2021 16:02:16 +0200
Message-ID: <CANNYZj-kpayUgC4zTvjkEcwrgKB5eLkqXkXbXZrHL6VYfj3MWg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 7/7] package_rpm: use zstd instead of xz
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b9cbb05cb7c55d3"

--0000000000001b9cbb05cb7c55d3
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Sept 2021 at 14:54, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Sure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/641/steps/13/logs/stdio
>
>
> I also have this one with the patch removed but with the previous lua
> patches and it only has a lua issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/628/steps/12/logs/stdio
>

This patchset was not completely tested and I had sent it with [RFC PATCH]
in the subject which I hoped would result only in comments and feedback on
the content, and not maintainers pulling it into various -next builds :)
Please drop, I have everything fixed locally, and will resend.

Alex

--0000000000001b9cbb05cb7c55d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 8 Sept 2021 at 14:54, Alexandre Belloni &lt;<a href=3D"mailt=
o:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Sure:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/115/buil=
ds/641/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/115/builds/641/steps/13/logs/=
stdio</a><br>
<br>
<br>
I also have this one with the patch removed but with the previous lua<br>
patches and it only has a lua issue:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/118/buil=
ds/628/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/118/builds/628/steps/12/logs/=
stdio</a><br></blockquote><div><br></div><div>This patchset was not complet=
ely tested and I had sent it with [RFC PATCH] in the subject which I hoped =
would result only in comments and feedback on the content, and not maintain=
ers pulling it into various -next builds :) Please drop, I have everything =
fixed locally, and will resend.</div><div><br></div><div>Alex<br></div></di=
v></div>

--0000000000001b9cbb05cb7c55d3--
