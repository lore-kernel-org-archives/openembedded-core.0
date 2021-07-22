Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.2015.1626982007061729791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 12:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nBxLSmuR;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id d3so239066qvq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 12:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=U21rmBbKwH93VhbVQG7neZaowavxmm7X6x3bILmrM30=;
        b=nBxLSmuRd4zhHTaQYpX2pAAT1YHi3UvQWB6KETodqnxeOJ+ZC+OW9DGq9vmMCxrfpC
         xYBpahCfKpZFcuDXa2HIyIzeHOUtkoyfjtAqeCTJJmtgOa0fYZ2UW++EeKSbJGWgj+IW
         RihcAgb91crGbhXo0dLJd/CC720cWlLNDwITKmxurInGBtZ81lEZXPrrIFmkawIZNCAm
         Hf1bZgRXaUWKzC/uxqGuuWoBZ+1xS48mqjad2Fus+6/uBXx8ZZUQXO9fQ6pSS5VTKdWd
         5B2wPdTQ0NuOPc7y0rArC3gULKLL6V9ig5wgAFLgv8G4Ysy+SSS/CBVMy0Ps26ZiNg0a
         j9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U21rmBbKwH93VhbVQG7neZaowavxmm7X6x3bILmrM30=;
        b=dqrCZWPyONi9W82ZCvNiXScDd68vW7gyNhRpNi5px/ZRmrdiRpyQe/9btrPVctTCU3
         QrTZ+LnXwq9h6XqPqQ4B+15bsLvSl9q65o/MYlvT6F8eHfDATb/PhvvgGMSxW0Qvrwa9
         ZAoqVMBDK/FEFlSwGSfjR5L+D8tZ7692AW02V3fZs5zFryVo6kO2vbRuJNqqCWN+vXg1
         VAN/DcYaQ2RHUmdaAU4CL3otOgUh8TlZ8McxcTv0UJVsO0+Hm1OaI99qcnsk1g/Csdqn
         AUFCoZIKsn6a9HQjx4UirGOQnkWHS+H2BSCfBCBegS1pPckQzzoWmwTe0pFod85CoIsy
         C+QA==
X-Gm-Message-State: AOAM531VZoaNwGAqTJsHg2jD9jP/4NOqwbJQvhx2QZOp/+ctTaYzwF0O
	jfCYORVR5Kij5J8XG538j0/hr8aLZJlagR/nL5g=
X-Google-Smtp-Source: ABdhPJy9cIBAZ2plH4UYEtSvwJmzNOE0DkCOe0ev/iqv79XFmB8C60c0YCITKWX3XDCBQ3B96yK1xbmfFfr1lbJpLhM=
X-Received: by 2002:a05:6214:312:: with SMTP id i18mr1468861qvu.55.1626982006196;
 Thu, 22 Jul 2021 12:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <8DD70E68-65EE-432E-BEA4-D9E8988A44BB@soulik.info>
In-Reply-To: <8DD70E68-65EE-432E-BEA4-D9E8988A44BB@soulik.info>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 12:26:20 -0700
Message-ID: <CAMKF1sr7VxYthccLNMSeykCgosjV=rhZ7YrF2Uq4hzm+WOqe3A@mail.gmail.com>
Subject: Re: [OE-core] proposal: using oe to build Android vendor image
To: Randy Li <ayaka@soulik.info>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy

Its not clear what you are looking for, perhaps you are looking to
build some Linux packages and dependencies that can run on Android.
meta-mingw does not build for windows target although it can be
extended, it builds SDK that can be used on windows hosts to build
packages for linux targets. What you need is perhaps meta-android
which can provide the android SDK environment into OE and then you can
leverage the build infra. But if you explain your usecase a bit more
that may bring more ways to solve your problem

On Thu, Jul 22, 2021 at 6:39 AM Randy Li <ayaka@soulik.info> wrote:
>
> Hello All
>
> I am working with video, graphics and AI stuff all the time, although An=
droid has many good frameworks and published some good standards to followi=
ng(as long as you could understand its documents). I am sure we would like =
still to use those packages that we are familiar with at GNU Linux. For exa=
mple, if we want to use the Gstreamer on Android, you would need to compile=
 a bulk of dependency packages. Although I don't know a vendor would like t=
o ship those frameworks in their product, they are very useful at the devel=
opment stage. I am sure AI staff would like this, there are too many neural=
 network frameworks for different platforms. Those frameworks may depend on=
 the other neural network framework for model parsing.
>
> There is a project from Gstreamer called Cerbero, people may have alread=
y known that. It has done the most of work I want, but  I just don't want t=
o port so many recipes to it.
>
> I am not sure what I need to do, what the meta-mingw did may not be enou=
gh for me. Do I need to start up a new distribution? There is not a library=
 C nor linker loader in the vendor's partition and many install files for g=
eneral Linux won't be used in Android.  The meta-clang may need to be adopt=
ed as it would use an external Android NDK toolchain. And I don't need to s=
upport many target platforms based on Android One policy, only limited ABIs=
 would be supported and no CPU variant tuning would be used.
> After we could run that software only depending on the kernel's API, I t=
hink I could move forward to support building those HAL modules(likes hardw=
are decoders and encoders for codec2). That would require us to separate th=
ose codes from Android SDK repositories. Packing the APEX file should be in=
 plan as well.
>
> ayaka
>
>=20
>
