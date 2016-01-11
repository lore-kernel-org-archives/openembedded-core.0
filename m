Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 02BD3731C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:04:02 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q63so51070090pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1RegJoCyHJ7mCxhg6YoWkiPEgiE5RBpmheCGi7FDgqI=;
	b=CVATERAiDNWeoTQHQEz1cvzZ2AxFLSuvP8Jz2NxUKfzRWjHIYtaqaRcIJDGCLluFAR
	JI319fnlN2CXBTv+btqBZglQ9pTf+wnl2z3e3gweBxEpY/ewJvCf1Jfo+/8gl6JMrhXl
	8t+Oq61dXw/oVWOLGx2uYK0FAhzUP4b/Uxf1Q/WVDDq/iWtNHlVo0k1VTPiCJFneKtpX
	OQI5xg6K033RUT5Y3cS8/xbsNzcASV96i9q7atH5Ud41ab5hn4910zuWw3cNmWUPC/8G
	GA0GWAA9k9FdOwOOHf32VXisU/woCrZ3avw0zbufpuVQgJUs+7pvucM4C+sGIKsOpNGy
	dOQg==
X-Received: by 10.98.16.65 with SMTP id y62mr29160110pfi.138.1452542643414;
	Mon, 11 Jan 2016 12:04:03 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	71sm25111217pfs.63.2016.01.11.12.04.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 12:04:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452541920.1950.27.camel@pbcl.net>
Date: Mon, 11 Jan 2016 12:03:57 -0800
Message-Id: <524FC047-DC8D-48AC-B08B-179E4C65E9F7@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
	<CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
	<4A8643CE-5D1C-45E5-8E89-891B18CDE7A6@gmail.com>
	<1452541920.1950.27.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Mon, 11 Jan 2016 20:04:05 -0000
X-Groupsio-MsgNum: 75869
Content-Type: multipart/signed;
	boundary="Apple-Mail=_82CC9008-D933-4B5C-A675-0BEF34AE9A94";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_82CC9008-D933-4B5C-A675-0BEF34AE9A94
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 11, 2016, at 11:52 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Mon, 2016-01-11 at 11:10 -0800, Khem Raj wrote:
>> So I was asking was what improvements do we get if we choose armv7ve =
as tune
>> and I did not get any definitive answers.
>=20
> If you compile with -march=3Darmv7ve then you get the integer divide
> instructions, which are not enabled under -march=3Darmv7a.

ah idiv. I was just thinking its few virt and security
extensions that may not be used in instruction schedule by gcc but idiv =
certainly
will be used.

>=20
>> Why shouldnt we keep using armv7-a and tune the handful of apps to
>> armv7ve where it is required.
>=20
> That'd be a distro decision.  I agree that if you are targetting a mix
> of cores, some that have hardware div and some that don't, it may not =
be
> sensible to compile everything twice and you might want to standardise
> on armv7a as the least common denominator.  But Cortex-A15 is
> widespread, and I think people who select tune-cortexa15.inc would =
have
> a reasonable expectation that it would, indeed, tune for the
> instructions that their processor supports.  That's not to say that it
> necessarily needs to be a generic armv7ve tune of course.

I am with you for a15.

>=20
>> We should strive to reduce this tuning mayhem
>> on arm especially.
>=20
> I agree with this, though.
>=20
> p.
>=20
>=20


--Apple-Mail=_82CC9008-D933-4B5C-A675-0BEF34AE9A94
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUCrEACgkQuwUzVZGdMxS1KgCfZUA/BtAtjVkI1XOhL/RTq6hZ
xtoAn3t8YoyEw2CnqUk1IceRfje2J8Uf
=DkkK
-----END PGP SIGNATURE-----

--Apple-Mail=_82CC9008-D933-4B5C-A675-0BEF34AE9A94--
