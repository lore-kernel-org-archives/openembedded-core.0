Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.6286.1628343026510455815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 06:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=LTuaHxSt;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.52, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f52.google.com with SMTP id em4so6530888qvb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=14qBXFTXLShwZpSrsp7FKHF3RgYDQ7NVYisTS+eas1c=;
        b=LTuaHxStIHcad1sj7X/twtLBL9Pl/Dx+aEMskucnMZ2NuWUVPAr7iPFiQH1OfiSe9h
         RxSHP9vYOkkGTdvvCw6xqPihiA7rDHtjQo28ivpaJV6Ip4qTaLi+/43jYXwPojdX8Kv7
         C10AV31mV1O1+M9FcJY0bxe8K+vHOd2pgccT0Da/yrI87S9eSCOuLFpxDi0Avki9OWdj
         GGK3B87PXWhOSHOUD09mYp6kv24Rcjo4b7FPPcOw5hSZjl7AunwIzyBGfAMxwfZZchV9
         D8voIJU77a0A0SJTR1r2c6KTXUO5Ixd3Xv3tOSPyFGwFQNYP9rYCgTkaFTvx6Atub6JP
         CtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=14qBXFTXLShwZpSrsp7FKHF3RgYDQ7NVYisTS+eas1c=;
        b=ryhfikrVffOoUJSGHM2hvskKCVj85RUsWQqDWiPf0zbS4dtM0sFSUvYvS882renphU
         rg0Ecs4tiro+O/MkBMoJV3WlnUCSchY7Lj4yGqCPB8JMaymO9KxWmpLLbNrvD/5kVWwC
         AhBkijz/OvOb3TNDNqzUK1ZS7vK0ZDAOCu6e6shaEAB+O0DtNO7pq6hdYSRV3R/aQUED
         osdnzVnle++/cBEkU2qhdvJLqBlcwitqjQXRyoUgz18va1gVJrk/dJBnyKn39PIa6C7B
         hNUrWtFRuXQyFAzle8Pz0VcgFCYhlQHTcEyC+eAxrkS2gR3F6vTVDrH670RhKuiGByqC
         ARfw==
X-Gm-Message-State: AOAM533moNU7KNQ7V2YQG0i9qTymI7a7zWLe6fPH6L60xqPEgpMamb9P
	97VtnueJvFLqNqO8KLgVI4Qv32NtTHoJVtK/
X-Google-Smtp-Source: ABdhPJzpo/pVTN0gPP/FLxnaHqqj8KfcR6gGTUnrlT+nIDGQBBIvFqnDAMf3vwP+tpXBkbcG8rr2kA==
X-Received: by 2002:a05:6214:2a45:: with SMTP id jf5mr15924997qvb.25.1628343025481;
        Sat, 07 Aug 2021 06:30:25 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id j2sm6035437qki.93.2021.08.07.06.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Aug 2021 06:30:24 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id c5so8702509qtp.13
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 06:30:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1899:: with SMTP id v25mr13080780qtc.233.1628343024426;
 Sat, 07 Aug 2021 06:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <ec96b538-d04d-e7ea-a9b5-e2f998c6b569@dresearch-fe.de>
 <CAP9ODKq+=O0QC_F7LxRWvbPtj-7i_JCJ__e6o4bE9+J_GrkPoA@mail.gmail.com> <3D6D2025-1EAA-4DC5-BA93-164922A6947E@dresearch-fe.de>
In-Reply-To: <3D6D2025-1EAA-4DC5-BA93-164922A6947E@dresearch-fe.de>
Date: Sat, 7 Aug 2021 10:30:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrYnG4wE9Q7rTMSho9_ph+MQzApkaTF35+x=w4JmDCDsQ@mail.gmail.com>
Message-ID: <CAP9ODKrYnG4wE9Q7rTMSho9_ph+MQzApkaTF35+x=w4JmDCDsQ@mail.gmail.com>
Subject: Re: [OE-core] GPSD time will jump back 1024 weeks at after week=2180 (23-October-2021)
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Sean Nyekjaer <sean@geanix.com>, Adrian Bunk <bunk@stusta.de>, Yi Zhao <yi.zhao@windriver.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 7 de ago. de 2021 =C3=A0s 10:18, Steffen Sledz
<sledz@dresearch-fe.de> escreveu:
> Why not switch Tod 3.23?

I'd update to it as well but for old branches we need to see what
would be the impact.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
