Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web09.1692.1619808352375244599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 11:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQ9GO4Yo;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id b131so8883156ybg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 11:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hk1RX/rWgEgKBfObm/lVD2dMcCMgPJFJOCiTPSdoltU=;
        b=LQ9GO4YoeHbZByBm5zAZ/bRTaUh9hTuEtODI6keFrXyecJgVaCP0yEh10beCL8UORv
         81hgpYdYboKBdqFys19jW07C//uWC5lc2Z+saN6qNrtZRVXUs4ain/cd6XJ/TTYDxcTO
         akMyt6VKeLwOp6twwHNkqiFXzyVGlwvmPRB46Yl/JqLb1XTp/qlrKSKlUlTyUKJJWkq+
         ZFlF5evdQhbziJPQGxQKjDKQOQ8M+FozkHE03gPWNpxSxLk2HSllzKzuseisHnihzuWb
         sDk4jYi8CefpnylwB9qJdIje6iSm4B0SCCIDFu5QTHBgPi33qmQxiyHO7vixSgDCTqrr
         9DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hk1RX/rWgEgKBfObm/lVD2dMcCMgPJFJOCiTPSdoltU=;
        b=QX9uiMLQkocCXZ+L7GaSqartZ4I0aS4ejhEKtx7TrtlNLh8MdxUur2Km2lO8/weQXG
         1j29mpkMHTCVgQdLN9kRItFwNQPcyB5cXoV+36YIFtW5pv4ssa2y37qDy3VtTZ2x5TnF
         bwu9WoHAXgmziVr3duEN6yzZI8l/Uuop08dOx9mieTabK2OkKKyve24RIF0R9VIyks2A
         OZoLpCSt48Q9AGLxr5reXVaOpbkj1PHDH0zs7i4t0LrEjSFhpJchR6QYsiQDoLZ1tYVU
         1uPxlWpPPnVw2+D7/XUhAOwVmkGQO2aHt6bpJb/boc7Wd+w0iWDNRItvGGcJSBpig5cW
         NYWQ==
X-Gm-Message-State: AOAM532tkUu58rT/jDg/uvbvvWLB5JSxE1hp6HiaOE3ltT/BujCyCBaX
	eYPVH2LW5dq3uDktoUBkCL1qUXmsfB17sLvOVS8=
X-Google-Smtp-Source: ABdhPJx1OXG5Yrx9PLQAR1UEn5FB4Vy2wU1GnVdgrFPClF2WP/XXlQswwBIG7FIJ16svxmJSu91nWD2g5GUrQKi/PVc=
X-Received: by 2002:a25:30d5:: with SMTP id w204mr8499315ybw.416.1619808351632;
 Fri, 30 Apr 2021 11:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <DB6PR0102MB26302BA4C54F13FC351F8C0A885E9@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
In-Reply-To: <CAGDS+nk51u31+-NR2k1u-y375RL0TyCEkm9L=7Va7eQcuRQwCA@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 30 Apr 2021 08:45:39 -1000
Message-ID: <CAGDS+nkq70RdM5SRVTabnsY5i4aB-VuDeeFraA9kyc=1HoCREw@mail.gmail.com>
Subject: Re: [OE-core] Unihash warning building kernels in Yocto 3.1.7
To: diego.santacruz@spinetix.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Trying again with Mark's correct email address!

On Fri, Apr 30, 2021 at 8:43 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Fri, Apr 30, 2021 at 7:00 AM Diego Santa Cruz via
> lists.openembedded.org
> <diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> >
> >
> > I just updated to Yocto 3.1.7 (from 3.1.5) and I got the following war=
ning while building a kernel recipe.
> >
> >
> >
> >   do_install: Task do_install requested do_package unihash, but it was=
 not available
> >
> >
> >
> > I tracked this down to OE-Core commit 0c28edf4bf0d2f92bf3a47406041c63a=
cd90bacf (=E2=80=9Cpackage.bbclass: hash equivalency and pr service=E2=80=
=9D) and it makes sense since do_package runs after do_install and in dunf=
ell we can find the following in kernel.bbclass
> >
> >
> >
> >   do_install[prefuncs] +=3D "package_get_auto_pr"
> >
> >
> >
> > Merging OE-Core commit 36fe4db8ae827a93abe9fce6740459d215411965 (=E2=
=80=9Ckernel.bbclass: Remove do_install[prefunc] no longer needed=E2=80=9D=
) should normally solve this warning by removing the above line, but I do n=
ot know if that change is safe in dunfell.
> >
> >
> >
> > Could that be merged in? Or is there something else that could be done=
 to avoid the warning?
>
> I can do some testing with that patch.  cc-ing Mark to see if he has
> any comments since he is the patch author.
>
> Steve
>
>
> > Our build system flags a production build as bad if there is a warning=
, so this is kind of annoying.
> >
> >
> >
> > Best,
> >
> >
> >
> > Diego
> >
> > --
> > Diego Santa Cruz, PhD
> > Technology Architect
> > spinetix.com
> >
> >
> >
> >
> >=20
> >
