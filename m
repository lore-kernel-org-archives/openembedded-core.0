Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.8281.1593554067579592460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 14:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pbnK5uF7;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a8so16494005edy.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4DJCfhOVuut946fX4m9yFbqGh+z7TiqOiiRDC+QAcWo=;
        b=pbnK5uF7htEQ7T0Wr1b0tU006XLmc1sQifCV95qn6p5tFUMkUUPTAxfFlqZQ+mG15J
         PZv8RwqbGrA1rtfocMuMfY64GuWPzp/urnEKsqup/A3X9RFfQEQ4s0eEwSAN/jrtuQmu
         2TMdd/PilSVsbeH4SJHG+0SGWgOHsoePekoUW4fvoLBEfnlDKmVouiV3nf15LXxCisbb
         Srf+DaXjvi0HesO49RytgDAOJHm3uRUVlw9srbFIhT6/Ku6arVZXpxeNaNpPZvox+O95
         AsiLZrXPQa7qthA6JWrQqUwH6KuJYJJqJJ/qRdfA++ugBKOgABV0ZWFWHFy4h2fYbSN+
         tJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4DJCfhOVuut946fX4m9yFbqGh+z7TiqOiiRDC+QAcWo=;
        b=BZG96FMTn5BxozXKEOXC+PsAcDnF+pABDbT9oET4Qg5WRPUBsHY6rLDGyGOiFI1t4B
         lZfQB5PsmMnNTVPFMaQAdwFlvbgOd9ZbTAXYzEafmPm5yPUpyFlIr1aeGUJE1lidy5W7
         nAAvCZ1V9BvIFmRNvF50rAHDIGqALXXNiKu2a0pSJG2nO9WondZYgvAaPz2+AxKL4mNq
         35+YvR8O4OuUKYEnesiRnh2y3pyc/CrjO1bKfhGdiUpWuji9jdBTOn66CZyNwBK9Pv+f
         D/Ma//5CVEXG+v/Q34uUJQF0g4rgzwVdK1hRmOCOXv3ZnWg9Bts7Q7Dc6ieAWB6//IrA
         +LnQ==
X-Gm-Message-State: AOAM531W5KrRIJzV2B7ZXgqXsygNKpfev4vFCSiYuwYn+TvegDzqMGvD
	BKuO+S9V9DxsGF3etR+twBY=
X-Google-Smtp-Source: ABdhPJz04AoeapJVsFTFrRz6YI+MfV9eKnsXYIW9Z8PsqYOCbQfxNfndCFF91AFVRWa880b7F7b6vw==
X-Received: by 2002:a05:6402:1778:: with SMTP id da24mr12994841edb.126.1593554065965;
        Tue, 30 Jun 2020 14:54:25 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s21sm4144601edw.37.2020.06.30.14.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:54:25 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Jun 2020 23:54:24 +0200
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: Ross Burton <ross@burtonini.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>
Subject: Re: [OE-core] Add package managers as a plugin
Message-ID: <20200630215424.u77jq5frrnpwztfc@jama>
References: <20200625101413.2783-1-fredrigu@axis.com>
 <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
 <1593543683295.70380@axis.com>
MIME-Version: 1.0
In-Reply-To: <1593543683295.70380@axis.com>
X-Groupsio-MsgNum: 140151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vlezr5jsmo3o6qb2"
Content-Disposition: inline

--vlezr5jsmo3o6qb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 07:01:23PM +0000, Fredrik Gustafsson wrote:
> Hi Ross,
> those 5 seconds will increase to minutes for my use case and we build a l=
ot
> hence I hope this will save us a lot of computer power and engineering ti=
me.
> For example I've sent numbers on building a bigger image (core-image-sato=
-sdk-ptest)
> to Alex and Alex:
> out.apk.1: 1:13.35
> out.apk.2: 1:13.51
> out.apk.3: 1:13.23
> out.apk.4: 1:14.07
> out.apk.5: 1:13.00
> out.deb.1: 3:49.37
> out.deb.2: 3:50.77
> out.deb.3: 3:51.39
> out.deb.4: 3:53.40
> out.deb.5: 3:53.99
> out.ipk.1: 2:38.99
> out.ipk.2: 2:39.07
> out.ipk.3: 2:35.34
> out.ipk.4: 2:36.15
> out.ipk.5: 2:34.55
> out.rpm.1: 1:58.61
> out.rpm.2: 1:59.42
> out.rpm.3: 1:59.70
> out.rpm.4: 1:58.96
> out.rpm.5: 1:58.11
>=20
> Also consider that if we've a target without python with limited space, r=
pm is out
> of the question. So the real comparison would be between ipk and apk. Let=
's
> say we can save 80 seconds in each build. Now multiply that with the numb=
er of
> builds, and we do a lot (I guess we might approach 100 000 builds/week in=
 the
> next year). Then this will save 92.5 days build time each week.

This is impressive.

Have you tried to profile where opkg spends most of the time compared to
apk? It would be nice to know if there is something fundamentally
different in how they handle packages or if apk is just better
optimized.

Now with opkg better maintained (thanks Alejandro!) there might be some
relatively low hanging optimalizations which could be implemented there
as well (for people who didn't implement the rest to switch to apk yet
:)).

I know at LGE we have some patches (some related to performance as well) wh=
ich
unfortunately weren't ever upstreamed :/, some are at:
https://github.com/webosose/meta-webosose/tree/master/meta-webos/recipes-de=
vtools/opkg/opkg

Cheers,

--vlezr5jsmo3o6qb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXvu0kAAKCRA3VSO3ZXaA
HDo/AJ42QuxvMD/yO0Yl+36r3yUIQGgaYgCglCxNgII0VUPyR7v5EN9U4aRE3CY=
=rP1T
-----END PGP SIGNATURE-----

--vlezr5jsmo3o6qb2--
