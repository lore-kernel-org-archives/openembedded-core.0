Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.29310.1588533743103533796
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 12:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FDAft16o;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id b12so10112407ion.8
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 12:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=I7FQCQ4W1dLlf9PoFM8ms1bdtGa09Ibi3UHjfknxv7c=;
        b=FDAft16opG0NjZuwGvzrZD8mGxuggqKemLZ+d+zhoNoapGVw1BfjVMLFyUizPaT5h9
         at+hUXaS7MVlETHSicWfeSrKbdEHlpkEVlkgsHXRFWZN8FIP23yt5Sr2nGqzMNKP6QV2
         byWRAwe/vWArzmS9lj3DqIkLgPHNhsNZ1XSo7RMersRX3F0XnvV8+nzjagvDN0xJmcqq
         TyALupsa/n9qEKiKvkQQYP1tUmNdxskx90CioASJulwCaMDdLR8y3diUyeS5DXOcfOqi
         W4eO2mGE08XsYD6laDnEssyhfG/7uzxR/ysCrQWhX0KomjMTKgCncTfKTT4W0BOKDAha
         8Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=I7FQCQ4W1dLlf9PoFM8ms1bdtGa09Ibi3UHjfknxv7c=;
        b=g72MqPwbsJz//5rvZGOWQfotgITQ37oFznhB5CD9Xa54K18VRcUwnPpZkq/o2SO+CU
         Jl4K7wDHq09wX7mzatBcgn199rlh/06QJ3Cx55x09nK6taz+SMlPqizxAqvfqle3dEUf
         VtdBbPjdfTCk2m8i9I+sNdWC1a+2nivP7i2SxPTGcTt2leLBV8515a5wAlJF71tY5wxP
         cZnjZjf2tlGhp77BC1iTTD0DYtUyArZfcckiwugMAO+mLgGqoo7qCWWEMECIGj4jcael
         tfAXDvTaNIYxnKrTB5ug1jJENB6DVG86RkICesJ6kqEusAofDYoGoEvbAIDsZ8fIV6cC
         WnbA==
X-Gm-Message-State: AGi0PuY+/+hpXAiU5y3G9viDjz1W0azLhq0RUpYQlc5WwzLHKftTrxQa
	6Rz0I38JZTx7i91mREgPvx0kl93gx8dZxTWpQsLaQRqG
X-Google-Smtp-Source: APiQypLQcO91f14F0USmPazUtBIKilH/zqHKrUDTcsSlwV9pSxLwWltknn2cdVJY13M3X2aprBKmGAwNtHrBZlVfK3Y=
X-Received: by 2002:a5d:9c02:: with SMTP id 2mr12622847ioe.67.1588533742357;
 Sun, 03 May 2020 12:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com> <f2661a61f4e661f58e4873bbe5efee4ef40e68cd.camel@linuxfoundation.org>
In-Reply-To: <f2661a61f4e661f58e4873bbe5efee4ef40e68cd.camel@linuxfoundation.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Sun, 3 May 2020 21:22:10 +0200
Message-ID: <CALbNGRQ92Nc7sV9SjWbSDJ6LHZsUWMNvGso3YU=m=DmyErMapQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2020 at 10:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-04-30 at 23:42 +0200, Andreas M?ller wrote:
> > From [1]:
> > New in 0.7.9
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * Fixed linking in darwin [Iain, Marco; !5]
> > * Added man page for notify-send [Jan; !6]
> > * Dropped autotools [Jan; !11]
> >
> > [1]
> > http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.ne=
ws
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  .../{libnotify_0.7.8.bb =3D> libnotify_0.7.9.bb}     | 14 +++++++++++-
> > --
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >  rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb =3D>
> > libnotify_0.7.9.bb} (59%)
>
> Looks like there is something that needs tweaking when api-documention
> is enabled as a DISTRO_FEATURE:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/470
>
> Cheers,
>
> Richard
Alex has just sent similar patch that seems to address this. I suggest
to take that one

Andreas
