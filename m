Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7512.1615475453984536478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RkJqjEMt;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id r17so46845852ejy.13
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BjO9Pr3mugP2k3ZTrUoY2c0GhJJrBUA/KwwaHlNBGCc=;
        b=RkJqjEMtv2lHC+G2hmk/x5Nt5FrYXG3bcQDE8Repi+dvthsZIdoyTl8UTwTev6T/NH
         sva/rr01CAK+bWW2b0dW8yCOVex0KL9PhJ43Yp7IiNtJIo2ASyvnTGoOuK1AelV8Ykff
         uQU/PS7PJGKzA7qvd1D8WicwsJwe2BkDypMgHHTEhHevA61owEx8x2ciN4bY4dkCZP01
         H6e5MHncl0Q9zgVturvADLwb/K8Sc7mJ2NfgqxW8Tij75BXdTJZm3AxvyoLgAtZGkJYQ
         thqVufk2WCGLT1DbkMe2LKBITmXhMRcC7NMih+0Hf4Y1/NKguVFMxdbugkhECMHkL3jE
         sxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BjO9Pr3mugP2k3ZTrUoY2c0GhJJrBUA/KwwaHlNBGCc=;
        b=srHleaSHZz1rX7YOJ5YdgjO1F2k2ZdMS6OYEf37YeMugGqMUrfcB+ACHxlnG0w1HTi
         rUpiLYI+O5m9zWV+Quu4U8OcUeK0aFazGxX+diRWmkRxHOGr13z+Q5anI3mMCnU5utGI
         I99r7XpxutVW6PbRrW7FgvfECVnUEShiArEsM2bOuq/1PfoM14vmGfgNFJ1XUNWVe0iQ
         oGgHBiQ5KwJgOqonFboFNAnNH+RzDpbFNra1tl2EUtxPyhXEBcwYuaNTyrD/sqGhQoeU
         hFrFFUHm3V1zhIJVokS1Xwg3GXDCKMUkjotIwVAEUxJG8vgsGq+7xgoN/DnlhjvTEVVI
         Vimg==
X-Gm-Message-State: AOAM531VZ9kvFcaXvn1Mf2BcN0vYzNlmGQZW9riZ+ClcosktEuaI0+1L
	IXSUozwfK7RWXvRYbZVVABY=
X-Google-Smtp-Source: ABdhPJyHQNM0eOkczUWDqaWXVSksMkBj73hn2S8I1KGxY11zyZPCfwX879yXq8XCtTmk9dqt4YNv8Q==
X-Received: by 2002:a17:906:39a:: with SMTP id b26mr3611422eja.158.1615475452219;
        Thu, 11 Mar 2021 07:10:52 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m14sm1376743edd.63.2021.03.11.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:10:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 16:10:51 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org, steve@sakoman.com,
	anibal.limon@linaro.org
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
Message-ID: <20210311151051.pjdkjyaj5ojax2ya@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama>
 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 149293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rp545n5oaz23a62f"
Content-Disposition: inline

--rp545n5oaz23a62f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 02:38:16PM +0000, Richard Purdie wrote:
> On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > This can fix a do_package error when compile with meta-secure-core la=
yer:
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-se=
cure-core/
> > >=20
> > > $ bitbake kernel-initramfs
> > > [snip]
> > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secur=
e-core-image-initramfs.packagedata
> > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x8=
6_64-nativesdk (variant '')?
> > > [snip]
> > >=20
> > > This is because kernel-initramfs wants to pack an initramfs image into
> > > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb t=
o do this:
> > >=20
> > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_imag=
e_complete')
> > >=20
> > > This causes kernel-initramfs' do_package depends on
> > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will g=
et the
> > > error. Delete do_packagedata as other do_package relelated tasks for =
the image
> > > recipe will fix the error.
> > >=20
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >=20
> > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > I went a bit further and inheritted nopackages, but RP mentioned that it
> > might be removing too much. Nothing failed with nopackages over night,
> > but still this smaller version will be safer as this needs to got to
> > gatesgarth and dunfell as well now.
>=20
> This has side effects and there was a reason this wasn't done originally.=
=A0The=A0
> trouble is that nobody is testing for that, just wanting to fix the probl=
em=A0
> they see. To prove this isn't straightforward, I tested this locally, com=
paring
> task-depends.dot from "bitbake core-image-sato -g" before and after this =
patch.

The trouble for me is that seeing this "bitbake -g" again, doesn't look
wrong to me and:

> I know last time we tried this I got several complaints
> from users who use these tasks for things.

is the first time I've heard about people using these tasks in image
recipes. I haven't found any reference to this in the patches which
previously touched this area. Complaining that people don't remember
whole history of OE like you isn't fair :).

Cheers,

--rp545n5oaz23a62f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEoy+QAKCRA3VSO3ZXaA
HPyuAJwKO9HklYiZOPgRCC/lHG/7GYi8DgCfeWPaqx1Kc288jUBH9ADcsePRSmA=
=MKY3
-----END PGP SIGNATURE-----

--rp545n5oaz23a62f--
