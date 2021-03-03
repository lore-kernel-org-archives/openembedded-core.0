Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.9725.1614790713723742355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 08:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BSUJEJ4/;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id do6so43627393ejc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 08:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WBrXuajEk2eIqDOdaiCrh4RbmW6d7itT339lHULFeSc=;
        b=BSUJEJ4/kSAcM2MILk0SBtnKBZvNvIMq5Zj2ntUAlhjBgV0+dj2nm/SN7NUGHHP0a/
         ngQZbjWN83TWdnt3nIJRZUATZ1mnu6b2sl+WwEwBMKNFR+pHmLFhtBHX8mfCDE5/T8pe
         k8rWiGcWFoJdkujOsqkLnRj944+ng+PFPp7IdL8aBCdqImRNczAHib67AwpKFD8CQHWj
         P8m812+kwGLQb68/DhErRGhHmj6sZY++QECbrUsjJHMB0ZumC3thcNpA5cd27vjUnJBY
         wrO+1AamDAxansjmjopyGXH3ceXLi/HrCk6HCwl1FqpyIku8zEx+toPd7gpoQvRmevTp
         Yv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WBrXuajEk2eIqDOdaiCrh4RbmW6d7itT339lHULFeSc=;
        b=EYaiwNJ5Mu/SxRU/CAYQy96g7WGbVn1cbU9Lz1dxtqzJCa9bbHj4ajb8qeLx1l8EJi
         l3SceZAZVlozuUrMXYAguFAzvzLT0W6JNijYIiwCnDhzuFhi32/ShOp6C+LyKZgmiaSc
         xgPGKca1/TRg1RTdO5W9L41UEmhwBhsM+t09CP0lo2d8E3VG7C+iCo3Q4cjyYb2aYivz
         MCVVEwxFnvTLhJhHZG7r2Obwx01+adzbVjQAH40iJSZxC/85D36EvUSgYCbmViOldJp4
         tGmtgzrZdPQ0elXvOpVWzq85I1byhadEHCrbZO5zneOuasqZXbXYxHowul2hZXe8+Mrz
         Kkag==
X-Gm-Message-State: AOAM531eekYbTjVbuz9OHFvtwbyqBMOvjljICmpBenreBVT10IH1akKK
	cp2VgWh4Su02vzNIZsiqHoM=
X-Google-Smtp-Source: ABdhPJxJGARBYQ9em1YmYji97R4pQ9DnMbpH5oAYAPv0Di3p4pWLMWC17YdpgUd0dYMNtXk8sldk5g==
X-Received: by 2002:a17:907:3e8c:: with SMTP id hs12mr8328464ejc.105.1614790712228;
        Wed, 03 Mar 2021 08:58:32 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t16sm24091337edi.60.2021.03.03.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 08:58:31 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Mar 2021 17:58:31 +0100
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Colin Finck <c.finck@enlyze.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
Message-ID: <20210303165831.vg4rzrxyhzrxpf2l@jama>
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org>
 <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
 <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
 <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
X-Groupsio-MsgNum: 148895
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hnsl36a4momtp6ut"
Content-Disposition: inline

--hnsl36a4momtp6ut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 08:34:23AM -0800, Khem Raj wrote:
> On Wed, Mar 3, 2021 at 8:16 AM Martin Jansa <Martin.Jansa@gmail.com> wro=
te:
> >
> > Steve, Colin:
> >
> > keep in mind that this version also introduces some new restrictions, =
e.g. rpi-sdimg IMAGE_FSTYPE in meta-raspberrypi is now failing with:
> >
> > mkfs.vfat: Label can be no longer than 11 characters
> >
> > not sure how common this will be in other BSPs, but people might be su=
rprised with such failures in LTS (like they were from the need to update o=
e-core/dunfell checkout to get python3targetconfig.bbclass recently when ot=
her layers started to require it).
>=20
> thanks for this info Martin, 4.1 was released in 2017, so 4.2 is not a
> bugfix only release by any means. It should be out of policy for LTS
> backport. since we have different tools and techniques to partition
> storage media
> this tool plays a vital role and we should be very careful making
> changes to it, especially in releases.

For reference this is the fix for meta-raspberrypi:
https://github.com/agherzan/meta-raspberrypi/pull/822
and this is the change in upstream which enforced this (it was checking
it in fatlabel for long time), but not in mkfs.vfat until recently:
https://github.com/dosfstools/dosfstools/commit/c598354

This mkfs.vfat error is relatively easy to spot (as it will usually
happen during build for us) and relatively easy to fix.

If I understood Colin correctly, then older dosfstools would break even
older partitions created by mtools (e.g. if you (let automatically) run fs=
ck.vfat from
dunfell based image on device with /boot partition originally created with=
 mtools
from warrior days), but it's not clear to me from what Colin said or from =
mtools mentions in:
https://github.com/dosfstools/dosfstools/releases/tag/v4.2

Some demonstration of this issue would be nice in the backport request
to persuade people it's worth an exception of backport policy or
maybe only the actual fix should be backported to v4.1.

Cheers,

> > On Tue, Mar 2, 2021 at 2:43 PM Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
> >>
> >> On Tue, 2 Mar 2021 at 14:26, Colin Finck <c.finck@enlyze.com> wrote:
> >>>
> >>> On Mon, Mar  1, 2021 at 05:58 PM, Alexander Kanavin wrote:
> >>> > Can you send a followup patch please, on top of master-next?
> >>>
> >>> Here we go: https://lists.openembedded.org/g/openembedded-core/topic=
/patch_dosfstools_build/81024606
> >>>
> >>> Who decides about backporting or not backporting dosfstools 4.2 to D=
unfell?
> >>> I can only stress again that a large number of devices in the wild a=
re currently running on FAT boot partitions, and come with a dosfschk versi=
on that likes to destroy these boot partitions.
> >>
> >>
> >> That would be Steve. It's best if you cherry-pick the needed patches =
into current dunfell tip, and send them here with [dunfell] prefix, adding =
the rationale to the commit messages.
> >>
> >> Alex
> >>
> >>
> >>
> >
> >=20
> >

--hnsl36a4momtp6ut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYD/ANQAKCRA3VSO3ZXaA
HFWYAJwJMutSmzgk+2nGyf87gAzBOsjCVwCeJZ5llTMPg7OHF8RedjHX209A7mA=
=1j6f
-----END PGP SIGNATURE-----

--hnsl36a4momtp6ut--
