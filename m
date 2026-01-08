Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3507BCF6C15
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:20:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3632.1767867593669518419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o2D5s9AL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2F5701A26FF;
	Thu,  8 Jan 2026 10:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 047CD606B6;
	Thu,  8 Jan 2026 10:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D86BC103C85D5;
	Thu,  8 Jan 2026 11:19:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767867591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=l19sPJygu6pG30UZLbS5UfNme5C5Wea9ApXdl+yMqrU=;
	b=o2D5s9ALFYT+O3rtf7gXuBBcU+IR900+VdjzTAc8MAcE0vrGTVLb5+zv+HOEo7hn4HAudi
	IbaUOUkb6bT/n+q816yiY7+pWCTWikEZA9lPM7RiGZ351Su+kA06YGQNpI2yq4vP8paUn0
	cpg185tCYfydlnQpNd4ipw4iszAqBjLkEnQVe98Lbq2MCYSnJ1l9XsJBO2x/lCYYHqq0i8
	jUlHph6vZxV0bpRNiMoGxHXC3PiPTVYZIQA2OLKe+pVsqqnm4yD2tMjqzn6Q9Sf8O2syGw
	fjXArT9jbpA0IGw8A0MeVHL20ssomLYj1niLauYoOnPXyCTOEQClnjckTj8LmA==
Message-ID: <f35f9afe3b2f757e39b3bb554e5fa06fef88b1e1.camel@bootlin.com>
Subject: Re: [OE-core][PATCH v2] opensbi: bump to 1.8
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>, raj.khem@gmail.com
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Date: Thu, 08 Jan 2026 11:19:49 +0100
In-Reply-To: <CADySD0GbySpgJVdCL8WSkbzid05_pFTCPWf0bzj3-bxgn5REbA@mail.gmail.com>
References: <20260107093231.59163-1-thomas.perrot@bootlin.com>
	 <CADySD0GbySpgJVdCL8WSkbzid05_pFTCPWf0bzj3-bxgn5REbA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-6x02mk2/9E4bgkX8Oumc"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Fuzzy: f6103a1a5328e3d7e62baee95ece4ab8c15f6191207e7c09da3d75d0c1d0b0c7b078459edc13010beb125b0141bbc9d64c53a35f3be699873c3acf651e5d2167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 10:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229056


--=-6x02mk2/9E4bgkX8Oumc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2026-01-08 at 06:58 +1300, Ankur Tyagi wrote:
> On Wed, Jan 7, 2026 at 10:33=E2=80=AFPM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > This release has:
> > - Safe and reverse list iteration
> > - Stack protector support
> > - Allocate heap housekeeping nodes dynamically
> > - IPI device ratings
> > - Andes QiLai SoC support
> > - SpacemiT K1 SoC support
> > - ESWIN Computing EIC7700 SoC support
> > - Moved Ariane and Openpiton to generic platform
> > - SiFive CLINT v2 support
> > - Simple FDT based cache library
> > - SiFive PL2 cache controller driver
> > - SiFive Extensible Cache (EC) driver
> > - SiFive TMC0 based HSM driver
> > - SiFive SMC0 based system suspend driver
> > - MPXY RPMI mailbox driver for voltage service group
> > - MPXY RPMI mailbox driver for device power service group
> > - MPXY RPMI mailbox driver for performance service group
> > - HART protection abstraction
> >=20
> > Overall, this release has various domain related improvements and
> > also adds multiple platform support.
> >=20
> > Also switch Qemu -cpu parameter to rv64 because rva23s64 and
> > rva22s64
> > profiles lack PMP entries, causing hart isolation configuration to
> > fail [1].
> >=20
> > [1]
> > https://lists.nongnu.org/archive/html/qemu-riscv/2026-01/msg00048.html
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > ---
> > =C2=A0=C2=A0=C2=A0 Changes in v2:
> > =C2=A0=C2=A0=C2=A0 - Enable PMP support on Qemu with rva23
> > =C2=A0=C2=A0=C2=A0 - Include tag=3Dv${PV} in the SRC_URI
> > =C2=A0=C2=A0=C2=A0 - Link to v1:
> > https://lists.openembedded.org/g/openembedded-core/message/228935
> > ---
> > =C2=A0meta/conf/machine/include/riscv/qemuriscv.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > =C2=A0meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.bb} | 2=
 +-
> > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> > =C2=A0rename meta/recipes-bsp/opensbi/{opensbi_1.7.bb =3D> opensbi_1.8.=
bb}
> > (97%)
> >=20
> > diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc
> > b/meta/conf/machine/include/riscv/qemuriscv.inc
> > index b755d32c9d1a..45fcf36e62d9 100644
> > --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> > +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> > @@ -27,7 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
> > =C2=A0# qemuboot options
> > =C2=A0QB_SMP ?=3D "-smp 4"
> > =C2=A0QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> > -QB_CPU:riscv64 ?=3D "-cpu rva23s64"
> > +QB_CPU:riscv64 ?=3D "-cpu rv64"
> > =C2=A0QB_MACHINE =3D "-machine virt"
> > =C2=A0QB_DEFAULT_BIOS =3D "fw_jump.elf"
> > =C2=A0QB_TAP_OPT =3D "-netdev
> > tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscript=3Dno"
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > similarity index 97%
> > rename from meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > rename to meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > index a460062e9398..f2d3e9f20082 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.7.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.bb
> > @@ -8,7 +8,7 @@ require opensbi-payloads.inc
> >=20
> > =C2=A0inherit deploy
> >=20
> > -SRCREV =3D "a32a91069119e7a5aa31e6bc51d5e00860be3d80"
> > +SRCREV =3D "e7fa66c2160ec139de1853a00f669c09320a9256"
> > =C2=A0SRC_URI =3D
> > "git://github.com/riscv/opensbi.git;branch=3Dmaster;protocol=3Dhttps"
>=20
> SRC_URI change is missing in v2
>=20

Sorry, I pushed a v4 [1], the patch should be good now.

[1] https://lists.openembedded.org/mt/117150136/5443093

Kind regards,
Thomas Perrot

> > =C2=A0TARGET_DBGSRC_DIR =3D "/share/opensbi/*/generic/firmware/"
> > --
> > 2.52.0
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#228967):
> > https://lists.openembedded.org/g/openembedded-core/message/228967
> > Mute This Topic:
> > https://lists.openembedded.org/mt/117131548/3619737
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-6x02mk2/9E4bgkX8Oumc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmlfhMYACgkQn8ALBXH+
Cu35lgv/SBelYMkeePZBdxzM5AfoCvP7OBAEyZbh0vyfXuDZUl8ZpI0R9zv1I01V
jS2P8ifg6nYPZBSKncPGiEtttPPD2gN/d561oxAiOCGmZVqHRgj6zrmCZdgBQtPZ
to/OyX5wqGRYp1DlquWhyg6RqJdNehavf6/zRVIs53U+Eiz4eEblZ03TRMqPD6Od
q0IgOfIVcEdBVJgeUtNKh9z4mID7yynYxuKKfyKptbJi8F7MW0YvH5tj0tZzkDKi
0yEW4Nsr+p3DD4AsVRqNOnyXRu10vke8bBkePFdTxEYRE8Nre1bjBJ2ixnlKPYaP
vDewIVOrT+547K3QxJpI5fGge66usJlsE0g4boCTlh7YOzxKcFW5AfBoZ3AoQ/76
s/CWYreE8OCq08SoY0PPYxShUTGNOdiHLUlzf9tm47Do4kK2pGFLpO4DEezGUixm
Irm/fEWa2tnenAB/8s6I3+WmAUxt3fK6Eyewyz7edVxitjJbZfK5TV0jnXtJbazF
DcQUIv6Y
=UqDd
-----END PGP SIGNATURE-----

--=-6x02mk2/9E4bgkX8Oumc--

