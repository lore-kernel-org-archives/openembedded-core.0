Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.7831.1615476560274463920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KrnHTVTU;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id hs11so47039334ejc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5CL9q5UzpS/IIltQ+v7aSfmFxUHsSV4TfMVMNnOTFbo=;
        b=KrnHTVTUqMic9S3+E9ufFNyxeaAdoQl9XTPKLOzFp7CbOzzGqD/18x/soMBVe+vduc
         HtvQsMOEZn/r5FOcJpKD0UYCSpGUD16gf+GqZfZtT1ZLkcdf1tVKM/NSacAPETLNkWUz
         tCFwCZJ1DVgGnRCtG66FT2X+jHYscBK9e0Stiov4WlhTcVLGmUu3e7fLp8O2A8XFKyeD
         QTFSH/f/GsKYl2i0+kPQ0ejnfYxs8PgzL7NKKHpk0GJkqgoFCjisdNreQV1NO9mEfiIe
         ggGnSXfX7IizlRQiSy3M7wdh3gDrpH4vA7Ua+2umllBvkSBY1+sbbo3RdRAF31YfpEMk
         Rr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5CL9q5UzpS/IIltQ+v7aSfmFxUHsSV4TfMVMNnOTFbo=;
        b=q5gxtfavQ+jQ6dHN8V9nTVufNuKAJFumw9vPikCoCz/MDPzurHDifKUqJzFeP6o3fj
         ovgW/bX5LmXHTlNyGBJZS7CHJvWRAJRGC233sjZ47la1fueTzNQQ+ytjTY6h6+03liis
         /sYB8SQibjROCGbTPwH0xg5gK0PxfyYTubktOxLW9fSdgL+KkY+rMY+mCYpGKm5dpQV9
         FteM3Jdvs3RyBZphIsuyZN/Fz9/ck4+a7fMJBooqv+3ZXBRyr5mdmCmCU8kAi5l9t19+
         r9p7hv1Hljnt8QfNTlhXiRwuJYujIorlbZC75O1L3ztuFXtywCjfR7hzP8HJUVkAzrJm
         0wKg==
X-Gm-Message-State: AOAM5336O7RshzLMaosctXwfeWPGToKT3RH2plL8c3BKXEg6y1UpepTV
	I5tiyouvqA7I0Bua+MvVrtY=
X-Google-Smtp-Source: ABdhPJymUF9KqbpgtoDZaw5c7SPCT945sbzfOYjn5dPmA8VfiJKI7xazsppH/8WzXKPsmtZbGFbh6w==
X-Received: by 2002:a17:906:5498:: with SMTP id r24mr3673933ejo.29.1615476558619;
        Thu, 11 Mar 2021 07:29:18 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r17sm1462128edt.70.2021.03.11.07.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:29:18 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 16:29:17 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org, steve@sakoman.com,
	anibal.limon@linaro.org
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
Message-ID: <20210311152917.3culjzy64ltjthgn@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama>
 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
 <20210311151051.pjdkjyaj5ojax2ya@jama>
 <166B52CA91D6C66C.28467@lists.openembedded.org>
 <30cf5ee761a17704e5e223d298869c16f13bf058.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <30cf5ee761a17704e5e223d298869c16f13bf058.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 149298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l44elhu5v6cyrarn"
Content-Disposition: inline

--l44elhu5v6cyrarn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 03:21:30PM +0000, Richard Purdie wrote:
> On Thu, 2021-03-11 at 15:18 +0000, Richard Purdie via lists.openembedded.=
org wrote:
> > On Thu, 2021-03-11 at 16:10 +0100, Martin Jansa wrote:
> > > On Thu, Mar 11, 2021 at 02:38:16PM +0000, Richard Purdie wrote:
> > > > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > > > This can fix a do_package error when compile with meta-secure-c=
ore layer:
> > > > > > http://layers.openembedded.org/layerindex/branch/master/layer/m=
eta-secure-core/
> > > > > >=20
> > > > > > $ bitbake kernel-initramfs
> > > > > > [snip]
> > > > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk=
-secure-core-image-initramfs.packagedata
> > > > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86=
_64_x86_64-nativesdk (variant '')?
> > > > > > [snip]
> > > > > >=20
> > > > > > This is because kernel-initramfs wants to pack an initramfs ima=
ge into
> > > > > > kernel-initramfs.rpm which adds a dependency in kernel-initramf=
s.bb to do this:
> > > > > >=20
> > > > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:d=
o_image_complete')
> > > > > >=20
> > > > > > This causes kernel-initramfs' do_package depends on
> > > > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we =
will get the
> > > > > > error. Delete do_packagedata as other do_package relelated task=
s for the image
> > > > > > recipe will fix the error.
> > > > > >=20
> > > > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > > >=20
> > > > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > >=20
> > > > > I went a bit further and inheritted nopackages, but RP mentioned =
that it
> > > > > might be removing too much. Nothing failed with nopackages over n=
ight,
> > > > > but still this smaller version will be safer as this needs to got=
 to
> > > > > gatesgarth and dunfell as well now.
> > > >=20
> > > > This has side effects and there was a reason this wasn't done origi=
nally.=A0The=A0
> > > > trouble is that nobody is testing for that, just wanting to fix the=
 problem=A0
> > > > they see. To prove this isn't straightforward, I tested this locall=
y, comparing
> > > > task-depends.dot from "bitbake core-image-sato -g" before and after=
 this patch.
> > >=20
> > > The trouble for me is that seeing this "bitbake -g" again, doesn't=A0
> > > look wrong to me and:
> >=20
> > It is a change of behaviour and it is not mentioned in the commit messa=
ge
> > so it would silently break anyone using SRC_URI in image recipes (among=
st=A0
> > other possible failure modes). Whether they should be doing that is a=A0
> > different question.
>=20
> I would add that anyone actually depending on that behaviour actually alr=
eady
> has a race issue since do_install and friends only has to happen before=A0
> do_build so can happen long after do_image_complete...

And according to your answer here:
https://stackoverflow.com/questions/51952495/yocto-image-recipe-and-src-uri
they also need to do few more steps to fetch the files.

--l44elhu5v6cyrarn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEo3TQAKCRA3VSO3ZXaA
HBusAJ964OyJeLQZ9ob3AQmEBh+tXPa1egCdFa8HSXdtDs8B+eFCFEVKi4l1+QI=
=BZl1
-----END PGP SIGNATURE-----

--l44elhu5v6cyrarn--
