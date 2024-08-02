Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696AFC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:15:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.95274.1722611713840768113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vmllz301;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBAD6FF802;
	Fri,  2 Aug 2024 15:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722611712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zaKsu/1bgzJjaKbnQbPc/Q9zxk/qNiZv7tEJ+0g+2Qk=;
	b=Vmllz301j0iWWgKzQhuxx/3jH68p+QEKGEi/68Ln1I19zjxKrbaBIdY8v1V8SoOGBW5cPd
	9xTdUD/QSnpBhzB/rS5USvWAtNMoDQ77coqjq/HjLEbZdV+cfiQUt2eKZfkUhE47TCeg7j
	f/o7rqonXwbBu9y+sQNfzKNT2xwD4Y/QHHLSmi+e49LTelWnAt5embw0tbi6/5PQAUoNpe
	uZXpBpdpxbBU+6mOb131UyqKa88XZxqfOCfbR4FCraHiC34QmoFfobW/M/I4iBxf/PWDQC
	4IIiK+J7wFqmxlC/mFGJYKvFQRfWw91yW3MGFGm5woxfCVVEVzqv03lk5lbKKw==
Message-ID: <a7bda5c361d6f73d7a84bb9c8591ddadc143ed92.camel@bootlin.com>
Subject: Re: [OE-core][PATCH] opensbi: bump to 1.5.1
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 02 Aug 2024 17:15:11 +0200
In-Reply-To: <CANNYZj_6erc-5cRHnTYtc3yucs73DaTuJ3Hcaxdx_urcQEH=2Q@mail.gmail.com>
References: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
	 <CANNYZj8XmjudNK_=O0ftKAw9pUHD2Ybc=ZoW_wLHjROiZQ7giA@mail.gmail.com>
	 <4c6579a7ae6988005f628bbdbd686a4294bb8e99.camel@bootlin.com>
	 <CANNYZj_6erc-5cRHnTYtc3yucs73DaTuJ3Hcaxdx_urcQEH=2Q@mail.gmail.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-66KzUPZUjwpqI7fhn6ZB"
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 15:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202920


--=-66KzUPZUjwpqI7fhn6ZB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Fri, 2024-08-02 at 17:03 +0200, Alexander Kanavin wrote:
> On Fri, 2 Aug 2024 at 16:57, Thomas Perrot
> <thomas.perrot@bootlin.com> wrote:
> > As for some recipes, like the kernel recipes, I only used the first
> > two
> > numbers of the release version.
> > I can rename it to use all numbers if you prefer.
>=20
> PV (set via file name) needs to exactly match the version tag in git
> repo that matches the git revision in the recipe, it's not a
> preference, but standard practice. Otherwise the recipe would be
> packaging a random revision and not the actual PV.
>=20

Thx, I'm submitting a v2 that renames the recipe.

Kind regards,
Thomas Perrot

> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202918):
> https://lists.openembedded.org/g/openembedded-core/message/202918
> Mute This Topic: https://lists.openembedded.org/mt/107683486/5443093
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


--=-66KzUPZUjwpqI7fhn6ZB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmas9/8ACgkQn8ALBXH+
Cu05HQv/dt80hc47/7sxxpEj/4/dOiyVe56VTm+vIPaEcSXXklCNjYzHCHXtRI+9
cgxdEU0hhII/H474UDBnjQmZv+ZaAQhqkg1ZZ0WiV2tA67Igx2BI+NogoLpjUxXj
epBEQ+UfL6b62ll44zmMmChwIBC9GxsesfDKKD4FZIYO5/Q9xKsp+Ymh31/ED6YP
Rs7EQD8dBwEjz0OCOgnE6UIyCYIzR3WpUeojVIlh4IchovOhbIospIj+R8uVn6Pv
X9DgCmZxFbW6a9yNDLgTqteASG2sVQq01SWkS2RplXUJIkGJkZhh8j9uPl2U/wbA
cyzUwv0ddo0e597lGH0/SnsSP4wwFgnUj+nWXohfNBAQDSg79vgQZ10uyrPjjCfj
gbFyLBw0Kd3XS5EVuH/mv+i6ofCcEZcAi9ZjW+gIg7nkBPx1y8vkGVYHBm9wjbnr
mjw2WvTX7hdFxinthFU4DhdOh8J69TMJTDbfK+5eKkDL0JEbEvWeLNtuFkgJ8+0Y
VBvj09Oh
=DXca
-----END PGP SIGNATURE-----

--=-66KzUPZUjwpqI7fhn6ZB--

