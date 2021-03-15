Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8859.1615816559243695257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PVomsugM;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j18so5743584wra.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3GX70yzMB2jUYG3pG2trZxPN6rS+k2DQuyvN3ptgBaI=;
        b=PVomsugMoyNK3YkqxdZBiyTLvUSZf2WieV96JaIKN3X0U87t5wQYaRmaTFDILmzsnE
         UTnUsQsQKSAdCtu0RCdXiIwjPgxhi9+I0hFUAz4dT/5Bhoo0XS1eXIQ7zFY65v1ylGsa
         p7B6aTJA6f443QGHzTG/aMgByystCsw0dk+QV2fxq4/SqWy/dIaYUcTGloOtqqCz3oQE
         ZrUnOj1qfYpJF3z0JMIzoffXxBBmBejGy46umc2eQnVuCSeCaRjcxqDMA6pweBN7zzhV
         qWBZRM+f8qVDdbeSbhphmeQuIkuYqBOF4OGc1/Fz0Gp5l8kwjqZANAM/6YusqOxOFllS
         r0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3GX70yzMB2jUYG3pG2trZxPN6rS+k2DQuyvN3ptgBaI=;
        b=cUDSNg4bvQAvw4k7WJ75yIo6PouHdJzU6fpMmE2tAWAPFdv5sWydb2c4oWDiuMPJ8N
         0ejLOxCi2YUycrWYzIvO2IjM7c8MDBsjIi2VFtX0Q5L2r+uxA/QP9KEsyaYylLOAB5MW
         uT+oVOa2pvOn+rurFgNHZFVY10OyPSEPRYxMSv+27FxZX3Z34ZSNj6ZiBg9qMFv+G0lv
         U6WoRxGfNOoJccKs3/oUD47x+6AlfygMLiFeX+uscyrahmBku/SZJzEURazIryyJZA+a
         SiLuvv0ayYSrQ2mRyb2d79ZwXAuf9q3Qd/s4cdktVlhEHg3c/kyEh5Zd0V5BJPDF3rN5
         PsAg==
X-Gm-Message-State: AOAM530bcExsB5MM8TZroyIEYzZWTCcCbFDHWTAQiYD6aSWB5WIGkV9U
	1UTA8vKwkM90EdVJjTvch1A=
X-Google-Smtp-Source: ABdhPJxM32xkzLFLJF/ZzkqQnyaIBK00jWgDF5bEMP/boTEJtlQfGx3iMh21YuyzDllhN6x6k+3h6w==
X-Received: by 2002:adf:a418:: with SMTP id d24mr27260351wra.187.1615816557346;
        Mon, 15 Mar 2021 06:55:57 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j203sm13187741wmj.40.2021.03.15.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 06:55:56 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Mar 2021 14:55:55 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Boccassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org,
	bluelightning@bluelightning.org
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
Message-ID: <20210315135555.hlkwmj4yj5ugw2he@jama>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
 <20210311150959.782186-1-luca.boccassi@gmail.com>
 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
 <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
 <764f13d7a09be6a0d992651ca0f95b9180284544.camel@gmail.com>
 <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <82b8349fa9de8918ddcb70993e438d9795de4700.camel@linuxfoundation.org>
X-Groupsio-MsgNum: 149461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oqjyb6me227h5iim"
Content-Disposition: inline

--oqjyb6me227h5iim
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:21:37PM +0000, Richard Purdie wrote:
> On Mon, 2021-03-15 at 11:50 +0000, Luca Boccassi wrote:
> > On Mon, 2021-03-15 at 10:49 +0000, Richard Purdie wrote:
> > > On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> > > > On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > > > > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > >=20
> > > > > > Recently util-linux gained an (optional) build dependency on li=
bcryptsetup.
> > > > > > But libcryptsetup build-depends on util-linux for blkid (option=
al, can be disabled)
> > > > > > and uuid (mandatory).
> > > > > > Split out util-linux-uuid in a different recipe to break the cy=
cle.
> > > > > >=20
> > > > > > https://github.com/karelzak/util-linux/pull/898
> > > > > >=20
> > > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > >=20
> > > > > Unfortunately I noticed we had a performance regression in buildt=
imes in=20
> > > > > recent changes. The closest I have this narrowed down to so far:
> > > > >=20
> > > > > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresu=
lts/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.h=
tml
> > > > >=20
> > > > > suggests it may be this change. I have more tests queued to confi=
rm
> > > > > that definitively, if so we'll have to figure out why as this sho=
uldn't
> > > > > really happen, its an 8% regression :(.
> > > >=20
> > > > Very strange that a single recipe could do that - is there something
> > > > wrong in the new .bb that I missed and could cause this?
> > >=20
> > > I'm wondering if it is because we're building util-linux twice now and
> > > there is some key choke point in the dependency chain. I have no evid=
ence
> > > for that yet, it is just speculation though.
> >=20
> > With the autoconf options I've set, on my laptop it takes 32s to do
> > configure + make -j2. Most of that is autoconf - make -j2 takes 8s.
> >=20
> > Only 3 libraries are built with this combination: libcommon.a,
> > libtcolors.a, and libuuid.a/so. No executables or anything else is
> > built. It doesn't look like libtcolors is actually needed, I'll see if
> > I can prepare a patch to skip it, but I don't think it will buy more
> > than 1s, it's just two object files.
> >=20
> > The good news is that meson support is about to land upstream, which
> > should be significantly faster than autoconf + make:
> >=20
> > https://github.com/karelzak/util-linux/commits/topic/meson
>=20
> Meson definitely improves the speed! I was wondering if it was from
> configure for example.
>=20
> I now have more performance test results in (takes time to interleave=A0
> them with testing of master):
>=20
> https://autobuilder.yocto.io/pub/non-release/20210315-1/testresults/build=
perf-ubuntu1604/perf-ubuntu1604_master_20210315005048_6bb1621815.html
>=20
> and I think this means it isn't from the util-linux change but one of=A0
> another three. I'm not entirely convinced those changes could do this
> but it is what the data says.=A0
>=20
> I've queued more bisection to narrow it=A0down from there...

BTW: this split also needs manual cleanup in the TMPDIR, right?

Incremental build fails with:
ERROR: util-linux-uuid-2.36.2-r0 do_packagedata: The recipe util-linux-uuid=
 is trying to install files into a shared area when those files already exi=
st. Those files and their manifest location are:
  /OE/build/oe-core/tmp-glibc/pkgdata/qemux86-64/shlibs2/util-linux-libuuid=
=2Elist
    (matched in manifest-qemux86_64-util-linux.packagedata)
  /OE/build/oe-core/tmp-glibc/pkgdata/qemux86-64/runtime/util-linux-libuuid=
=2Epackaged
    (matched in manifest-qemux86_64-util-linux.packagedata)
  /OE/build/oe-core/tmp-glibc/pkgdata/qemux86-64/runtime/util-linux-libuuid
    (matched in manifest-qemux86_64-util-linux.packagedata)
Please verify which recipe should provide the above files.

The build has stopped, as continuing in this scenario WILL break things - i=
f not now, possibly in the future (we've seen builds fail several months la=
ter). If the system knew how to recover from this automatically it would, h=
owever there are several different scenarios which can result in this and w=
e don't know which one this is. It may be you have switched providers of so=
mething like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in =
that case you need to execute the clean task for both recipes and it will r=
esolve this error. It may be you changed DISTRO_FEATURES from systemd to ud=
ev or vice versa. Cleaning those recipes should again resolve this error, h=
owever switching DISTRO_FEATURES on an existing build directory is not supp=
orted - you should really clean out tmp and rebuild (reusing sstate should =
be safe). It could be the overlapping files detected are harmless in which =
case adding them to SSTATE_DUPWHITELIST may be the correct solution. It cou=
ld also be your build is including two different conflicting versions of th=
ings (e.g. bluez 4 and bluez 5 and the correct solution for that would be t=
o resolve the conflict. If in doubt, please ask on the mailing list, sharin=
g the error and filelist above.
ERROR: util-linux-uuid-2.36.2-r0 do_packagedata: If the above message is to=
o much, the simpler version is you're advised to wipe out tmp and rebuild (=
reusing sstate is fine). That will likely fix things in most (but not all) =
cases.
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/core2=
-64-oe-linux/util-linux-uuid/2.36.2-r0/temp/log.do_packagedata.2055738
NOTE: recipe util-linux-uuid-2.36.2-r0: task do_packagedata: Failed
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/util-lin=
ux/util-linux-uuid_2.36.2.bb:do_packagedata) failed with exit code '1'

as util-linux-uuid doesn't depend on util-linux (and even cannot depend on =
it), then
nothing ensures that older util-linux (including libuuid) is removed from s=
state-control
before this new separate util-linux-uuid is running packagedata.

Not sure if there is something we can do in cases like this and
bumping OELAYOUT_ABI because of this 1 recipe seems a bit overkill.

"bitbake -c clean util-linux" should be enough to unblock util-linux-uuid, =
but it
needs to be executed for every MACHINE (or at least every TUNE_PKGARCH) in =
given
TMPDIR.

Cheers,

--oqjyb6me227h5iim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYE9nagAKCRA3VSO3ZXaA
HKIIAJ93N/J9XwckOiFLcidDX08/LO3O4gCfciggc4eOAhQ4Y0DQRGwhr5xg7/c=
=CWwJ
-----END PGP SIGNATURE-----

--oqjyb6me227h5iim--
