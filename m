Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A5F79766B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:45:26 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so2790750pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BXgm3DZ6oLCx6jLCFUB35EmKWilgqUQkcpzJhHIPBLI=;
	b=LZSxVESO/2ProY5kQ8hD92doZhZSidoCCvQ6n/9ww1JHmKt2EvWR/jPTsiMbIYyh2x
	HsN9gyBmM/liwt6/qmXROkZCFo5by9vIBGmpvHxigJA60UWJv63Es7dkrvhksQj9CeZG
	OmJwP91I5osy7nvpEdh1Np6e9v/TGjbs/Zi1B6IzgAOaJxsWd83Eiy7bGaTUfG+jQH5z
	NVwmJRxoxeN2qoZYpv7XitAZ9hULFpbKB3je3COL7cqlqZIvqNrKfFfQmZ8spVLru4XM
	In9zSW+HvjACIQnI2k/xYyehNb+iNBtUymxEjYdTKubh+GkwQ89utEI3/GFBH69KB5oO
	KChQ==
X-Received: by 10.68.249.66 with SMTP id ys2mr63324669pbc.82.1439343926522;
	Tue, 11 Aug 2015 18:45:26 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:157:79f9:ef5c:d3d0?
	([2601:646:8601:4580:157:79f9:ef5c:d3d0])
	by smtp.gmail.com with ESMTPSA id
	si1sm1338540pbc.72.2015.08.11.18.45.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 18:45:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55C433F9.5040403@windriver.com>
Date: Tue, 11 Aug 2015 18:45:24 -0700
Message-Id: <A8967B6B-47D8-40F2-AAA4-DDCCAE65BDAC@gmail.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<646c2c404c3064d5b7ce1d1351690caf1d482aa2.1438265949.git.alexander.kanavin@linux.intel.com>
	<55C433F9.5040403@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 19/21] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Wed, 12 Aug 2015 01:45:30 -0000
X-Groupsio-MsgNum: 69323
Content-Type: multipart/signed;
	boundary="Apple-Mail=_03BE4AF4-53D5-45C1-8818-F69AB4CE19AF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_03BE4AF4-53D5-45C1-8818-F69AB4CE19AF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 6, 2015, at 9:28 PM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
>> Epiphany is replacing midori as the browser in oe-core recipe set
>> and poky distribution.
>=20
> I just got caught up on oe-core and:
>   https://www.mail-archive.com/yocto@yoctoproject.org/msg24522.html
>=20
> Please move the midori recipe and dependencies to
> meta-oe when this change is merged to oe-core. That would help
> anyone that needs to provide a transition warning. Of course it
> adds more cruft to meta-oe but that's a separate problem.
>=20

just drop it. If someone needs it let them propose it to be included in =
other layers


--Apple-Mail=_03BE4AF4-53D5-45C1-8818-F69AB4CE19AF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKpTQACgkQuwUzVZGdMxQPpACfc4XCdBe+7caA1XasgkajL9pJ
+iQAn329gtWxfIGpEueNFvzI4o5btZWm
=KGfI
-----END PGP SIGNATURE-----

--Apple-Mail=_03BE4AF4-53D5-45C1-8818-F69AB4CE19AF--
