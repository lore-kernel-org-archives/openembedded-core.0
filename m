Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F62E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 10:45:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.60315.1735555502303193070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 02:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ol81JoR4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 166D51BF208;
	Mon, 30 Dec 2024 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735555500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ucrmnoqueXXEa3vwoUOqw3xhOufGZGUy/CIvVim6Go4=;
	b=Ol81JoR4vc43sO7ioZchblIvPnEwfQpbW+RQEZpfjh/DHrfBDvsWHmTPH6E795HGqW/tV2
	la7zhxRfA+xM/v9B3QL0y+qv8RTcuoaH8BLxQqwuWjC69ZKtPjSVhzsriS9ino/obITG0B
	clJV0qRrfg6OH+T7QRRTJshIoh5OIAjAv4TMR7+O2aAIVFGteb46WilMqOPpB2jQ4xRPxW
	VIU5rEpTU8/Ui1aOGBqZql7BVe/9XF/w5C84D46TVvj9/6hheLeELd0h/MYqhnvpK66SVS
	F7zaTPuTJ0U7vAwd8z09ehwro0Q4EfhxUc6d6ShGQv2WLBfHQVxPiPjQNBQgKA==
Message-ID: <513d07135692db6404ae5e2f5ac377c5afca1d5f.camel@bootlin.com>
Subject: Re: [OE-core] [PATCH 21/22] webkitgtk: upgrade 2.46.4 -> 2.46.5
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Cc: thomas.perrot@bootlin.com
Date: Mon, 30 Dec 2024 11:44:58 +0100
In-Reply-To: <1734945065-4373-21-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
	 <1734945065-4373-21-git-send-email-wangmy@fujitsu.com>
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
	protocol="application/pgp-signature"; boundary="=-FTOmwjPSfUnwL3UrCzF6"
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 10:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209155


--=-FTOmwjPSfUnwL3UrCzF6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Since the update to version 2.46.4, there has been a regression on
RISC-V 64-bit systems. The following build issue [1] occurs, and the
workaround, which involved disabling JIT support, no longer works.

What do you recommend to fix it?

[1] https://bugs.webkit.org/show_bug.cgi?id=3D271371

Kind regards,
Thomas

On Mon, 2024-12-23 at 17:11 +0800, wangmy via lists.openembedded.org
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fix the build with GBM and release logs disabled.
> - Fix several crashes and rendering issues.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
> =C2=A0.../webkit/{webkitgtk_2.46.4.bb =3D> webkitgtk_2.46.5.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename meta/recipes-sato/webkit/{webkitgtk_2.46.4.bb =3D>
> webkitgtk_2.46.5.bb} (98%)
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
> similarity index 98%
> rename from meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
> index 6e1b793924..abbf84ccbe 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D
> "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/bmalloc-fix.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/sys_futex.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -SRC_URI[sha256sum] =3D
> "0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176"
> +SRC_URI[sha256sum] =3D
> "bad4020bb0cfb3e740df3082c2d9cbf67cf4095596588a56aecdde6702137805"
> =C2=A0
> =C2=A0inherit cmake pkgconfig gobject-introspection perlnative
> features_check upstream-version-is-even gi-docgen
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209036):
> https://lists.openembedded.org/g/openembedded-core/message/209036
> Mute This Topic: https://lists.openembedded.org/mt/110254987/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-FTOmwjPSfUnwL3UrCzF6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmdyeasACgkQn8ALBXH+
Cu26DQv+KPF8iNGrEYb/ZIbNlRfLolwKKEm0ILHEjyoQYFAQQ2iR611/cFVo+KuD
n6yVkHKDMSn7ko5FrixvNhRdy9yvi16CJtXNUNAVMrYGzzWdiFmKy+xbPktd/RIk
mLx9dg8LbH77byxpuGYxJdwA0YrPRwiOLz3osfP8NiaoVb6MXadgy6Q0dRuz5H+1
BrI8VbtDBc5hLWDIoDH4id7TTfAbZN1RsznW2eY1XAdgnXxjT26iXnF8qDwDDhVd
xyB399+ySHDPByvphJUAyySJ9J4aiSBK//rC35U0/r8zCmz2bLzPhD3+VNOIAvbr
yxFE3hXgMNnUWQudJQvaWdVvNbBWuda9SA64XdFjrnB8yN27vrXyoqtEF+u1C9mr
6nwqkojCMYfyM1FxsSMXlK8sRXLdCJV5qoMC1AJAzN3iRKib+jDQKNdQvdI4x3mJ
t64xGeazAwKMS2O1E5LfSMLHZHzBd585OR5YR2tfMUElzWzMaI46dLHFRhL0QImr
tJolhL3/
=BJ5N
-----END PGP SIGNATURE-----

--=-FTOmwjPSfUnwL3UrCzF6--

