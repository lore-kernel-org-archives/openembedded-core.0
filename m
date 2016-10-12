Return-Path: <martin.jansa@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94C98719A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:18:36 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id f6so13488552qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 05:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4jsi6/Z3v99AmEGkOiBUwrok4oTeNjuhtVq/yuddGu0=;
	b=x62G/uI1Sh92wYnRTOu/k5uH5+uWwUik5yA3Sw4RR61wTg7R1odf+freWImriYQcVI
	/zigSXXoXlw8jWalvBq6YculhEklgJAxQWeFhcrqjV2/UG/stnTlpRSGDZynkkqmto9W
	eiZYx18vs6XM7VZzFsP/VBcFmQbFS8rprSAWjAJ3w5F3T/Nr7hfLmsSBUNUD3P9lkpm7
	1r/n4aDpYvhW6chKcY731+69mdy7TqDKQuqGC/GJniL0NrEZcpPiIrjY0oHhd0drm6Er
	LAXbl/URY9SSWiWo6MyN99tWP9dBScEl9tYM/U9bKBrKvpEPo2flA2SUjNhAuaMOrSUh
	lGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4jsi6/Z3v99AmEGkOiBUwrok4oTeNjuhtVq/yuddGu0=;
	b=N5R1TM5UJMG5SPsR7oNXIeziaECpn3pbe806ElCvgLJNYP7TqFyzgxLsDxMtboxN+d
	vTeWa1wU9BhWDOpVGvnYMPrTdED32FASULm47omViRuXxdOg69WCrcEgzsRPTqyIsb6o
	JGuIpF2s+ztJ5+znFmFZGZLHPvUu2Q3IV2dkQppWjgO3ahV/K5sY3nr4hYDqPwMxEQR6
	/rSUlD2jLzKqr1ftt7TEzJ4/8cnJDuMYHj+gyVAumjgvSXi+ROBWhIvmPojkoz18F4Lq
	n+maY2G8n+xbHo7BjwegCkIw6nZPenRkuQEMrKzOFRizlPE8cY7/J8DhyxupNZ7fubrn
	o0rQ==
X-Gm-Message-State: AA6/9Rkr3eX6nzcqkj2W/YQWJiY0KfjhAr6G5ljY9HHIr6sbMnCriAr8POD958YvLT3R3A==
X-Received: by 10.194.97.69 with SMTP id dy5mr1013656wjb.53.1476274716819;
	Wed, 12 Oct 2016 05:18:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	e2sm12464487wjw.14.2016.10.12.05.18.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Oct 2016 05:18:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Oct 2016 14:18:36 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20161012121836.GA2923@jama>
References: <20161006085422.GA2921@jama>
MIME-Version: 1.0
In-Reply-To: <20161006085422.GA2921@jama>
User-Agent: Mutt/1.7.1 (2016-10-04)
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
X-List-Received-Date: Wed, 12 Oct 2016 12:18:36 -0000
X-Groupsio-MsgNum: 88119
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2016 at 10:54:22AM +0200, Martin Jansa wrote:
> Either use 4.7.99+4.8-rc4 like most other recipes do or at least "4.8~rc4"
> which might sort lower than "4.8" (but needs to be verified for all
> packaging backends first).
>=20
> Ignoring all this completely results with what we can see in oe-core
> now:
>=20
> ERROR: linux-libc-headers-4.8-r0 do_packagedata: QA Issue: Package
> version for package linux-libc-headers-dbg went backwards which would
> break package feeds from (0:4.8-rc4-r0.0 to 0:4.8-r0.0)
> [version-going-backwards]

I've noticed one more thing related to linux-yocto. Is it expected that
only qemuarm is using 4.8 by default and (qemu)x86* is still using 4.4?

meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=3D =
"4.4%"
meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??=3D "4.8%"

I've checked poky repository and it is using 4.8 at least for qemu* and var=
ious
other MACHINEs, so it might make sense to use the same for nodistro for con=
sistency?

OE @ ~/extras/poky $ git grep PREFERRED_VERSION.*linux-yocto
bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.xml:     =
PREFERRED_VERSION_linux-yocto =3D "3.10%"
documentation/bsp-guide/bsp.xml:     PREFERRED_VERSION_linux-yocto ?=3D "4.=
4%"
documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yoc=
to =3D "3.19%"
documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yoc=
to_qemux86 =3D "3.4%"
documentation/ref-manual/ref-variables.xml:     PREFERRED_VERSION_linux-yoc=
to_forcevariable =3D "3.4%"
meta-poky/conf/distro/poky-lsb.conf:PREFERRED_VERSION_linux-yocto_linuxstdb=
ase ?=3D "4.1%"
meta-poky/conf/distro/poky-tiny.conf:PREFERRED_VERSION_linux-yocto-tiny ?=
=3D "4.4%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto ?=3D "4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86 ?=3D =
"4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemux86-64 ?=
=3D "4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuarm ?=3D =
"4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips ?=3D=
 "4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemumips64 ?=
=3D "4.8%"
meta-poky/conf/distro/poky.conf:PREFERRED_VERSION_linux-yocto_qemuppc ?=3D =
"4.8%"
meta-yocto-bsp/conf/machine/beaglebone.conf:PREFERRED_VERSION_linux-yocto ?=
=3D "4.8%"
meta-yocto-bsp/conf/machine/edgerouter.conf:PREFERRED_VERSION_linux-yocto ?=
=3D "4.8%"
meta-yocto-bsp/conf/machine/genericx86-64.conf:PREFERRED_VERSION_linux-yoct=
o_genericx86-64 ?=3D "4.8%"
meta-yocto-bsp/conf/machine/genericx86.conf:PREFERRED_VERSION_linux-yocto_g=
enericx86 ?=3D "4.8%"
meta-yocto-bsp/conf/machine/include/genericx86-common.inc:PREFERRED_VERSION=
_linux-yocto ?=3D "4.4%"
meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf:PREFERRED_VERSION_linux-yocto=
 ?=3D "4.8%"
meta/conf/machine/include/x86-base.inc:PREFERRED_VERSION_linux-yocto ??=3D =
"4.4%"
meta/conf/machine/qemuarm.conf:PREFERRED_VERSION_linux-yocto ??=3D "4.8%"
meta/conf/machine/qemuarm.conf:QB_DTB =3D "${@base_version_less_or_equal('P=
REFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlf+KWIACgkQN1Ujt2V2gByrAACfU4lYRa+OUcZ43rkNqzk/L2kL
+hUAnR9enr3GB4FFP4y3x+QS89cwZq4Y
=94sD
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
