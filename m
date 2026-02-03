Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FDCE8784D
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 17:02:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21868.1770138146269208804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 09:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=naI39NpU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 207214E423CC
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Feb 2026 17:02:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D988960728;
	Tue,  3 Feb 2026 17:02:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61406119A88EE;
	Tue,  3 Feb 2026 18:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770138140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=brMY7pcFmsTq1Kq7/VJbspaY6yX2P0fIZrUf04+g3aU=;
	b=naI39NpUdOOi0enrUmgyopDZODe/HCgGI3TDhtWwN/wNcpDXr2qeMZzdjD9Iw77klvoX9e
	HloOrk5xGLuzGLVg6IxnPh08QaqSe0lzwfcG0ALslZw/L7wqND2yAzaXtGh2fXHrZWMGh7
	bWfiUPrRRkYIk39V9m+YUPLVEh8qOkRqxAOOOVNLpJcZNvYokdd6XNzYaFbukjY5o/NBmU
	lgY7oMwg9pRO7cITkNb7+Uz66dXDxz+TbhT8ZX5rNjDWk58OBmQCdCFyqf4tyQ99UOQ01Y
	uGoUns7CBwHJYQnJK95FxQ14fj4KeaP2tQlcEqUE15vKXltUVnpjBVpn+TgrJA==
Message-ID: <60a0590f584c498d5fff88f016c2bd9d0df864b2.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: force gcc toolchain
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: raj.khem@gmail.com
Cc: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Date: Tue, 03 Feb 2026 18:02:17 +0100
In-Reply-To: <CAMKF1sqD8T-5g8S2nhDEivcg84U0Kw3GjnAs_0qDqKqy13_Q1A@mail.gmail.com>
References: <20260122153050.341395-1-thomas.perrot@bootlin.com>
	 <CAMKF1sqD8T-5g8S2nhDEivcg84U0Kw3GjnAs_0qDqKqy13_Q1A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-ag6Upqw5pAqSy1wErOxN"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 17:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230465


--=-ag6Upqw5pAqSy1wErOxN
Content-Type: multipart/alternative; boundary="=-n/2v4jN/Ql/IrqmzHDDm"

--=-n/2v4jN/Ql/IrqmzHDDm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

On Thu, 2026-01-22 at 09:19 -0800, Khem Raj via lists.openembedded.org
wrote:
>=20
>=20
> On Thu, Jan 22, 2026 at 7:31=E2=80=AFAM Thomas Perrot via
> lists.openembedded.org
> <thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
> > From: Thomas Perrot <thomas.perrot@bootlin.com>
> >=20
> > OpenSBI requires the gcc toolchain to build correctly. Set
> > TOOLCHAIN
> > explicitly to prevent build failures when using alternative
> > toolchains.
> >=20
>=20
>=20
> I am assuming you are having issues compiling it with clang, it would
> be good to document whats=C2=A0going wrong.
> Since it's a bug to address, openSBI does not intend to use a
> particular compiler.
> =C2=A0

We are figuring out the linker issue when Clang is used as the default
toolchain. We haven't taken the time to figure it out yet.

Kind regards,
Thomas Perrot

> >=20
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0meta/recipes-bsp/opensbi/opensbi_1.8.1.bb | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > index 0a9652c2831e..52d7b38ff2ba 100644
> > --- a/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > +++ b/meta/recipes-bsp/opensbi/opensbi_1.8.1.bb
> > @@ -15,6 +15,8 @@ TARGET_DBGSRC_DIR =3D
> > "/share/opensbi/*/generic/firmware/"
> >=20
> > =C2=A0TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >=20
> > +TOOLCHAIN =3D "gcc"
> > +
> > =C2=A0RISCV_SBI_FW_TEXT_START ??=3D "0x80000000"
> > =C2=A0EXTRA_OEMAKE +=3D "REPRODUCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX=
}
> > ELFFLAGS=3D"${LDFLAGS}" PLATFORM=3D${RISCV_SBI_PLAT} I=3D${D}
> > FW_TEXT_START=3D${RISCV_SBI_FW_TEXT_START}"
> > =C2=A0EXTRA_OEMAKE:append:toolchain-clang =3D " LLVM=3Dy"
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#229853):
> > https://lists.openembedded.org/g/openembedded-core/message/229853
> > Mute This Topic:
> > https://lists.openembedded.org/mt/117401535/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-n/2v4jN/Ql/IrqmzHDDm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello Khem,</div><div><br></div><div>On Thu, 2026=
-01-22 at 09:19 -0800, Khem Raj via lists.openembedded.org wrote:</div><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Jan 22, 2026 at 7:31=E2=80=AFAM Thomas Perrot via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;thomas.pe=
rrot=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote type=3D"cite" styl=
e=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><di=
v>From: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com" targ=
et=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br></div><div><br>OpenSBI r=
equires the gcc toolchain to build correctly. Set TOOLCHAIN<br>explicitly t=
o prevent build failures when using alternative<br>toolchains.<br></div><br=
></blockquote><div><br></div><div>I am assuming you are having issues compi=
ling it with clang, it would be good to document whats&nbsp;going wrong.</d=
iv><div>Since it's a bug to address, openSBI does not intend to use a parti=
cular compiler.</div><div>&nbsp;</div></div></div></blockquote><div><br></d=
iv><div><div>We are figuring out the linker issue when Clang is used as the=
 default=20
toolchain. We haven't taken the time to figure it out yet.</div></div><div>=
<br></div><div>Kind regards,<br>Thomas Perrot</div><div><br></div><blockquo=
te type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_co=
ntainer"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><div><br>Signed-off-by: Thomas Perrot &=
lt;<a href=3D"mailto:thomas.perrot@bootlin.com" target=3D"_blank">thomas.pe=
rrot@bootlin.com</a>&gt;<br>---<br>&nbsp;meta/recipes-bsp/opensbi/<a href=
=3D"http://opensbi_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">opensbi_1=
.8.1.bb</a> | 2 ++<br>&nbsp;1 file changed, 2 insertions(+)<br></div><div><=
br>diff --git a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb=
" rel=3D"noreferrer" target=3D"_blank">opensbi_1.8.1.bb</a> b/meta/recipes-=
bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">opensbi_1.8.1.bb</a><br>index 0a9652c2831e..52d7b38ff2ba 100644=
<br>--- a/meta/recipes-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">opensbi_1.8.1.bb</a><br>+++ b/meta/recipe=
s-bsp/opensbi/<a href=3D"http://opensbi_1.8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">opensbi_1.8.1.bb</a><br>@@ -15,6 +15,8 @@ TARGET_DBGSRC_DIR =3D=
 "/share/opensbi/*/generic/firmware/"<br></div><div><br>&nbsp;TARGET_CC_ARC=
H +=3D "${LDFLAGS}"<br></div><div><br>+TOOLCHAIN =3D "gcc"<br>+<br>&nbsp;RI=
SCV_SBI_FW_TEXT_START ??=3D "0x80000000"<br>&nbsp;EXTRA_OEMAKE +=3D "REPROD=
UCIBLE=3Dy CROSS_COMPILE=3D${HOST_PREFIX} ELFFLAGS=3D"${LDFLAGS}" PLATFORM=
=3D${RISCV_SBI_PLAT} I=3D${D} FW_TEXT_START=3D${RISCV_SBI_FW_TEXT_START}"<b=
r>&nbsp;EXTRA_OEMAKE:append:toolchain-clang =3D " LLVM=3Dy"<br></div><div><=
br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>L=
inks: You receive all messages sent to this group.<br></div><div>View/Reply=
 Online (#229853): <a href=3D"https://lists.openembedded.org/g/openembedded=
-core/message/229853">https://lists.openembedded.org/g/openembedded-core/me=
ssage/229853</a><br></div><div>Mute This Topic: <a href=3D"https://lists.op=
enembedded.org/mt/117401535/5443093">https://lists.openembedded.org/mt/1174=
01535/5443093</a><br></div><div>Group Owner: <a href=3D"mailto:openembedded=
-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembed=
ded.org</a><br></div><div>Unsubscribe: <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembed=
ded-core/unsub</a>&nbsp;[<a href=3D"mailto:thomas.perrot@bootlin.com">thoma=
s.perrot@bootlin.com</a>]<br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-<br></div><div><br></div></blockquote></div></div></blockquote>=
<div><br></div><div><span><pre>-- <br></pre><pre>Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

</pre></span></div></body></html>

--=-n/2v4jN/Ql/IrqmzHDDm--

--=-ag6Upqw5pAqSy1wErOxN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmmCKhkACgkQn8ALBXH+
Cu1ofQv/ZtC0RjsHwPYdcolw+8K0pK/zodN+LAqlyEJB5w9GK8LIJJZtWFCFVu8t
xC1oSuTspCRNJqcLU+Aqt0uuIpnrDh/NKU2mJ1Tpg1gWBAUNe/cB+WytQhhFEIPG
kFLv7pg8u969cTF4NpM6QVmm5bqr6Gcxteq6XNrn2LqCFMcHt8KIuQx6mXbgXnO0
8UBskySa+aSUC7NOfmDSuOnGEVNLwqfTAQY9wCoZaS2f4SsRJLHKAdnQxuy9DzSJ
oqSjXbiBsqLi9LWMu2bHdVV7zl8WVtK8jig9jS1b8U/nCVD4mzrXoi+1SmV4OFHi
Q+n3QR02Lx8bT6k8oodFfwvjbWpsNCiGV+YuGnqy+1KoS5+nGg5Xud1ZHORepmXe
cQN3usoziIABsrIVmJQfCeT5osdJFKSUFY9d0H/xSUxTOHBaUV4h2l3fbC2yRhql
rpQldjkzyPh+D4myJif0qMkWNe7AoW983v4TTC9+Bx09PXKqfcADlSYDSPt/XpNY
IdWRx3Rz
=7WxZ
-----END PGP SIGNATURE-----

--=-ag6Upqw5pAqSy1wErOxN--

