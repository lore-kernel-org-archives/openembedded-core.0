Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662D6C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 08:52:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.69185.1705913563297132349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 00:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CckQtG6t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1BC5240005;
	Mon, 22 Jan 2024 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705913561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zeHggdAQ95evBlEMq5h5FgjCX+Hz5WfyF9eMyC7c9MI=;
	b=CckQtG6ttS6bn2K/UjKnRm2duJImpS3gJvn+moi1YZ0SAM7UeEtP+nmr06XQbyRlpYGbgk
	oAYCA+LUM/lXpRkcCRm7zRcpc0L0IvVitZ9lCzd6itAeFJ4W78C2dshidCVvX9t75/qchB
	ciNd7lV0ydtDRbU/eE+lU9yhAaGJVyLbRk7zaSaHvJ5huVb8kIgepU7/AY4uUs1rQkpswY
	cVQlAskfRHlxHTLqzkmg+6FBiqsm6REEJ3qOYrzSLUM18Lzt5RQVlQgD5Rzo9r85LEwopI
	xzzxIsMA2pofe4XdSeIrOH3toM2U5QvduLDZBr1S+062sEP+GmTn86uTt9NGUw==
Message-ID: <9aa6f7bdc7d10588b090430514ab49b0775afd66.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.4
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Date: Mon, 22 Jan 2024 09:52:39 +0100
In-Reply-To: <CAMKF1srAGVi6k_OBgRKMMNaat2K=s0bWcTh5f8g10_xDGsKt=g@mail.gmail.com>
References: <20240117094701.25763-1-thomas.perrot@bootlin.com>
	 <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
	 <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
	 <3d768fea662107ded470e7aa3dbd3e2d561e173a.camel@linuxfoundation.org>
	 <2024011922003945fc56a9@mail.local>
	 <CAMKF1srAGVi6k_OBgRKMMNaat2K=s0bWcTh5f8g10_xDGsKt=g@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/WRUdA7xwGjwlAgqg6tD"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 08:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194125


--=-/WRUdA7xwGjwlAgqg6tD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Fri, 2024-01-19 at 15:56 -0800, Khem Raj wrote:
> On Fri, Jan 19, 2024 at 2:00=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >=20
> >=20
> > On 19/01/2024 19:24:44+0000, Richard Purdie wrote:
> > > On Fri, 2024-01-19 at 18:48 +0100, Thomas Perrot wrote:
> > > > Hello Richard,
> > > >=20
> > > > On Fri, 2024-01-19 at 17:22 +0000, Richard Purdie wrote:
> > > > > On Wed, 2024-01-17 at 10:47 +0100, Thomas Perrot via
> > > > > lists.openembedded.org wrote:
> > > > > > From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > > >=20
> > > > > > This release has:
> > > > > > - Synopsys DesignWare APB GPIO driver
> > > > > > - Zicntr and Zihpm support
> > > > > > - Console print improvements
> > > > > > - Smepmp support
> > > > > > - Simple FDT based syscon regmap driver
> > > > > > - Syscon based reboot and poweroff driver
> > > > > > - Non-contiguous hpm counters
> > > > > > - Smcntrpmf support
> > > > > > - Full sparse hartid support
> > > > > > - IPI improvements
> > > > > > - RFENCE improvements
> > > > > > - Zkr support
> > > > > > - Andes custom PMU support
> > > > > > Overall, this release mainly adds more ISA extensions,
> > > > > > drivers and
> > > > > > other improvements.
> > > > > >=20
> > > > > > https://github.com/riscv-software-src/opensbi/compare/v1.3.1...=
v1.4
> > > > > >=20
> > > > > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > >=20
> > > > > This all seems reasonable but why is there a revert below?
> > > >=20
> > > > I reverted it otherwise the following link issue occurs:
> > > >=20
> > > > "build/tmp-glibc/work/riscv64-oe-linux/opensbi/1.4/recipe-
> > > > sysroot-
> > > > native/usr/bin/riscv64-oe-linux/../../libexec/riscv64-oe-
> > > > linux/gcc/riscv64-oe-linux/13.2.0/ld.bfd:/src/build/tmp-
> > > > glibc/work/riscv64-oe-
> > > > linux/opensbi/1.4/git/build/platform/generic/firmware/fw_dynami
> > > > c.elf.ld
> > > > :54: undefined section `.dynsym' referenced in expression"
> > >=20
> > > The commit should at least mention the issue.
> > >=20
> > > I'm also not sure that is "Inappropriate", more like "Pending" as
> > > in
> > > needs further investigation.
> >=20
> > The original commit states that relocations don't need to be
> > handled
> > because everything is linked statically which is not true in our
> > case,
> > else we wouldn't be trying to link dynamically.
> >=20
> > >=20
> > > > > > ---
> > > > > > =C2=A0...re-Remove-handling-of-R_RISCV_-32-64.patch | 88
> > > > > > +++++++++++++++++++
> > > > > > =C2=A0.../{opensbi_1.3.bb =3D> opensbi_1.4.bb}=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
> > > > > > =C2=A02 files changed, 92 insertions(+), 4 deletions(-)
> > > > > > =C2=A0create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-
> > > > > > Revert-
> > > > > > firmware-Remove-handling-of-R_RISCV_-32-64.patch
> > > > > > =C2=A0rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb =3D>
> > > > > > opensbi_1.4.bb}
> > > > > > (90%)
> > > > > >=20
> > > > > > diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-
> > > > > > firmware-
> > > > > > Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-
> > > > > > bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-
> > > > > > of-
> > > > > > R_RISCV_-32-64.patch
> > > > > > new file mode 100644
> > > > > > index 000000000000..d14e0b73a9bc
> > > > > > --- /dev/null
> > > > > > +++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-
> > > > > > firmware-Remove-
> > > > > > handling-of-R_RISCV_-32-64.patch
> > > > > > @@ -0,0 +1,88 @@
> > > > > > +From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17
> > > > > > 00:00:00
> > > > > > 2001
> > > > > > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > > > +Date: Tue, 16 Jan 2024 15:16:58 +0100
> > > > > > +Subject: [PATCH] Revert "firmware: Remove handling of
> > > > > > R_RISCV_{32,64}"
> > > > > > +
> > > > > > +This reverts commit
> > > > > > 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
> > > > > > +
> > > > > > +Upstream-Status: Inappropriate [oe specific]
> > > > > > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > > >=20
> > > > > If we're going to revert an upstream change, we need to say
> > > > > *why*. We
> > > > > need to revert it for some OE specific reason but what is
> > > > > that
> > > > > reason?
> > > > >=20
> > > >=20
> > > > I agree, maybe you have any advice to fix it in another way?
> > >=20
> > > I have no idea, I've copied Khem who might or might know who to
> > > talk
> > > to.
>=20
> We have so far build a non-PIC version but I would suggest we start
> doing PIC version
> set FW_PIC=3Dy in EXTRA_OEMAKE and try it out.
>=20

Thank you, indeed it's better.

Kind regards,
Thomas

> > >=20
> > > Cheers,
> > >=20
> > > Richard
> >=20
> > >=20
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#194065):
> > > https://lists.openembedded.org/g/openembedded-core/message/194065
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/103782707/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > > alexandre.belloni@bootlin.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >=20
> >=20
> >=20
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-/WRUdA7xwGjwlAgqg6tD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmWuLNcACgkQn8ALBXH+
Cu1YaQv+JaWZDEyT84jlSgh1GBdd/b9g0hp3w/Z3bFAZrkntvV7VWq4biy5Paqki
vJfuY5lIcrEkjK4iO+X36LIpcrX/UkorvCU3PVwpu1LrsS8mSe4PEutSRE3GxHjb
Hy7scQJ4N5OVcdrFaq84YkoR+462AG4j6J6NI0H7ZZkSK+hLooXKVo+Sh0++LtmP
P05/hJy97xre6C9TPMV52HgERcTQjrvPm0Ld8FKceXFv6YEtsVVS8ClBy1Rn0WN2
brAFf0+D/VL9EAibOqoFXOHZD/JH/jvX9TDzLVsAkZz7LV+zecpvc68Fuzc6Fn1s
vHJjkKbugv1O8umv/Ja1qnkSKscxBU2OXvxRUGeS1Ap796n1CkPUMBcNVGNNtNik
e4XLW1gVqUA2mPcU/vpnIoAj64smWDkL6A5ko9vnedyO/Ge+Ip/dKnrUv4kYWrxL
7f+bVkLVtfyTTsFlFl8GPj2Dhhi1OG2Lxpqfeqfecs8wMJA1pNT5YhDzb9nFMQno
oAZwFSgR
=7pYT
-----END PGP SIGNATURE-----

--=-/WRUdA7xwGjwlAgqg6tD--

