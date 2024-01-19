Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BABC47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 17:48:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1198.1705686491467227281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 09:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=josaJWf9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7E9BC0008;
	Fri, 19 Jan 2024 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705686489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k3APgdJaoHQaiGkseRmywg6uOqmtnJuB8EYkZMrNKC8=;
	b=josaJWf9sbmcsHFhcuOLocsx/1v+P96DW0P46qPqX9M8j6x1BhJZI3kGK1KPPnaW/pEXPm
	xpBkvukO8bJCqDeimhnYgUuK6TxN5wnAuHJeSQCBY9U1v0ulKbP8a+dm8vy9fZKkLvVGbO
	xhEpmlnSgmKeAqzX9aAOrdYMLQGTgYlkpLMtp01y9lTvbS+l5PQXMRscwdLTlW22ESGeqW
	ICN6srscl9aM4QqXpxEImiurNX61jO/8Vbj6QkdIFaLEv20xS/1if0Dcm6v6uYR/AsyAta
	KujKjWzOshoMmuq27kMUNdbql3rgbRQ0AWVA8boxAw921XrlkRr1cUql5WSKRg==
Message-ID: <f9050dd0b2bb0c072f891a5b45cf96bdb7b9a7f0.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.4
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Fri, 19 Jan 2024 18:48:07 +0100
In-Reply-To: <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
References: <20240117094701.25763-1-thomas.perrot@bootlin.com>
	 <abad3986d80e9eae3e7ed69f1ca466678eea042d.camel@linuxfoundation.org>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwYO+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrLCMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1GnU3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2nXxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2ukI45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQEAAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfwAsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVForlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXEdnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIifja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWL
	TZY0hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH+c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2khME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Te5AY0EX79k5QEMAMNL3Jqgtre1+nGSt2SxDoLCzBUxufh+nHXgSPK4+dka3R1nmv8Ek1XGJ/PYp9PRXqaRGMaMb61OXsxU2vs9+Blg8ko7FE7wwMTohfRlGMxwNB0adFIqXeuyoEm9rKIUMez+WCiE97FTvZpJgjuIBal30JjaDxyqTSB22tS1cT7bXQTkX9Ijml1zunD+WmfFKLvddhMthOF5hnxMgnBJlAXDHyd6F1kEFYwEgbugldym65D0Z8xyVyJkfKQSmamUW4jcbg8FvVjVwWCg/gH6N+KokR2VQOnbqyB/5ISb0w/cggnH8I36KZnPZ9YRXpFK2Le6QG8mEnWf8f4h8S50ZtV98v7ANb6F9DbLbfK+qoKWdyxhXQCRzoV1vT64eOrJnxaL7uE7g9mkpQvspETK2lBx1okPn9f1qe1On096T4huS7qrhEF+Qt8fg1yAK1G5Ifj7o9nk8uGvFoHly0edTzf4BNZIjruXaM9PNpYMGutT+j/TcTY60a+vQi6GKTf0LQARAQABiQG2BBgBCAAgAhsMFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAl+/aA8ACgkQn8ALBXH+Cu10Rwv/fNlo+C3lnNnJUr+1t7toVZFynsPCBRXhoGvCNlJZa1/mOQGzKLWd4vKoNrCsjm3wmbaajTTST7FmnphUmGahx8/Fn/iU+BeNflLW/Z54RbqC7b+0NpeagueoTtgeYzxGsbrammwtkCk4T6YzS4pIRbubde/kKxAYrb/CZU
	0S//jkiNumQmWn2Pi+VPXHldd/7vXAaBkzkhN/mzIhBxZRebE1+qADKzDt70J393NfA5nq2FuUU3Q2se5CFBvOpDmsxMhiGQrOOREGMzWj46NA3qsC4VxpetgbjTf1gY/JwvWItWMfVA23SkqRcflE5Mv6gLE39uGSnuYAE6T6j0dMlwPwxhoikSjfeEsEayvBM75xKJvMkXOzZS56rmpx+dC2AlrUFTMFnT9RlalKixZn9McKIELk6eeJkU3m2euvf5JxabEhuNK2zlUQPhXNRlMwTWfTBuDsxcLXnsNi+h4ULfjbBu3VTfdE6DhC7phy6Q8dJuAn8MJDRySBqp/L4juX
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Y0gHwcvQNuBB2M3eVGBQ"
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 17:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194061


--=-Y0gHwcvQNuBB2M3eVGBQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Fri, 2024-01-19 at 17:22 +0000, Richard Purdie wrote:
> On Wed, 2024-01-17 at 10:47 +0100, Thomas Perrot via
> lists.openembedded.org wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > This release has:
> > - Synopsys DesignWare APB GPIO driver
> > - Zicntr and Zihpm support
> > - Console print improvements
> > - Smepmp support
> > - Simple FDT based syscon regmap driver
> > - Syscon based reboot and poweroff driver
> > - Non-contiguous hpm counters
> > - Smcntrpmf support
> > - Full sparse hartid support
> > - IPI improvements
> > - RFENCE improvements
> > - Zkr support
> > - Andes custom PMU support
> > Overall, this release mainly adds more ISA extensions, drivers and
> > other improvements.
> >=20
> > https://github.com/riscv-software-src/opensbi/compare/v1.3.1...v1.4
> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> This all seems reasonable but why is there a revert below?

I reverted it otherwise the following link issue occurs:

"build/tmp-glibc/work/riscv64-oe-linux/opensbi/1.4/recipe-sysroot-
native/usr/bin/riscv64-oe-linux/../../libexec/riscv64-oe-
linux/gcc/riscv64-oe-linux/13.2.0/ld.bfd:/src/build/tmp-
glibc/work/riscv64-oe-
linux/opensbi/1.4/git/build/platform/generic/firmware/fw_dynamic.elf.ld
:54: undefined section `.dynsym' referenced in expression"

>=20
> > ---
> > =C2=A0...re-Remove-handling-of-R_RISCV_-32-64.patch | 88
> > +++++++++++++++++++
> > =C2=A0.../{opensbi_1.3.bb =3D> opensbi_1.4.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +-
> > =C2=A02 files changed, 92 insertions(+), 4 deletions(-)
> > =C2=A0create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Revert-
> > firmware-Remove-handling-of-R_RISCV_-32-64.patch
> > =C2=A0rename meta/recipes-bsp/opensbi/{opensbi_1.3.bb =3D> opensbi_1.4.=
bb}
> > (90%)
> >=20
> > diff --git a/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-
> > Remove-handling-of-R_RISCV_-32-64.patch b/meta/recipes-
> > bsp/opensbi/opensbi/0001-Revert-firmware-Remove-handling-of-
> > R_RISCV_-32-64.patch
> > new file mode 100644
> > index 000000000000..d14e0b73a9bc
> > --- /dev/null
> > +++ b/meta/recipes-bsp/opensbi/opensbi/0001-Revert-firmware-Remove-
> > handling-of-R_RISCV_-32-64.patch
> > @@ -0,0 +1,88 @@
> > +From bfe480929bcc966e1fdf5afdde8d4c22adba7f6f Mon Sep 17 00:00:00
> > 2001
> > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > +Date: Tue, 16 Jan 2024 15:16:58 +0100
> > +Subject: [PATCH] Revert "firmware: Remove handling of
> > R_RISCV_{32,64}"
> > +
> > +This reverts commit 2a6d72534d44c39e1de0614970a0dad97b1c41ba.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> If we're going to revert an upstream change, we need to say *why*. We
> need to revert it for some OE specific reason but what is that
> reason?
>=20

I agree, maybe you have any advice to fix it in another way?

Kind regards,
Thomas Perrot

> We cannot take patches marked as Inappropriate without much more
> information.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194059):
> https://lists.openembedded.org/g/openembedded-core/message/194059
> Mute This Topic: https://lists.openembedded.org/mt/103782707/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=-Y0gHwcvQNuBB2M3eVGBQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmWqtdcACgkQn8ALBXH+
Cu0knAwAloqkmtjdosa8STR63MPg8egvRPt80CwoEMO93BBdgwR/Bh9q2Ek8TIdq
z4+2BFF2B2fjQ8BR3mxZoJ7F/9DzJQ6rr7nKdCwlOLTOi+pvu4yDh2O2GGH7Mzf6
tXXaa9rKxJT7i5cmOMulrQnerCiauLSXHn8ov96Vlof8QSNl6mjHT2JZG13xXMDq
im3TPmKijrrXI6tX7eJ/M02SacQZvoO8kKGTIuxVq4YrdW4rISGqo4gqr5W4CCDQ
VRG17D7b6dCaYRhN2lnqA+xkrvXN7Lr9gl52u1CVONPDrKb3v6D5SW1Dazwyk8iv
5NLZ3Cht2Kx1xoxNKLtgCbV3LmGksJhMUC2uuIFhcjN8w7o69no7JEuhArN64PbT
GvhMQnT6zVC41LX3WH1C+63ffrDyvffaTqumlWhcGfZU6x4Vd+ULefERU8vMD1PS
8i6rnhL0flVHOjS9GzdcAILESio26BgrFnMDnovxacLqvZQ3m3gupaOVjdwU5QxA
ZXIbNCl8
=4ZID
-----END PGP SIGNATURE-----

--=-Y0gHwcvQNuBB2M3eVGBQ--

