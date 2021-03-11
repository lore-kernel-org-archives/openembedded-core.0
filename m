Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.3328.1615451445968230704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CdNxzgGP;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id dx17so44448910ejb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 00:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sl57p1ooY30N6pvqRQ2rOBut26nF1jK9c0xH0ZySwl4=;
        b=CdNxzgGP42CI5rfJp0jQu3YR7H1Ha4mOSaMLsQqIL4X1QRNNOaKZvk2vX25EcBQ7Vp
         zBkXeDzUsOwqJwcDYP8F/uAeyKeQB8Unb8F//zBNMwLk62HWsGMUK3W+y563qV/IVmct
         pnL4jPilRS4yp5qHKWNQ4GyDmgQ7oAKn2gV0WvbVLQZU9vzxcgSS/ctuvJZA0KG/4Yey
         nliZ2MfgW4G7Aq8sm/vrP1r8IF0BpCEbiX4msgkZn4nN4Jx2Ho2iTcjS3Xbxv76pHizv
         v3QZoLDmG9aTZSH1aIIwtWhqahAXYSLLotNAq492q0/MUIcQHNBlXCqP9CGeDZyOyOoc
         KpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sl57p1ooY30N6pvqRQ2rOBut26nF1jK9c0xH0ZySwl4=;
        b=IzsodiW26g3mRQdZJhg05p7XA1xqPyHAceh5Euh8Gm3aYqgVJOZS54GNJAdCvbWYnx
         LQAsrcdwPqNamt8lI725ywIYFpQNtvggVOkywLYBjiM+PTVPLH6ZhYXw/esYIhLhNxKl
         g6cdr40ouCexVqp+4YGFtcGoR+RrxJabV64XkDNk6DXaYiJjwGCoGPtHRT9Akw7qQH7/
         31J0XXtXLZy5Ku79apXAFTkrFIMVbAyMEnJqsXC+aPZGDr1FcxIY7ILHf6fPdQipseSe
         eAhEv3D9TXiWKCQc0rAATLZqW6bPlWv0ZVyE0aev3JdVcmM26UMAyxiXZ14qBxvxa21t
         ItSQ==
X-Gm-Message-State: AOAM533a8ooIvdQgcw+A/KCyCozcDtebMAWRkF/AFDYHNRKOfoa+Bl/l
	6AYzAunzOfycP/Q+5GYMshU=
X-Google-Smtp-Source: ABdhPJwN6CoYLnFSMMZKGE/z2n9MKoxa99U1rVXCmthByODvQtP6ZDk4HrZ79B66AcOg0sWr77KZ6Q==
X-Received: by 2002:a17:907:7699:: with SMTP id jv25mr1212565ejc.363.1615451444254;
        Thu, 11 Mar 2021 00:30:44 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u59sm878602edc.73.2021.03.11.00.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 00:30:43 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 09:30:43 +0100
To: Phil Reid <preid@electromag.com.au>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] INITRAMFS_IMAGE Manifest packagedata not found
Message-ID: <20210311083043.dpreym6g7xiijhbb@jama>
References: <fe33bbac-fdfa-abd6-5e05-b716449dd7ec@electromag.com.au>
MIME-Version: 1.0
In-Reply-To: <fe33bbac-fdfa-abd6-5e05-b716449dd7ec@electromag.com.au>
X-Groupsio-MsgNum: 149268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="454qvebmli2zjjjs"
Content-Disposition: inline

--454qvebmli2zjjjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 12:14:08PM +0800, Phil Reid wrote:
> oe branch: dunfell
>=20
> Or kernel uses a simple initramfs, no modules are package so there's no c=
ircular dependencies.
> And this approach seems simplest for a one pass build.
>=20
> So it includes this:
> INITRAMFS_IMAGE =3D "emit-image-init"
> INITRAMFS_TASK =3D  "emit-image-init:do_image_complete"
>=20
> Previously this seemed to be just a warning, but now we are getting an er=
ror that aborts the build:
>=20
> NOTE: recipe emit-linux-rel-5.1.7+gitAUTOINC+d2b6c25422-r0: task do_popul=
ate_sysroot: Started
> ERROR: emit-linux-rel-5.1.7+gitAUTOINC+d2b6c25422-r0 do_package: Manifest=
 /home/cleanbuild/build/workspace/soc-image-v2020.04/tmp-glibc/sstate-contr=
ol/manifest-x86_64_x86_64-nativesdk-emit-image-init.packagedata
> not found in cyclone5 cortexa9t2hf-neon cortexa9t2hf-vfp cortexa9hf-neon
> cortexa9hf-vfp armv7at2hf-neon armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp
> armv6thf-vfp armv6hf-vfp armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-=
vfp
> allarch x86_64_x86_64-nativesdk (variant '')?
>=20
>=20
> And sure enough there is no packagedata file being generated.
>=20
> Not sure what the solution is here.
>=20
> image.bbclass sets: do_packagedata[noexec] =3D "1"
> So I tried do_packagedata[noexec] =3D "0" in the emit-image-init recipe b=
ut that had no effect.
>=20
> Any suggestions appreciated.

Hi,

this is the same corner case I've reported yesterday in:
https://lists.openembedded.org/g/openembedded-core/message/149257

but I've deleted the packagedata task instead of executing it.

Regards,

--454qvebmli2zjjjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEnVMQAKCRA3VSO3ZXaA
HNmqAJ9oHybqXufIaMOI9O0rM76BExUY5ACgi0EcqhJykfR92izKgR5j8iuY75U=
=6THs
-----END PGP SIGNATURE-----

--454qvebmli2zjjjs--
