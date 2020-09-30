Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.6636.1601434009666741639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 19:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=cTZXxVKd;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.65, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f65.google.com with SMTP id f11so180399qvw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 19:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3TrUhDv+uxQZVm9dWLEvwkcEuLDfG3fW8E+1pJ3L07E=;
        b=cTZXxVKdpZDUOxaQ0Qr/MMAcosdOfqHvJssVO6ytGZms/MeOeDHz868btvdK/Yls1n
         qdGmU7QVSiEMO3OpmJ3VliaTnnVtTnLRnKU9eutZaKtLiZfNrxEJAwOWSXKwOT2vw1Nt
         R5z60wqw1wqJOT2nPpnygYP+lD7ITzhW0i5J9Zn6ESP5Mf9z+lPSPpkmTugcUJHs8H0a
         I3riWZz8nToAZqIXS5mjpZCM2KBYzZz9ut8rBhcsBSI2r48MdL7vrB5a1JDMFlPhZR1Y
         bMK0RlgUc3jyaN+aUGH+J/WZvgvhWFRCy/iMxQ8X1Tv5dsLpFegkI2W2U35Ln4KVDBwo
         CwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3TrUhDv+uxQZVm9dWLEvwkcEuLDfG3fW8E+1pJ3L07E=;
        b=issW+8PtINYi84iVNMjrH8336FiAsscvaJwyZs4zkXqInRtAr7a20q8qOQXjxNLpM7
         ZPpG7fCLm+h7jBdKHhkCoPME1byR8huaWPWEsM7PW7kGYLTxxxvx22lNG1n/jhSj6jIE
         pskg4eRv+JRGWp4f1JYBJ4Y2R/oHDPPr1SuRbOZBuGpF45nF5aV4EE5b/MOUd9l8tarz
         60XFrORw0mqUvZecLNQ60aLUis+rJGfnK+cIWzaoLDZaitAbbUV0UqYsDjIJkb3FV03V
         wOUFuevqkSALSRatFwV/84rkHtilELnHVV+PSs9jRt9vmbuqqAwsnDQcoTp+lu9BBKg5
         9KLA==
X-Gm-Message-State: AOAM533TAYlhpEumWwGepdjlg2kGLFmx8wvm7dgRhZ/lQnJ776xiKs03
	gJCklSN5P2LS3mClV1eFk+wf8dUTHE1dzG7B
X-Google-Smtp-Source: ABdhPJyo3kQAgB3Pm89SwhnU+81pqRm3ygvVZ9RSLubn+oFVrzR881tzy0+Ix8ThqiEMbnPJBOXvlw==
X-Received: by 2002:a0c:e28b:: with SMTP id r11mr387255qvl.23.1601434008559;
        Tue, 29 Sep 2020 19:46:48 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id w44sm637773qth.9.2020.09.29.19.46.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 19:46:47 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f179.google.com with SMTP id b2so114020qtp.8
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 19:46:47 -0700 (PDT)
X-Received: by 2002:ac8:24b9:: with SMTP id s54mr229800qts.138.1601434007151;
 Tue, 29 Sep 2020 19:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200928130551.21346-1-jon.mason@arm.com> <20200928130551.21346-7-jon.mason@arm.com>
 <CAMKF1spUKBY8ff3zphQ--H_9__jTKgs=hkHH7maMVJ4ZktjsHw@mail.gmail.com> <CAPoiz9w4iYci=mQPSEveAymTPDwLwspM22KQNH+wsLO0NC_7ew@mail.gmail.com>
In-Reply-To: <CAPoiz9w4iYci=mQPSEveAymTPDwLwspM22KQNH+wsLO0NC_7ew@mail.gmail.com>
Date: Tue, 29 Sep 2020 23:46:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprwu+-D3yMzbd1=f7m1PM50c-Exxv3gYxTE=F87jGMiA@mail.gmail.com>
Message-ID: <CAP9ODKprwu+-D3yMzbd1=f7m1PM50c-Exxv3gYxTE=F87jGMiA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v4 6/6] tunes/armv8: move to a new location
To: Jon Mason <jdmason@kudzu.us>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 29 de set. de 2020 =C3=A0s 21:38, Jon Mason <jdmason@kudzu.us> esc=
reveu:
>
> On Tue, Sep 29, 2020 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Lets not do it. For couple of reasons,
> >
> > There are BSPs including these include files which are using same
> > branch across multiple yocto releases, this will break them
> > files under include/<ARCH> are common at arch level, this moved the
> > CPU implementation ( cortex* ) under it, seems odd and even more odd
> > when you consider arm32 tunes.
>
> There are so many specific files and I'm about to add even more
> (cortex-m).  I agree that it should be done uniformly, instead of
> doing just the armv8 ones.  So, let's drop this patch (not the
> series), and I'll address it after the gatesgarth release.

Could those tune files be generated? This could allow a hierarchical
structure but easy maintenance. This might be a way to reduce the
maintenance burden and avoid breaking old BSPs.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
