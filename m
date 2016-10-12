Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 65CE071957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 13:14:02 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id x23so1359878lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xTWfyiDCOXj3TZDHEOJL34UiFGw/kdAZuq8bojSli8M=;
	b=JjSb9f6Smy1k6zFcTO7M5GPwaBn0SvD9ocyMVxY+p76ElJHt85jgSv8GqiN/HQhmOE
	85bG5M1SP6vgmj1r/2d7fCShhXyztj5F/hpju+eCCtxWJjdu2Z5DKw9s5TSdYAJ8Y+RN
	P7NaZimkGB9VtCauSDMQgj+wTPsugO/F0ewS0EdI42hhm5hO1IYhgMXwm6t1fOWqYQUj
	zoJzg9oTlCLgdcQa6ADQ2LX0Npq8QQiqpN4Cgj6X6ONvQuQEoJTYgTNtWnCYvSyrTct9
	80CFwbQ3euA8CgoYaVcrkAaXyfs6Z821GQj3jCCrRKPQigol4M5yiAM4pYfKt0Um/vB3
	Giyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xTWfyiDCOXj3TZDHEOJL34UiFGw/kdAZuq8bojSli8M=;
	b=G4pXCYYPoCSgzaS2qgOrm1LEXfVExn2Lmc28O4L6tZPHL8bKQkteBXn8FG7qaogYM4
	HgRZQC+nsXqy+tzhb3R+XLwyYW66hx8PsAyeVYSV9jUkkU/StF4llNT8c8VcSRS5BlU6
	/mpMokE6nhj3qY5mB2XPOSO24JvqaMrtsAPaL2sNt+uhoQX9W00kjfUdZWe1grSXhMYg
	u5R7nSktRUTSY4fdebdX1IPzmQGjx7K5bXXllKEmz30Nbi7xmRH686D4Xa4bHNxqIF3o
	E5tNYqwUu5D6fcUzYxYv8nkvPHYMKz/3c5CRNBO9kineglRpibYZuyXPqkSxOD2F4dxR
	H/Gg==
X-Gm-Message-State: AA6/9RkFPSFuvxL+HdPVWX85ZPWUuxcLYplTw9bXNwUZvB5Z69PoAnlnkS1mzZA+jILX2A==
X-Received: by 10.194.126.133 with SMTP id my5mr1449522wjb.47.1476278043318;
	Wed, 12 Oct 2016 06:14:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a1sm12859671wjl.28.2016.10.12.06.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Oct 2016 06:14:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2016 15:14:02 +0200
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20161012131402.GB2923@jama>
References: <20161006085422.GA2921@jama> <20161012121836.GA2923@jama>
	<CANwerB1ZjGMYWryOCXDo+muAbAYHsyLG4nG3Gt7DPQV_OYP5Qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB1ZjGMYWryOCXDo+muAbAYHsyLG4nG3Gt7DPQV_OYP5Qg@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and linux-libc-headers are again going backwards
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2016 13:14:03 -0000
X-Groupsio-MsgNum: 88123
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WhfpMioaduB5tiZL"
Content-Disposition: inline

--WhfpMioaduB5tiZL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 11:55:00PM +1100, Jonathan Liu wrote:
> On 12 October 2016 at 23:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Oct 06, 2016 at 10:54:22AM +0200, Martin Jansa wrote:
> >> Either use 4.7.99+4.8-rc4 like most other recipes do or at least "4.8~=
rc4"
> >> which might sort lower than "4.8" (but needs to be verified for all
> >> packaging backends first).
> >>
> >> Ignoring all this completely results with what we can see in oe-core
> >> now:
> >>
> >> ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue: Package
> >> version for package linux-libc-headers-dbg went backwards which would
> >> break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
> >> [version-going-backwards]
> >
> > I've noticed one more thing related to linux-yocto. Is it expected that
> > only qemuarm is using 4.8 by default and (qemu)x86* is still using 4.4?
> >
> > meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=
=3D "4.4%"
> > meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??=3D "4.8=
%"
> >
> > I've checked poky repository and it is using 4.8 at least for qemu* and=
 various
> > other MACHINEs, so it might make sense to use the same for nodistro for=
 consistency?
>=20
> Using bitbake and OE-core actually selects linux-yocto 4.8 for me.
> Probably because x86-base.inc isn't actually used by the machine
> definitions in OE-core.

You're right, the issue was caused by bbappend in one of my layers,
which bumps PE, so the 4.4 which had this bbappend sorted higher than
other versions, from bitbake-layers:

linux-yocto:
  meta                 1:4.4.22+gitAUTOINC+d9f20333c4_f4e52341c3
  meta                 4.1.33+gitAUTOINC+322fa5b279_a38cb20273
  meta                 4.8+gitAUTOINC+03bf3dd731_67813e7efa

You're also right that x86-base.inc isn't used anywhere in oe-core's
MACHINEs so it just confused me, that qemuarm explicitly selects 4.8
version even when there is no negative D_P and 4.8 is now default.

> I am also running into a kernel bug with linux-yocto 4.8 on x86:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10402

I didn't get that far to actually boot it yet, in my environment I need
http://lists.openembedded.org/pipermail/openembedded-core/2016-October/1275=
12.html
for sysconfig to find the kernel.

When I've created /vmlinuz manually then almost everything was failing
to start for whatever reason (that's why I started checking the kernel
version as well).

Thanks

> > OE @ ~/extras/poky $ git grep PREFERRED_VERSION.*linux-yocto
> > bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.xml: =
    PREFERRED_VERSION_linux-yocto =3D "3.10%"
> > documentation/bsp-guide/bsp.xml:     PREFERRED_VERSION_linux-yocto ?=3D=
 "4.4%"
> > documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux=
-yocto =3D "3.19%"
> > documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux=
-yocto_qemux86 =3D "3.4%"
> > documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux=
-yocto_forcevariable =3D "3.4%"
> > meta-poky/conf/distro/poky-lsb.conf:PREFERRED_VERSION_linux-yocto_linux=
stdbase ?=3D "4.1%"
> > meta-poky/conf/distro/poky-tiny.conf:PREFERRED_VERSION_linux-yocto-tiny=
 ?=3D "4.4%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto ?=3D "4.8=
%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86 ?=
=3D "4.8%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86-6=
4 ?=3D "4.8%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuarm ?=
=3D "4.8%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips =
?=3D "4.8%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips6=
4 ?=3D "4.8%"
> > meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuppc ?=
=3D "4.8%"
> > meta-yocto-bsp/conf/machine/beaglebone.conf:PREFERRED_VERSION_linux-yoc=
to ?=3D "4.8%"
> > meta-yocto-bsp/conf/machine/edgerouter.conf:PREFERRED_VERSION_linux-yoc=
to ?=3D "4.8%"
> > meta-yocto-bsp/conf/machine/genericx86-64.conf:PREFERRED_VERSION_linux-=
yocto_genericx86-64 ?=3D "4.8%"
> > meta-yocto-bsp/conf/machine/genericx86.conf:PREFERRED_VERSION_linux-yoc=
to_genericx86 ?=3D "4.8%"
> > meta-yocto-bsp/conf/machine/include/genericx86-common.inc:PREFERRED_VER=
SION_linux-yocto ?=3D "4.4%"
> > meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf:PREFERRED_VERSION_linux-y=
octo ?=3D "4.8%"
> > meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=
=3D "4.4%"
> > meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??=3D "4.8=
%"
> > meta/conf/machine/qemuarm.conf:QB_DTB =3D "${@base_version_less_or_equa=
l('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)=
}"
> >
> > Regards,
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WhfpMioaduB5tiZL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf+NxkACgkQN1Ujt2V2gByJwQCeIhbVOjll8KrCkN9cShVdKHZ1
bgQAnRfn0v2E1mAuVnsrI1ZvBrGeCFz6
=SXS4
-----END PGP SIGNATURE-----

--WhfpMioaduB5tiZL--
