Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.9449.1611648479531250212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=raFlGuUu;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z9so11670447qtv.6
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uYEpyUAL7KObefBGRlaPLSsoxDTJIf2e+f78V8qpWxE=;
        b=raFlGuUu+OcdAA0F+Ib1LE1sBW9nv1GFWJEOZVbvoGpEoiarijoPEUTnnTJNE/mRuf
         myk90CqSyqkTGXJ4SUUSDQ7V7JfgShLOsVt0NCgxeUYQWUdqtJ59fonqz55HBWIE5cQf
         10Kf20zeHu652WnOiKZWa365DLkGKMM+H3Tf9sFn8fIb3RoDEa7Z4uW5x9yLs4L8TJIB
         UOSor6Hv2FF4XW4ojO/DvrVUgF23hOI4ZEVPKhKiMhimstAjQw6ll5K3g9/cLksmuXV8
         LC0UpIgc/Ef9qF4fXxEYUMXWY7okgRJTtnKn0kLHqPwVgcBgnbFbi3hYfZjFxh3wSUVD
         EVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uYEpyUAL7KObefBGRlaPLSsoxDTJIf2e+f78V8qpWxE=;
        b=kykIYdSHDycP6eVtPQMZufLh7lz5B76/M0H24Yc9yznH1Csg2S6OXM4BoTdbp9kFIG
         Q2V3PYtG2pwuNgGMQf2S3w4U3L7Kavbqp3NMZL5oFd3Vez9KlP5bllB+yd8q0akL4eml
         KrBUQu27nAadcMtiX8ETBtYTyQHufYlIeG6rtnPKKa220NnO/JskJvfS7laNgoxL5qLX
         iamYnLEsbvSmMItWmPVu/TKGJUSd6aW/5g9D8V1ujW7HNZPM/joDAQLo+y2Y2JDzCNcV
         k35n80QPEs8le2ZpYhjQQZFVi93aPdp4HWUn7sQzTkDK3DzKBSnyz0ooOwixCl3lrWNZ
         JBkA==
X-Gm-Message-State: AOAM530+WDrSsgdAqNmQXN8u1pfFVudm5Ln9kp453IqQMiv5cGvtNAUc
	7znm6LjmESHfLxaD0FQSFXwJgtWfCD4qTwCV1fo=
X-Google-Smtp-Source: ABdhPJyOubdXPM7wqJ3hLyKoUpNsV/cXevKU2raBGIgmUJdPOikDa0dAndft+5jH9uNk4D7Xvedt1qVj7wpY3VVVGWc=
X-Received: by 2002:ac8:7441:: with SMTP id h1mr4083093qtr.88.1611648478500;
 Tue, 26 Jan 2021 00:07:58 -0800 (PST)
MIME-Version: 1.0
References: <CAN7sTguiWFuDzFbynGfZUO02Lh3X-bTVVSYezgBxZ75fGX0K6Q@mail.gmail.com>
In-Reply-To: <CAN7sTguiWFuDzFbynGfZUO02Lh3X-bTVVSYezgBxZ75fGX0K6Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 Jan 2021 00:07:32 -0800
Message-ID: <CAMKF1srP4QvoST3JMmgUtiem-g66Bu+X-egG3Sz+04dVv3cCGQ@mail.gmail.com>
Subject: Re: [OE-core] World build doesn't include any recipes other than the core recipes
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ida

You perhaps can build the respective test images e.g.

./meta-filesystems/recipes-filesystems/images/meta-filesystems-image.bb
./meta-initramfs/recipes-core/images/meta-initramfs-image.bb
./meta-multimedia/recipes-multimedia/images/meta-multimedia-image.bb
./meta-networking/recipes-core/images/meta-networking-image.bb
./meta-oe/recipes-core/images/meta-oe-image.bb
./meta-oe/recipes-core/images/meta-oe-ptest-image.bb
./meta-perl/recipes-perl/images/meta-perl-image.bb
./meta-perl/recipes-perl/images/meta-perl-ptest-image.bb
./meta-python/recipes-core/images/meta-python-image.bb
./meta-python/recipes-core/images/meta-python-ptest-image.bb
./meta-webserver/recipes-core/images/meta-webserver-image.bb

On Mon, Jan 25, 2021 at 8:54 PM Meh Mbeh Ida Delphine <idadelm@gmail.com> =
wrote:
>
> Hi Everyone,
> I added meta-oe, meta-python and meta-networking layers before running m=
y world build but from my output I get, none of the recipes of these layers=
 are included or taken into consideration. It's almost like they weren't ad=
ded. Please what could be going on?
>
> Cheers,
> Ida.
>
>=20
>
