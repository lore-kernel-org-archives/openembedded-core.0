Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 85FC07CAE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:33:11 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id a48so31686682qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jduk0gHPiG3Wz7g8sxEyiW07I3IOYILwekn56/WhzMg=;
	b=TXEAcGCyUNTX3In1OSYfHZyXCdCxYwgmEFYyLiRVscB696/5tV91HTSghSBBWdzwbD
	PwV+43jFdpSLi/xq0BmnUHl6DMu2CEmWR3JmGfnGyF8yk+G6hv/PNYWL3EQmiJa2AGFC
	amIqReiMMh4SxqFzRQ7WIS+JeC2pCaJ1okOvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jduk0gHPiG3Wz7g8sxEyiW07I3IOYILwekn56/WhzMg=;
	b=FcTrtMWREq03ty3DK90yr20U6K5C8g9xhpPtaI6Ud8FDtT7M//7HnD1oyJFKcixjDg
	wnLbxmHfF0WOJ/SWcC+8a7SapNXeV+BxNhEW2e0bbOY+s3k8y1gCZIlhjfrwUUl78wLV
	AX4BIUoRffoVuQxoJOZS3QstJG8GQBBgDxe1i6iSZBwS4mmIwqWmhwH+6Dj299PFnlw4
	DH1Re1M8jz5aYJebO5WA5hkgPSWlG++Tg28u1di/SQwXbMwFay+HcFNu8L7I1oU0vLEG
	erbM38cwPsnR0JkguMo+Sg6LqAKu+dR96Lg83Zx4JjbPYXSHs2AMotNz/pydROnf2GCR
	hhEw==
X-Gm-Message-State: AHQUAub94VxhVIob23E57e9uocu3dpaDQ9FEsHgeSUnsgEGIBXO8LdpN
	cEsGu8WYyKkNGDdRYGsssICvjg==
X-Google-Smtp-Source: AHgI3IZRPuwCY3VHS5WGGOblhav6buHtg37oq0hwaU4a/c1ui1RAwe8/v//2yyALW+PWoEIdmTAJjQ==
X-Received: by 2002:a0c:b90d:: with SMTP id u13mr29168434qvf.66.1550759592165; 
	Thu, 21 Feb 2019 06:33:12 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-861F-6911-836D-B65B-3E93.dyn6.twc.com.
	[2606:a000:1401:861f:6911:836d:b65b:3e93])
	by smtp.gmail.com with ESMTPSA id
	p9sm13313799qtp.50.2019.02.21.06.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 06:33:10 -0800 (PST)
Date: Thu, 21 Feb 2019 09:33:08 -0500
From: Tom Rini <trini@konsulko.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20190221143308.GC12379@bill-the-cat>
References: <83ec17fa-88b0-04fa-adab-b402b10c6339@topic.nl>
	<CAMjhiJjO0+0=_6HOmVM67U0nnbW=iu-FiMTzJBe4ZCvceuguuA@mail.gmail.com>
	<CAJ86T=Vy6AMbJ0J23V_9K+GJxwCFjD-Gq7NQwZ7AeJSW5Lum_A@mail.gmail.com>
	<CAMjhiJgFxSH3Rz+ot6qAZN1LPF=WmZ1ySt0Y4TSCg0S0m7YsxQ@mail.gmail.com>
	<5d6f25cb-e7fb-8306-5a6e-afe497620b9a@topic.nl>
MIME-Version: 1.0
In-Reply-To: <5d6f25cb-e7fb-8306-5a6e-afe497620b9a@topic.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic creates ext4 images that read really slow in u-boot
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
X-List-Received-Date: Thu, 21 Feb 2019 14:33:11 -0000
X-Groupsio-MsgNum: 121465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 10:55:20AM +0000, Mike Looijmans wrote:

> >>> I am aware of two fixes for U-Boot. I will look them up, and reply ag=
ain to this thread.
>=20
> Browsing through u-boot commits, I found this gem that's disabled by defa=
ult:
>=20
> CONFIG_BLOCK_CACHE=3Dy
>=20
> The commit is this one:
>=20
> commit e40cf34a29f1b248643731a11fb1c6f0520d016c
> Author: Eric Nelson <eric@nelint.com>
> Date:   Mon Mar 28 10:05:44 2016 -0700
>=20
>      drivers: block: add block device cache
>=20
>      Add a block device cache to speed up repeated reads of block devices=
 by
>      various filesystems.

For the record, it's not that it's disabled by default but rather to
enable it, you need to enable other "new" frameworks and so forth.  And
at least for "legacy" platforms, there's a certain level of pushback
against doing the work required to enable that (as to be honest, it is
more than just enable a few CONFIG options and re-test).  A
counter-pushback of "but it enables things that fix some bad performance
problems!" would be really helpful.

--=20
Tom

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcbrajAAoJEIf59jXTHXZSzWIQAJIk92Wr3l7bIYB6BPS70jrH
kgfW27XUFE91Y4PfAf7pmBC6sph/l5Z8E5CAXDYsp8px4e8tGBJe9fjUQh9ckEMA
z+JsTAt+hMOA6L1MW0She98Nphtq9FkkGOqcz5LpjRIHuE79m/anKaJrGUgPFo/p
uEleQci0DniPczkG/dRXY+Z9kPqm3xe1nUb69w25oWm81vTDw2wXGNdMgKDWToes
KVuy2k1yemWuT/8IMTgcziv4zL5NczF7ghritRCCi5MW5GE8HQ/Ft8Z29hi2oIOm
ecAslcgtEQEce1KHlfbzpnySC3Nf1FXhver8VWdggOPd4f1ia761FSfPZavOhEg8
z5Qi/chbFeQZK0PhQ0821i1o0R5cBRx8ouGRVBASHkMTmC1vtPPx801q1+AkJAL7
hHpAe8bNwa1bd5Nz6a4Ji3nSDiEZtXr2BHCmaMvjw60TI+fn4pr/cweXLQzbTFe9
Jtc35tti9tLqA+PL+PzE6wqRDAUP69Gk/oQTXe7EFxjJvidamMuC8AqoP+9lF7gC
rx92jZRl56/5p4yuAlHxfYyHsVvb3aJoYdcFD4cbPmtCWroDS03ITk5EL5KF0sAQ
HQ4cF+atRah9ABSQbkBO9aS5I9c1Zgz7x4t4pZYcFzP7PscJRkbfJzrs3pWr1Q/5
BvSU7OiOKD3aBAfHjFwA
=G5Am
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
