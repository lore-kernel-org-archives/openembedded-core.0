Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id D94356F391
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 17:59:00 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so1291815pad.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 09:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MijQ2WsTIJGDn97hi8Ap2gMnkd83NRIvI3TliJSc9ww=;
	b=NYQXWLAkMG32fPQik75FHk0XpI3xV0XNHUA3zHLCFmYHxf6AugoOBxDCup5gaiyLt/
	q+HShCdSfB86oPLWU5bR7we2iXMhRu/BEJj6uHnnTD3XeXf5VCr9Asw7LrXEItYSfvRH
	gkAbBmjLH030HQBC9TQe3YlHgTXB1ei5tWbYDBXSQT083AN6PXYa9YIGf1NpyqUxvsHo
	sC5/7zR5jPFfEADPBvcEh+04sxfbVwDInU2IK2eNJ0XySjjSNA3YCgAfvQebt3cnM/iz
	D9CqLzvIC9sxaNP5TpFqVUUtubm4QKh0ZNzhRnQRaUkAZhU+VlYc+mQk6LoWoCY37Zl/
	zzoQ==
X-Received: by 10.68.190.200 with SMTP id gs8mr8358837pbc.130.1393437541571;
	Wed, 26 Feb 2014 09:59:01 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id z3sm11776701pas.15.2014.02.26.09.58.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 09:58:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <530DAD38.7010506@linux.intel.com>
Date: Wed, 26 Feb 2014 09:58:38 -0800
Message-Id: <510F77D4-8E52-49FA-836D-ED9C123F1BD8@gmail.com>
References: <cover.1392891203.git.raj.khem@gmail.com>	<20140221151607.GG3854@jama>
	<1392996116.1560.14.camel@ted>	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>	<1393058961.5181.4.camel@ted>	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<6631D5B8-751A-458C-B9B2-7ACFDE88B065@gmail.com>
	<530DAD38.7010506@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 26 Feb 2014 17:59:00 -0000
X-Groupsio-MsgNum: 50621
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0C4EF161-3638-4E84-8840-1B40FBD00529";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0C4EF161-3638-4E84-8840-1B40FBD00529
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Feb 26, 2014, at 1:00 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 02/26/2014 09:14 AM, Khem Raj wrote:
>>>>=20
>>>> I did run test builds of the git version on the autobuilders and =
didn't
>>>> see any failures?
>>>=20
>>>=20
>>> builds might work but they won=92t run and yes so far IFUNC support =
is needed so it won=92t work on non-x86
>>> architectures. One common runtime problem I am seeing is logind not =
being able to talk to dbus
>>> across all architectures. I have pushed my latest rework to pull =
branch
>>=20
>> I have now refreshed my contrib tree
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/system=
d-210
>>=20
>> I have documented additional change you might need in your distro if =
you are not
>> using OE-Core=92s fs-perms.txt, systemd now needs /var/run to be =
symlinked to /run
>> or else it won=92t be able to talk to d-bus and kdbus is too new to =
enable yet.
>>=20
>> Please try this patch, it now builds and boots fine on x86 and arm =
here. I am also
>> testing out other architecture in meantime
>>=20
>=20
> Khem,
>=20
> Did you test with ptest enabled in DISTRO_FEATURES? =20

no


> I just built it locally and got the following error:
>=20
>> | cp: cannot stat =
'/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r=
0/build/rules': No such file or directory
>> | WARNING: =
/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0=
/temp/run.do_install_ptest_base.9533:1 exit 1 from
>> |   cp -rf =
/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0=
/build/rules =
/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0=
/image/usr/lib/systemd/ptest/
>> | ERROR: Function failed: do_install_ptest_base (log file is located =
at =
/home/sgw/yocto/builds/world/tmp/work/core2-64-poky-linux/systemd/1_210-r0=
/temp/log.do_install_ptest_base.9533)
>=20


this is because you might have S !=3D B, anyway I have fixed this and =
refreshed the branch

>=20
> Sau!
>=20
>=20
>> -Khem
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_0C4EF161-3638-4E84-8840-1B40FBD00529
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMOK04ACgkQuwUzVZGdMxQhKQCcCqCb3c1n4Zhn1rHIU+CgzpFA
bX8AnAtjKnZuQXD8A7RyZ4K2kdOTeJq7
=Jq7S
-----END PGP SIGNATURE-----

--Apple-Mail=_0C4EF161-3638-4E84-8840-1B40FBD00529--
