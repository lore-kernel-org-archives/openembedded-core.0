Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 36040606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:57:43 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id ks6so9091319pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=wNW+bp7JfahwJdYQKg7p87ChZVkRoMi4uRoCbeGj750=;
	b=TE7472b6CJYFEhFr38CTOsk3uSqvCnW/UhMDk+HeyV26fCHzKOugRgQzi7GcmUDDMn
	y/aitqKTLs2pxGC5+/SogJ83bk1DtiDMsxMf4BB7B0T+Hzc6qFswb9LLk8piYsRHCHNS
	F47DAqfG8eGCf2uzK7fGeJx1TLFQGp0uDtSwabqJXqcJZoXyFd31V3W1cm1rWuBpLwXO
	vzH9GCh6MfNLKla9ANQOQ66qV0JeXxCGtBTmuskNWTcuxprYKBqh+awBBKac0qo/JE7U
	5MYAiCvgpbM2DZS/M+V194Z9H4mYxuU/cJlSjQMWQmgXb5No5U3zuDZ5vkone8t347ou
	bhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wNW+bp7JfahwJdYQKg7p87ChZVkRoMi4uRoCbeGj750=;
	b=Gr/EoAjIVJFj/1PEQPNvvuLEDgIDvIRUogCDircPow+SrVCZ01CXD0tynEki87F2dP
	BYgr5cAglpD/MpCaKVEtsBN8ifs1P/Ico6RkRy6QIAlLvuTM/M4QwhNo+ixLWTasKR7c
	0XbT9Pn2DMMpRQLB7xJ98ZfV5KewJzLswv855vd3tiGifwShn74visY8EH08/Deptm5C
	grqtZ2ZYCLOyCWgnfiW8xdktpGP4BVeX5yik0a5FR32h+BReidfsr4juLNhLEWQ3hJGp
	Wlldb5n3k3SVsQKKFt5kVW1ipyePJaYkPMRdqOPoic3wqlElxjTv8edOsZ29M3d7e1Be
	MTyA==
X-Gm-Message-State: AEkooutilP+f7NK/D3lx1bjV56uYEZanx9df/GcfrmLsMmbZQQlqIOh4m0Q6c4S5yLeYyg==
X-Received: by 10.66.74.103 with SMTP id s7mr47434708pav.1.1469613464214;
	Wed, 27 Jul 2016 02:57:44 -0700 (PDT)
Received: from [192.168.0.5] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	nd4sm7771110pab.14.2016.07.27.02.57.43
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 02:57:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469525795.6937.1.camel@ts.fujitsu.com>
Date: Wed, 27 Jul 2016 02:57:37 -0700
Message-Id: <AA7383CF-888C-4605-97BB-BB016A5EB450@gmail.com>
References: <1469194596.6594.13.camel@ts.fujitsu.com>
	<CAMKF1srBan-tupS7qGb3kDnAn-2-u8dox3vFk5ssGwQLzeGaHw@mail.gmail.com>
	<1469455403.6896.29.camel@ts.fujitsu.com>
	<CAMKF1soyDLFePf+JqwQeyqCeig=CeZqHADwJJ7yZ=Nz9PcW0Hg@mail.gmail.com>
	<1469525795.6937.1.camel@ts.fujitsu.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building for armv7athf-neon but toolchain is softfp
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
X-List-Received-Date: Wed, 27 Jul 2016 09:57:45 -0000
X-Groupsio-MsgNum: 84973
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C45CC17A-E652-4086-AE11-B181410B25AD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C45CC17A-E652-4086-AE11-B181410B25AD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 26, 2016, at 2:39 AM, thilo.cestonaro@ts.fujitsu.com wrote:
>=20
> Hey Khem,
>=20
>> Seems steps are all ok. Can you upload your hello world somewhere.
>=20
> http://thilo.cestona.ro/~ephraim/public/helloworld.zip
>=20
> Hope you can find out whats going on here :).
>=20

This seems to contain C++ it seems. Can you try a simple C hello.c and =
see if that works.

> Cheers,
> Thilo


--Apple-Mail=_C45CC17A-E652-4086-AE11-B181410B25AD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleYhZYACgkQuwUzVZGdMxSIGACfc6wp8gyg+V5UjK7q7axsUqHu
bCsAoINxRvbcybnlZ2CIFSQEOOD/kAxM
=HRqY
-----END PGP SIGNATURE-----

--Apple-Mail=_C45CC17A-E652-4086-AE11-B181410B25AD--
