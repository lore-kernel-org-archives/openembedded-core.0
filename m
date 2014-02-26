Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id DCD7C6BC8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 07:14:20 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id un15so597187pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 23:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Rvd2FKi98AAAQSgWF+W2NBlVDOzlDE8lCeAj4LBzJnk=;
	b=pQsXyh3loG38vQ2PDOAPM5UvU4IgtOQcgZjYu8BHZIGAnupwlu8xUCVbC1NEHJNf3A
	7vDVEG3fRFKOeDKmmMAhfMqmzcoXk3mdybJ+1HMmjEkRhSX+b7xcmos2Em45IAUQe/Li
	n4Gm/DLpXG/22hXsWgpgPICZOtMHU1Vg2iY2ptbd4kvyYGxfesvXjBomFnAgzVE2T/Lf
	2kBncKqbe7ik1adKzXmIIVlzyywnxh240eNsNDXKE+dFPlFAWmF0U+l4ZyGzmGFjEbA1
	sVuidoCXLSSH1QXp6asxhC2nt9wt3++sW4laib99Lf3PCGL87n24bdi9JS3MSPVBk1fN
	e2WA==
X-Received: by 10.66.156.137 with SMTP id we9mr6913039pab.30.1393398861697;
	Tue, 25 Feb 2014 23:14:21 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id bc4sm110679pbb.2.2014.02.25.23.14.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 23:14:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
Date: Tue, 25 Feb 2014 23:14:21 -0800
Message-Id: <6631D5B8-751A-458C-B9B2-7ACFDE88B065@gmail.com>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Wed, 26 Feb 2014 07:14:24 -0000
X-Groupsio-MsgNum: 50590
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DFD6152F-98AF-405E-8B63-1F0492F042AF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DFD6152F-98AF-405E-8B63-1F0492F042AF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

>>=20
>> I did run test builds of the git version on the autobuilders and =
didn't
>> see any failures?=20
>=20
>=20
> builds might work but they won=92t run and yes so far IFUNC support is =
needed so it won=92t work on non-x86
> architectures. One common runtime problem I am seeing is logind not =
being able to talk to dbus
> across all architectures. I have pushed my latest rework to pull =
branch

I have now refreshed my contrib tree

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/system=
d-210

I have documented additional change you might need in your distro if you =
are not
using OE-Core=92s fs-perms.txt, systemd now needs /var/run to be =
symlinked to /run
or else it won=92t be able to talk to d-bus and kdbus is too new to =
enable yet.

Please try this patch, it now builds and boots fine on x86 and arm here. =
I am also
testing out other architecture in meantime

-Khem

--Apple-Mail=_DFD6152F-98AF-405E-8B63-1F0492F042AF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMNlE0ACgkQuwUzVZGdMxRl9gCfTUfR9qoi/ndDJJtKDAgCh+xd
+lsAn0CzL4VbMwRxIZwu48tIBKP99x3s
=C/Hs
-----END PGP SIGNATURE-----

--Apple-Mail=_DFD6152F-98AF-405E-8B63-1F0492F042AF--
