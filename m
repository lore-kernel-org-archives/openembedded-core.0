Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA3A07969F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 19:24:19 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id l189-v6so4505378ywb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 12:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yPVariTNYU8qkjm3lLb8z0qKrvLj3DkTWUoCXMaVO8s=;
	b=m14ozYBS2vRwtSwcJmB2EaMid2UL3VudPcCJyxTB3SANp7tc5Ev0rS1zlMkbNgolJW
	QKBbCAHsufI54SrYnxVZ+e0IqqqE3jzk/brjIVx3zTErcvUtYckMXmPzqckqzUevNONX
	5WbL+7YmYS9ikQWua+N7TbyHvpSS0YsNzqdKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yPVariTNYU8qkjm3lLb8z0qKrvLj3DkTWUoCXMaVO8s=;
	b=UKKQh8fF5kxYSC1f1rgLpEhFya5QcTRrZpAnIzpJ9Np9Aqv40q9/BoKu+1FkVTYeWT
	EiHYjbzQ2Fi3EAufUVtwj3f9Jef4Ho6FbKqjQujxCAt9rOAHQiXDWPvVtfqN9k4WvpyL
	yciTBOaL63sNjYvfcHNDI5pRjWCOJdhHEIyed+2GoEscju4GKAMi6RI9Sj+9qh3VS/GI
	r1X0DJ5ScoS4HLkSHPlBq6+Mitnx8bFOJnWflbj+1NH37PFa1N2GGZD6SDwNHE2ec7VJ
	7/D1ZTpAXhsK/QLwZYjyQXrirRTFpbu2s26HzT/hzZsB6UZeGMixL1ReSrfyjtBmCK0q
	Pblg==
X-Gm-Message-State: APzg51DDHCoWDbSt9u5ldx5DUh/s1xSCSLceDsUx7IpoSO+uTWCgKSUy
	uKjwMVjFCCr9AO/KdLJoX2/NXg==
X-Google-Smtp-Source: ANB0VdZUh8koxFDLgy3z2Z/iqz567z7O4Sy2xkvfTBwiqZ2G51wCxVwwEXzxkDLTtj9J23WiE5aF+g==
X-Received: by 2002:a81:8602:: with SMTP id w2-v6mr2381024ywf.61.1536261860800;
	Thu, 06 Sep 2018 12:24:20 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	n2-v6sm2223205ywd.64.2018.09.06.12.24.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 12:24:19 -0700 (PDT)
Date: Thu, 6 Sep 2018 15:24:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Emmanuel Roullit <emmanuel.roullit@gmail.com>
Message-ID: <20180906192418.GD26633@bill-the-cat>
References: <1536257152-491-1-git-send-email-emmanuel.roullit@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1536257152-491-1-git-send-email-emmanuel.roullit@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] wic: squashfs does support partition uuid.
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
X-List-Received-Date: Thu, 06 Sep 2018 19:24:20 -0000
X-Groupsio-MsgNum: 116003
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ThOh0GMkMRgTs3n/"
Content-Disposition: inline

--ThOh0GMkMRgTs3n/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 08:05:52PM +0200, Emmanuel Roullit wrote:

> wic allows the user to create disk image and reference each created
> partitions via its partition UUID.
>=20
> squashfs does not support filesystem UUID but it does offer support for
> partition UUID.
>=20
> $ lsblk -o NAME,FSTYPE,UUID,PARTUUID
> NAME   FSTYPE   UUID                                 PARTUUID
> sda
> |-sda1 vfat     6078-ACD0                            95aa4ffb-741d-4d99-a=
df6-0358bc890046
> |-sda2 squashfs                                      7d46da2d-29cc-4d5a-9=
e39-d0381c4abb0c
> |-sda3 squashfs                                      d4a3e24e-410a-4f2c-8=
ad5-8f8321de177b
> |-sda4 ext4     d72ec529-78e4-4cd3-b39b-781b6b1cb47c f3edc990-f4f6-4536-9=
587-44dae4ceb99f
> `-sda5 ext4     a0b265aa-e935-40b8-9c6b-e9e58ad3890f 6e72ebaa-29ed-41cd-8=
44c-3f76976cf41d
>=20
> Modifying this constrain allows a user to create squashfs-based rootfs an=
d boot
> from them with such kernel argument 'root=3DPARTUUID=3D7d46da2d-29cc-4d5a=
-9e39-d0381c4abb0c'
>=20
> Fixes: 2fbdcf4e59c8 ("wic: kparser.py: Check for SquashFS and use-uuid")
> Signed-off-by: Emmanuel Roullit <emmanuel.roullit@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--ThOh0GMkMRgTs3n/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbkX7hAAoJEIf59jXTHXZSgKoP/0oyku7PaK+sGPlxHi8MTvrI
c9MQOvKfHisEH5muZxe9a9Zw/5iuE0N2A1gTIxKxi3MRbUoq9OKgpM7DwOBUQ26P
y9pzyYP4yZ5feAIuw/8dADfjy2IKv8gYh6082RjCBBlc02wqkX3+CKwY+p99Dc7h
zWUh67NXmZmS+cKLo9bLjR+nhb2cOGgTKXo3mzpkO/1LWxjpE6UiwWckrlWnqTbo
aI1vqIg1kIW/dxeGku2fDxO6RkJsxYtSrylSq+ClFE4W3HktGxeNrzT17xYOdTuC
9E9rZdHT0Kt7JXDuFrOTdx0b1D4Fw47TVMRONxLx0BYyv3k9oVONklv956UXWdSc
kDpg8MuNGevx0PRRXnJtlsC1vZpSv5lmy4n9TwiBlUO44uN7KvwNb8TNrAicxfh9
VioggUQG+iNH7fVeHpgiKPpQNACSDyys7effpEMDnA/EvCqxanp3xMJsRM6VqgAy
v+Bk3R97ICQQ0/NT8bIaefZS/D/67KBT1TeZkOfIBsc0NzYQPnX/b9zE46n/WNF9
3S8GPhF7h5VF2+Bgmfam3Znv0f8KV+npF+5JLN6DXWpIykgo0BpL3P5vxcrNraCB
gQ34IR5oLpC5jd45bNVHISKl186QITXoOwX9vd40/v41kA13vngS6ByxsA1MhIsk
Ripg7n9l2ObShidndxWK
=ddWr
-----END PGP SIGNATURE-----

--ThOh0GMkMRgTs3n/--
