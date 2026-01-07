Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF0CF6C19
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:12:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2221.1767777114619675736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mhHBh09P;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8F711A26DE;
	Wed,  7 Jan 2026 09:11:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 900F4606F8;
	Wed,  7 Jan 2026 09:11:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BA91103C86D8;
	Wed,  7 Jan 2026 10:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767777112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=hmUeGCAHxHMH1go0F44sQp/NV0LuF2vO4qxDzF8e3+g=;
	b=mhHBh09PtQDrqSrtQo8xScFGGMyA80FEZir0F7FOwW8pNZq8+169XLBamDsAAa3aFmUHmn
	yH2z88M3XPjdLatP4VGysW5V1KBueH5ddMQ/ZCoxUA6w1JBUsgKCQNLIu8T5urHH2rjdlC
	nx3aqRVwpWlM6n+KcP6ELXZ8RhCbl1TiTEjd0lXySWQ6krJNY3kRm8dZaLTJ2qpN0QbG5Q
	6Mg+lBkOafDU9FCS7STak8ecuHAxUzRpTXTMgjKHqjo8ieXNEvItghCM7jwH3f7BGUgr0S
	lvaURhYwqMmca0Ajng4uwqPtrwelBjMvRG6hnq3x/OkEyhs8LzfqptxjH4wO/Q==
Message-ID: <5275cdb44c145020b817af4b56c31f6dfe2b66ed.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.8
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: raj.khem@gmail.com, ankur.tyagi85@gmail.com
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Date: Wed, 07 Jan 2026 10:11:49 +0100
In-Reply-To: <CAMKF1sqQWFBJdyYTsVLU7iQiaGrQF4ebGue0Q2+=wxtx_JdWEA@mail.gmail.com>
References: <20260106221016.3504565-1-thomas.perrot@bootlin.com>
	 <CADySD0GKQiq_jM=M57_A-6cwe-=xd8bukZH_3p1AzhuWLrmQfA@mail.gmail.com>
	 <CAMKF1sqQWFBJdyYTsVLU7iQiaGrQF4ebGue0Q2+=wxtx_JdWEA@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-v98RU25jG95bntaQKLSV"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 09:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228963


--=-v98RU25jG95bntaQKLSV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2026-01-06 at 19:29 -0800, Khem Raj via lists.openembedded.org
wrote:
>=20
>=20
> On Tue, Jan 6, 2026 at 2:30=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > On Wed, Jan 7, 2026 at 11:12=E2=80=AFAM Thomas Perrot via
> > lists.openembedded.org
> > <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > >=20
> > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > >=20
> > > This release has:
> > > - Safe and reverse list iteration
> > > - Stack protector support
> > > - Allocate heap housekeeping nodes dynamically
> > > - IPI device ratings
> > > - Andes QiLai SoC support
> > > - SpacemiT K1 SoC support
> > > - ESWIN Computing EIC7700 SoC support
> > > - Moved Ariane and Openpiton to generic platform
> > > - SiFive CLINT v2 support
> > > - Simple FDT based cache library
> > > - SiFive PL2 cache controller driver
> > > - SiFive Extensible Cache (EC) driver
> > > - SiFive TMC0 based HSM driver
> > > - SiFive SMC0 based system suspend driver
> > > - MPXY RPMI mailbox driver for voltage service group
> > > - MPXY RPMI mailbox driver for device power service group
> > > - MPXY RPMI mailbox driver for performance service group
> > > - HART protection abstraction
> > >=20
> > > Overall, this release has various domain related improvements and
> > > also adds multiple platform support.
> > >=20
> > > Also switch Qemu -cpu parameter to rv64 because rva23s64 and
> > > rva22s64
> > > profiles lack PMP entries, causing hart isolation configuration
> > > to fail [1].
> > >=20
> > > [1]
> > > https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.htm=
l
> > >=20
> >=20
>=20
>=20
> Is this change temporary ? This change to rva23 is intentional and we
> want to continue to use it so we can use rvv 1.0 switching back in a
> less than ideal=C2=A0
> Can you explore more=C2=A0

Yes, I can. It seems possible to enable PMP support on Qemu with rva23.

Kind regards,
Thomas Perrot

>=20
>=20
> >=20
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > > =C2=A0 meta/conf/machine/include/riscv/qemuriscv.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2
> > > +-
> > > =C2=A0 meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} =
| 2
> > > +-
> > > =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
> > > =C2=A0 rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D>
> > > opensbi_1.8.bb} (97%)
> > >=20
> > > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc
> > > b/meta/conf/machine/include/riscv/qemuriscv.inc
> > > index b755d32c9d1a..45fcf36e62d9 100644
> > > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > > @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
> > > =C2=A0 # qemuboot options
> > > =C2=A0 QB_SMP ?=3D "-smp 4"
> > > =C2=A0 QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> > > -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> > > +QB_CPU:riscv64 ?=3D "-cpu rv64"
> > > =C2=A0 QB_MACHINE =3D "-machine virt"
> > > =C2=A0 QB_DEFAULT_BIOS =3D "fw_jump.elf"
> > > =C2=A0 QB_TAP_OPT =3D "-netdev
> > > tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscript=3Dno"
> > > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > > b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > > similarity index 97%
> > > rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > > rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > > index a460062e9398..f2d3e9f20082 100644
> > > --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > > @@ -8,7 +8,7 @@ require opensbi-payloads.inc
> > >=20
> > > =C2=A0 inherit deploy
> > >=20
> > > -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> > > +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
> > > =C2=A0 SRC_URI =3D
> > > "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps"
> >=20
> > Can you please also try including tag=3Dv${PV} in the SRC_URI ?
> >=20
> > > =C2=A0 TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> > > --
> > > 2.52.0
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> >=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228942):
> https://lists.openembedded.org/g/openembedded-core/message/228942
> Mute This Topic: https://lists.openembedded.org/mt/117115594/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-v98RU25jG95bntaQKLSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmleI1UACgkQn8ALBXH+
Cu185Qv+LJ+AqdfzHSV5+JVIe9WsQynIEZfTlFW2FzboGg6aYosEL9fAhvM2GqFp
52DUiyhnyUV/74EA22ZW+8mr1qgMzJnmtqcA8wleiCTB59bMCZbkXp6M4kJMP5Ez
vbsk5/tZ6sLNNs8inII4EZMWMci92t8yf/KlgnOcxEyrydk9rtF3BcGlL6PFvhDb
8vCb8llVBPVX51eYYKjQ9zcY+R5GOnmeOVKrMuXEy2olFR1g2s6fdEy4IQ0RBKGf
16msPj7+nVuETXeT1mzGzz8a8uGdg2+6ZVW38QSOOecs9uLvL2PKPZIi0QzeLJ0U
ermHmTLv/r1azFHWAREhwAWj3QEp0iXm89c1Kg2FR9tx4i40OmeCyN2JXhyrdKhi
o8E2BnGi5fIVIiJ0rwkXhTfuEWC8ms8atYQsU/zg+u3wZpartohMZ2K8/u3eYf2m
mnsmTvUaKa2iEJMcS01ry6tOdrMeqmfmh6JCy3ETILVxhin/uBIK05uMSRn+bqbs
ZhBdLNRr
=oCau
-----END PGP SIGNATURE-----

--=-v98RU25jG95bntaQKLSV--

